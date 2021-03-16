from django.shortcuts import render, redirect

def principal(request):
     #precondición, una lista con un cliente que tambien es una lista
     clientes_qs = []
     cliente = ["Homero", "1122334455", "5544332211", "Avenida Siempre Viva, 109", "Frecuente"]
     clientes_qs.append(cliente)
     request.session['clientes_qs'] = clientes_qs#la agregamos a una variable de sesión

     if request.method=="POST":
          telefono = request.POST.get('telefono')#obtenemos el teléfono ingresado del método POST

          if telefono in request.session.get('clientes_qs')[0]:#simulamos la busqueda del teléfono en nuestro clientes_qs
               request.session['telefono'] = telefono #lo agregamos a una variable de sesión
          else:
               request.session['telefono'] = "" #en caso contrario vaciamos la variable de sesión
          return redirect('busqueda-cliente')

     else:
          context = {}
          return render(request, 'principal.html', context)

def busqueda_cliente(request):

     #Aquí se trabaja toda la lógica del negocio

     clientes = []
     if not request.session.get('telefono') == "":
          clientes.append(request.session.get('clientes_qs')[0])
     context = {}
     context['clientes'] = clientes

     return render(request, 'busqueda-cliente.html', context)

def menu_orden(request):


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

	total = 331.5

	observacion = "las albóndigas con poca salsa. dos cocas frías, una al tiempo"

	context = {}
	context["orden"] = orden
	context["total"] = total
	context["observacion"] = observacion
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

