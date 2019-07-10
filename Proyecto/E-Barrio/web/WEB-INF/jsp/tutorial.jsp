<%--
    Document   : tutorial
    Created on : 10-01-2019, 11:17:17
    Author     : Francisco Sáez Guerra
--%>

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>E-Barrio | Cómo añadir ubicación Proyecto</title>
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
                $('.fixed-action-btn').floatingActionButton();
            });
        </script>

        <footer class="page-footer green darken-3">
            <div class="container">
                <div class="row">
                    <h3 style="text-align: center">Tutorial para añadir ubicación de Proyecto</h3>
                </div>
            </div>
            <div class="footer-copyright">
                <div class="container">
                    <p style="text-align: center">
                        <b>Fácil tutorial de cómo obtener cuenta Google, añadir ubicación del Proyecto y editarlo en tan solo <b>3 PASOS</b>.</b>
                    </p>
                </div>
            </div>
        </footer>
        <%
            HttpSession sesion = request.getSession();
            String usu;
            String nivel;

            if (sesion.getAttribute("user") != null && sesion.getAttribute("nivel") != null) {
                usu = sesion.getAttribute("user").toString();
                nivel = sesion.getAttribute("nivel").toString();
                out.print("<h5>Usuari@: <a>" + usu + "</h5></a> ");
            } else {
                out.print("<script>location.replace('login.htm');</script>");
            }
        %>
        <div class="container">
            <fieldset class="field_set">
                <legend style="font-size:200%; color:grey">PASO 1: Ingresar a tu cuenta de Google</legend>
                <p class="input-field col s6">
                    <b style="color:red">1.-</b> Es de vital importancia que tenga una cuenta creada en Google. De no poseerla, se deberá crear una desde acá: <a href="https://accounts.google.com/signup/v2/webcreateaccount?flowName=GlifWebSignIn&flowEntry=SignUp" target="_blank"><b>Crear cuenta google</b></a><br/>
                    <b style="color:red">2.-</b> Una vez creada su cuenta Google, debe ingresar con los datos insertados en el registro. Si ya posee cuenta "Google", acceda de forma inmediata desde aquí: <a href="https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin" target="_blank"><b>Acceder a cuenta Google</b></a><br/>
                    <b style="color:red">3.-</b> Una vez que haya ingresado a su cuenta, podrá avanzar al <b>PASO 2</b>.
                </p>
            </fieldset>
            <br/><br/>
            <fieldset class="field_set">
                <legend style="font-size:200%; color:grey">PASO 2: Ingresar la ubicación del Proyecto</legend>
                <p class="input-field col s6">
                    <b style="color:red">1.-</b> Lo primero que hará es hacer <b>CLICK</b> en el siguiente botón, ubicado al final del Formulario de <b>"Crear Proyecto"</b>:<br/>
                    <img class="responsive-img" src="img/tuto1.PNG"><br/>
                    <b style="color:red">-</b> <b>PD: Recuerde que ya debe haber iniciado sesión con su cuenta de Google.</b><br/>
                    <b style="color:red">2.-</b> Luego visualizará el siguiente mapa:<br/>
                    <img class="responsive-img" src="img/tuto2.PNG" width="1000" height="500"><br/>
                    <b style="color:red">3.-</b> Para añadir la ubicación de su proyecto, debe ir a la dirección específica donde se realizaría. Ej: Algún sector de Gómez Carreño en Viña del Mar<br/>
                    <img class="responsive-img" src="img/tuto3.PNG" width="700" height="500"><br/>
                    <b style="color:red">-</b> En el recuadro <b style="color:red">ROJO</b> se indica el botón donde se debe hacer <b>CLICK</b> para añadir una nueva ubicación.<br/>
                    <b style="color:red">-</b> El recuadro <b style="color:blue">AZUL</b> sería dónde se realizará el proyecto.<br/>
                    -------------------------------------------------------------------------------------------------------------------<br/>
                    <b style="color:red">4.-</b> Una vez seleccionado el botón para añadir una ubicación, hará un <b>CLICK</b> en la zona donde se realizaría el proyecto <b>(EJ: Recuadro <b style="color:blue">AZUL</b>)</b>.<br/>
                    <b style="color:red">5.-</b> Se nos desplegará la siguiente ventana:<br/>
                    <img class="responsive-img" src="img/tuto4.PNG" width="700" height="500"><br/>
                    <b style="color:red">-</b> Donde dice "Punto 2" se colocará el nombre de proyecto <b>(El mismo que se colocó en el Formulario)</b>.<br/>
                    <b style="color:red">-</b> En el recuadro de abajo se colocará una breve descripción del proyecto. Ejemplo: <br/>
                    <img class="responsive-img" src="img/tuto5.PNG" width="700" height="500"><br/>
                    <b style="color:red">-</b> <b>PD:</b> Se puede añadir una imagen donde está enmarcado con <b style="color:red">ROJO</b> para una mejor referencia.<br/>
                    <b style="color:red">-</b> Luego hacer <b>CLICK</b> en GUARDAR.<br/>
                </p>
            </fieldset>
            <br><br><br>
            <fieldset class="field_set">
                <legend style="font-size:200%; color:grey">PASO 3: Editar icono de ubicación (OPCIONAL)</legend>
                <p class="input-field col s6">
                    <b style="color:red">1.-</b> Una vez que el proyecto fue ingresado al mapa, se puede editar el ícono de éste y su color para que sea más fácil identificar. Se puede editar haciendo <b>CLICK</b> en el botón de "Estilo" como se ve en la siguiente imagen:<br/>
                    <img class="responsive-img" src="img/tuto6.PNG" width="700" height="500"><br/>
                    <b style="color:red">2.-</b> Se abrirá el siguiente recuadro donde usted podrá editar el color del icono y escoger otro tipo de icono de acuerdo al tipo de Proyecto postulado:<br/>
                    <img class="responsive-img" src="img/tuto7.PNG" width="700" height="500"><br/>
                    <b style="color:red">-</b> En el recuadro <b style="color:blue">AZUL</b> se pueden encontrar más iconos.<br/>
                    <b style="color:red">3.-</b> Como ejemplo, así quedaría el resultado:<br/>
                    <img class="responsive-img" src="img/tuto8.PNG" width="700" height="500"><br/>
                </p>
            </fieldset>
            <br><br><br>
            <a class="waves-effect waves-light red btn" onclick="window.close();">Salir</a>
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
        <!--  Scripts-->
        <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script src="js/materialize.js"></script>
        <script src="js/init.js"></script>
    </body>
</html>
