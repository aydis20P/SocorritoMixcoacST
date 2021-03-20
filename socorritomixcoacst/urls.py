from django.urls import path
from . import views
from .views import BusquedaCliente

urlpatterns = [
    path('', views.principal, name="principal"),
    path('cliente/<pk>/', BusquedaCliente.as_view(), name='cliente'),
    path('menu-orden', views.menu_orden, name = "menu-orden"),
    path('registrar-cliente', views.registrar_cliente, name="registrar-cliente"),
    path('resumen-pedido', views.resumen_pedido, name="resumen-pedido"),
    path('perfil-cliente', views.perfil_cliente, name="perfil-cliente"),
    path("prueba", views.prueba, name="prueba"),
]
