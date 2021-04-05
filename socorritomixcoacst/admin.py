from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Usuario)
admin.site.register(Cliente)
admin.site.register(Orden)
admin.site.register(OrdenPlatillo)
admin.site.register(Platillo)
admin.site.register(HistorialPrecio)
admin.site.register(Menu)
admin.site.register(PlatilloMenu)