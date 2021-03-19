from django.db import models
from django.conf import settings

TIPO_CLIENTE = (('NU', 'nuevo'), ('FR', 'frecuente'), ('ES', 'esporádico'), ('FA', 'favorito'))
TIPO_PLATILLO = (('GU', 'guisado'), ('EN', 'entrada'), ('ST', 'segundo tiempo'))
TIPO_MENU = (('DE', 'desayunos'),('CO','comidas'),('CENAS','cenas'))
TIPO_USUARIO = (('AD', 'administrador'),('EM','empleado'))

class Cliente(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False)
    telefono = models.CharField(max_length=10, null=False, blank=False)
    direccion = models.CharField(max_length=128, null=False, blank=False)
    referencias = models.CharField(max_length=128, null=True, blank=True)
    tipo = models.CharField(choices=TIPO_CLIENTE, max_length=2, null=False, blank=False)
    telefono_alternativo = models.CharField(max_length=10, null=True, blank=True)

class Orden(models.Model):
    total = models.FloatField(max_length=5, null=False)
    promocion = models.BooleanField(null=False)
    total_descuento = models.FloatField(max_length=5, null=True)
    fecha = models.DateTimeField(null=False)    
    cliente = models.ForeignKey(Cliente, on_delete=models.PROTECT)

class Platillo(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False)
    precio = models.FloatField(max_length=5, null=False)
    descripcion = models.CharField(max_length=128, null=False, blank=False)
    tipo = models.CharField(choices=TIPO_PLATILLO, max_length=2, null=False, blank=False)
    es_complemento = models.BooleanField(null=False)


class OrdenPlatillo(models.Model):
    sub_total = models.FloatField(max_length=5, null=False)
    es_completa = models.BooleanField(null=False)
    cantidad = models.IntegerField(null=False)
    orden = models.ForeignKey(Orden, on_delete=models.PROTECT)
    platillo = models.ForeignKey(Platillo, on_delete=models.PROTECT)

class Promocion(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False)

class ClientePromocion(models.Model):
    fecha_inicio = models.DateField(null=False)
    fecha_fin = models.DateField(null=False)
    cliente = models.ForeignKey(Cliente, on_delete=models.PROTECT)
    promocion = models.ForeignKey(Promocion, on_delete=models.PROTECT)

class Menu(models.Model):
    dia = models.DateField(null=False)
    tipo = models.CharField(choices=TIPO_MENU, max_length=2, null=False, blank=False)

class PlatilloMenu(models.Model):
    disponible = models.BooleanField(null=False)    
    platillo = models.ForeignKey(Platillo, on_delete=models.PROTECT)
    menu = models.ForeignKey(Menu, on_delete=models.PROTECT)

class Usuario(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    rol = models.CharField(choices=TIPO_USUARIO, max_length=2, null=False, blank=False)