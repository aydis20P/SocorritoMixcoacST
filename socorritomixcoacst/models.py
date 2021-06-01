from django.db import models
from django.conf import settings
from django.shortcuts import reverse
from django.utils import timezone



TIPO_CLIENTE = (('NU', 'nuevo'), ('FR', 'frecuente'), ('ES', 'esporádico'), ('FA', 'favorito'))
TIPO_PLATILLO = (('EN', 'entrada'), ('ST', 'segundo tiempo'), ('GU', 'guisado'), ('EX', 'extra'), ('SU', 'sushi'), ('BE', 'bebida'))
TIPO_MENU = (('DE', 'desayunos'),('CO','comidas'),('CE','cenas'))
TIPO_USUARIO = (('AD', 'administrador'),('EM','empleado'))
METODO_PAGO = (('EF','efectivo'),('TE','terminál'),('PA','pagado'))
TIPO_DESAYUNO = (('D1', "desayunito"), ('D2', "desayuno"), ('D3', "desayunote"))

class Cliente(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False)
    telefono = models.CharField(max_length=10, null=False, blank=False, unique=True)
    direccion = models.CharField(max_length=128, null=False, blank=False)
    referencias = models.CharField(max_length=128, null=True, blank=True)
    tipo = models.CharField(choices=TIPO_CLIENTE, max_length=2, null=False, blank=False)
    telefono_alternativo = models.CharField(max_length=10, null=True, blank=True)
    fecha_registro = models.DateField(null=False, default=timezone.now)
    compras_realizadas = models.IntegerField(null=False, default=0)
    ingresos_generados = models.FloatField(null=False, default=0)

    def __str__(self):
        return "Nombre: " + self.nombre + ", Tel: " + self.telefono

    def get_absolute_url(self):
        return reverse("cliente", args=[str(self.id)])

class Orden(models.Model):
    total = models.FloatField(max_length=5, null=False)
    promocion = models.BooleanField(null=False, default=False)
    lleva_topper = models.BooleanField(null=False, default=False)
    total_descuento = models.FloatField(max_length=5, null=True)
    fecha = models.DateTimeField(null=False)
    cliente = models.ForeignKey(Cliente, on_delete=models.PROTECT)
    metodo_pago = models.CharField(choices=METODO_PAGO, max_length=2, null=False, blank=False, default="EF")
    aplica_comision = models.BooleanField(null=False, default=False)
    comision = models.IntegerField(null=False, default=0)
    paga_con = models.FloatField(max_length=5, null=False)
    observaciones = models.CharField(max_length=256, null=True, blank=True)
    cambio = models.FloatField(max_length=5, null=False)
    cambio_devuelto = models.BooleanField(null=False, default=False)

    def __str__(self):
        return "ID: " + str(self.id) + ", Fecha: " + str(self.fecha) + ", Monto: $"+ str(self.total_descuento) + ", Cliente: " + self.cliente.nombre


class Platillo(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False, unique=True)
    descripcion = models.CharField(max_length=256, null=False, blank=False)
    tipo = models.CharField(choices=TIPO_PLATILLO, max_length=2, null=False, blank=False)
    es_complemento = models.BooleanField(null=False)
    esta_eliminado = models.BooleanField(null= False, default=False)
    es_constante = models.BooleanField(null=False, default=False)
    tipo_desayuno = models.CharField(choices=TIPO_DESAYUNO, max_length=2, null=True, blank=True)

    def __str__(self):
        cadena_frontend = ("ID:" +str(self.id) + " Nombre: " + self.nombre + " Tipo: "+ self.tipo + " Es complemento: " + str(self.es_complemento) +
                            " Es constante: " + str(self.es_constante))

        if self.tipo_desayuno:
            cadena_frontend += (" tipo_desayuno: " + self.tipo_desayuno)

        if self.esta_eliminado:
            cadena_frontend += (" ELIMINADO")
        return cadena_frontend


class OrdenPlatillo(models.Model):
    sub_total = models.FloatField(max_length=5, null=False)
    es_completa = models.BooleanField(null=False)
    numero_completa = models.IntegerField(null=True)
    observaciones_completa = models.CharField(max_length=256, null=True, blank=True)
    cantidad = models.IntegerField(null=False)
    orden = models.ForeignKey(Orden, on_delete=models.PROTECT)
    platillo = models.ForeignKey(Platillo, on_delete=models.PROTECT)

    def __str__(self):
        return "ID: " + str(self.id) + ", Es completa: " + str(self.es_completa) + ", Numero completa: " + str(self.numero_completa) + ", Platillo: " + self.platillo.nombre + ", Cantidad: " + str(self.cantidad) + ", Subtotal: $" + str(self.sub_total)

class Desayuno(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False, unique=True)
    precio = models.FloatField(max_length=5, null=False)
    platillos = models.ManyToManyField(Platillo)

    def __str__(self):
        return self.nombre + " Precio: " + str(self.precio)

class OrdenDesayuno(models.Model):
    orden = models.ForeignKey(Orden, on_delete=models.PROTECT)
    desayuno = models.ForeignKey(Desayuno, on_delete=models.PROTECT)
    sub_total = models.FloatField(max_length=5, null=False)
    cantidad = models.IntegerField(null=False)

class Promocion(models.Model):
    nombre = models.CharField(max_length=64, null=False, blank=False, unique=True)
    vigencia_dias = models.IntegerField(null=True)
    es_por_periodo = models.BooleanField(null=False, default=False)

class ClientePromocion(models.Model):
    fecha_inicio = models.DateField(null=True)
    fecha_fin = models.DateField(null=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.PROTECT)
    promocion = models.ForeignKey(Promocion, on_delete=models.PROTECT)

class Menu(models.Model):
    dia = models.DateField(null=False)
    tipo = models.CharField(choices=TIPO_MENU, max_length=2, null=False, blank=False)

    def __str__(self):
        return "Día: " + str(self.dia) + ", Tipo: " + self.tipo

class PlatilloMenu(models.Model):
    disponible = models.BooleanField(null=False)
    platillo = models.ForeignKey(Platillo, on_delete=models.PROTECT)
    menu = models.ForeignKey(Menu, on_delete=models.PROTECT)

    def __str__(self):
        return "Menú: (" + str(self.menu) + "), Platillo: (" + str(self.platillo) + "), Disponible: " + str(self.disponible)

class Usuario(models.Model):
    user = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    rol = models.CharField(choices=TIPO_USUARIO, max_length=2, null=False, blank=False)

class HistorialPrecio(models.Model):
    precio = models.FloatField(null=False)
    fecha = models.DateTimeField(null=False, auto_now_add=True)
    es_precio_actual = models.BooleanField(null=False, default=True)
    platillo = models.ForeignKey(Platillo, on_delete=models.PROTECT)
