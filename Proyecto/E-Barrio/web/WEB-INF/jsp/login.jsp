<%-- 
    Document   : login
    Created on : 12-nov-2017, 18:36:30
    Author     : Francisco Sáez Guerra
--%>

<%@page import="modelo.Conectar"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Expires" content="0" /> 
        <meta http-equiv="Pragma" content="no-cache" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Ingreso</title>
        <link href="css/login.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script type="text/javascript">
            if (history.forward(1)) {
                location.replace(history.forward(1));
            }
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
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>

        <div class="container" align="center">
            <div class="panel-heading">
                <h1 style="color:black">Ingresa a E-Barrio</h1>
            </div>
            <div class="row" id="pwd-container">
                <div class="col-md-4 text-center" align="center" style="width: 100%">
                    <section class="login-form">
                        <form method="POST" action="login.htm" role="login">
                            <img src="img/usuarioLogin.png" class="responsive-img" alt="" width="150" height="150"  />
                            <input type="text" name="userName" placeholder="Usuario" required class="form-control input-lg" />
                            <input type="password" name="password" class="form-control input-lg" placeholder="Contraseña" required="" />
                            <div class="pwstrength_viewport_progress"></div>
                            <button type="submit" name="btnIngresar" value="Ingresar" class= "waves-effect waves-red green btn">Ingresar</button>&nbsp;&nbsp;&nbsp;
                            <a class="waves-effect waves-red blue btn" href="index.htm"><i class="material-icons left">input</i>Volver a inicio</a>
                            <div style="color: red">${error}</div>
                        </form>
                        <%
                            Conectar conn = new Conectar();
                            if (request.getParameter("btnIngresar") != null) {
                                String usu = request.getParameter("userName");
                                String pass = request.getParameter("password");

                                HttpSession sesion = request.getSession();

                                switch (conn.loguear(usu, pass)) {
                                    case 2:
                                        sesion.setAttribute("user", usu);
                                        sesion.setAttribute("nivel", "2");
                                        response.sendRedirect("inicio.htm");
                                        break;
                                    default:
                                        out.write("Usuario/Password inválidos, inténtelo de nuevo");
                                        break;
                                }
                            }
                            if (request.getParameter("cerrar") != null) {
                                session.invalidate();
                            }
                        %>
                    </section>  
                </div>
                <div class="col-md-4"></div>
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