from django.shortcuts import render, redirect

def principal(request):
     if request.method=="POST":
          telefono = request.POST.get('telefono')
          #simulamos la busqueda (el QUERY)
          if telefono == "1122334455" or telefono == "5544332211":
               request.session['telefono'] = telefono #lo agregamos a una variable de sesión
          else:
               request.session['telefono'] = "" #en caso contrario vaciamos la variable de sesión
          return redirect('busqueda-cliente')
          
     else:
          context = {}
          return render(request, 'principal.html', context)

def busqueda_cliente(request):

     #Aquí se trabaja toda la lógica del negocio

     #precondición, una lista con un cliente que tambien es una lista
     clientes = []
     cliente = ["Homero", "1122334455", "5544332211", "Avenida Siempre Viva, 109", "Frecuente"]
     if not request.session.get('telefono') == "":
          clientes.append(cliente)
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
     context = {}
     return render (request, 'registrar-cliente.html', context)
