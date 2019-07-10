<%-- 
    Document   : mantenedorUser
    Created on : 08-01-2019, 15:06:46
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
                    <h2 align="center">Usuarios</h2>
                    <hr>
                </div>
                <table class="responsive-table highlight centered">
                    <thead>
                        <tr>
                            <th>ID Usuario</th>
                            <th>Nombre</th>
                            <th>Email</th>
                            <th>Nivel</th>
                            <th>Estado</th>
                            <th>Acciones<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Editar | Bloquear | Eliminar </th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${usuario}" var="datoUser">
                            <tr>
                                <td><c:out value="${datoUser.id}"/></td>
                                <td><c:out value="${datoUser.nombre}"/></td>
                                <td><c:out value="${datoUser.email}"/></td>
                                <td><c:out value="${datoUser.nivel}"/></td>
                                <td><c:out value="${datoUser.estado}"/></td>
                                <td><a href="<c:url value="editarUsuario.htm?id=${datoUser.id}"/>"><i class="small material-icons">border_color</i></a> &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="bloquearUser.htm?id=${datoUser.id}"/>"><i class="small material-icons">do_not_disturb_alt</i></a> &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp;
                                    <a href="<c:url value="eliminarUsuario.htm?id=${datoUser.id}"/>"><i class="small material-icons">cancel</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
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
