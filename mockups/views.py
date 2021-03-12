from django.shortcuts import render

def principal(request):
     context = {}
     return render(request, 'principal.html', context)

def busqueda_cliente(request):

     #Aquí se trabaja toda la lógica del negocio

     context = {}
     context['frutas'] = ["manzana", "platano", "cereza"]
     return render(request, 'busqueda-cliente.html', context)
