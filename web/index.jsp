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
        <title>Modding Mafires</title>
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

                    <!-- Banner -->
                    <section id="banner">
                        <div class="content">
                            <header>
                                <h1>¡Somos Modding Mafires, Somos Calidad!<br />
                                </h1>
                                <p align="justify">Una de las mejores empresas con el más completo servicio de modding llega a Chile</p>
                            </header>
                            <p align="justify">Aburrido de tener lo mismo que el resto, cansado de no resaltar, tu computador está pasado de moda...</p>
                            <ul class="actions">
                                <li><a href="informaciones.jsp" class="button big">Leer más</a></li>
                            </ul>
                        </div>
                        <span class="image object">
                            <img src="images/logoMafires.png" alt="" />
                        </span>
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>SERVICIOS</h2>
                        </header>
                        <div class="features">
                            <article>
                                <span class="icon fa-diamond"></span>
                                <div class="content">
                                    <h3>MODDING PARA PC</h3>
                                    <p align="justify">Modificaciones para computador y/o periféricos a tu gusto</p>
                                </div>
                            </article>
                            <article>
                                <span class="icon fa-paper-plane"></span>
                                <div class="content">
                                    <h3>COURIER</h3>
                                    <p align="justify">Contamos con las mejores opciones para retiro y envíos de equipos</p>
                                </div>
                            </article>
                            <article>
                                <span class="icon fa-rocket"></span>
                                <div class="content">
                                    <h3>CERTIFICACIÓN</h3>
                                    <p align="justify">Todo nuestro équipo de técnicos están certificados para la manipulación y upgrade de computadores</p>
                                </div>
                            </article>
                            <article>
                                <span class="icon fa-signal"></span>
                                <div class="content">
                                    <h3>MEJORA DE PRODUCTOS</h3>
                                    <p align="justify">No solo enchulamos su máquina, ¡también podemos mejorar altamente su rendimiento!</p>
                                </div>
                            </article>
                        </div>
                    </section>

                    <!-- Section -->
                    <section>
                        <header class="major">
                            <h2>OFERTAS</h2>
                        </header>
                        <div class="posts">
                            <article>
                                <a class="image"><img src="images/mouseMafires.png" alt="" /></a>
                                <h3>Modding Mouses</h3>
                                <p align="justify">Modelamos cualquier mouse marca ACER por solo 9.000 CLP</p>
                                <ul class="actions">
                                    <li><a href="miCuenta.jsp" class="button">Más</a></li>
                                </ul>
                            </article>
                            <article>
                                <a class="image"><img src="images/tecladoMafires.png" alt="" /></a>
                                <h3>Modding Keyboard</h3>
                                <p align="justify">Un 50% de descuento en cualquier teclado hasta el 30 Abril</p>
                                <ul class="actions">
                                    <li><a href="miCuenta.jsp" class="button">Más</a></li>
                                </ul>
                            </article>
                            <article>
                                <a class="image"><img src="images/gabineteMafires.png" alt="" /></a>
                                <h3>Modding Gabinetes</h3>
                                <p align="justify">20% de descuento en tu segundo gabinete</p>
                                <ul class="actions">
                                    <li><a href="miCuenta.jsp" class="button">Más</a></li>
                                </ul>
                            </article>
                            <article>
                                <a class="image"><img src="images/notebookMafires.png" alt="" /></a>
                                <h3>Modding Notebooks</h3>
                                <p align="justify">¡10% descuento en modding de Notebooks solo por Mayo!</p>
                                <ul class="actions">
                                    <li><a href="miCuenta.jsp" class="button">Más</a></li>
                                </ul>
                            </article>
                            <article>
                                <a class="image"><img src="images/courierMafires.png" alt="" /></a>
                                <h3>Servicio Courier</h3>
                                <p align="justify">Solo por éste mes, si el costo del servicio es sobre 50.000 CLP, ¡el despacho es gratis!</p>
                                <ul class="actions">
                                    <li><a href="miCuenta.jsp" class="button">Más</a></li>
                                </ul>
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
                            <input type="text" name="query" id="query" placeholder="Buscar" />
                        </form>
                    </section>

                    <!-- Menu -->
                    <nav id="menu">
                        <header class="major">
                            <h2>Menú</h2>
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