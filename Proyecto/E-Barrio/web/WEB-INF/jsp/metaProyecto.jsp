<%-- 
    Document   : metaProyecto
    Created on : 14-01-2019, 15:16:24
    Author     : Francisco Sáez Guerra
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Ver Proyecto</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
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
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <div class="container">
            <form:form class="col s12" method="POST" commandName="crearProyecto">
                <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                <div class="row">
                    <h3>Datos de Proyectos:<form:input align="center" path="nombre" disabled="true"/></h3>
                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Información de contacto</legend>
                        <p class="input-field col s6"><b>Nombre institución/Persona:</b>
                            <form:input path="razonsocial" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Rut institución/Persona:</b>
                            <form:input path="rutsocial" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Tipo de institución:</b>
                            <form:input path="organizacion" disabled="true"/>
                        </p>
                    </fieldset>
                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Datos del proyecto</legend>
                        <p class="input-field col s6"><b>Tipo de proyecto:</b>
                            <form:input path="tipo" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Nombre del proyecto:</b>
                            <form:input path="nombre" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Cobro a beneficiarios del proyecto:</b>
                            <form:input path="tarifa" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Destinatarios del proyecto:</b>
                            <form:input path="destinatario" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Cantidad de beneficiarios directos:</b>
                            <form:input path="beneficiariodirecto" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Cantidad de beneficiarios indirectos:</b>
                            <form:input path="beneficiarioindirecto" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Dimensiones del proyecto (Metros Cuadrados M2):</b>
                            <form:input path="dimensiones" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Duración del proyecto calculado en meses:</b>
                            <form:input path="duracion" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Region:</b>
                            <form:input path="region" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Porcentaje de ahorro estimado:</b>
                            <form:input path="meta" disabled="true"/>
                        </p>
                    </fieldset>
                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Valor del proyecto</legend>
                        <p class="input-field col s6"><b>Capital disponible:</b>
                            <form:input path="dinero" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Capital solicitado:</b>
                            <form:input path="aporte" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Capital Mano de obra:</b>
                            <form:input path="manodeobra" disabled="true"/>
                        </p>
                        <p class="input-field col s6"><b>Capital Materiales:</b>
                            <form:input path="materiales" disabled="true"/>
                        </p>
                    </fieldset>
                    <br><br>
                </div>
                <p class="input-field col s6">
                    <a class="waves-effect waves-light indigo btn"  target="_blank" href="https://drive.google.com/open?id=1GeCL3j8bddHNXg-VU-yaaPWVMfdiTHtK&usp=sharing" >Ver ubicación de proyecto</a>
                    <a class="waves-effect waves-light red btn" onclick="window.close();">Salir</a>
                </p>
            </form:form>
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
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>
    </body>
</html>