from django.shortcuts import render

def principal(request):
     context = {}
     return render(request, 'principal.html', context)
