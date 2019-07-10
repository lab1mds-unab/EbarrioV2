<%-- 
    Document   : inicio
    Created on : 04-01-2019, 11:47:41
    Author     : Francisco Sáez Guerra
--%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Inicio usuario</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
        <script type = "text/javascript" src = "https://code.jquery.com/jquery-2.1.1.min.js"></script>
    </head>
    <body>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
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
                $('.button-collapse').sidenav();
                $(".dropdown-trigger").dropdown();
            });
        </script>
        <script type="text/javascript">
            document.addEventListener('DOMContentLoaded', function () {
                var elems = document.querySelectorAll('.fixed-action-btn');
                var instances = M.FloatingActionButton.init(elems, {
                    hoverEnabled: false
                });
            });
        </script>
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
                out.print("<h5>Bienvenid@: <a>" + usu + "</h5></a> ");
            } else {
                out.print("<script>location.replace('login.htm');</script>");
            }
        %>
        
        <!-- Slider de las Fotos que se cargan en la vista -->
        <link rel="stylesheet" href="cssslider_files/csss_engine1/style.css">
        <div align="center">
            <div class="csslider1 autoplay">
                <input name="cs_anchor1" id="cs_slide1_0" type="radio" class="cs_anchor slide">
                <input name="cs_anchor1" id="cs_slide1_1" type="radio" class="cs_anchor slide">
                <input name="cs_anchor1" id="cs_slide1_2" type="radio" class="cs_anchor slide">
                <input name="cs_anchor1" id="cs_slide1_3" type="radio" class="cs_anchor slide">
                <input name="cs_anchor1" id="cs_play1" type="radio" class="cs_anchor" checked="">
                <input name="cs_anchor1" id="cs_pause1_0" type="radio" class="cs_anchor pause">
                <input name="cs_anchor1" id="cs_pause1_1" type="radio" class="cs_anchor pause">
                <input name="cs_anchor1" id="cs_pause1_2" type="radio" class="cs_anchor pause">
                <input name="cs_anchor1" id="cs_pause1_3" type="radio" class="cs_anchor pause">
                <ul>
                    <li class="cs_skeleton"><img src="cssslider_files/csss_images1/plaza.jpg" style="width: 100%;"></li>
                    <li class="num0 img slide"> <img src="cssslider_files/csss_images1/plaza.jpg" alt="Creación de nuevas plazas para la comunidad" title="Creación de nuevas plazas para la comunidad"></li>
                    <li class="num1 img slide"> <img src="cssslider_files/csss_images1/juegos.jpg" alt="Nuevos juegos para niños" title="Nuevos juegos para niños"></li>
                    <li class="num2 img slide"> <img src="cssslider_files/csss_images1/luz.jpg" alt="Nueva luminaria pública" title="Nueva luminaria pública"></li>
                    <li class="num3 img slide"> <img src="cssslider_files/csss_images1/pavimento.jpg" alt="Repavimentación de calles" title="Repavimentación de calles"></li>
                </ul>
                <div class="cs_description">
                    <label class="num0"><span class="cs_title"><span class="cs_wrapper">Creación de nuevas plazas para la comunidad</span></span><br><span class="cs_descr"><span class="cs_wrapper">Antiguo terreno utilizado como basural, ahora es un punto de reunión.</span></span></label>
                    <label class="num1"><span class="cs_title"><span class="cs_wrapper">Nuevos juegos para niños</span></span><br><span class="cs_descr"><span class="cs_wrapper">Renovación antiguos juegos oxidados, por juegos nuevos.</span></span></label>
                    <label class="num2"><span class="cs_title"><span class="cs_wrapper">Nueva luminaria pública</span></span><br><span class="cs_descr"><span class="cs_wrapper">Cambio de antiguas ampolletas alogenas de alto consumo, por ampolletas led de bajo consumo.</span></span></label>
                    <label class="num3"><span class="cs_title"><span class="cs_wrapper">Repavimentación de calles</span></span><br><span class="cs_descr"><span class="cs_wrapper">Reparación de calles que se encontraban con hoyos y grietas..</span></span></label>
                </div>
                <div class="cs_play_pause">
                    <label class="cs_play" for="cs_play1"><span><i></i><b></b></span></label>
                    <label class="cs_pause num0" for="cs_pause1_0"><span><i></i><b></b></span></label>
                    <label class="cs_pause num1" for="cs_pause1_1"><span><i></i><b></b></span></label>
                    <label class="cs_pause num2" for="cs_pause1_2"><span><i></i><b></b></span></label>
                    <label class="cs_pause num3" for="cs_pause1_3"><span><i></i><b></b></span></label>
                </div>
                <div class="cs_arrowprev">
                    <label class="num0" for="cs_slide1_0"><span><i></i><b></b></span></label>
                    <label class="num1" for="cs_slide1_1"><span><i></i><b></b></span></label>
                    <label class="num2" for="cs_slide1_2"><span><i></i><b></b></span></label>
                    <label class="num3" for="cs_slide1_3"><span><i></i><b></b></span></label>
                </div>
                <div class="cs_arrownext">
                    <label class="num0" for="cs_slide1_0"><span><i></i><b></b></span></label>
                    <label class="num1" for="cs_slide1_1"><span><i></i><b></b></span></label>
                    <label class="num2" for="cs_slide1_2"><span><i></i><b></b></span></label>
                    <label class="num3" for="cs_slide1_3"><span><i></i><b></b></span></label>
                </div>
                <div class="cs_bullets">
                    <label class="num0" for="cs_slide1_0"> <span class="cs_point"></span>
                        <span class="cs_thumb"><img src="cssslider_files/csss_tooltips1/plaza.jpg" alt="Creación de nuevas plazas para la comunidad" title="Creación de nuevas plazas para la comunidad"></span></label>
                    <label class="num1" for="cs_slide1_1"> <span class="cs_point"></span>
                        <span class="cs_thumb"><img src="cssslider_files/csss_tooltips1/juegos.jpg" alt="Nuevos juegos para niños" title="Nuevos juegos para niños"></span></label>
                    <label class="num2" for="cs_slide1_2"> <span class="cs_point"></span>
                        <span class="cs_thumb"><img src="cssslider_files/csss_tooltips1/luz.jpg" alt="Nueva luminaria pública" title="Nueva luminaria pública"></span></label>
                    <label class="num3" for="cs_slide1_3"> <span class="cs_point"></span>
                        <span class="cs_thumb"><img src="cssslider_files/csss_tooltips1/pavimento.jpg" alt="Repavimentación de calles" title="Repavimentación de calles"></span></label>
                </div>
            </div>
        </div>
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
        <script src="js/init.js"></script>
    </body>
</html>
