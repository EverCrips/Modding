<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%
    //SE OBTIENE LA SESION
    HttpSession sesion = request.getSession(false);
    String categoriaUser = (String) sesion.getAttribute("categoriaUsuario");
    //OBTENER REQUEST
    String exitoRegistroCuenta = (String) request.getAttribute("exitoExitoPrincipal");
    String errorLogin = (String) request.getAttribute("errorErrorLogin");
%>

<%
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
    }else 
    if ((exitoRegistroCuenta == null) && (errorLogin == null)) {%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires - Mi Cuenta</title>
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
                        <a href="index.jsp" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>

                    <!-- Content -->
                    <section>
                        <header class="main">
                            <h1>Acceso</h1>
                        </header>
                        <div class="posts">
                            <article>                               
                                <h3>Clientes</h3>
                                <p align="justify">Ya poseo una cuenta en Mafires Modding...</p>
                                <form method="post" action="loginServlet">
                                    <div class="row uniform">
                                        <div class="10u">
                                            <input type="email" name="mailUser" id="mailUser" value="" placeholder="Email" required=""/>
                                        </div>
                                        <div class="10u">
                                            <input type="password" name="passUser" id="passUser" value="" placeholder="Contraseña" required=""/>
                                        </div>                                      
                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Ingresar" class="special" /></li>
                                                <a href="recuperarContraseña.jsp">No recuerdo mi contraseña</a>
                                            </ul>
                                        </div>
                                    </div>
                                </form>

                            </article>
                            <article>
                                <h3>Nuevo Cliente</h3>
                                <p align="justify">Al crear una cuenta podrás realizar cotizaciones de forma rápida y poder consultar
                                    el estado de las mismas en tu panel de control. Además, obtendrás variadas ofertas personalizadas.</p>
                                <ul class="actions">
                                    <li><a href="registro.jsp" class="button">Continuar</a></li>
                                </ul>                               
                            </article> 
                        </div>
                        
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
                            <li><a href="index.jsp">Página Principal</a></li>
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
<% } else if((exitoRegistroCuenta != null) && (errorLogin == null)){ %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires - Mi Cuenta</title>
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
                        <a href="index.html" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>

                    <!-- Content -->
                    <section>
                        <header class="main">
                            <h1>Acceso</h1>
                        </header>
                        <div class="posts">
                            <article>                               
                                <h3>Clientes</h3>
                                <p align="justify">Ya poseo una cuenta en Mafires Modding...</p>
                                <form method="post" action="loginServlet">
                                    <div class="row uniform">
                                        <div class="10u">
                                            <input type="email" name="mailUser" id="mailUser" value="" placeholder="Email" required=""/>
                                        </div>
                                        <div class="10u">
                                            <input type="password" name="passUser" id="passUser" value="" placeholder="Contraseña" required=""/>
                                        </div>                                      
                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Ingresar" class="special" /></li>
                                                <a href="recuperarContraseña.jsp">No recuerdo mi contraseña</a>
                                            </ul>
                                        </div>
                                    </div>
                                </form>

                            </article>
                            <article>
                                <h3>Nuevo Cliente</h3>
                                <p align="justify">Al crear una cuenta podrás realizar cotizaciones de forma rápida y poder consultar
                                    el estado de las mismas en tu panel de control. Además, obtendrás variadas ofertas personalizadas.</p>
                                <ul class="actions">
                                    <li><a href="registro.jsp" class="button">Continuar</a></li>
                                </ul>
                                <h4 style="color:red;">Se ha creado una cuenta satisfactoriamente en nuestro sistema.</h4>
                                <h4 style="color:red;">¡Ingresa con tus datos y empieza a solicitar nuestros servicios!</h4>    
                            </article>   
                                
                        </div>



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
                            <li><a href="index.jsp">Página Principal</a></li>
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
<% request.removeAttribute("exitoExitoPrincipal");} 
else { %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires - Mi Cuenta</title>
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
                        <a href="index.html" class="logo"><strong>MODDING MAFIRES</strong></a>
                        <ul class="icons">
                            <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                            <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                            <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        </ul>
                    </header>

                    <!-- Content -->
                    <section>
                        <header class="main">
                            <h1>Acceso</h1>
                        </header>
                        <div class="posts">
                            <article>                               
                                <h3>Clientes</h3>
                                <p align="justify">Ya poseo una cuenta en Mafires Modding...</p>
                                <form method="post" action="loginServlet">
                                    <div class="row uniform">
                                        <div class="10u">
                                            <input type="email" name="mailUser" id="mailUser" value="" placeholder="Email" required=""/>
                                        </div>
                                        <div class="10u">
                                            <input type="password" name="passUser" id="passUser" value="" placeholder="Contraseña" required=""/>
                                        </div>                                      
                                        <!-- Break -->
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Ingresar" class="special" /></li>
                                                <a href="recuperarContraseña.jsp">No recuerdo mi contraseña</a>
                                            </ul>
                                        </div>
                                    </div>
                                </form>
                                <h4 style="color:red;">No se pudo ingresar a su cuenta</h4>
                                <h4 style="color:red;"><%=errorLogin %></h4>
                            </article>
                            <article>
                                <h3>Nuevo Cliente</h3>
                                <p align="justify">Al crear una cuenta podrás realizar cotizaciones de forma rápida y poder consultar
                                    el estado de las mismas en tu panel de control. Además, obtendrás variadas ofertas personalizadas.</p>
                                <ul class="actions">
                                    <li><a href="registro.jsp" class="button">Continuar</a></li>
                                </ul>    
                            </article>   
                                
                        </div>



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
                            <li><a href="index.jsp">Página Principal</a></li>
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
<% request.removeAttribute("errorErrorLogin"); }
    
%>