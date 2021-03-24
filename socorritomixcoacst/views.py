from django.shortcuts import render, redirect
from .models import Usuario, Cliente, Orden, OrdenPlatillo, Platillo
from django.http import HttpResponseRedirect
from django.views.generic.detail import DetailView
from django.contrib import messages
from django.db import IntegrityError
import datetime
import pytz

def principal(request):
     if request.method=="POST":
          qs_clientes = Cliente.objects.filter(telefono=request.POST.get("telefono"))
          if qs_clientes:
               cliente_encontrado = qs_clientes[0]
               cliente_url = cliente_encontrado.get_absolute_url()
               return redirect(cliente_url)
          else:
               print("No se encontró el cliente")#TODO desplegar mensaje advirtiendo
               messages.warning(request, "¡¡¡No se encontró al cliente!!!")
               context = {}
               return redirect('cliente-no-encontrado')

     else:
          context = {}
          return render(request, 'principal.html', context)


class BusquedaCliente(DetailView):

     model = Cliente
     template_name = "busqueda-cliente.html"

     def get_context_data(self, **kwargs):
          #Orden.objects.filter(fecha=timezone.now.date(), cliente=self.object)
          context = super().get_context_data(**kwargs)
          return context


def cliente_no_encontrado(request):

     context = {}
     return render(request, 'busqueda-cliente-no-encontrado.html', context)


def menu_orden(request):
     #Primero jalamos de la base de datos los platillos,
     #desglosados en forma de diferentes listas para cada vista

     entradas = []
     segundos_tiempos = []
     guisados = []
     platillos = []

     lista_platillos = Platillo.objects.all()
     for platillo in lista_platillos:
          if(platillo.tipo == "EN"):
               entradas.append(platillo.nombre)
          if(platillo.tipo == "ST"):
               segundos_tiempos.append(platillo.nombre)
          if(platillo.tipo == "GU"):
               guisados.append(platillo.nombre)
          platillos.append(list((platillo.nombre, platillo.precio)))

     if request.method == "POST":
          orden = []
          total = 0
          for key, value in request.POST.items():
               print('Key: %s' % (key) )
               print('Value %s' % (value) )
               if "Albondiga" in key:
                    p = ["Albondiga", 60.5, value, int(value)*60.5]
                    orden.append(p)
                    total = total + int(value)*60.5
               if "Taco azteca" in key:
                    p = ["Taco azteca", 60.5, value, int(value)*60.5]
                    orden.append(p)
                    total = total + int(value)*60.5
               if "Coca-cola" in key:
                    p = ["Coca-cola", 20, value, int(value)*20]
                    orden.append(p)
                    total = total + int(value)*20
               if "Sopa" in key:
                    p = ["Sopa", 30, value, int(value)*30]
                    orden.append(p)
                    total = total + int(value)*30
               if "observaciones" in key:
                    request.session["observacion"] = value

          print("lista orden: " + str(orden))
          request.session['orden'] = orden
          request.session['total'] = total
          context = {}
          return redirect('resumen-pedido')

     else:

          #obtener la url de la página anterior
          pag_ant = request.META.get('HTTP_REFERER')
          print(pag_ant)

          context = {}
          context['referer'] = pag_ant #mandarlo en el contexto
          context['platillos'] = zip(platillos) #hay que hacer esto, no se por que
          context['entradas'] = entradas
          context['segundos_tiempos'] = segundos_tiempos
          context['guisados'] = guisados
          return render(request, 'menu-orden.html', context)

def resumen_pedido(request):

	orden = [
		["Albóndiga", 60.5, 1, 60.5],
		["Taco azteca", 60.5, 2, 121.0],
		["Coca-cola", 20, 3, 60],
		["Sopa", 30, 3, 90],
	]

	observacion = "las albóndigas con poca salsa. dos cocas frías, una al tiempo"

	context = {}
	context["orden"] = request.session.get("orden")
	context["total"] = request.session.get('total')
	context["observacion"] = request.session.get('observacion')
	return render(request, "resumen-pedido.html", context)

class PerfilCliente(DetailView):

     model = Cliente
     template_name = "perfil-cliente.html"

     def get_context_data(self, **kwargs):
          context = super().get_context_data(**kwargs)

          #TODO revisar flujo hacia esta template cuando se llega desde la vista administrativa
          # en base a ello modificar referer
          
          #obtener la url actual
          url_actual = self.request.get_full_path()
          #quitar la subcadena 'perfil-cliente/' de la url actual
          nueva_url = url_actual.replace('perfil-cliente/','')
          #mandar la nueva url en el contxto con el nombre referer
          context['referer'] = nueva_url

          #Se obtienen todos los pedidos realizados por el cliente y se guardan en una lista
          lista_pedidos = Orden.objects.filter(cliente=self.object)
          context['pedidos'] = lista_pedidos
          #Se obtienen todas las ordenesPlatillo asociadas a los pedidos del cliente
          lista_ordenesPlatillo = []
          #Aprovechando el cliclo for que era inicialmente para las ordenesPlatillo, de una vez sacamos la fecha del último pedido realizado por el cliente 
          #También aprovechamos el mismo ciclo for para sacar el total de dinero gastado por el cliente en la fonda
          fecha_ultimo_pedido = datetime.datetime(1900, 1, 1, 17, 55) #Inicialmente le asignamos una fecha lejana en el tiempo
          fecha_mexico = pytz.timezone("America/Mexico_City") #Esta variable nos permite formatear la fecha inicial a una compatible con models.DateField, esto para poder hacer comparaciones
          fecha_ultimo_pedido = fecha_mexico.localize(fecha_ultimo_pedido) #En este punto las fechas ya se puede comparar
          fecha_aux = pytz.timezone("America/Mexico_City").localize(datetime.datetime(1900, 1, 1, 17, 55)) #Variable auxiliar que sirve para hacer verificaciones posteriormente
          dinero_gastado_por_cliente = 0
          for pedido in lista_pedidos:
               if pedido.fecha > fecha_ultimo_pedido:
                    fecha_ultimo_pedido = pedido.fecha
               aux = OrdenPlatillo.objects.filter(orden=pedido)
               dinero_gastado_por_cliente = dinero_gastado_por_cliente + pedido.total_descuento
               for ordenPlatillo in aux:
                    lista_ordenesPlatillo.append(ordenPlatillo)
          context['ordenes_platillo'] = lista_ordenesPlatillo
          #El siguiente condicional se utiliza para que el form-outline "Fecha del último pedido realizado:" se muestre vacío cuando el cliente no ha realizado ninguna compra
          if fecha_ultimo_pedido > fecha_aux:
               context['fecha_ultimo_pedido'] = fecha_ultimo_pedido
          else:
               context['fecha_ultimo_pedido'] = ""
          context['dinero_gastado_por_cliente'] = dinero_gastado_por_cliente
          #Se obtiene el número de pedidos realizados y se envía como contexto
          context['num_pedidos_realizados'] = len(lista_pedidos)
          
          
          


          return context

     def post(self, request, *args, **kwargs):
          self.object = self.get_object() # asignar object a la vista
          nombre = str(request.POST.get("nombre"))
          telefono_alternativo = request.POST.get("telefono_alternativo")
          direccion = str(request.POST.get("direccion"))
          referencias = request.POST.get("referencias")
          tipo = request.POST.get("nombre")

          if nombre:
               self.object.nombre=nombre
          if telefono_alternativo:
               self.object.telefono_alternativo=telefono_alternativo
          if direccion:
               self.object.direccion=direccion
          if referencias:
               self.object.referencias=referencias
          self.object.save()

          return HttpResponseRedirect(request.path_info)

def registrar_clientes(request):
     """ Pregunta si hay datos ocultos(POST)"""
     if request.method == "POST":
          cliente_registro = Cliente(nombre=request.POST.get("nombre")+" "+request.POST.get("apellidos"),
                                   direccion=request.POST.get("direccion"),
                                   telefono=request.POST.get("telefono"),
                                   telefono_alternativo=request.POST.get("telefonoalt"),
                                   referencias=request.POST.get("obs"),
                                   tipo="NU"
                                   )
          """ Manejo de excepciones """
          try:
               """Guarda los datos en BD (mysql)"""
               cliente_registro.save()
               """Redirecciona la página a una url absoluta que contiene los datos del cliente"""
               return redirect(cliente_registro.get_absolute_url())
          #"""Si existe una excepción de IntegrityError"""
          except IntegrityError:
               print("Este cliente ya está registrado ") # TODO mandar mensaje advirtiendo ckiente registrado
               context = {}
               """Vuelve a la ventana registrar-clientes"""
               return render (request, 'registrar-clientes.html', context)



     else:
          context = {}
          return render (request, 'registrar-clientes.html', context)
