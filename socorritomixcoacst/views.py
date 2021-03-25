from django.shortcuts import render, redirect
from .models import Usuario, Cliente, Orden, OrdenPlatillo, Platillo
from django.http import HttpResponseRedirect
from django.views.generic.detail import DetailView
from django.contrib import messages
from django.db import IntegrityError
import datetime
from datetime import datetime as dt
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
          self.request.session["cliente_actual"] = self.object.id
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

     lista_platillos = Platillo.objects.all()
          
     if request.method == "POST":

          todos_menus = []
          todos_ordenes = []
          todos_extras = []
          numero_menu = 1
          pedido = []
          cliente = Cliente.objects.filter(id=request.session.get("cliente_actual"))[0]
          orden = Orden(total=0,
                        promocion=False,
                        total_descuento=0,
                        fecha=dt.now(),
                        cliente=cliente)

          for clave, valor in request.POST.items():
               print("Clave: %s" % (clave))
               print("Valor: %s" % (valor))
               
               if "menu-" in clave:
                    todos_menus.append(tuple((clave, valor)))
               if "orden_de_" in clave:
                    if int(valor) > 0:
                         todos_ordenes.append(tuple((clave.replace("orden_de_", ""), valor)))
               if "orden_extra_de_" in clave:
                    if int(valor) > 0:
                         todos_extras.append(tuple((clave.replace("orden_extra_de_", ""), valor)))

          print(todos_menus)
          print(todos_ordenes)
          print(todos_extras)

          #guardamos los menús completos
          for i in range(len(todos_menus)):
               platillo_actual = Platillo.objects.filter(nombre=todos_menus[i][1])[0]
               if i % 3 == 0: #Entradas
                    platillo_menu_1 = OrdenPlatillo(sub_total=0,
                                                    es_completa=True,
                                                    numero_completa=numero_menu,
                                                    cantidad=1,
                                                    orden=orden,
                                                    platillo=platillo_actual)
                    pedido.append(platillo_menu_1)
               if i % 3 == 1: #Segúndos tiempos
                    platillo_menu_2 = OrdenPlatillo(sub_total=0,
                                                    es_completa=True,
                                                    numero_completa=numero_menu,
                                                    cantidad=1,
                                                    orden=orden,
                                                    platillo=platillo_actual)
                    pedido.append(platillo_menu_2)
               if i % 3 == 2: #Guisado
                    platillo_menu_3 = OrdenPlatillo(sub_total=(platillo_actual.precio + 20),
                                                    es_completa=True,
                                                    numero_completa=numero_menu,
                                                    cantidad=1,
                                                    orden=orden,
                                                    platillo=platillo_actual)
                    pedido.append(platillo_menu_3)
                    numero_menu += 1

          #guardamos las órdenes
          for i in range(len(todos_ordenes)):
               platillo_actual = Platillo.objects.filter(nombre=todos_ordenes[i][0])[0]
               cantidad_platillo_actual = int(todos_ordenes[i][1])
               platillo_orden = OrdenPlatillo(sub_total=(platillo_actual.precio * cantidad_platillo_actual),
                                              es_completa=False,
                                              cantidad=cantidad_platillo_actual,
                                              orden=orden,
                                              platillo=platillo_actual)
               pedido.append(platillo_orden)

          #guardamos los extras
          for i in range(len(todos_extras)):
               platillo_actual = Platillo.objects.filter(nombre=todos_extras[i][0])[0]
               cantidad_platillo_actual = int(todos_extras[i][1])
               platillo_orden = OrdenPlatillo(sub_total=(platillo_actual.precio * cantidad_platillo_actual),
                                              es_completa=False,
                                              cantidad=cantidad_platillo_actual,
                                              orden=orden,
                                              platillo=platillo_actual)
               pedido.append(platillo_orden)

          print(orden)
          for i in pedido:
               print(i)

          return redirect('resumen-pedido')

     else: #Método GET

          #obtener la url de la página anterior
          pag_ant = request.META.get('HTTP_REFERER')
          print(pag_ant)

          context = {}
          context['referer'] = pag_ant #mandarlo en el contexto
          context['platillos'] = lista_platillos
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
