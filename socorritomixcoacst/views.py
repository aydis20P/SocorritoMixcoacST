from django.shortcuts import render, redirect
from .models import Usuario, Cliente, Orden, OrdenPlatillo
from django.http import HttpResponseRedirect
from django.views.generic.detail import DetailView
<<<<<<< HEAD
from django.contrib import messages

=======
from django.db import IntegrityError
>>>>>>> 4c3157e1e7a02270d33c621cd2224c21de9eadd3

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

          p1 = ["Albondiga", 60.5]
          p2 = ["Taco azteca", 60.5]
          p3 = ["Coca-cola", 20]
          p4 = ["Sopa", 30]
          platillos = []
          platillos.append(p1)
          platillos.append(p2)
          platillos.append(p3)
          platillos.append(p4)

          context = {}
          context['referer'] = pag_ant#mandarlo en el contexto
          context['platillos'] = platillos
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
          context['referer'] = self.request.META.get('HTTP_REFERER')

          lista_pedidos = Orden.objects.filter(cliente=self.object)
          context['pedidos'] = lista_pedidos
          lista_ordenesPlatillo = []
          for pedido in lista_pedidos:
               aux = OrdenPlatillo.objects.filter(orden=pedido)
               for ordenPlatillo in aux:
                    lista_ordenesPlatillo.append(ordenPlatillo)
          context['ordenes_platillo'] = lista_ordenesPlatillo
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


def prueba(request):
	
	context = {}
	return render(request, "prueba.html", context)

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
