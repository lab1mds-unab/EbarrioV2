<%-- 
    Document   : editarUsuario
    Created on : 15-01-2019, 10:05:21
    Author     : Francisco Sáez Guerra
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Editar Usuario</title>
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

        <h3 style="text-align: center;">Editar Usuario</h3>
        <div class="container">
            <form:form class="col s12" method="POST" commandName="registro">
                <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                <div class="row">
                    <fieldset class="field_set">
                        <legend style="font-size:200%; color:grey">Información de Usuario</legend>
                        <p class="input-field col s6"><b>Nombre:</b>
                            <form:input path="nombre" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Nombre del Usuario (Puede incluir apellidos)" required="required"/>
                            <form:errors path="nombre"/>
                        </p>
                        <p class="input-field col s6"><b>Contraseña:</b>
                            <form:input path="password" type="password" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="¡ SOLO CAMBIAR EN EL CASO QUE SEA SOLICITADO !" required="required"/>
                            <form:errors path="password"/>
                        </p>
                        <p class="input-field col s6"><b>Correo:</b>
                            <form:input path="email" type="text" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Email del usuario" required="required"/>
                            <form:errors path="email"/>
                        </p>
                        <p class="input-field col s6"><b>Nivel de Usuario:</b>
                            <form:input path="nivel" type="number" class="tooltipped" data-pisition="bottom" data-delay="50" data-tooltip="ROL de Usuario: 0-deshabilitado | 2-Usuario Promedio" required="required"/>
                            <form:errors path="nivel"/>
                        </p>
                        <p class="input-field col s6"><b>Estado:</b>
                            <form:input path="estado" list="estado1" type="text" class="tooltipped" data-pisition="bottom" data-delay="50" data-tooltip="Estado Usuario: on-Activo | off-Inactivo" required="required"/>
                            <datalist id="estado1">
                                <option value="on"></option>
                                <option value="off"></option>
                            </datalist>
                            <form:errors path="estado"/>
                        </p>
                    </fieldset>
                    <br><br>
                </div>
                <p class="input-field col s6">
                    <input class="btn waves-yellow red" type="submit" value="Editar Usuario">
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
