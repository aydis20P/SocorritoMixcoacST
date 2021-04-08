from django.shortcuts import render, redirect
from .models import Usuario, Cliente, Orden, OrdenPlatillo, Platillo, HistorialPrecio
from django.http import HttpResponseRedirect
from django.views.generic.detail import DetailView
from django.contrib import messages
from django.db import IntegrityError
import datetime
from datetime import datetime as dt
import pytz
from django.conf import settings
from .models import TIPO_PLATILLO
import re

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
          
          pedido = []
          request.session['observaciones'] = request.POST.get('observaciones')

          

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

          request.session['todos_menus'] = todos_menus
          request.session['todos_ordenes'] = todos_ordenes
          request.session['todos_extras'] = todos_extras
          #TODO request.session['todos_desayunos'] = todos_desayunos
          

          for p in pedido:
               print(asdict(p))

          #request.session['orden-cliente']=
          #request.session['pedidos-cliente']= 

          return redirect('resumen-pedido')

     else: #Método GET

          #obtener la url de la página anterior
          pag_ant = request.META.get('HTTP_REFERER')
          print(pag_ant)

          context = {}
          context['referer'] = pag_ant #mandarlo en el contexto
          context['platillos'] = lista_platillos #Todos los platillos de la BD
          context['entradas'] = entradas #
          context['segundos_tiempos'] = segundos_tiempos
          context['guisados'] = guisados
          return render(request, 'menu-orden.html', context)

def resumen_pedido(request):
     numero_menu = 1
     todos_menus = request.session['todos_menus'] 
     todos_ordenes = request.session['todos_ordenes'] 
     todos_extras = request.session['todos_extras']
     observaciones = request.session.get('observaciones')
     cambio = request.session.get('cambio')
     pago_con = request.session.get('pagC')
     pedidos_del_cliente = []
     #cambio del pago de a $500
     cliente = Cliente.objects.filter(id=request.session.get("cliente_actual"))[0]
     print (cambio)
     #
     orden = Orden(total=0,
                    promocion=False,
                    total_descuento=0,
                    fecha=dt.now(),
                    cliente=cliente)
     
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
               pedidos_del_cliente.append(platillo_menu_1)
          if i % 3 == 1: #Segúndos tiempos
               platillo_menu_2 = OrdenPlatillo(sub_total=0,
                                                  es_completa=True,
                                                  numero_completa=numero_menu,
                                                  cantidad=1,
                                                  orden=orden,
                                                  platillo=platillo_actual)
               pedidos_del_cliente.append(platillo_menu_2)
          if i % 3 == 2: #Guisado
               platillo_menu_3 = OrdenPlatillo(sub_total=(platillo_actual.precio + 20),
                                                  es_completa=True,
                                                  numero_completa=numero_menu,
                                                  cantidad=1,
                                                  orden=orden,
                                                  platillo=platillo_actual)
               pedidos_del_cliente.append(platillo_menu_3)
               numero_menu += 1
               orden.total += platillo_menu_3.sub_total
     #guardamos las órdenes
     for i in range(len(todos_ordenes)):
          platillo_actual = Platillo.objects.filter(nombre=todos_ordenes[i][0])[0]
          cantidad_platillo_actual = int(todos_ordenes[i][1])
          platillo_orden = OrdenPlatillo(sub_total=(platillo_actual.precio * cantidad_platillo_actual),
                                             es_completa=False,
                                             cantidad=cantidad_platillo_actual,
                                             orden=orden,
                                             platillo=platillo_actual)
          pedidos_del_cliente.append(platillo_orden)
          orden.total += platillo_orden.sub_total
     #guardamos los extras
     for i in range(len(todos_extras)):
          platillo_actual = Platillo.objects.filter(nombre=todos_extras[i][0])[0]
          cantidad_platillo_actual = int(todos_extras[i][1])
          platillo_orden = OrdenPlatillo(sub_total=(platillo_actual.precio * cantidad_platillo_actual),
                                             es_completa=False,
                                             cantidad=cantidad_platillo_actual,
                                             orden=orden,
                                             platillo=platillo_actual)
          pedidos_del_cliente.append(platillo_orden)
          orden.total += platillo_orden.sub_total

     if request.method=="POST":
          for key, value in request.POST.items():
               print ('Entré al for')
               print('Key: %s' % (key) ) 
               # print(f'Key: {key}') in Python >= 3.7
               print('Value %s' % (value) )
               # print(f'Value: {value}') in Python >= 3.7

          orden.fecha=dt.now().astimezone(pytz.timezone(settings.TIME_ZONE))
          pago_con=float(request.POST.get('pagC'))
          cambio=float(pago_con-orden.total)
         
          orden.save()
          for pedido in pedidos_del_cliente:
               pedido.orden=orden
               pedido.save()

          return redirect(principal)
     else: #Método GET
          
          context = {}
          
         
          context['orden_del_cliente'] = orden
          context['pedidos_del_cliente'] = pedidos_del_cliente
          context["observaciones"] = observaciones
          context['cambio'] = cambio
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
               dinero_gastado_por_cliente = dinero_gastado_por_cliente + pedido.total
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

def gestion_platillos(request):
     platillo_tipo = TIPO_PLATILLO
     platillo_mod = Platillo.objects.all()
     todos_historial_precio_reciente = HistorialPrecio.objects.filter(es_precio_actual=True)
     complemento = True
     if request.method == "POST":
          
         
          for clave, valor in request.POST.items():
               print("Clave: %s" % (clave))
               print("Valor: %s" % (valor))
               #Buscamos habilitar el campo esta_eliminado del platillo con id=idAeliminar
               if "True" in valor:
                    idAeliminar = clave.replace("eliminar_", "")
                    eliminar_P = Platillo.objects.filter(pk=int(idAeliminar)).update(esta_eliminado = True)
               # Condicional para proporcionar valor False si el complemento es un guizado      
               if "GU" in valor:
                    complemento = False  
               # Condionales para modificar un platillo
               # Modificar el nombre del plato
               
               if "modnom-" in clave and valor:
                    nuevoNombre = valor
                    idModificar = clave.replace("modnom-plat_","")
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(nombre = str(nuevoNombre))      
               if "modprecio_" in clave and valor:
                    nuevoPrecio = float(valor)
                    idModificar = clave.replace("modprecio_","")
                    
                   
                    idPlatillo = HistorialPrecio.objects.filter(pk = int(idModificar))
                    modificacion_platillo = HistorialPrecio.objects.filter(pk=int(idModificar))
                    modificacion_platillo.update(es_precio_actual = False )

                    platillo = modificacion_platillo[0].platillo

                    nuevo_Precio = HistorialPrecio(platillo = platillo, precio = nuevoPrecio)
                    nuevo_Precio.save()

               if "modselect-tipo_" in clave and valor:
                    idModificar = clave.replace("modselect-tipo_","")
                    if "GU" in valor:
                         modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(es_complemento = False)
                    else:
                         modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(es_complemento = True)
               if "moddescripcion_" in clave and valor:
                    
                    nuevaDescripcion = valor
                    idModificar = clave.replace("moddescripcion_","")
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(descripcion = nuevaDescripcion)

          platillos_nuevos=Platillo(nombre=request.POST.get("nom-plat"),
                                   tipo=request.POST.get("select-tipo"),
                                   es_complemento=complemento,
                                   descripcion=request.POST.get("descripcion"))
          #Generamos este try para atrapar una excepción, en este caso buscamos atrapar el error cuando se repite el nombre de un platillo
          try:
               print("Entro Aquí")
               context = {}
               context['tip_platillo'] = platillo_tipo
               context['platillo'] = platillo_mod
               context['hist_precio'] = todos_historial_precio_reciente
               """Guarda los datos en BD (mysql)"""
               platillos_nuevos.save()
               #Creamos un registro que guardará el precio usando la llave foranea que es el objeto "platillos_nuevos"
               precio = HistorialPrecio(precio=request.POST.get("precio"), platillo=platillos_nuevos)
               precio.save()
               
               return render( request, 'gestion-platillos.html', context)
          #"""Si existe una excepción de IntegrityError"""
          except IntegrityError:
               print("Entro Aquí 2")
               return render( request, 'gestion-platillos.html', context)




     else:
          context = {}
          context['tip_platillo'] = platillo_tipo
          context['platillos'] = platillo_mod
          context['hist_precio'] = todos_historial_precio_reciente
          
          return render( request, 'gestion-platillos.html', context)