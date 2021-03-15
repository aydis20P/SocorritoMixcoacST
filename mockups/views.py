from django.shortcuts import render

def principal(request):
     context = {}
     return render(request, 'principal.html', context)

def busqueda_cliente(request):

     #Aquí se trabaja toda la lógica del negocio
     clientes = []
     cliente = ["Homero", "1122334455", "5544332211", "Avenida Siempre Viva, 109", "Frecuente"]
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