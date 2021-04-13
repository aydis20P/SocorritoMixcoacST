from django.urls import path
from . import views
from .views import *

urlpatterns = [
    path('', views.principal, name="principal"),
    path('busqueda-cliente', views.busqueda_cliente, name="busqueda-cliente"),
    path('cliente/<pk>/', BusquedaCliente.as_view(), name="cliente"),
    path('cliente-no-encontrado', views.cliente_no_encontrado, name = "cliente-no-encontrado"),
    path('menu-orden1', views.menu_orden, name = "menu-orden1"),
    path('resumen-pedido', views.resumen_pedido, name="resumen-pedido"),
    path('cliente/<pk>/perfil-cliente/', PerfilCliente.as_view(), name='perfil-cliente'),
    path('admin-cliente', AdminCliente.as_view(), name='admin-cliente'),
    path('registrar-clientes', views.registrar_clientes, name="registrar-clientes"),
    path("menus-del-dia", views.menus_del_dia, name="menus-del-dia"),
    path("crear-nuevo-menu", views.crear_nuevo_menu, name="crear-nuevo-menu"),
    path('gestion-platillos-principal',views.gestion_platillos_principal, name="gestion-platillos-principal"),
    path('agregar-platillo',views.agregar_platillo, name="agregar-platillo"),
    path('modificar-platillo',views.modificar_platillo, name="modificar-platillo"),
    path('eliminar-platillo', views.eliminar_platillo, name ="eliminar-platillo")
]
