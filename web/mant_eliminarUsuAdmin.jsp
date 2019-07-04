<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    //OBTENER REQUEST
    String exito = (String) request.getAttribute("exitoExitoUsuario");
    String error = (String) request.getAttribute("errorErrorUsuario");
%>

<%    
    HttpSession sesion = request.getSession(false);
    String categoriaUsuario = (String) sesion.getAttribute("categoriaUsuario");
    //PRIMERO SE VALIDA QUE EL ROL SEA DISTINTO A NULL (SI ES NULL, NO HAY SESION ACTIVA)
    if (categoriaUsuario != null) {
            //EL ROL ES DISTINTO DE NULL (HAY SESION ACTIVA). AHORA, VERIRIFICAR QUE EL ROL CORRESPONDA CON LA PAGINA
            if (categoriaUsuario.equals("ADMINISTRADOR")) {
                %>
<% /*
    //SE OBTIENE LA SESION
    HttpSession sesion = request.getSession(false);
    ArrayList datosCliente = (ArrayList) sesion.getAttribute("datosUsuario");

    String categoriaUsuario = (String) sesion.getAttribute("categoriaUsuario");
    //PRIMERO SE VALIDA QUE EL ROL SEA DISTINTO A NULL (SI ES NULL, NO HAY SESION ACTIVA)
    if (categoriaUsuario != null) {
        //EL ROL ES DISTINTO DE NULL (HAY SESION ACTIVA). AHORA, VERIRIFICAR QUE EL ROL CORRESPONDA CON LA PAGINA
        if (categoriaUsuario.equals("CLIENTE")) {
    */
    //VALIDACION DE ACCESOS RESTRINGIDOSv
    //HttpSession sesion = request.getSession(true);
    
                
                String id = (String)session.getAttribute("idUsuario");
                String name = (String)request.getAttribute("nombreUsuario");
                String apelli = (String)request.getAttribute("apellidosUsuario");
                String rune = (String)request.getAttribute("runUsuario");
                String celu = (String)request.getAttribute("celularUsuario");
                String email = (String)request.getAttribute("emailUsuario");
                String passe = (String)request.getAttribute("passUsuario");
                String categoria = (String)request.getAttribute("categoriaUsuario");
                String idantigua = (String)request.getAttribute("idAntigua");
                
                //String eliminando = (String)request.getAttribute("eliminando");
                //String nombre_carre = (String)request.getAttribute("IDmodi");
                


        %>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Mantenedor Usuarios</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <body>

        <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
            <div id="main">
                <div class="inner">

                    <!-- Header -->
                    <header id="header">
                        <a href="index.html" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>
                    <br>
                    <div class="features">
                            <nav class="nav1">
                                        <!-- Listado de Navegación -->
                                        <ul class="menu">  
                                            <li><a href="mant_usuarios.jsp">Ingresar Usuario</a></li>  
                                            <li><a href="buscarModiUsu.jsp">Modificar Usuario</a></li>  
                                            <li><a href="buscareliminarUsuAdmin.jsp">Eliminar Usuario</a></li>
                                        </ul>    
                            </nav> 
                    </div>

                    <!-- Content -->
                    <section>
                        <header class="main">
                            <h1>Mantenedor Usuarios</h1>
                        </header>
                        <div id="containerino">
                            <!-- FORMULARIO -->
                            <form method="post" action="EliminarUsuarioAdmin" name="form1">
                                <div class="posts">
                                <article> 
                                    <h5>Datos Personales</h5>
                                    <div class="row uniform">
                                        <div class="10u">
                                            <input type="number" class="hide" name="idUser" id="idUser" value="<%=idantigua %>" placeholder="" required=""  />
                                        </div>
                                        <div class="10u">
                                            <small id="ayudaNombre" class="form-text text-muted">
                                                    Nombre
                                            </small>
                                            <input type="text" name="nombreUser" id="nombreUser" value="<%=name %>" placeholder="Nombre" required="" pattern="[a-zA-Z\s]{3,40}" disabled />
                                        </div>
                                        <div class="10u">
                                             <small id="ayudaApellido" class="form-text text-muted">
                                                    Apellidos
                                            </small>
                                            <input type="text" name="apellidoUser" id="apellidoUser" value="<%=apelli %>" placeholder="Apellidos" required="" pattern="[a-zA-Z\s]{3,40}" disabled/>
                                        </div>  
                                        <div class="10u">
                                            <small id="ayudaRun" class="form-text text-muted">
                                                    Run
                                            </small>
                                            <input type="text" name="runUser" id="runUser" value="<%=rune %><" placeholder="Run" pattern="\d{2}[\.]\d{3}[\.]\d{3}[\-]\d{1}" required="" maxlength="12" title="Seguir el formato solicitado: xx.xxx.xxx-x" disabled/>
                                            <small id="ayudaRunUser" class="form-text text-muted">
                                                    Ej: xx.xxx.xxx-x.
                                            </small>
                                        </div>
                                        <div class="10u">
                                            <small id="ayudaCelular" class="form-text text-muted">
                                                    Teléfono celular
                                            </small>
                                            <input type="text" name="celularUser" id="celularUser" value="<%=celu %>" placeholder="Teléfono contacto" pattern="[\+][\(]\d{3}[\)]\d{8}" required="" title="Seguir el formato solicitado: +(569)xxxxxxxx" disabled/>
                                            <small id="ayudaTelefonoUser" class="form-text text-muted">
                                                    Ej: +(569)XXXXXXXX.
                                            </small>
                                        </div>
                                        <div class="10u">
                                             <small id="ayudaCorreo" class="form-text text-muted">
                                                    Correo
                                            </small>
                                            <input type="email" name="correoUser" id="correoUser" value="<%=email %>" placeholder="Correo" required="" disabled/>
                                        </div> 
                                        <div class="10u" id="Info"></div>
                                    </div>
                                </article>
                                        
                                <article> 
                                    <h5>Seguridad Contraseña</h5>
                                    <div class="row uniform">
                                        <div class="10u">
                                            <small id="ayudaContraseña1" class="form-text text-muted">
                                                Contraseña
                                            </small>
                                            <input type="text" name="passUser1" id="passUser1" value="<%=passe %>" placeholder="Contraseña" required pattern="[A-Za-z0-9]{5,20}" disabled/>
                                            <small id="ayudaPassUser" class="form-text text-muted">
                                                    Letras y números. Entre 5 y 20 caracteres
                                            </small>
                                        </div>
                                        <div class="10u">
                                            <small id="ayudaContraseña2" class="form-text text-muted">
                                                Repetir Contraseña
                                            </small>
                                            <input type="text" name="passUser2" id="passUser2" value="<%=passe %>" placeholder="Contraseña" onblur="validarPass()" required pattern="[A-Za-z0-9]{5,20}" disabled/>
                                        </div>  
                                    </div>
                                    <br>
                                    <!-- Break -->
                                    <div class="12u">
                                        <ul class="actions">
                                            <li><input type="submit" value="Eliminar" class="special" /></li>
                                        </ul>
                                    </div>
                                </article>
                                    </div>
                            </form>
                    </div>
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
                            <li><a href="index.jsp">Página Principal</a></li>
                            <li><a href="mantenedor_usuarios.jsp">Mantenedor Usuarios</a></li>
                            <li><a href="buscarventasAdmin.jsp">Cotizaciones</a></li>
                            <li><a href="informaciones.jsp">Informaciones</a></li>                           
                            <li><a href="miCuenta.jsp">Mi cuenta</a></li>
                            <li><a href="deslogServlet">Salir</a></li>
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
                                <a class="image"><img src="images/neones_1.jpg" alt="" /></a>
                                <p align="justify">¡Ingresa, busca y comparte con el resto de personas tu misma pasión!</p>
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
                            al cliente donde podrá resolver todas sus dudas</p>
                        <ul class="contact">
                            <li class="fa-envelope-o"><a href="#">Kevin.Labarca@correoaiep.cl</a></li>
                            <li class="fa-phone">(+569) 78829337</li>
                            <li class="fa-home">Los Andes #8254</li>
                        </ul>
                    </section>

                    <!-- Footer -->
                    <footer id="footer">
                        <p class="copyright">&copy; Modding Mafires. All rights reserved. Diseñado by: <strong>Ignacio Viacava - Cristopher Perez - <a>KING MAFIRE DEADLINE GOD LABARCA</a></strong>.</p>
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

    </body>
</html>
<% 
    //SI EL ROL ES DISTINTO DE CLIENTE, SE ENVIARÁ A JSP ERROR LOGIN
    } else {
            request.getRequestDispatcher("errorLogin.jsp").forward(request, response);
        }
    //SI NO EXISTE SESION ACTIVA, SE ENVIARA A JSP ERROR LOGIN. IMPLEMENTAR UN ERROR PARA CUANDO ESTÉ LOGEADO Y OTRO PARA CUANDO NO ESTÉ LOGEADO.
    } else {
            request.getRequestDispatcher("errorLogin.jsp").forward(request, response);
    } 
%>