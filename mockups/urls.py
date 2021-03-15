from django.urls import path
from . import views

urlpatterns = [
    path('', views.principal, name="principal"),
    path('busqueda-cliente', views.busqueda_cliente, name="busqueda-cliente"),
    path('menu-orden', views.menu_orden, name = "menu-orden"),
]