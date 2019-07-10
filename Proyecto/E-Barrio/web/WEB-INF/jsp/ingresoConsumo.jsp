<%-- 
    Document   : ingresoConsumo
    Created on : 21-01-2019, 12:43:03
    Author     : Francisco Sáez Guerra
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.xml.wss.util.DateUtils"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Ingreso Consumo</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.imageLens.js"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('#img01').imageLens();
                $('#img02').imageLens();
            });
        </script>
    </head>
    <body>
        <script type="text/javascript">
            function makeArray() {
                for (i = 0; i < makeArray.arguments.length; i++)
                    this[i + 1] = makeArray.arguments[i];
            }
            var months = new makeArray('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo',
                    'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
            var date = new Date();
            var day = date.getDate();
            var month = date.getMonth() + 1;
            var yy = date.getYear();
            var year = (yy < 1000) ? yy + 1900 : yy;
            document.write("Hoy es " + day + " de " + months[month] + " del " + year);
        </script>
        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('.fixed-action-btn');
                var instances = M.FloatingActionButton.init(elems, {
                    hoverEnabled: false
                });
            });
        </script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <nav>
            <div class="nav-wrapper green darken-3">
                <ul class="left hide-on-med-and-down">
                    <li><a class="button-collapse" href="inicio.htm" style="color:white">Inicio</a></li>
                    <li><a href="login.htm?cerrar=true" style="color:white">Salir</a></li>
                </ul>
                <ul  class="right hide-on-med-and-down">
                    <li><a href="huellaCarbono.htm" style="color:white">¿Qué es la huella de carbono?</a></li>
                    <li><a href="proyectos.htm" style="color:white">Proyectos Contribuidos</a></li>
                    <li><a href="listaProyectos.htm" style="color:white">Ver Proyectos</a></li>
                    <li><a href="consumoHistorico.htm" style="color:white">Mi Consumo Histórico</a></li>
                </ul>
            </div>
        </nav>
        <%
            HttpSession sesion = request.getSession();
            String usu;
            String nivel;

            if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel").toString().equals("2")) {
                usu = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
                out.print("<h5>Usuari@: <a>" + usu + "</h5></a> ");
            } else {
                out.print("<script>location.replace('login.htm');</script>");
            }
        %>
        <input type="hidden" id="refreshed" value="no">
        <div class="container">
            <h2 style="text-align: center">Ingreso Consumo Histórico</h2>
            <hr>
            <h6 style="text-align: justify;">En esta sección podras ingresar el consumo de los últimos <strong>6 MESES</strong> para calcular el promedio de tu consumo y de esta manera conocer cuantos kwh debes ahorrar para poder cumplir con tu meta.</h6>
            <hr>
            <br/>
            <form:form class="col s12" commandName="ingresoConsumo" method="POST">
                <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                <div class="row">
                    <fieldset class="field_set">
                        <legend style="font-size:160%; color:grey">Información de proveedor de energía</legend>
                        <!-- Número de Cliente -->
                        <form:input type="hidden" path="emailuser" value="${user}"/>
                        <p class="input-field col s6"><b>Numero de cliente:</b>
                            <form:input path="numcliente" type="text" required="required" placeholder="Ej: 123456-7"/><span style="color: red">Número cliente es obligatorio.</span>
                            <form:errors path="numcliente"/>
                        </p>
                        <!-- Empresa Distribuidora de Energía -->
                        <p class="input-field col s6"><b>Empresa distribuidora de energía:</b>
                            <form:input path="distribuidora" type="text" list="distribuidora1" required="required" placeholder="Ej: Chilquinta"/><span style="color: red">Empresa es obligatorio.</span>
                            <datalist id="distribuidora1">
                                <option value="Elecnor Chile"></option>
                                <option value="CGE Distribución"></option>
                                <option value="Conafe"></option>
                                <option value="Chilquinta"></option>
                                <option value="Edelaysen"></option>
                                <option value="Edelmag"></option>
                                <option value="EEPA"></option>
                                <option value="ELECDA"></option>
                                <option value="ELIQSA"></option>
                                <option value="EMELARI"></option>
                                <option value="EMELAT"></option>
                                <option value="Empresa Electrica de Colina"></option>
                                <option value="Energia Casablanca"></option>
                                <option value="ENEL"></option>
                                <option value="FRONTEL"></option>
                                <option value="Edelmag"></option>
                                <option value="ISA Interchile"></option>
                                <option value="Litoral"></option>
                                <option value="Luz Andes"></option>
                                <option value="Luz Linares"></option>
                                <option value="Luz Osorno"></option>
                                <option value="Luz Parral"></option>
                                <option value="SAEZA"></option>
                                <option value="STS"></option>
                                <option value="Engie energía"></option>
                                <option value="Transelec"></option>
                                <option value="Transemel"></option>
                            </datalist> 
                            <form:errors path="distribuidora"/>
                        </p>
                        <!-- Nombre de Cliente -->
                        <p class="input-field col s6"><b>Nombre usuario:</b>
                            <form:input path="nomusuario" type="text" required="required" placeholder="Ej: Juan Manuel López Silva"/><span style="color: red" value="">Nombre usuario es obligatorio.</span>
                            <form:errors path="nomusuario"/>
                        </p>
                        <!-- Tipo de inmueble -->
                        <p class="input-field col s6"><b>Tipo de inmueble:</b>
                            <form:input path="inmueble" type="text" list="tipo" required="required" placeholder="Ej: Empresa"/><span style="color: red">Tipo de inmueble es obligatorio.</span>
                            <datalist id="tipo">
                                <option value="Trabajo"></option>
                                <option value="Casa"></option>
                                <option value="Empresa"></option>
                            </datalist>
                            <form:errors path="inmueble"/>
                        </p>
                        <!-- Dirección del Inmueble -->
                        <p class="input-field col s6"><b>Dirección:</b>
                            <form:input path="direccion" type="text" required="required" placeholder="Ej: Manuel Rodriguez 8451, Valparaíso"/><span style="color: red">Dirección es obligatorio.</span>
                            <form:errors path="direccion"/>
                        </p>
                        <!-- Número del Medidor -->
                        <p class="input-field col s6"><b>Número medidor:</b>
                            <form:input path="medidor" type="number" required="required" value="." placeholder="Ej: 8785652"/><span style="color: red">Número de medidor es obligatorio.</span>
                            <form:errors path="medidor"/>
                        </p>
                    </fieldset>
                    <br>
                    <fieldset class="field_set">
                        <legend style="font-size:160%; color:grey">Consumo histórico</legend>
                        <p style="font-weight: bold; text-align: center"> **Todos los datos que se solicitan en el formulario son los <b style="font-weight: bold; color: green">remarcados en un recuadro verde</b> en las imágenes de la boleta.**</p>
                        <p style="font-weight: bold; text-align: center"> **El consumo de cada mes está definido por la fecha de emisión de cada boleta, como se muestra en las siguientes imágenes:**</p> 
                        <img class="responsive-img" src="img/boleta2.jpg" id="img01" width="600" height="700"><img class="responsive-img" src="img/boleta1.jpg" id="img02" width="600" height="700">
                        <p style="font-weight: bold; text-align: center">**Los valores históricos se ingresan desde mes más proximo al más antiguo**</p>
                        <!-- Mes de la última emisión de Boleta -->
                        <div class="input-field col s6">
                            <div class="card white">
                                <div class="card-content black-text">
                                    <span class="card-title"><strong>Mes:
                                            <%
                                                Calendar fecha1 = Calendar.getInstance();
                                                fecha1.add(Calendar.MONTH, -1);
                                                SimpleDateFormat format1 = new SimpleDateFormat("dd-MM-yyyy");
                                                String formatted1 = format1.format(fecha1.getTime());
                                                out.println(formatted1);
                                            %>
                                        </strong>
                                    </span>
                                    <p> <form:input path="mes1" type="date" min="2018-06-01" required="required"/></p>
                                    <p>Consumo kWh: <form:input path="kwh1" type="number" id="kw1" placeholder="Valores en kWh" value="." required="required"/></p>
                                    <p>Consumo Mensual: <form:input path="valor1" type="number" placeholder="Valor total de la boleta en pesos ($)" id="pm1" value="." required="required"/></p>
                                </div>
                            </div>
                        </div>
                        <div class="input-field col s6">
                            <div class="card white">
                                <div class="card-content black-text">
                                    <span class="card-title"><strong>Mes:
                                            <%
                                                Calendar fecha2 = Calendar.getInstance();
                                                fecha2.add(Calendar.MONTH, -2);
                                                SimpleDateFormat format2 = new SimpleDateFormat("dd-MM-yyyy");
                                                String formatted2 = format2.format(fecha2.getTime());
                                                out.println(formatted2);
                                            %>
                                        </strong>
                                    </span>
                                    <p><form:input path="mes2" type="date" min="2018-06-01" required="required"/>
                                    </p>
                                    <p>Consumo kWh: <form:input path="kwh2" type="number" placeholder="Valores en kWh" id="kw2" required="required" value="." />  </p>
                                    <p>Consumo Mensual: <form:input path="valor2" type="number" placeholder="Valor total de la boleta en pesos ($)" id="pm2" value="." required="required"/></p>
                                </div>
                            </div>
                        </div>
                        <div class="input-field col s6">
                            <div class="card white">
                                <div class="card-content black-text">
                                    <span class="card-title"><strong>Mes:
                                            <%
                                                Calendar fecha3 = Calendar.getInstance();
                                                fecha3.add(Calendar.MONTH, -3);
                                                SimpleDateFormat format3 = new SimpleDateFormat("dd-MM-yyyy");
                                                String formatted3 = format3.format(fecha3.getTime());
                                                out.println(formatted3);
                                            %>
                                        </strong>
                                    </span>
                                    <p><form:input path="mes3" type="date" min="2018-06-01" required="required"/>
                                    </p>
                                    <p>Consumo kWh: <form:input path="kwh3" type="number" placeholder="Valores en kWh" id="kw3" value="." required="required"/></p>
                                    <p>Consumo Mensual: <form:input path="valor3" type="number" placeholder="Valor total de la boleta en pesos ($)" id="pm3" value="." required="required"/></p>
                                </div>
                            </div>
                        </div>		
                        <div class="input-field col s6">
                            <div class="card white">
                                <div class="card-content black-text">
                                    <span class="card-title"><strong>Mes:
                                            <%
                                                Calendar fecha4 = Calendar.getInstance();
                                                fecha4.add(Calendar.MONTH, -4);
                                                SimpleDateFormat format4 = new SimpleDateFormat("dd-MM-yyyy");
                                                String formatted4 = format4.format(fecha4.getTime());
                                                out.println(formatted4);
                                            %>
                                        </strong>
                                    </span>
                                    <p><form:input path="mes4" type="date" min="2018-06-01" required="required"/>
                                    </p>
                                    <p>Consumo kwh: <form:input path="kwh4" type="number" placeholder="Valores en kWh" id="kw4" value="." required="required"/></p>
                                    <p>Consumo Mensual: <form:input path="valor4" type="number" placeholder="Valor total de la boleta en pesos ($)" id="pm4" value="." required="required"/></p>
                                </div>
                            </div>
                        </div>	
                        <div class="input-field col s6">
                            <div class="card white">
                                <div class="card-content black-text">
                                    <span class="card-title"><strong>Mes:
                                            <%
                                                Calendar fecha5 = Calendar.getInstance();
                                                fecha5.add(Calendar.MONTH, -5);
                                                SimpleDateFormat format5 = new SimpleDateFormat("dd-MM-yyyy");
                                                String formatted5 = format5.format(fecha5.getTime());
                                                out.println(formatted5);
                                            %>
                                        </strong>
                                    </span>
                                    <p><form:input path="mes5" type="date" min="2018-06-01" required="required"/>
                                    </p>
                                    <p>Consumo kWh: <form:input path="kwh5" type="number" placeholder="Valores en kWh" id="kw5" value="." required="required"/></p>
                                    <p>Consumo Mensual: <form:input path="valor5" type="number" placeholder="Valor total de la boleta en pesos ($)" id="pm5" value="." required="required"/></p>
                                </div>
                            </div>
                        </div>		
                        <div class="input-field col s6">
                            <div class="card white">
                                <div class="card-content black-text">
                                    <span class="card-title"><strong>Mes:
                                            <%
                                                Calendar fecha6 = Calendar.getInstance();
                                                fecha6.add(Calendar.MONTH, -6);
                                                SimpleDateFormat format6 = new SimpleDateFormat("dd-MM-yyyy");
                                                String formatted6 = format6.format(fecha6.getTime());
                                                out.println(formatted6);
                                            %>
                                        </strong>
                                    </span>
                                    <p><form:input path="mes6" type="date" min="2018-06-01" required="required"/>
                                    </p>
                                    <p>Consumo kWh: <form:input path="kwh6" type="number" placeholder="Valores en kWh" id="kw6" value="." required="required"/></p>
                                    <p>Consumo Mensual: <form:input path="valor6" type="number" placeholder="Valor total de la boleta en pesos ($)" id="pm6" value="." required="required"/></p>
                                </div>
                            </div>
                        </div>		
                        <div class="input-field col s12">
                            <p style="font-weight: bold;">**Para calcular los promedios de kWh y Consumo debes apretar el botón azul que dice "Calcular Promedio".**</p>
                            <p style="color: green;">Promedio de consumo: <b style="color: green;" id="promedioKwh"></b> KWh por mes
                                <form:input type="number" path="promKwh" placeholder="Ingresar el valor pomediado de Consumo en kWh. Ej: 237.5" value="." step="any" required="required"/>
                            </p>
                            <p style="color: blue;">Valor promedio consumo mensual: $<b style="color: blue;" id="valorProm"></b> 
                                <form:input type="number" path="promValorMens" placeholder="Ingresar el valor promediado de Consumo Mensual en $. Ej: 32580" value="." step="any" required="required"/>
                            </p>
                            <p style="font-weight: bold;">**Nota: valores solo incluyen kWh consumidos, no incluyendo costos extras como cargo fijo, administración, etc.** </p>
                        </div>
                        <div class="input-field col s6"><input class="btn waves-yellow red" type="submit" value="Ingresar Consumo" ></div>
                    </fieldset>
                </div>
            </form:form>
            <button class="waves-effect waves-red btn-large  blue darken-3" onclick="Calcular()">Calcular Promedio</button>
            <br/><br/>
        </div>
        <br/><br/><br/><br/>
        <div class="fixed-action-btn vertical click-to-toggle">
            <a class="btn-floating btn-large red">
                <i class="material-icons">menu</i>
            </a>
            <ul>
                <li><a class="btn-floating red" title="Postular un proyecto" href="crearProyecto.htm"><i class="material-icons">local_post_office</i></a></li>
                <li><a class="btn-floating yellow darken-1" title="Aportar a un proyecto" href="aporteProyecto.htm"><i class="material-icons">monetization_on</i></a></li>
                <li><a class="btn-floating green" title="Lista de proyectos" href="listaProyectos.htm"><i class="material-icons">list</i></a></li>
                <li><a class="btn-floating blue" title="Ingresar mi consumo historico" href="ingresoConsumo.htm"><i class="material-icons">insert_invitation</i></a></li>
                <li><a class="btn-floating green" title="Mi consumo historico" href="consumoHistorico.htm"><i class="material-icons">account_balance</i></a></li>
                <li><a class="btn-floating blue" title="Informacion efficient home" href="#"><i class="material-icons">info</i></a></li>
            </ul>
        </div>
        <footer class="page-footer green darken-3">
            <div class="container">
                <div class="row">
                    <div class="col l6 s12">
                        <p class="grey-text text-lighten-4">Proyecto elaborado por Mauricio Arancibia, estudiante de ingeniería en computación e informática y Re-diseñado por Francisco Sáez.</p>
                    </div>
                    <div class="col l4 offset-l2 s12">
                        <h5 class="white-text">Links de interés</h5>
                        <ul>
                            <li><a class="grey-text text-lighten-3" href="http://vinculacion.unab.cl" target="_blank">Dirección General de Vinculación con el Medio</a></li>
                            <li><a class="grey-text text-lighten-3" href="http://www.unab.cl" target="_blank">Universidad Andres Bello</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    © 2019 Copyright Francisco Sáez Guerra
                </div>
            </div>
        </footer>
    </body>
    <script>
        //Script para calcular el promedio de los Kwh y el Consumo mensual
        function Calcular() {
            var vr1 = document.getElementById('kw1').value;
            var vr2 = document.getElementById('kw2').value;
            var vr3 = document.getElementById('kw3').value;
            var vr4 = document.getElementById('kw4').value;
            var vr5 = document.getElementById('kw5').value;
            var vr6 = document.getElementById('kw6').value;
            var vr7 = document.getElementById('pm1').value;
            var vr8 = document.getElementById('pm2').value;
            var vr9 = document.getElementById('pm3').value;
            var vr10 = document.getElementById('pm4').value;
            var vr11 = document.getElementById('pm5').value;
            var vr12 = document.getElementById('pm6').value;
            var kw = (parseFloat(vr1) + parseFloat(vr2) + parseFloat(vr3) + parseFloat(vr4) + parseFloat(vr5) + parseFloat(vr6)) / 6;
            var valorProm = (parseFloat(vr7) + parseFloat(vr8) + parseFloat(vr9) + parseFloat(vr10) + parseFloat(vr11) + parseFloat(vr12)) / 6;
            document.getElementById('promedioKwh').innerHTML = kw;
            document.getElementById('valorProm').innerHTML = valorProm;
        }
    </script>
    <script src="js/materialize.js"></script>
</html>