<%-- 
    Document   : editarProyecto
    Created on : 14-01-2019, 9:44:44
    Author     : Francisco Sáez Guerra
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Editar Proyecto</title>
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

        <script type="text/javascript">
            $(document).ready(function () {
                $('.tooltipped').tooltip();
            });

            $(document).ready(function () {
                $('select').formSelect();
            });
            
            $("disabled").attr("Disabled","Disabled");
        </script>

        <nav>
            <div class="nav-wrapper green darken-3">
                <ul class="left hide-on-med-and-down">
                    <li><a href="inicioAdmin.htm" style="color:white">Inicio</a></li>
                    <li><a href="loginAdmin.htm?cerrar=true" style="color:white">Salir</a></li>
                </ul>
                <ul  class="right hide-on-med-and-down">
                    <li><a href="mantenedorProyectos.htm" style="color:white">Revisar Proyectos</a></li>
                    <li><a href="mantenedorUser.htm" style="color:white">Administrar Usuarios</a></li>
                    <li><a href="#" style="color:white">Metas</a></li>
                </ul>
            </div>
        </nav>

        <%
            HttpSession sesion = request.getSession();
            String usuario;
            String nivel;

            if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel").toString().equals("1")) {
                usuario = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
                out.print("<h5>Administrador/a: <a>" + usuario + "</h5></a> ");
            } else {
                out.print("<script>location.replace('loginAdmin.htm');</script>");
            }
        %>

        <h3 style="text-align: center;">Formulario de Edición de Proyectos</h3>
        <div class="container">
            <form:form class="col s12" method="POST" commandName="crearProyecto">
                <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                <div class="row">
                    <!-- Cuadro de datos de persona que ingresa el proyecto -->
                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Información de contacto</legend>
                        <p class="input-field col s6"><b>Nombre institución/Persona:</b>
                            <form:input path="razonsocial" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Señalar el nombre de la institución que presenta el proyecto." required="required" readonly="true"/>
                            <form:errors path="razonsocial"/>
                        </p>
                        <p class="input-field col s6"><b>Rut institución/Persona:</b>
                            <form:input path="rutsocial" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Señalar Rol Único Tributario de la institución que presenta el proyecto" placeholder="Ej: 11111111-1" maxlength="10" required="required" readonly="true"/>
                            <form:errors path="rutsocial"/>
                        </p>
                        <p class="input-field col s6"><b>Tipo de institución:</b>
                            <form:input path="organizacion" list="organziacion1" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Señalar si corresponde a una corporación, fundación o establecimiento educacional" required="required" readonly="true"/>
                            <datalist id="organziacion1">
                                <option value="Corporación"></option>
                                <option value="Fundación"></option>
                                <option value="Establecimiento educacional"></option>
                                <option value="Empresa"></option>
                                <option value="Persona natural"></option>
                            </datalist>
                            <form:errors path="organizacion"/>
                        </p>
                        <p class="input-field col s6"><b>Telefóno de contacto:</b>
                            <form:input path="telefono" type="number" class="tooltipped" data-pisition="bottom" data-delay="50" data-tooltip="Indicar numero de telefono de contacto" required="required"/>
                            <form:errors path="telefono"/>
                        </p>
                        <p class="input-field col s6"><b>Correo usuario:</b>
                            <form:input path="email" type="text" class="tooltipped" data-pisition="bottom" data-delay="50" data-tooltip="Indicar correo de contacto" placeholder="Correo de la cuenta actual" required="required" readonly="true"/>
                            <form:errors path="email"/>
                        </p>
                    </fieldset>

                    <!-- Cuadro con informacion del proyecto -->

                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Datos del proyecto</legend>
                        <p class="input-field col s6"><b>Tipo de proyecto:</b>
                            <form:input path="tipo" list="tipo1" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Tipo de proyecto" required="required"/>
                            <datalist id="tipo1">
                                <option value="Reducción de consumo de energía"></option>
                                <option value="Reducción de consumo de agua"></option>
                                <option value="Reciclaje"></option>
                                <option value="Otro"></option>
                            </datalist>
                            <form:errors path="tipo"/>
                        </p>
                        <p class="input-field col s6"><b>Nombre del proyecto:</b>
                            <form:input path="nombre" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Indicar un nombre de fantasía que permita identificar el proyecto. Idealmente con pocas palabras" required="required"/>
                            <form:errors path="nombre"/>
                        </p>
                        <p class="input-field col s6"><b>Cobro a beneficiarios del proyecto:</b>
                            <form:input path="tarifa" type="text" list="tarifa1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="¿Se cobra alguna tarifa a los beneficiarios del proyecto?" required="required"/>
                            <datalist id="tarifa1">
                                <option value="Si"></option>
                                <option value="No"></option>
                            </datalist>
                        </p>
                        <p class="input-field col s6"><b>Destinatarios del proyecto:</b>
                            <form:input path="destinatario" type="text" list="destinatario1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Destinatario/a del proyecto" required="required"/>
                            <datalist id="destinatario1">
                                <option value="Personas de escasos recursos"></option>
                                <option value="Personas en situación de discapacidad"></option>
                                <option value="Personas en riesgo o afecta a adicción de alcohol y/o drogas"></option>
                            </datalist>
                            <form:errors path="destinatario"/>
                        </p>
                        <p class="input-field col s6"><b>Cantidad de beneficiarios directos:</b>
                            <form:input path="beneficiariodirecto" type="number" min="1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Personas que son beneficiadas directamente por el proyecto Ej: número de profesores capacitados" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Cantidad de beneficiarios indirectos:</b>
                            <form:input path="beneficiarioindirecto" type="number" ng-model="beneficiarioindirecto" name="beneficiarioindirecto"  min="1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Personas que son beneficiadas indirectamente por el proyecto ej: personas que integran la comunidad educativa" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Dimensiones del proyecto:</b>
                            <form:input path="dimensiones" type="number" min="0" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Para el caso de proyectos que contemplen construir o habilitar infraestructura, es obligación señalar el número de metros cuadrados (M2) de ésta. En caso contrario ingresar 0" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Duración del proyecto calculado en meses:</b>
                            <form:input path="duracion" type="number" min="1" max="60" step="1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Señalar la duración, en meses, del proyecto" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Region:</b>
                            <form:input path="region" type="text" list="region1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Especificar región" required="required"/>
                            <datalist id="region1">
                                <option value="I Región de Tarapacá"></option>
                                <option value="II Región de Antofagasta"></option>
                                <option value="III Región de Atacama"></option>
                                <option value="IV Región de Coquimbo"></option>
                                <option value="V Región de Valparaíso"></option>
                                <option value="VI Región del Libertador General Bernardo O’Higgins"></option>
                                <option value="VII Región del Maule"></option>
                                <option value="VIII Región del Biobío"></option>
                                <option value="IX Región de La Araucanía"></option>
                                <option value="X Región de Los Lagos"></option>
                                <option value="XI Región Aysén del General Carlos Ibáñez del Campo"></option>
                                <option value="XII Región de Magallanes y Antártica Chilena"></option>
                                <option value="R.M Región Metropolitana de Santiago"></option>
                                <option value="XIV Región de Los Ríos"></option>
                                <option value="XV Región de Arica y Parinacota"></option>
                                <option value="XVI Región de Ñuble"></option>
                            </datalist>
                        </p>
                        <p class="input-field col s6"><b>Porcentaje de ahorro estimado:</b>
                            <form:input path="meta" type="number" min="0" max="100" step="1" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Indicar el porcentaje de ahorro que se prentede lograr" required="required"/>
                        </p>
                    </fieldset>
                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Valor del proyecto</legend>
                        <p class="input-field col s6"><b>Capital disponible:</b>
                            <form:input path="dinero"  type="number" data-length="500" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Aporte con que cuenta (dinero que posee al día de hoy)" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Capital solicitado:</b>
                            <form:input path="aporte" type="number" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Monto solicitado para donaciones (dinero extra que necesita para el proyecto" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Capital Mano de obra:</b>
                            <form:input path="manodeobra" type="number" data-length="500" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Equivalente en dinero a gasto en mano de obra" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Capital Materiales:</b>
                            <form:input path="materiales" type="number" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Equivalente en dinero a gasto en materiales" required="required"/>
                        </p>
                        <p class="input-field col s6"><b>Porcentaje Actual de avance en metas:</b>
                            <form:input path="porcentaje" type="number" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Porcentaje real y actual sobre el consumo de los participantes sobre la meta de proyecto" required="required"/>
                        </p>
                        <form:input path="estado" type="hidden"/>
                        <form:input path="aprobado" type="hidden"/>
                    </fieldset>
                    <br><br>
                </div>
                <p class="input-field col s6">
                    <b>¿No sabes cómo añadir una ubicación en <br/> Google My Maps?<a target="_blank" href="tutorial.htm"> Haz click acá </a> y sigue estos pasos!</b><br/>
                    <a class="waves-effect waves-light indigo btn"  target="_blank" href="https://drive.google.com/open?id=1GeCL3j8bddHNXg-VU-yaaPWVMfdiTHtK&usp=sharing" >Ver ubicación de proyecto</a>
                    <input class="btn waves-yellow red" type="submit" value="Editar Proyecto">
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