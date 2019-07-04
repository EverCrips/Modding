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
            if (categoriaUsuario.equals("CLIENTE")) {
                //SE OBTIENE LA SESION              
                ArrayList datosCliente = (ArrayList) sesion.getAttribute("datosUsuario");
                String id = (String) datosCliente.get(0);
                String nombre = (String) datosCliente.get(1);
                String apellidos = (String) datosCliente.get(2);
                String run = (String) datosCliente.get(3);
                String celular = (String) datosCliente.get(4);
                String correo = (String) datosCliente.get(5);
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
                                <h3>Editar Información Cuenta</h3><br />
                            </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <h5>Datos Personales</h5>
                                        <div class="row uniform">
                                            <input type="hidden" name="idCliente" value="<%= id.trim() %>">
                                            <div class="10u">
                                                <small id="ayudaNombre" class="form-text text-muted">
                                                    Nombre*
                                                </small>
                                                <input type="text" name="nombreUser" id="nombreUser" value="<%= nombre.trim() %>" placeholder="Nombre" required="" pattern="[a-zA-Z\s]{3,40}" />
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaApellido" class="form-text text-muted">
                                                    Apellidos*
                                                </small>
                                                <input type="text" name="apellidoUser" id="apellidoUser" value="<%= apellidos.trim() %>" placeholder="Apellidos" required="" pattern="[a-zA-Z\s]{3,40}"/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRun" class="form-text text-muted">
                                                    Run*
                                                </small>
                                                <input type="text" name="runUser" id="runUser" value="<%= run.trim() %>" placeholder="Run" pattern="\d{2}[\.]\d{3}[\.]\d{3}[\-]\d{1}" required="" maxlength="12" title="Seguir el formato solicitado: xx.xxx.xxx-x" readonly/>
                                                <small id="ayudaRunUser" class="form-text text-muted">
                                                    Ej: xx.xxx.xxx-x.
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCelular" class="form-text text-muted">
                                                    Teléfono celular*
                                                </small>
                                                <input type="text" name="celularUser" id="celularUser" value="<%= celular.trim() %>"  pattern="[\+][\(]\d{3}[\)]\d{8}" required="" title="Seguir el formato solicitado: +(569)xxxxxxxx"/>
                                                <small id="ayudaTelefonoUser" class="form-text text-muted">
                                                    Ej: +(569)XXXXXXXX.
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCorreo" class="form-text text-muted">
                                                    Correo*
                                                </small>
                                                <input type="email" name="correoUser" id="correoUser" value="<%= correo.trim() %>" placeholder="Correo" required=""/>
                                            </div> 
                                            <div class="10u" id="Info"></div>
                                        </div>

                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Guardar" class="special" /></li>
                                            </ul>
                                        </div>
                                        <input type="hidden" name="opcion" value="1">
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
                                <h3>Editar Información Cuenta</h3><br />
                            </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <h5>Datos Personales</h5>
                                        <div class="row uniform">
                                            <input type="hidden" name="idCliente" value="<%= id.trim() %>">
                                            <div class="10u">
                                                <small id="ayudaNombre" class="form-text text-muted">
                                                    Nombre*
                                                </small>
                                                <input type="text" name="nombreUser" id="nombreUser" value="<%= nombre.trim() %>" placeholder="Nombre" required="" pattern="[a-zA-Z\s]{3,40}" />
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaApellido" class="form-text text-muted">
                                                    Apellidos*
                                                </small>
                                                <input type="text" name="apellidoUser" id="apellidoUser" value="<%= apellidos.trim() %>" placeholder="Apellidos" required="" pattern="[a-zA-Z\s]{3,40}"/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRun" class="form-text text-muted">
                                                    Run*
                                                </small>
                                                <input type="text" name="runUser" id="runUser" value="<%= run.trim() %>" placeholder="Run" pattern="\d{2}[\.]\d{3}[\.]\d{3}[\-]\d{1}" required="" maxlength="12" title="Seguir el formato solicitado: xx.xxx.xxx-x" readonly/>
                                                <small id="ayudaRunUser" class="form-text text-muted">
                                                    Ej: xx.xxx.xxx-x.
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCelular" class="form-text text-muted">
                                                    Teléfono celular*
                                                </small>
                                                <input type="text" name="celularUser" id="celularUser" value="<%= celular.trim() %>"  pattern="[\+][\(]\d{3}[\)]\d{8}" required="" title="Seguir el formato solicitado: +(569)xxxxxxxx"/>
                                                <small id="ayudaTelefonoUser" class="form-text text-muted">
                                                    Ej: +(569)XXXXXXXX.
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCorreo" class="form-text text-muted">
                                                    Correo*
                                                </small>
                                                <input type="email" name="correoUser" id="correoUser" value="<%= correo.trim() %>" placeholder="Correo" required=""/>
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
                                        <input type="hidden" name="opcion" value="1">
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
                                <h3>Editar Información Cuenta</h3><br />
                            </header>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <h5>Datos Personales</h5>
                                        <div class="row uniform">
                                            <input type="hidden" name="idCliente" value="<%= id.trim() %>">
                                            <div class="10u">
                                                <small id="ayudaNombre" class="form-text text-muted">
                                                    Nombre*
                                                </small>
                                                <input type="text" name="nombreUser" id="nombreUser" value="<%= nombre.trim() %>" placeholder="Nombre" required="" pattern="[a-zA-Z\s]{3,40}" />
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaApellido" class="form-text text-muted">
                                                    Apellidos*
                                                </small>
                                                <input type="text" name="apellidoUser" id="apellidoUser" value="<%= apellidos.trim() %>" placeholder="Apellidos" required="" pattern="[a-zA-Z\s]{3,40}"/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRun" class="form-text text-muted">
                                                    Run*
                                                </small>
                                                <input type="text" name="runUser" id="runUser" value="<%= run.trim() %>" placeholder="Run" pattern="\d{2}[\.]\d{3}[\.]\d{3}[\-]\d{1}" required="" maxlength="12" title="Seguir el formato solicitado: xx.xxx.xxx-x" readonly/>
                                                <small id="ayudaRunUser" class="form-text text-muted">
                                                    Ej: xx.xxx.xxx-x.
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCelular" class="form-text text-muted">
                                                    Teléfono celular*
                                                </small>
                                                <input type="text" name="celularUser" id="celularUser" value="<%= celular.trim() %>"  pattern="[\+][\(]\d{3}[\)]\d{8}" required="" title="Seguir el formato solicitado: +(569)xxxxxxxx"/>
                                                <small id="ayudaTelefonoUser" class="form-text text-muted">
                                                    Ej: +(569)XXXXXXXX.
                                                </small>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCorreo" class="form-text text-muted">
                                                    Correo*
                                                </small>
                                                <input type="email" name="correoUser" id="correoUser" value="<%= correo.trim() %>" placeholder="Correo" required=""/>
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
                                        <input type="hidden" name="opcion" value="1">
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
