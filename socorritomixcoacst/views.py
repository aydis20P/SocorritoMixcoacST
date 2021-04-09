from django.views.generic import ListView, DetailView
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.db import IntegrityError
from django.contrib import messages
from django.conf import settings
from .models import *
import pytz
import datetime
from datetime import datetime as dt, timedelta

def principal(request):
    context = {}
    return render(request, 'principal.html', context)

def busqueda_cliente(request):
    if request.method=="POST":
        qs_clientes = Cliente.objects.filter(telefono=request.POST.get("telefono"))

        if qs_clientes:
            cliente_encontrado = qs_clientes[0]
            cliente_url = cliente_encontrado.get_absolute_url()
            return redirect(cliente_url)

        else:
            print("No se encontró el cliente")#TODO desplegar mensaje advirtiendo
            messages.warning(request, "¡¡¡No se encontró al cliente!!!")
            context = {}
            return redirect('cliente-no-encontrado')

    else:
        context = {}
        return render(request, 'busqueda-cliente-principal.html', context)

class BusquedaCliente(DetailView):
    model = Cliente
    template_name = "busqueda-cliente.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        self.request.session["cliente_actual"] = self.object.id
        return context

def cliente_no_encontrado(request):
    context = {}
    return render(request, 'busqueda-cliente-no-encontrado.html', context)

def menu_orden(request):
    #Primero jalamos de la base de datos los platillos,
    #desglosados en forma de diferentes listas para cada vista
    entradas = []
    segundos_tiempos = []
    guisados = []

    lista_platillos = Platillo.objects.all()

    if request.method == "POST":

        todos_menus = []
        todos_ordenes = []
        todos_bebidas = []
        todos_extras = []

        pedido = []
        request.session['observaciones'] = request.POST.get('observaciones')

        for clave, valor in request.POST.items():
            print("Clave: %s" % (clave))
            print("Valor: %s" % (valor))

            if "menu-" in clave:
                todos_menus.append(tuple((clave, valor)))

            if "orden_de_" in clave:
                if int(valor) > 0:
                    todos_ordenes.append(tuple((clave.replace("orden_de_", ""), valor)))

            if "orden_bebida_de_" in clave:
                if int(valor) > 0:
                    todos_bebidas.append(tuple((clave.replace("orden_bebida_de_", ""), valor)))

            if "orden_extra_de_" in clave:
                if int(valor) > 0:
                    todos_extras.append(tuple((clave.replace("orden_extra_de_", ""), valor)))

        request.session['todos_menus'] = todos_menus
        request.session['todos_ordenes'] = todos_ordenes
        request.session['todos_bebidas'] = todos_bebidas
        request.session['todos_extras'] = todos_extras
        #TODO request.session['todos_desayunos'] = todos_desayunos

        return redirect('resumen-pedido')

    else: #Método GET

        #obtener la url de la página anterior
        pag_ant = request.META.get('HTTP_REFERER')
        print(pag_ant)

        context = {}
        context['referer'] = pag_ant #mandarlo en el contexto
        context['platillos'] = lista_platillos #Todos los platillos de la BD
        context['entradas'] = entradas
        context['segundos_tiempos'] = segundos_tiempos
        context['guisados'] = guisados
        return render(request, 'menu-orden.html', context)

def resumen_pedido(request):
    #TODO actualizar los atributos compras_realizadas e ingresos_generados del cliente, cada vez que se realiza una orden

    numero_menu = 1

    todos_menus = request.session['todos_menus']
    todos_ordenes = request.session['todos_ordenes']
    todos_extras = request.session['todos_extras']

    observaciones = request.session.get('observaciones')

    cliente = Cliente.objects.filter(id=request.session.get("cliente_actual"))[0]
    pedidos_del_cliente = [] #lista para pasar los pedidos del cliente al frontend

    #creamos la potencial orden del clinte
    orden = Orden(total=0,
                  promocion=False,
                  total_descuento=0,
                  fecha=dt.now(),
                  cliente=cliente)

    #agregamos los menús completos a la lista pedidos_del_cliente
    numero_menu = 1
    for i in range(len(todos_menus)):
        platillo_actual = Platillo.objects.filter(nombre=todos_menus[i][1])[0]

        if i % 3 == 0: #Entradas
            platillo_menu_1 = OrdenPlatillo(sub_total=0,
                                            es_completa=True,
                                            numero_completa=numero_menu,
                                            cantidad=1,
                                            orden=orden,
                                            platillo=platillo_actual)
            pedidos_del_cliente.append(platillo_menu_1)

        if i % 3 == 1: #Segúndos tiempos
            platillo_menu_2 = OrdenPlatillo(sub_total=0,
                                            es_completa=True,
                                            numero_completa=numero_menu,
                                            cantidad=1,
                                            orden=orden,
                                            platillo=platillo_actual)
            pedidos_del_cliente.append(platillo_menu_2)

        if i % 3 == 2: #Guisado
            platillo_menu_3 = OrdenPlatillo(sub_total=(platillo_actual.precio + 20),
                                            es_completa=True,
                                            numero_completa=numero_menu,
                                            cantidad=1,
                                            orden=orden,
                                            platillo=platillo_actual)
            pedidos_del_cliente.append(platillo_menu_3)
            numero_menu += 1
            orden.total += platillo_menu_3.sub_total

    #agregamos las "órdenes" sueltas a la lista pedidos_del_cliente
    for i in range(len(todos_ordenes)):
        platillo_actual = Platillo.objects.filter(nombre=todos_ordenes[i][0])[0]
        cantidad_platillo_actual = int(todos_ordenes[i][1])
        platillo_orden = OrdenPlatillo(sub_total=(platillo_actual.precio * cantidad_platillo_actual),
                                       es_completa=False,
                                       cantidad=cantidad_platillo_actual,
                                       orden=orden,
                                       platillo=platillo_actual)
        pedidos_del_cliente.append(platillo_orden)
        orden.total += platillo_orden.sub_total

    #agregamos los extras a la lista pedidos_del_cliente
    for i in range(len(todos_extras)):
        platillo_actual = Platillo.objects.filter(nombre=todos_extras[i][0])[0]
        cantidad_platillo_actual = int(todos_extras[i][1])
        platillo_orden = OrdenPlatillo(sub_total=(platillo_actual.precio * cantidad_platillo_actual),
                                       es_completa=False,
                                       cantidad=cantidad_platillo_actual,
                                       orden=orden,
                                       platillo=platillo_actual)
        pedidos_del_cliente.append(platillo_orden)
        orden.total += platillo_orden.sub_total

    if request.method=="POST":
        for key, value in request.POST.items():
            print('Key: %s' % (key) )
            print('Value %s' % (value) )

        orden.fecha=dt.now().astimezone(pytz.timezone(settings.TIME_ZONE))
        pago_con=float(request.POST.get('pagC'))
        cambio=float(pago_con - orden.total)#TODO: try...

        orden.save()

        for pedido in pedidos_del_cliente:
            pedido.orden=orden
            pedido.save()

        return redirect(principal)

    else: #Método GET
        context = {}

        context['orden_del_cliente'] = orden
        context['pedidos_del_cliente'] = pedidos_del_cliente
        context["observaciones"] = observaciones
        context["cliente"] = cliente
        return render(request, "resumen-pedido.html", context)

class PerfilCliente(DetailView):
    model = Cliente
    template_name = "perfil-cliente.html"

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)

        #TODO revisar flujo hacia esta template cuando se llega desde la vista administrativa
        #en base a ello modificar referer

        #obtener la url actual
        url_actual = self.request.get_full_path()

        #quitar la subcadena 'perfil-cliente/' de la url actual
        nueva_url = url_actual.replace('perfil-cliente/','')

        #mandar la nueva url en el contxto con el nombre referer
        context['referer'] = nueva_url

        #Se obtienen todos los pedidos realizados por el cliente y se guardan en una lista
        lista_pedidos = Orden.objects.filter(cliente=self.object)
        context['pedidos'] = lista_pedidos
        #Se obtienen todas las ordenesPlatillo asociadas a los pedidos del cliente
        lista_ordenesPlatillo = []

        #Aprovechando el cliclo for que era inicialmente para las ordenesPlatillo, de una vez sacamos la fecha del último pedido realizado por el cliente
        #También aprovechamos el mismo ciclo for para sacar el total de dinero gastado por el cliente en la fonda
        fecha_ultimo_pedido = datetime.datetime(1900, 1, 1, 17, 55) #Inicialmente le asignamos una fecha lejana en el tiempo
        fecha_mexico = pytz.timezone("America/Mexico_City") #Esta variable nos permite formatear la fecha inicial a una compatible con models.DateField, esto para poder hacer comparaciones
        fecha_ultimo_pedido = fecha_mexico.localize(fecha_ultimo_pedido) #En este punto las fechas ya se puede comparar
        fecha_aux = pytz.timezone("America/Mexico_City").localize(datetime.datetime(1900, 1, 1, 17, 55)) #Variable auxiliar que sirve para hacer verificaciones posteriormente

        dinero_gastado_por_cliente = 0

        for pedido in lista_pedidos:
            if pedido.fecha > fecha_ultimo_pedido:
                fecha_ultimo_pedido = pedido.fecha
            aux = OrdenPlatillo.objects.filter(orden=pedido)
            dinero_gastado_por_cliente = dinero_gastado_por_cliente + pedido.total
            for ordenPlatillo in aux:
                lista_ordenesPlatillo.append(ordenPlatillo)

        context['ordenes_platillo'] = lista_ordenesPlatillo

        #El siguiente condicional se utiliza para que el form-outline "Fecha del último pedido realizado:" se muestre vacío cuando el cliente no ha realizado ninguna compra
        if fecha_ultimo_pedido > fecha_aux:
            context['fecha_ultimo_pedido'] = fecha_ultimo_pedido
        else:
            context['fecha_ultimo_pedido'] = ""
        context['dinero_gastado_por_cliente'] = dinero_gastado_por_cliente

        #Se obtiene el número de pedidos realizados y se envía como contexto
        context['num_pedidos_realizados'] = len(lista_pedidos)
        return context

    def post(self, request, *args, **kwargs):
        self.object = self.get_object() # asignar object a la vista
        nombre = str(request.POST.get("nombre"))
        telefono_alternativo = request.POST.get("telefono_alternativo")
        direccion = str(request.POST.get("direccion"))
        referencias = request.POST.get("referencias")
        tipo = request.POST.get("nombre")

        if nombre:
            self.object.nombre=nombre
        if telefono_alternativo:
            self.object.telefono_alternativo=telefono_alternativo
        if direccion:
            self.object.direccion=direccion
        if referencias:
            self.object.referencias=referencias
        self.object.save()

        return HttpResponseRedirect(request.path_info)

class AdminCliente(ListView):
    model = Cliente
    template_name = "admin-cliente.html"
    context_object_name = 'clientes'

    ordenes_por_cliente = []
    for cliente in Cliente.objects.all():
        ordenes_por_cliente.append(Orden.objects.filter(cliente=cliente, fecha__range=[pytz.timezone("America/Mexico_City").localize(datetime.datetime.today()) - timedelta(days=30), pytz.timezone("America/Mexico_City").localize(datetime.datetime.today())]))

    clientes_orderby_ingresos_mes = []
    for qs in ordenes_por_cliente:
        if qs:
            ingresos_generados_mes = 0
            aux = qs[0]
            cliente = aux.cliente
            for i in range(0,len(qs)):
                if qs[i].promocion:
                    ingresos_generados_mes += qs[i].total_descuento
                else:
                    ingresos_generados_mes += qs[i].total
            tuplita = tuple((cliente, ingresos_generados_mes))
            clientes_orderby_ingresos_mes.append(tuplita)

    clientes_orderby_ingresos_mes.sort(key=lambda x:x[1])
    clientes_orderby_ingresos_mes.reverse()

    ordenes_por_cliente.sort(key = len)
    ordenes_por_cliente.reverse()

    clientes_orderby_frecuencia = []
    for qs in ordenes_por_cliente:
        if qs:
            frecuencia = len(qs)
            aux = qs[0]
            cliente = aux.cliente
            tuplita = tuple((cliente, frecuencia))
            clientes_orderby_frecuencia.append(tuplita)

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['order_by_fecha_registro_antiguos'] = Cliente.objects.order_by('fecha_registro')
        context['order_by_fecha_registro_recientes'] = Cliente.objects.order_by('-fecha_registro')
        context['order_by_nombre'] = Cliente.objects.order_by('nombre')
        context['order_by_orden_fecha'] = Orden.objects.filter(fecha__range=[datetime.date.today() - timedelta(days=40), datetime.date.today()]).order_by('-fecha')
        context['order_by_ingresos_generados'] = Cliente.objects.order_by('-ingresos_generados')
        context['order_by_compras_realizadas'] = Cliente.objects.order_by('-compras_realizadas')
        context['order_by_compras_realizadas_mes'] = self.clientes_orderby_frecuencia
        context['order_by_ingresos_mes'] = self.clientes_orderby_ingresos_mes
        return context

def registrar_clientes(request):
    #Pregunta si hay datos ocultos(POST)
    if request.method == "POST":
        cliente_registro = Cliente(nombre=request.POST.get("nombre")+" "+request.POST.get("apellidos"),
                            direccion=request.POST.get("direccion"),
                            telefono=request.POST.get("telefono"),
                            telefono_alternativo=request.POST.get("telefonoalt"),
                            referencias=request.POST.get("obs"),
                            tipo="NU"
                            )
        #Manejo de excepciones
        try:

            #Guarda los datos en BD (mysql)
            cliente_registro.save()
            #Redirecciona la página a una url absoluta que contiene los datos del cliente
            return redirect(cliente_registro.get_absolute_url())
        #Si existe una excepción de IntegrityError
        except IntegrityError:
            print("Este cliente ya está registrado ") #TODO mandar mensaje advirtiendo ckiente registrado
            context = {}
            #Vuelve a la ventana registrar-clientes
            return render (request, 'registrar-clientes.html', context)

    else:
        context = {}
        return render (request, 'registrar-clientes.html', context)

def menus_del_dia(request):
    if request.method == "POST":
        for clave, valor in request.POST.items():
            if valor == "on":
                platillo = Platillo.objects.filter(nombre=clave)[0]
                platillo_menu = PlatilloMenu.objects.filter(platillo=platillo)
                platillo_menu.update(disponible=False)

        return redirect("menus-del-dia")

    else:
        #Jalamos de la BD todos los platillosMenu para mostrarlos en la vista,
        #En forma de una lista de diccionarios con cada campo de PlatilloMenu como entrada
        menus_platillo = []
        for platillo_menu in PlatilloMenu.objects.all():
            menus_platillo.append({"disponible": platillo_menu.disponible,
                                   "platillo": platillo_menu.platillo,
                                   "menu": platillo_menu.menu})

        context = {}
        context["menus_platillo"] = menus_platillo
        return render(request, "menus-del-dia.html", context)

def crear_nuevo_menu(request):
    if request.method == "POST": #cuando mandemos la opcion "Agregar nuevo menú del día"

        #creamos el menú del día, con solo la fecha actual, y la lista de platillosMenu a tratar
        nuevoMenu = Menu(dia=dt.now())
        platillosMenu = []

        for clave, valor in request.POST.items():

            #capturemos el select que nos dirá que tipo de menú vamos a manejar
            if valor in [tipo[0] for tipo in TIPO_MENU]:
                nuevoMenu.tipo = valor

            #Ahora capturemos los platillos que fueron marcados en la lista
            if valor == "on":
                platillosMenu.append(PlatilloMenu(disponible=True,
                                            platillo=Platillo.objects.filter(nombre=clave)[0],
                                            menu=nuevoMenu))

            #guardemos los platillosMenu y el Menú en la BD
            nuevoMenu.save()
            for platilloMenu in platillosMenu:
                platilloMenu.save()

        return redirect("menus-del-dia")

    context = {}
    context["platillos"] = [platillo for platillo in Platillo.objects.all() if platillo.esta_eliminado == False]
    return render(request, "crear-nuevo-menu.html", context)


def gestion_platillos_principal(request):
    return render(request, "gestion-platillos-principal.html")


def agregar_platillo(request):
    if request.method == "POST":

        #traceback para verificar lo que viene del post en el diccionario correspondiente
        print("\nTRACEBACK: MÉTODO POST, RETURN DICT FROM POST")
        for clave, valor in request.POST.items():
            print("Clave: %s" % (clave))
            print("Valor: %s" % (valor))
        print("END TRACEBACK\n")

        #revisamos si el platillo a registrar es complemeto
        tipo_platillo = request.POST.get("select-tipo")
        es_complemento = False
        if not (tipo_platillo == "GU" or tipo_platillo == "BE" or tipo_platillo == "EX"):
            #en caso de no ser bebida ni guisado cambiamos la variable es_complemento a True
            es_complemento = True

        #creamos un objeto de tipo platillo que potencialmente se guardará con el método save()
        nuevo_platillo = Platillo(nombre=request.POST.get("nom-plat"),
                                   es_complemento=es_complemento,
                                   descripcion=request.POST.get("descripcion"),
                                   tipo=tipo_platillo)

        #guardar el platillo

        try:
            nuevo_platillo.save()
            #Creamos un registro que guardará el precio usando la llave foranea que es el objeto "platillos_nuevos"
            precio = HistorialPrecio(precio=request.POST.get("precio"),
                                     platillo=nuevo_platillo)
            precio.save()

            return redirect("gestion-platillos-principal")

        except IntegrityError:
            #TODO enviar mensaje con advertencia.
            print("\nTRACEBACK: NO SE PUDO GUARDAR EL PLATILLO\n")

            return redirect("gestion-platillos-principal")

    else:

        #estamos en el método GET
        context = {}
        context["tip_platillo"] = TIPO_PLATILLO
        return render(request, "agregar-platillo.html", context)


def modificar_platillo(request):
    platillos = Platillo.objects.all()
    precios_de_platillos = HistorialPrecio.objects.filter(es_precio_actual=True)
    if request.method =="POST":
        #colocar en una tupla la clave y elvalor del POST
        for clave, valor in request.POST.items():
            print("Clave: %s" % (clave))
            print("Valor: %s" % (valor))  
            #busca el elemento en html con nombre modnom- recibido en clave 
            if "modnom-" in clave and valor:
                nuevoNombre = valor
                idModificar = clave.replace("modnom-plat_","")
                modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(nombre = str(nuevoNombre))      
            #busca el elemento a cambiar con nombre modprecio_ recibido en clave
            if "modprecio_" in clave and valor:
                nuevoPrecio = float(valor)
                idModificar = clave.replace("modprecio_","")
                
            
                idPlatillo = HistorialPrecio.objects.filter(pk = int(idModificar))
                modificacion_platillo = HistorialPrecio.objects.filter(pk=int(idModificar))
                modificacion_platillo.update(es_precio_actual = False )

                platillo = modificacion_platillo[0].platillo

                nuevo_Precio = HistorialPrecio(platillo = platillo, precio = nuevoPrecio)
                nuevo_Precio.save()

            #busca el elemento a cambiar con nombre modselect-tipo_ recibido en clave
            if "modselect-tipo_" in clave and valor:
                idModificar = clave.replace("modselect-tipo_","")
                if "GU" in valor:
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(es_complemento = False)
                else:
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(es_complemento = True)
            ##busca el elemento a cambiar con nombre moddescripcion_ recibido en clave        
            if "moddescripcion_" in clave and valor:
                nuevaDescripcion = valor
                idModificar = clave.replace("moddescripcion_","")
                modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(descripcion = nuevaDescripcion)
            
        return redirect("gestion-platillos-principal")
    else:    
        context = {}
        context['platillos'] = precios_de_platillos
        context["tip_platillo"] = TIPO_PLATILLO
        return render(request, "modificar-platillo.html", context)

def eliminar_platillo(request):
    platillos = Platillo.objects.all()
    precios_de_platillos = HistorialPrecio.objects.filter(es_precio_actual=True)
    if request.method =="POST":
        for clave, valor in request.POST.items():
            print("Clave: %s" % (clave))
            print("Valor: %s" % (valor))
            #Buscamos habilitar el campo esta_eliminado del platillo con id=idAeliminar
            if "True" in valor:
                idAeliminar = clave.replace("eliminar_", "")
                eliminar_P = Platillo.objects.filter(pk=int(idAeliminar)).update(esta_eliminado = True)
        return redirect("gestion-platillos-principal")

    else:    
        context = {}
        context['platillos'] = precios_de_platillos
        context["tip_platillo"] = TIPO_PLATILLO
        return render(request, "eliminar-platillo.html", context)

