<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //OBTENER REQUEST
    String exito = (String) request.getAttribute("exitoExitoUsuario");
    String error = (String) request.getAttribute("errorErrorUsuario");
%>

<%
    //SE OBTIENE LA SESION
    HttpSession sesion = request.getSession(false);
    String categoriaUsuario = (String) sesion.getAttribute("categoriaUsuario");
        //PRIMERO SE VALIDA QUE EL ROL SEA DISTINTO A NULL (SI ES NULL, NO HAY SESION ACTIVA)
        if (categoriaUsuario != null) {
            //EL ROL ES DISTINTO DE NULL (HAY SESION ACTIVA). AHORA, VERIRIFICAR QUE EL ROL CORRESPONDA CON LA PAGINA
            if (categoriaUsuario.equals("CLIENTE")) {
                
                ArrayList datosCliente = (ArrayList) sesion.getAttribute("datosUsuario");
                String id = (String) datosCliente.get(0);
                if ((exito == null) && (error == null)) {
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <meta charset="utf-8" />
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
                        <a href="" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>


                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                                <h3>Modificar Contraseña</h3><br />
                            </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <input type="hidden" name="idCliente" value="<%= id.trim()%>">
                                            
                                            <div class="10u">
                                                <small id="ayudaContraseña1" class="form-text text-muted">
                                                    Contraseña
                                                </small>
                                                <input type="password" name="passUser1" id="passUser1" value="" placeholder="Contraseña" required pattern="[A-Za-z0-9]{5,20}"/>
                                                <small id="ayudaPassUser" class="form-text text-muted">
                                                    Letras y números. Entre 5 y 20 caracteres
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaContraseña2" class="form-text text-muted">
                                                    Repetir Contraseña
                                                </small>
                                                <input type="password" name="passUser2" id="passUser2" value="" placeholder="Contraseña" onblur="validarPass()" required pattern="[A-Za-z0-9]{5,20}"/>
                                            </div>  
                                            <div class="10u" id="Info"></div>
                                        </div>

                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Guardar" class="special" /></li>
                                            </ul>
                                        </div>
                                        <input type="hidden" name="opcion" value="2">
                                    </article>                                   
                                </div>
                            </form>
                                            
                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h3>¡Gracias por preferir Modding Mafires!</h3><br />
                            </header>
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
                            <input type="text" name="query" id="query" placeholder="Buscar" />
                        </form>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <header class="major">
                            <h2>Menú</h2>
                        </header>
                        <ul>
                            <li><a href="Clientes.jsp">Principal</a></li>
                            <li><a href="ClientesSolicitarCotizacion.jsp">Solicitar Cotización</a></li>
                            <li><a href="ClientesDatos.jsp">Editar Datos</a></li>
                            <li><a href="ClientesPass.jsp">Contraseña</a></li>                           
                            <li><a href="ClientesDirecciones.jsp">Direcciones</a></li>
                            <li><a href="ClientesPedidos.jsp">Resumen Pedidos</a></li>
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
                                <a class="image"><img src="images/blackplateMafires.png" alt="" /></a>
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
                            <li class="fa-envelope-o">Kevin.Labarca@correoaiep.cl</li>
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
        <script type="text/javascript" src="js/validarPass.js"></script>
        

    </body>
</html>
<% } else
    if((exito == null) && (error != null)) { %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <meta charset="utf-8" />
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
                        <a href="" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>


                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                                <h3>Modificar Contraseña</h3><br />
                            </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <input type="hidden" name="idCliente" value="<%= id.trim()%>">
                                            
                                            <div class="10u">
                                                <small id="ayudaContraseña1" class="form-text text-muted">
                                                    Contraseña
                                                </small>
                                                <input type="password" name="passUser1" id="passUser1" value="" placeholder="Contraseña" required pattern="[A-Za-z0-9]{5,20}"/>
                                                <small id="ayudaPassUser" class="form-text text-muted">
                                                    Letras y números. Entre 5 y 20 caracteres
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaContraseña2" class="form-text text-muted">
                                                    Repetir Contraseña
                                                </small>
                                                <input type="password" name="passUser2" id="passUser2" value="" placeholder="Contraseña" onblur="validarPass()" required pattern="[A-Za-z0-9]{5,20}"/>
                                            </div>  
                                            <div class="10u" id="Info"></div>
                                        </div>
                                        <p style="color:red;"><%= error %></p>
                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Guardar" class="special" /></li>
                                            </ul>
                                        </div>
                                        <input type="hidden" name="opcion" value="2">
                                    </article>                                   
                                </div>
                            </form>
                                            
                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h3>¡Gracias por preferir Modding Mafires!</h3><br />
                            </header>
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
                            <input type="text" name="query" id="query" placeholder="Buscar" />
                        </form>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <header class="major">
                            <h2>Menú</h2>
                        </header>
                        <ul>
                            <li><a href="Clientes.jsp">Principal</a></li>
                            <li><a href="ClientesSolicitarCotizacion.jsp">Solicitar Cotización</a></li> 
                            <li><a href="ClientesDatos.jsp">Editar Datos</a></li>
                            <li><a href="ClientesPass.jsp">Contraseña</a></li>                           
                            <li><a href="ClientesDirecciones.jsp">Direcciones</a></li>
                            <li><a href="ClientesPedidos.jsp">Resumen Pedidos</a></li>
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
                                <a class="image"><img src="images/blackplateMafires.png" alt="" /></a>
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
                            <li class="fa-envelope-o">Kevin.Labarca@correoaiep.cl</li>
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
        <script type="text/javascript" src="js/validarPass.js"></script>
        

    </body>
</html>
<% request.removeAttribute("errorErrorUsuario");} else{ %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <meta charset="utf-8" />
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
                        <a href="" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>


                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                                <h3>Modificar Contraseña</h3><br />
                            </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <input type="hidden" name="idCliente" value="<%= id.trim()%>">
                                            
                                            <div class="10u">
                                                <small id="ayudaContraseña1" class="form-text text-muted">
                                                    Contraseña
                                                </small>
                                                <input type="password" name="passUser1" id="passUser1" value="" placeholder="Contraseña" required pattern="[A-Za-z0-9]{5,20}"/>
                                                <small id="ayudaPassUser" class="form-text text-muted">
                                                    Letras y números. Entre 5 y 20 caracteres
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaContraseña2" class="form-text text-muted">
                                                    Repetir Contraseña
                                                </small>
                                                <input type="password" name="passUser2" id="passUser2" value="" placeholder="Contraseña" onblur="validarPass()" required pattern="[A-Za-z0-9]{5,20}"/>
                                            </div>  
                                            <div class="10u" id="Info"></div>
                                        </div>
                                        <p style="color:red;"><%= exito %></p>       
                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Guardar" class="special" /></li>
                                            </ul>
                                        </div>
                                        <input type="hidden" name="opcion" value="2">
                                    </article>                                   
                                </div>
                            </form>
                                            
                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h3>¡Gracias por preferir Modding Mafires!</h3><br />
                            </header>
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
                            <input type="text" name="query" id="query" placeholder="Buscar" />
                        </form>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <header class="major">
                            <h2>Menú</h2>
                        </header>
                        <ul>
                            <li><a href="Clientes.jsp">Principal</a></li>
                            <li><a href="ClientesSolicitarCotizacion.jsp">Solicitar Cotización</a></li> 
                            <li><a href="ClientesDatos.jsp">Editar Datos</a></li>
                            <li><a href="ClientesPass.jsp">Contraseña</a></li>                           
                            <li><a href="ClientesDirecciones.jsp">Direcciones</a></li>
                            <li><a href="ClientesPedidos.jsp">Resumen Pedidos</a></li>
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
                                <a class="image"><img src="images/blackplateMafires.png" alt="" /></a>
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
                            <li class="fa-envelope-o">Kevin.Labarca@correoaiep.cl</li>
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
        <script type="text/javascript" src="js/validarPass.js"></script>
        

    </body>
</html>
<% request.removeAttribute("exitoExitoUsuario"); }
    
%>

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
