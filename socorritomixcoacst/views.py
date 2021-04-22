from django.views.generic import ListView, DetailView
from django.shortcuts import render, redirect
from django.forms.models import model_to_dict
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

    #Jalamos de la BD los platillos tales que sean parte de los menús del día y que estén disponibles
    lista_platillos = [platilloMenu.platillo for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now()) and platilloMenu.disponible]
    platillos = Platillo.objects.all()
    paquete1=Platillo.objects.filter(desayuno__nombre = "Paquete 1")
    paquete2=Platillo.objects.filter(desayuno__nombre = "Paquete 2")
    paquete3=Platillo.objects.filter(desayuno__nombre = "Paquete 3")
    paquete4=Platillo.objects.filter(desayuno__nombre = "Paquete 4")
    paquete5=Platillo.objects.filter(desayuno__nombre = "Paquete 5")
    paquete6=Platillo.objects.filter(desayuno__nombre = "Paquete 6")
    paquete7=Platillo.objects.filter(desayuno__nombre = "PaqueteInfantil")
    Desayunos = Desayuno.objects.all()
    print("Aquí comienza:----------------------------------------------------------------------------------------------------")
    print (Desayunos)

    if request.method == "POST":

        todos_menus = []
        todos_ordenes = []
        todos_bebidas = []
        todos_extras = []
        todos_desayunos = [] #lista de los potenciales ordenplatillo que se mandará a la vista resumen_pedido

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

            #si es un paquete de desayuno
            if "orden-desayunos" in clave:
                todos_desayunos.append(tuple((clave.replace("orden-desayunos_", ""), valor)))

        request.session['todos_menus'] = todos_menus
        request.session['todos_ordenes'] = todos_ordenes
        request.session['todos_bebidas'] = todos_bebidas
        request.session['todos_extras'] = todos_extras
        request.session['todos_desayunos'] = todos_desayunos

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
        context['platillo'] = platillos
        context['paquete1'] = paquete1
        context['paquete2'] = paquete2
        context['paquete3'] = paquete3
        context['paquete4'] = paquete4
        context['paquete5'] = paquete5
        context['paquete6'] = paquete6
        context['paquete7'] = paquete7
        context['desayunos'] = Desayunos

        return render(request, 'menu-orden.html', context)

def resumen_pedido(request):
    #TODO actualizar los atributos compras_realizadas e ingresos_generados del cliente, cada vez que se realiza una orden

    numero_menu = 1

    todos_menus = request.session['todos_menus']
    todos_ordenes = request.session['todos_ordenes']
    todos_extras = request.session['todos_extras']
    todos_bebidas = request.session['todos_bebidas']
    todos_desayunos = request.session['todos_desayunos']

    observaciones = request.session.get('observaciones')

    cliente = Cliente.objects.filter(id=request.session.get("cliente_actual"))
    pedidos_del_cliente = [] #lista para pasar los pedidos del cliente al frontend

    #creamos la potencial orden del clinte
    orden = Orden(total=0,
                  promocion=False,
                  total_descuento=0,
                  fecha=dt.now(),
                  cliente=cliente[0])

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
            platillo_menu_3 = OrdenPlatillo(sub_total=(HistorialPrecio.objects.filter(platillo=platillo_actual, es_precio_actual=True)[0].precio + 20),
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
        platillo_orden = OrdenPlatillo(sub_total=(HistorialPrecio.objects.filter(platillo=platillo_actual, es_precio_actual=True)[0].precio * cantidad_platillo_actual),
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
        platillo_orden = OrdenPlatillo(sub_total=(HistorialPrecio.objects.filter(platillo=platillo_actual, es_precio_actual=True)[0].precio * cantidad_platillo_actual),
                                       es_completa=False,
                                       cantidad=cantidad_platillo_actual,
                                       orden=orden,
                                       platillo=platillo_actual)
        pedidos_del_cliente.append(platillo_orden)
        orden.total += platillo_orden.sub_total

    #agregamos las bebidas a la lista pedidos_del_cliente
    print(todos_bebidas)
    for i in range(len(todos_bebidas)):
        platillo_actual = Platillo.objects.filter(nombre=todos_bebidas[i][0])[0]
        cantidad_platillo_actual = int(todos_bebidas[i][1])
        platillo_orden = OrdenPlatillo(sub_total=(HistorialPrecio.objects.filter(platillo=platillo_actual, es_precio_actual=True)[0].precio * cantidad_platillo_actual),
                                       es_completa=False,
                                       cantidad=cantidad_platillo_actual,
                                       orden=orden,
                                       platillo=platillo_actual)
        pedidos_del_cliente.append(platillo_orden)
        orden.total += platillo_orden.sub_total

    #agregamos los deayunos a la lista pedidos_del_cliente
    #ordenar todos desayunos en una tupla con paquete, platillos correspondientes
    desayunos = []
    platillos = []
    for c, v in todos_desayunos:
        #verificar si hay _
        if not "_" in c:
            #agregar el paquete a la lista desayunos
            desayunos.append((numero_menu, v))
            numero_menu += 1
        else:
            #agregar los platillos de los paquetes a la lista platillos con la clave correspondiente a su paquete
            platillos.append((numero_menu - 1, v))

    print("\nTRACEBACK desayunos ordenados")
    for c, v in desayunos:
        print("clave: " + str(c) + " valor: " + v)
    for c, v in platillos:
        print("clave: " + str(c) + " valor: " + v)

    for clave, desayuno in desayunos:
        #obtener sus platillos
        platillos_desayuno = [platillo for c, platillo in platillos if c == clave]
        print("\nTRACEBACK"+ str(platillos_desayuno))

        #obterner su precio
        precio = Desayuno.objects.filter(nombre=desayuno)[0].precio
        print("precio original: "+ str(precio))
        #verificar si el precio es aumentado
        for platillo in platillos_desayuno:
            if "Leche Caliente" in platillo or "chino" in platillo or "late" in platillo or "Café con leche" in platillo:
                precio = precio +10
        print("precio nuevo: "+ str(precio) + " termina TRACEBACK\n")

        #obtener el numero_completa
        numero_completa = clave

        #crear las ordenes platillos asociados al desayuno

        for i in range(len(platillos_desayuno)):
            sub_total = 0
            if i == len(platillos_desayuno) - 1:
                sub_total = precio
            orden_platillo = OrdenPlatillo(sub_total=sub_total,
                                            es_completa=True,
                                            numero_completa=numero_completa,
                                            cantidad=1,
                                            orden=orden,
                                            platillo=Platillo.objects.filter(nombre=platillos_desayuno[i])[0])
            pedidos_del_cliente.append(orden_platillo)

    print("\nTRACEBACK pedidos_del_cliente: ")
    for op in pedidos_del_cliente:
        print(op)
    print("termina TRACEBACK\n")

    if request.method=="POST":
        for key, value in request.POST.items():
            print('Key: %s' % (key) )
            print('Value %s' % (value) )

        #actualizar datos conmplementarios de la orden
        orden.fecha = dt.now().astimezone(pytz.timezone(settings.TIME_ZONE))

        if request.POST.get('comision-extra?') == 'on':
            orden.aplica_comision = True
            orden.comision = request.POST.get('comExt')

        if request.POST.get('lleva-topper') == 'on':
            orden.lleva_topper = True

        orden.paga_con = float(request.POST.get('pagC'))
        orden.metodo_pago = request.POST.get('metodo-pago')
        orden.observaciones = request.POST.get('obs-pedido')
        orden.cambio = request.POST.get('cambio')

        '''
        #TRACEBACK nuevos campos de orden
        print("\nTRACEBACK: nuevos campos de orden")
        print("método pago: " + orden.metodo_pago)
        print("topper: " + str(orden.lleva_topper))
        print("con comisión: " + str(orden.aplica_comision))
        print("comisión: " + str(orden.comision))
        print("paga con: " + str(orden.paga_con))
        print("cambio: " + str(orden.cambio))
        if orden.observaciones:
            print("observaciones: " + orden.observaciones)
        print("termina TRACEBACK\n")

        print("\nComienza TRACEBACK: pagos")
        print(orden.total)
        print(orden.comision)
        print(orden.paga_con)
        print(orden.cambio)
        print("termina TRACEBACK\n")
        '''

        #verificar concordancia entre total, paga con y cambio
        if (orden.total + int(orden.comision)) == (orden.paga_con - int(orden.cambio)):
            #guardar la orden
            orden.save()

            #guardar los registros de OrdenPlatillo asociados a la orden
            for pedido in pedidos_del_cliente:
                pedido.orden=orden
                pedido.save()

            if orden.promocion:
                cliente.update(compras_realizadas=cliente[0].compras_realizadas + 1, ingresos_generados=cliente[0].ingresos_generados + orden.total_descuento)
            else:
                cliente.update(compras_realizadas=cliente[0].compras_realizadas + 1, ingresos_generados=cliente[0].ingresos_generados + orden.total)

            #mandar el id de la orden en una variable de sesión
            request.session['id_orden_generada'] = orden.id

            #redireccionar a la página de impresión del ticket
            return redirect(impresion_ticket)

        else:
            messages.warning(request, "¡¡¡Error de concordancia en totales!!! contacta al desarrollador")
            return redirect(resumen_pedido)

    else: #Método GET
        context = {}

        context['orden_del_cliente'] = orden
        context['pedidos_del_cliente'] = pedidos_del_cliente
        context["observaciones"] = observaciones
        context["cliente"] = cliente[0]
        return render(request, "resumen-pedido.html", context)

def impresion_ticket(request):
    #recibir la orden de la variable de sesión
    orden = Orden.objects.filter(id=request.session.get('id_orden_generada'))[0]

    #obtener ordenes platillo correspondientes a la orden:
    pedidos_del_cliente = OrdenPlatillo.objects.filter(orden=orden)

    print("\nTRACEBACK orden generada: " + str(orden) + "termina TRACEBACK\n")

    context = {}
    context['orden'] = orden
    context['pedidos_del_cliente'] = pedidos_del_cliente
    return render(request, "impresion-ticket.html", context)

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
        context['ordenes_platillo'] = [orden_platillo for orden_platillo in OrdenPlatillo.objects.all() if orden_platillo.orden.cliente==self.object]
        fecha_ultimo_pedido = Orden.objects.filter(cliente=self.object).order_by('-fecha')
        if fecha_ultimo_pedido:
            context['fecha_ultimo_pedido'] = fecha_ultimo_pedido[0].fecha
        else:
            context['fecha_ultimo_pedido'] = "Sin pedidos realizados"

        context['dinero_gastado_por_cliente'] = self.object.ingresos_generados

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
        
        if request.POST.get("input"):
            ordensita = Orden.objects.filter(id=request.POST.get("input"))[0]
            ordensita_platillos = OrdenPlatillo.objects.filter(orden=ordensita)
            context={}
            context['orden'] = ordensita
            print("la ordenswita es = " +str(ordensita))
            context['pedidos_del_cliente'] = ordensita_platillos
            print("la otra es "+str(ordensita_platillos))
            return render(request, "impresion-ticket.html", context)
        else:
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
        context['order_by_orden_fecha'] = Orden.objects.filter(fecha__range=[datetime.date.today() - timedelta(days=40), dt.now().astimezone(pytz.timezone(settings.TIME_ZONE))]).order_by('-fecha')
        context['order_by_ingresos_generados'] = Cliente.objects.order_by('-ingresos_generados')
        context['order_by_compras_realizadas'] = Cliente.objects.order_by('-compras_realizadas')
        context['order_by_compras_realizadas_mes'] = self.clientes_orderby_frecuencia
        context['order_by_ingresos_mes'] = self.clientes_orderby_ingresos_mes
        context['order_by_deben_topper'] = Orden.objects.filter(lleva_topper=True)
        return context
    
    def post(self, request, *args, **kwargs):
        
        for k, v in request.POST.items():
            print("\nclave: "+k+" valor: "+v+"\n")
            if v == "on":
                orden_id=k.replace("checkbox-","")
                Orden.objects.filter(pk=int(orden_id)).update(lleva_topper=False)
        
        return HttpResponseRedirect(request.path_info)

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
        menus_hoy = Menu.objects.filter(dia=dt.now())

        context = {}

        #creamos listas con los nombres de los platillos del menú del día de hoy, muy similar a crear-nuevo-menu con los platillos de ayer:
        #de todos los platillosMenu en la base de datos tales que su menú sea de hoy y del tipo correspondiente, forma con ellos una lista
        context["menu_desayuno"] = [platilloMenu for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in menus_hoy and platilloMenu.menu.tipo == "DE"]
        context["menu_comida"] = [platilloMenu for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in menus_hoy and platilloMenu.menu.tipo == "CO"]
        context["menu_cena"] = [platilloMenu for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in menus_hoy and platilloMenu.menu.tipo == "CE"]
        context["menus_hoy"] = menus_hoy

        return render(request, "menus-del-dia.html", context)

def crear_nuevo_menu(request):
    if request.method == "POST": #cuando mandemos la opcion "Agregar nuevo menú del día"

        #creamos los menú del día, con solo la fecha actual y el tipo de menú
        nuevaDesayuno = Menu(dia=dt.now(), tipo="DE")
        nuevaComida = Menu(dia=dt.now(), tipo="CO")
        nuevaCena = Menu(dia=dt.now(), tipo="CE")
        nuevaDesayuno.save()
        nuevaComida.save()
        nuevaCena.save()

        #Capturemos los platillos que fueron marcados en la lista, acorde a si son desayuno, comida o cena
        for clave, valor in request.POST.items():
                if valor == "on":
                    platilloMenu = PlatilloMenu(disponible=True)

                    if "desayuno" in clave:
                        platilloMenu.platillo = Platillo.objects.filter(nombre=clave.replace("-desayuno", ""))[0]
                        platilloMenu.menu = nuevaDesayuno

                    if "comida" in clave:
                        platilloMenu.platillo = Platillo.objects.filter(nombre=clave.replace("-comida", ""))[0]
                        platilloMenu.menu = nuevaComida

                    if "cena" in clave:
                        platilloMenu.platillo = Platillo.objects.filter(nombre=clave.replace("-cena", ""))[0]
                        platilloMenu.menu = nuevaCena

                    platilloMenu.save()

        return redirect("menus-del-dia")

    else: #el request es GET
        context = {}

        #Mandamos una lista con todos los platillos de la BD que no están eliminados
        context["platillos"] = [platillo for platillo in Platillo.objects.all() if platillo.esta_eliminado == False]

        #Mandamos listas con nombres de platillos que estaban en los menús del día de ayer:
        #de todos los platillosMenu en la base de datos tales que su menú sea de ayer y del tipo correspondiente, toma los nombres de sus platillos y pasalo como una lista
        context["desayuno_ayer"] = [platilloMenu.platillo.nombre for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now() - timedelta(days=1)) and platilloMenu.menu.tipo == "DE"]
        context["comida_ayer"] = [platilloMenu.platillo.nombre for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now() - timedelta(days=1)) and platilloMenu.menu.tipo == "CO"]
        context["cena_ayer"] = [platilloMenu.platillo.nombre for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now() - timedelta(days=1)) and platilloMenu.menu.tipo == "CE"]

        return render(request, "crear-nuevo-menu.html", context)

def editar_menus(request):
    #creamos listas con los nombres de los platillos del menú del día de hoy, muy similar a crear-nuevo-menu con los platillos de ayer:
    #de todos los platillosMenu en la base de datos tales que su menú sea de hoy y del tipo correspondiente, toma los nombres de sus platillos, y forma con ellos una lista
    desayuno_hoy = [platilloMenu.platillo.nombre for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now()) and platilloMenu.menu.tipo == "DE"]
    comida_hoy = [platilloMenu.platillo.nombre for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now()) and platilloMenu.menu.tipo == "CO"]
    cena_hoy = [platilloMenu.platillo.nombre for platilloMenu in PlatilloMenu.objects.all() if platilloMenu.menu in Menu.objects.filter(dia=dt.now()) and platilloMenu.menu.tipo == "CE"]

    #extraemos de la BD todos los platillos que no estén eliminados
    platillos = [platillo for platillo in Platillo.objects.all() if platillo.esta_eliminado == False]

    if request.method == "GET":
        context = {}

        context["platillos"] = platillos

        context["desayuno_hoy"] = desayuno_hoy
        context["comida_hoy"] = comida_hoy
        context["cena_hoy"] = cena_hoy

        return render(request, "editar-menus.html", context)

    if request.method == "POST":
        #recuperamos los 3 menus del día de hoy
        desayuno = Menu.objects.filter(dia=dt.now(), tipo="DE")[0]
        comida = Menu.objects.filter(dia=dt.now(), tipo="CO")[0]
        cena = Menu.objects.filter(dia=dt.now(), tipo="CE")[0]

        #actualizamos los platilloMenu acorde a lo ingresado en la vista para cada tipo de menú:
        # Si el platillo no está incluido en el menú pero el checkbox correspondiente está marcado, creamos y guardamos un nuevo PlatilloMenu.
        # Si el platillo está incluido en el menú pero el checkbox correspondiente está desmarcado, borramos el PlatilloMenu correspondiente.
        for platillo in platillos:
            if request.POST.get(platillo.nombre + "-desayuno") == "on" and not platillo.nombre in desayuno_hoy:
                nuevoPlatilloMenu = PlatilloMenu(disponible=True,
                                                 platillo=Platillo.objects.filter(nombre=platillo.nombre)[0],
                                                 menu=desayuno)
                nuevoPlatilloMenu.save()
            if request.POST.get(platillo.nombre + "-desayuno") == None and platillo.nombre in desayuno_hoy:
                platilloMenuBorrado = PlatilloMenu.objects.filter(platillo=platillo,
                                                                  menu=desayuno)[0]
                platilloMenuBorrado.delete()

            if request.POST.get(platillo.nombre + "-comida") == "on" and not platillo.nombre in comida_hoy:
                nuevoPlatilloMenu = PlatilloMenu(disponible=True,
                                                 platillo=Platillo.objects.filter(nombre=platillo.nombre)[0],
                                                 menu=comida)
                nuevoPlatilloMenu.save()
            if request.POST.get(platillo.nombre + "-comida") == None and platillo.nombre in comida_hoy:
                platilloMenuBorrado = PlatilloMenu.objects.filter(platillo=platillo,
                                                                  menu=comida)[0]
                platilloMenuBorrado.delete()

            if request.POST.get(platillo.nombre + "-cena") == "on" and not platillo.nombre in cena_hoy:
                nuevoPlatilloMenu = PlatilloMenu(disponible=True,
                                                 platillo=Platillo.objects.filter(nombre=platillo.nombre)[0],
                                                 menu=cena)
                nuevoPlatilloMenu.save()
            if request.POST.get(platillo.nombre + "-cena") == None and platillo.nombre in cena_hoy:
                platilloMenuBorrado = PlatilloMenu.objects.filter(platillo=platillo,
                                                                  menu=cena)[0]
                platilloMenuBorrado.delete()

        return redirect("menus-del-dia")

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
                if "GU" in valor or "BE" in valor or "EX" in valor:
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(tipo = valor, es_complemento = False)
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(es_complemento = False)
                else:
                    modificacion_platillo  = Platillo.objects.filter(pk=int(idModificar)).update(tipo = valor, es_complemento = True)
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
def aux(request):
    context = {}
    return render(request, "aux.html", context)