from django.urls import path
from . import views
from .views import BusquedaCliente
from .views import PerfilCliente
from .views import AdminCliente

urlpatterns = [
    path('', views.principal, name="principal"),
    path('cliente/<pk>/', BusquedaCliente.as_view(), name='cliente'),
    path('cliente-no-encontrado', views.cliente_no_encontrado, name = "cliente-no-encontrado"),
    path('menu-orden', views.menu_orden, name = "menu-orden"),
    path('resumen-pedido', views.resumen_pedido, name="resumen-pedido"),
    path('cliente/<pk>/perfil-cliente/', PerfilCliente.as_view(), name='perfil-cliente'),
    path('admin-cliente', AdminCliente.as_view(), name='admin-cliente'),
    path('registrar-clientes', views.registrar_clientes, name="registrar-clientes"),
    path('editar-platillos',views.editar_platillos, name="editar-platillos")
]
