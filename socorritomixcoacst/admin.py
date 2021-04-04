from django.contrib import admin
from .models import Usuario, Cliente, Orden, OrdenPlatillo, Platillo, HistorialPrecio

# Register your models here.
admin.site.register(Usuario)
admin.site.register(Cliente)
admin.site.register(Orden)
admin.site.register(OrdenPlatillo)
admin.site.register(Platillo)
admin.site.register(HistorialPrecio)