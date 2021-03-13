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
