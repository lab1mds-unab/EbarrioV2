<%-- 
    Document   : index
    Created on : 06-11-2017, 10:00:42
    Author     : Francisco Sáez Guerra
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>E-Barrio | Inicio</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
    </head>
    <body>
        <!-- Script para cargar la fecha actual del día al inicio de la página -->
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

        <div class="parallax-container">
            <div class="parallax" id="ingresar"><img src="img/header.png"></div>
        </div>
        <div class="section white">
            <div class="row container" style="text-align: center">
                <h2 class="header">E-BARRIO</h2>
                <hr style="text-align: right">
                <p class="grey-text text-darken-3 lighten-3">Plataforma colaborativa para la gestión de iniciativas sociales.</p>
                <div class="row">
                    <a class="waves-effect waves-red blue btn" href="login.htm"><i class="material-icons left">input</i>Ingresar</a>
                    &nbsp;&nbsp;&nbsp;
                    <a class="waves-effect waves-yellow red btn" href="registro.htm"><i class="material-icons left">mode_edit</i>Registrarse</a>
                </div>
                <div class="row">
                    <a href="loginAdmin.htm">Ingresar como administrador</a>
                </div>
            </div>
        </div>
        <div class="parallax-container">
            <div class="parallax"><img src="img/barrio1.jpg"></div>
        </div>
        <div class="section white">
            <div class="row container">
                <h2 class="header" style="text-align: center">¿QUÉ ES E-BARRIO?</h2>
                <hr>
                <p class="grey-text text-darken-3 lighten-3" style="text-align: justify;"> Es una plataforma Web donde individuos de la comuna puedan en conjunto postular proyectos al MINVU 
                    para el mejoramiento de su barrio, quien aprobará este proyecto en base a un plan de ahorro energético 
                    sostenido en un periodo de tiempo determinado. Esta plataforma se comunicará con cada kit de la casa de cada participante para determinar el ahorro del grupo, 
                    el cual será accesible mediante una App que le permitirá a cada participante analizar el uso de energía en su casa así como ver el cumplimiento de metas en los
                    proyectos en los que esté participando. Además a cada jefe de proyecto se le entregará una interfaz tangible física que representa en tiempo real el cumplimiento de la meta
                    de cada participante motivando su compromiso al proyecto. Como beneficio, se favorece la conciencia de la población acerca del consumo energético, se favorecen las comunicaciones
                    entre individuos del barrio para un bien común, y se educan a las nuevas generaciones en el buen uso de los recursos.</p>
            </div>
        </div>
        <div class="parallax-container">
            <div class="parallax"><img src="img/barrio2.jpg"></div>
        </div>
        <!-- Sección donde se ven las "CARDS" con los proyectos postulados que han sido Aprobados por un Administrador -->
        <div class="section white">
            <div class="row container">
                <h2 style="text-align: center">Proyectos Postulados</h2>
                <hr>
                <p style="text-align: center; font-size: 20px">
                    Lista de proyectos que han sido aprobados para postular. <strong>Registrate</strong> o <strong>inicia sesión</strong> para unirte a un proyecto <strong><a href="#ingresar">Aquí</a></strong>!
                </p>
                <c:forEach items="${index}" var="datosProyectos">
                    <div class="card col s4" style="width: 30%; height: 50%" >
                        <div class="card-image waves-effect waves-block waves-light">
                            <img class="activator responsive-img" src="img/cards/juegos.jpg">
                        </div>
                        <div class="card-content">
                            <span class="card-title activator grey-text text-darken-4">Proyecto: "<c:out value="${datosProyectos.nombre}"/>"<i class="material-icons right">more_vert</i></span>
                            <p><a href="<c:out value="metaProyecto.htm?id=${datosProyectos.idproyectos}"/>" target="_blank">Ver detalles</a></p>
                        </div>
                        <div class="card-reveal">
                            <span class="card-title grey-text text-darken-4">"<c:out value="${datosProyectos.nombre}"/>"<i class="material-icons right">close</i></span>
                            <p>Proyecto propuesto por <strong><c:out value="${datosProyectos.razonsocial}"/></strong>, organización de tipo <strong><c:out value="${datosProyectos.organizacion}"/></strong>.
                                Su propuesta de tipo <strong><c:out value="${datosProyectos.tipo}"/></strong> está destinado para <strong><c:url value="${datosProyectos.destinatario}"/></strong> y su meta para
                                realizar éste proyecto es de un <strong><c:out value="${datosProyectos.meta}"/>%</strong> de consumo eléctrico.
                            </p>
                            <p>Progreso: <b><c:out value="${datosProyectos.porcentaje}%"/></b></p>
                            <div class="progress">
                                <div class="determinate" style="width: <c:out value="${datosProyectos.porcentaje}"/>%"></div>
                            </div>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;
                </c:forEach>
            </div>
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