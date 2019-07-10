<%-- 
    Document   : registro
    Created on : 04-01-2019, 10:34:38
    Author     : Francisco Sáez Guerra
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Registro</title>
        <link href="css/login.css" rel="stylesheet">
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
            <div class="panel panel-primary">
                <h3 style="text-align: center;">Formulario de Registro</h3>
                <div class="panel-body row">
                    <form:form method="POST" commandName="registro">
                        <form:errors path="*" element="div" cssClass="alert alert-danger"/>
                        <p class="input-field col s6">
                            <form:label  path="nombre"></form:label>
                            <form:input  path="nombre" class="tooltipped" data-position="bottom" data-delay="50" data-tooltip="Nombre de usuario" placeholder="Nombre y Apellidos" required="required"/>
                            <form:errors path="nombre" />
                        </p>
                        <p class="input-field col s6">
                            <form:label path="password"></form:label>
                            <form:input type="password" path="password" cssClass="form-control" placeholder="Contraseña" id="pass" required="required"/>
                            <form:errors path="password" />
                        </p>
                        <p class="input-field col s6">
                            <form:label path="email"></form:label>
                            <form:input path="email" cssClass="form-control" placeholder="Email" required="required"/>
                            <form:errors path="email"/>
                        </p>
                        <p class="input-field col s6">
                            <form:input type="hidden" path="nivel" cssClass="form-control" value="2"/>
                        </p>
                        <p class="input-field col s6">
                            <form:input type="hidden" path="estado" cssClass="form-control" value="on"/>
                        </p>

                        <input class="btn waves-effect waves-yellow red" type="submit" onclick="cifrar()" value="Registro">&nbsp;&nbsp;&nbsp;
                        <a class="waves-effect waves-red blue btn" href="index.htm"><i class="material-icons left">input</i>Volver a inicio</a>
                    </form:form>
                </div>
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
        <script src="js/sha1.js"></script>
        <script>
            function cifrar() {
                var input_pass = document.getElementById("pass");
                input_pass.value = sha1(input_pass.value);
            }
        </script>
    </body>
</html>