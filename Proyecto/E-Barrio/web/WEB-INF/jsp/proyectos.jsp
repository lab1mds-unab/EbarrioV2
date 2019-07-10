<%-- 
    Document   : proyectos
    Created on : 09-01-2019, 11:09:47
    Author     : Francisco Sáez Guerra
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Proyectos Contribuidos</title>
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
        <input type="hidden" id="refreshed" value="no">

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

        <div class="container">
            <div class="row">
                <table class="responsive-table highlight centered">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nombre proyecto</th>
                            <th>Meta</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${proyectoContribuido}" var="listProyect">
                            <tr>
                                <td><c:out value="${listProyect.id}"/></td>
                                <td><c:out value="${listProyect.nombre}"/></td>
                                <td><c:out value="${listProyect.meta}%"/></td>
                                <td><a class="waves-effect waves-red blue btn" href="<c:out value="metaProyecto.htm?id=${listProyect.idproyectos}"/>" target="_blank">Detalles</a> <a class="waves-effect waves-red green btn" href="consumoProyecto.htm">Consumo</a> <a class="waves-effect waves-light red btn" onclick="alert('Usted se ha desligado del Proyecto: <c:out value="${listProyect.nombre}"/> ')" href="<c:url value="desunirProyecto.htm?id=${listProyect.id}"/>">Salir</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
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
        <script src="js/materialize.js"></script>
    </body>
</html>
