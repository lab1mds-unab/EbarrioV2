<%-- 
    Document   : mantenedorProyectos
    Created on : 11-01-2019, 16:22:57
    Author     : Francisco Sáez Guerra
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Lista Usuarios</title>
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

            $(document).ready(function () {
                $('.collapsible').collapsible();
            });
        </script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
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

        <div class="container">
            <div class="row">
                <div class="text-center">
                    <h2 align="center">Proyectos en Postulación</h2>
                    <hr>
                    <h4 align="center">Proyectos en Postulación Fase 1</h4>
                </div>
                <table class="responsive-table highlight centered">
                    <thead>
                        <tr>
                            <th>ID Proyecto</th>
                            <th>Razón Social</th>
                            <th>Nombre</th>
                            <th>Destinatario</th>
                            <th>Region</th>
                            <th>Estado</th>
                            <th>Acciones<br/>Revisar|Aprobar|Eliminar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${postFase1}" var="datosPostFase1">
                            <tr>
                                <td><c:out value="${datosPostFase1.idproyectos}"/></td>
                                <td><c:out value="${datosPostFase1.razonsocial}"/></td>
                                <td><c:out value="${datosPostFase1.nombre}"/></td>
                                <td><c:out value="${datosPostFase1.destinatario}"/></td>
                                <td><c:out value="${datosPostFase1.region}"/></td>
                                <td><c:out value="${datosPostFase1.estado}"/></td>
                                <td><a href="<c:url value="editarProyecto.htm?id=${datosPostFase1.idproyectos}"/>"><i class="small material-icons">border_color</i></a> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="aprobarProyecto.htm?id=${datosPostFase1.idproyectos}"/>"><i class="small material-icons">check_circle</i></a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="eliminarProyecto.htm?id=${datosPostFase1.idproyectos}"/>"><i class="small material-icons">cancel</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br/><br/><br/>
                <hr>
                <div class="text-center">
                    <h4 align="center">Proyectos en Proceso Fase 1</h4>
                </div>
                <table class="responsive-table highlight centered">
                    <thead>
                        <tr>
                            <th>ID Proyecto</th>
                            <th>Razón Social</th>
                            <th>Nombre</th>
                            <th>Destinatario</th>
                            <th>Region</th>
                            <th>Estado</th>
                            <th>Acciones<br/>Revisar|Terminar|Eliminar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${ProceFase1}" var="datosProceFase1">
                            <tr>
                                <td><c:out value="${datosProceFase1.idproyectos}"/></td>
                                <td><c:out value="${datosProceFase1.razonsocial}"/></td>
                                <td><c:out value="${datosProceFase1.nombre}"/></td>
                                <td><c:out value="${datosProceFase1.destinatario}"/></td>
                                <td><c:out value="${datosProceFase1.region}"/></td>
                                <td><c:out value="${datosProceFase1.estado}"/></td>
                                <td><a href="<c:url value="editarProyecto.htm?id=${datosProceFase1.idproyectos}"/>"><i class="small material-icons">border_color</i></a> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="terminarProyecto.htm?id=${datosProceFase1.idproyectos}"/>"><i class="small material-icons">assignment_turned_in</i></a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="eliminarProyecto.htm?id=${datosProceFase1.idproyectos}"/>"><i class="small material-icons">cancel</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br/><br/><br/>
                <hr>
                <div class="text-center">
                    <h4 align="center">Proyectos Terminado Fase 1</h4>
                </div>
                <table class="responsive-table highlight centered">
                    <thead>
                        <tr>
                            <th>ID Proyecto</th>
                            <th>Razón Social</th>
                            <th>Nombre</th>
                            <th>Destinatario</th>
                            <th>Region</th>
                            <th>Estado</th>
                            <th>Acciones<br/>Revisar|Adjudicar|Eliminar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${TermFase1}" var="datosTermFase1">
                            <tr>
                                <td><c:out value="${datosTermFase1.idproyectos}"/></td>
                                <td><c:out value="${datosTermFase1.razonsocial}"/></td>
                                <td><c:out value="${datosTermFase1.nombre}"/></td>
                                <td><c:out value="${datosTermFase1.destinatario}"/></td>
                                <td><c:out value="${datosTermFase1.region}"/></td>
                                <td><c:out value="${datosTermFase1.estado}"/></td>
                                <td><a href="<c:url value="editarProyecto.htm?id=${datosTermFase1.idproyectos}"/>"><i class="small material-icons">border_color</i></a> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="adjudicarProyecto.htm?id=${datosTermFase1.idproyectos}"/>"><i class="small material-icons">class</i></a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="eliminarProyecto.htm?id=${datosTermFase1.idproyectos}"/>"><i class="small material-icons">cancel</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <br/><br/><br/>
                <hr>
                <div class="text-center">
                    <h4 align="center">Proyectos Adjudicado Fase 2</h4>
                </div>
                <table class="responsive-table highlight centered">
                    <thead>
                        <tr>
                            <th>ID Proyecto</th>
                            <th>Razón Social</th>
                            <th>Nombre</th>
                            <th>Destinatario</th>
                            <th>Region</th>
                            <th>Estado</th>
                            <th>Acciones<br/>Revisar | Eliminar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${AdjuFase2}" var="datosAdjFase2">
                            <tr>
                                <td><c:out value="${datosAdjFase2.idproyectos}"/></td>
                                <td><c:out value="${datosAdjFase2.razonsocial}"/></td>
                                <td><c:out value="${datosAdjFase2.nombre}"/></td>
                                <td><c:out value="${datosAdjFase2.destinatario}"/></td>
                                <td><c:out value="${datosAdjFase2.region}"/></td>
                                <td><c:out value="${datosAdjFase2.estado}"/></td>
                                <td><a href="<c:url value="editarProyecto.htm?id=${datosAdjFase2.idproyectos}"/>"><i class="small material-icons">border_color</i></a> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="eliminarProyecto.htm?id=${datosAdjFase2.idproyectos}"/>"><i class="small material-icons">cancel</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <br/><br/><br/><br/><br/>
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
