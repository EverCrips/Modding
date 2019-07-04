<!--Dise�ado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page import="Modelos.ConsultasGenerales"%>
<%
    //SE OBTIENE LA SESION
    HttpSession sesion = request.getSession(false);
    String categoriaUser = (String) sesion.getAttribute("categoriaUsuario");
    //SI EL ROL ES DISTINTO DE NULL, SE ESCOJE LA VISTA CORRESPONDIENTE
    if (categoriaUser != null) {
        switch (categoriaUser) {
            case "ADMINISTRADOR":
                request.getRequestDispatcher("Administradores.jsp").forward(request, response);
                break;
            case "CLIENTE":
                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                break;
        }
    } else {
%>
<html>
    <head>
        <title>Modding Mafires - Registro Cliente Nuevo</title>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <link href="css/Validar.css" media="screen" rel="stylesheet" type="text/css" />
        
        <script type="text/javascript">
            $(document).ready(function () {
                $('#correoUser').blur(function () {

                    //$('#Info').html('<img src="images/input/loader.gif" alt="" />').fadeOut(1000);

                    var nombre = $(this).val();
                    var dataString = 'nombre=' + nombre;

                    $.ajax({
                        type: "POST",
                        url: "ValidarUsuario.jsp",
                        data: dataString,
                        success: function (data) {
                            $('#Info').fadeIn(1000).html(data);
                            //alert(data);
                        }
                    });
                });
            });
            
          
        </script>

    </head>
    <body>

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Header -->
                    <header id="header">
                        <a class="logo" href="index.jsp"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>

                    <!-- Content -->
                    <section>
                        <header class="main">
                            <h1>Registro Nueva Cuenta</h1>
                        </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="registroServlet" name="form1">
                                <div class="posts">
                                <article> 
                                    <h5>Datos Personales</h5>
                                    <div class="row uniform">
                                        <div class="10u">
                                            <small id="ayudaNombre" class="form-text text-muted">
                                                    Nombre
                                            </small>
                                            <input type="text" name="nombreUser" id="nombreUser" value="" placeholder="Nombre" required="" pattern="[a-zA-Z\s]{3,40}" />
                                        </div>
                                        <div class="10u">
                                             <small id="ayudaApellido" class="form-text text-muted">
                                                    Apellidos
                                            </small>
                                            <input type="text" name="apellidoUser" id="apellidoUser" value="" placeholder="Apellidos" required="" pattern="[a-zA-Z\s]{3,40}"/>
                                        </div>  
                                        <div class="10u">
                                            <small id="ayudaRun" class="form-text text-muted">
                                                    Run
                                            </small>
                                            <input type="text" name="runUser" id="runUser" value="" placeholder="Run" pattern="\d{2}[\.]\d{3}[\.]\d{3}[\-]\d{1}" required="" maxlength="12" title="Seguir el formato solicitado: xx.xxx.xxx-x"/>
                                            <small id="ayudaRunUser" class="form-text text-muted">
                                                    Ej: xx.xxx.xxx-x.
                                            </small>
                                        </div>
                                        <div class="10u">
                                            <small id="ayudaCelular" class="form-text text-muted">
                                                    Tel�fono celular
                                            </small>
                                            <input type="text" name="celularUser" id="celularUser" value="" placeholder="Tel�fono contacto" pattern="[\+][\(]\d{3}[\)]\d{8}" required="" title="Seguir el formato solicitado: +(569)xxxxxxxx"/>
                                            <small id="ayudaTelefonoUser" class="form-text text-muted">
                                                    Ej: +(569)XXXXXXXX.
                                            </small>
                                        </div>
                                        <div class="10u">
                                             <small id="ayudaCorreo" class="form-text text-muted">
                                                    Correo
                                            </small>
                                            <input type="email" name="correoUser" id="correoUser" value="" placeholder="Correo" required=""/>
                                        </div> 
                                        <div class="10u" id="Info"></div>
                                    </div>
                                </article>
                                <article> 
                                    <h5>Dato Facturaci�n</h5>
                                    <div class="row uniform">
                                        <div class="10u">
                                            <small id="ayudaDireccion" class="form-text text-muted">
                                                    Direcci�n
                                            </small>
                                            <input type="text" name="direccionUser" id="direccionUser" value="" placeholder="Direcci�n" required=""/>
                                        </div>
                                        <div class="10u">
                                             <small id="ayudaCiudad" class="form-text text-muted">
                                                    Ciudad
                                            </small>
                                            <input type="text" name="ciudadUser" id="ciudadUser" value="" placeholder="Ciudad" required=""/>
                                        </div>  
                                        <div class="10u">
                                            <small id="ayudaRegion" class="form-text text-muted">
                                                    Regi�n
                                            </small>
                                            <select id="regiones" name="regionUser" required=""></select>
                                        </div>
                                        <div class="10u">
                                             <small id="ayudaComuna" class="form-text text-muted">
                                                    Comuna
                                            </small>
                                            <select id="comunas" name="comunaUser" required=""></select>
                                        </div>                                          
                                    </div>
                                </article>
                                <article> 
                                    <h5>Seguridad Contrase�a</h5>
                                    <div class="row uniform">
                                        <div class="10u">
                                            <small id="ayudaContrase�a1" class="form-text text-muted">
                                                Contrase�a
                                            </small>
                                            <input type="password" name="passUser1" id="passUser1" value="" placeholder="Contrase�a" required pattern="[A-Za-z0-9]{5,20}"/>
                                            <small id="ayudaPassUser" class="form-text text-muted">
                                                    Letras y n�meros. Entre 5 y 20 caracteres
                                            </small>
                                        </div>
                                        <div class="10u">
                                            <small id="ayudaContrase�a2" class="form-text text-muted">
                                                Repetir Contrase�a
                                            </small>
                                            <input type="password" name="passUser2" id="passUser2" value="" placeholder="Contrase�a" onblur="validarPass()" required pattern="[A-Za-z0-9]{5,20}"/>
                                        </div>  
                                    </div>
                                    <br>
                                    <!-- Break -->
                                    <div class="12u">
                                        <ul class="actions">
                                            <li><input type="submit" value="Registrarse" class="special" /></li>
                                        </ul>
                                    </div>
                                </article>
                                    </div>
                            </form>

                        <hr class="major" />

                    </section>

                </div>
            </div>

            <!-- Sidebar -->
            <div id="sidebar">
                <div class="inner">

                    <!-- Search -->
                    <section id="search" class="alt">
                        <form method="post" action="#">
                            <input type="text" name="query" id="query" placeholder="Search" />
                        </form>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <header class="major">
                            <h2>Menu</h2>
                        </header>
                        <ul>
                            <li><a href="index.jsp">P�gina Principal</a></li>
                            <li><a href="informaciones.jsp">Informaciones</a></li>                           
                            <li><a href="miCuenta.jsp">Mi cuenta</a></li>
                        </ul>
                    </nav>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>PRONTO</h2>
                            <h3>FORO CLIENTES</h3>
                        </header>
                        <div class="mini-posts">
                            <article>
                                <a class="image"><img src="images/blackplateMafires.png" alt="" /></a>
                                <p align="justify">�Ingresa, busca y comparte con el resto de personas tu misma pasi�n!</p>
                            </article>
                        </div>
                        <!--<ul class="actions">
                            <li><a href="#" class="button">FORO</a></li>
                        </ul>-->
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>Mantener Contacto</h2>
                        </header>
                        <p align="justify">Para mayor informacion, puede contactarnos o ir derectamente a nuestras ofinas, ademas de tener un apartado de servicio
                            al cliente donde podr� resolver todas sus dudas</p>
                        <ul class="contact">
                            <li class="fa-envelope-o">Kevin.Labarca@correoaiep.cl</li>
                            <li class="fa-phone">(+569) 78829337</li>
                            <li class="fa-home">Los Andes #8254</li>
                        </ul>
                    </section>

                    <!-- Footer -->
                    <footer id="footer">
                        <p class="copyright">&copy; Modding Mafires. All rights reserved. Dise�ado by: <strong>Ignacio Viacava - Cristopher Perez - <a>KING MAFIRE DEADLINE GOD LABARCA</a></strong>.</p>
                    </footer>

                </div>
            </div>

        </div>

        <!-- Scripts -->
        <script src="js/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="js/main.js"></script>
        <script type="text/javascript" src="js/regionYcomuna.js"></script>
        <script type="text/javascript" src="js/validarPass.js"></script>
        
    </body>
</html>
 <% }
%>