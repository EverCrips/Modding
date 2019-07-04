<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
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
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires - Información</title>
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
                            <h1>Acerca de nosotros</h1>
                        </header>
                        <div class="posts">
                            <article>                               
                                <h3>Modding Mafires</h3>
                                <p align="justify">Somos una empresa dedicada al rubro del modding, nos enfocamos en satifacer la necesidad del cliente. 
                                    contamos con una gran variedad de servicios a ofrecer, tanto de modificaciones a gabinetes, periféricos, componentes, 
                                    retroiluminaciones, entre otras.</p>
                                
                                <a class="image"><img src="images/moddingMafiresInformacion1.png" alt="" /></a> 
                            </article>
                            <article>
                                <h3>Reconocimiento Europeo</h3>
                                <p align="justify">Modding Mafires surgió inicialmente gracias a la experiencia obtenida en el rubro, nuestros integrantes vienen de 
                                    varias empresas enfocadas al modding, a partir de ello nacimos nosotros, entregándole servicios a grandes empresas reconocidas, algunos como 
                                    Msi, Corsair, Nvidia, entre otras.<br>
                                    Actualmente somos una empresa independiente, la cual entrega servicios de modding a los clientes, a través de nuestra página web.</p>
                            </article>                          
                        </div>
                        <hr class="major" />
                        <div class="posts">
                            <article>                               
                                <h3>¿Cómo funciona?</h3>
                                <p align="justify">1. Lo principal es ser usuario registrado en nuestro sistema.<br>

                                                    2. Se solicita una cotización de un servicio modding (gabinete, perifericos, componentes, retroiluminación, etc).<br>

                                                    3. Confirmar el servicio solicitado (realizando abonos, más envíos del producto).<br>

                                                    4. Realizar seguimiento del producto semanalmente (Recibirá imágenes del avance del producto más una descripción breve).<br> 

                                                    5. Al finalizar la fecha, el producto se enviará a su respectivo usuario (una vez realizado el pago final).</p>
                            </article>
                            <article>
                                <h3>La mejor calidad para nuestros clientes</h3>
                                <p align="justify">Contamos con técnicos especializados y el mejor servicio de courier de la zona, además de estar siempre atentos a los 
                                    comentarios de los clientes y ayudar en posibles problemas que tenga el cliente con el servicio y/o sistema.
                                </p>
                                <a class="image"><img src="images/moddingMafiresInformacion2.png" alt="" /></a>
                            </article>                          
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
 <% }
%>
