from django.shortcuts import render, redirect
from .models import Usuario, Cliente
from django.views.generic.detail import DetailView

def principal(request):
     if request.method=="POST":
          qs_clientes = Cliente.objects.filter(telefono=request.POST.get("telefono"))
          if qs_clientes:
               cliente_encontrado = qs_clientes[0]
               cliente_url = cliente_encontrado.get_absolute_url()
               return redirect(cliente_url)
          else:
               print("No se encontró el cliente")#TODO desplegar mensaje advirtiendo
               context = {}
               return render(request, 'principal.html', context)

     else:
          context = {}
          return render(request, 'principal.html', context)


class BusquedaCliente(DetailView):

     model = Cliente
     template_name = "busqueda-cliente.html"

     def get_context_data(self, **kwargs):
          #Orden.objects.filter(fecha=timezone.now.date(), cliente=self.object)
          context = super().get_context_data(**kwargs)
          context['tipo'] = self.object.tipo
          print(self.object.tipo)
          return context


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
          context['platillos'] = platillos
          return render(request, 'menu-orden.html', context)

def registrar_cliente(request):
     if request.method == "POST":
          print("nombre post: " + request.POST.get('nombre'))
          clientes_qs = []
          cliente = [request.POST.get('nombre'), request.POST.get('tel1'), request.POST.get('tel2'), request.POST.get('direccion'), "Nuevo"]
          clientes_qs.append(cliente)
          request.session['clientes_qs'] = clientes_qs #la agregamos a una variable de sesión

          request.session['telefono'] = request.POST.get('tel1')

          return redirect('busqueda-cliente')
     else:
          context = {}
          return render (request, 'registrar-cliente.html', context)

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

def perfil_cliente(request):
     clientes = request.session['clientes_qs']
     context = {}
     context['clientes'] = clientes
     context['nombre'] = clientes[0][0]
     context['telefono1'] = clientes[0][1]
     context['telefono2'] = clientes[0][2]
     context['direccion'] = clientes[0][3]
     context['tipo'] = clientes[0][4]
     return render(request, 'perfil-cliente.html', context)

def prueba(request):
	
	context = {}
	return render(request, "prueba.html", context)