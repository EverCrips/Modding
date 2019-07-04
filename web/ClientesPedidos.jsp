<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //SE OBTIENE LA SESION
    HttpSession sesion = request.getSession(false);
    String categoriaUsuario = (String) sesion.getAttribute("categoriaUsuario");
    //PRIMERO SE VALIDA QUE EL ROL SEA DISTINTO A NULL (SI ES NULL, NO HAY SESION ACTIVA)
    if (categoriaUsuario != null) {
        //EL ROL ES DISTINTO DE NULL (HAY SESION ACTIVA). AHORA, VERIRIFICAR QUE EL ROL CORRESPONDA CON LA PAGINA
            if (categoriaUsuario.equals("CLIENTE")) {
               
                ArrayList datosCliente = (ArrayList) sesion.getAttribute("datosUsuario");
                String correo = (String) datosCliente.get(5);
                ArrayList datosCotizaciones = (ArrayList) sesion.getAttribute("datosCotizaciones");
                
                if(datosCotizaciones.get(0) == "null"){
                    
%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <meta charset="utf-8" />
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <script>
        $(document).ready(function () {
            $(".boton").click(function () {
                
                    var valores = new Array();
                    i = 0;

                    $(this).parents("tr").find("td").each(function () {
                        valores[i] = $(this).html();
                        i++;
                    });

                    document.getElementById("idCotizacion").value = valores[0];
                    document.tablaCotizacion.submit();
                
            });
        });
    </script>
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
                                <h3>Historial De Pedidos</h3><br />
                            </header>
                            <h5>No existen pedidos actualmente</h5>
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
<%
    }else{
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <meta charset="utf-8" />
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
    </head>
    <script>
        $(document).ready(function () {
            $(".boton").click(function () {
                
                    var valores = new Array();
                    i = 0;

                    $(this).parents("tr").find("td").each(function () {
                        valores[i] = $(this).html();
                        i++;
                    });

                    document.getElementById("idCotizacion").value = valores[0];
                    document.tablaCotizacion.submit();
                
            });
        });
    </script>
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
                                <h3>Historial De Pedidos</h3><br />
                            </header>
                            <form method="post" action="datosClientesServlet" name="tablaCotizacion">

                                <div class="table100 ver1 m-b-110">
                                    <br>
                                    <table data-vertable="ver1"> <!-- all the table; data-toggle="collapse" data-target="#demo" -->
                                        <thead>
                                            <tr class="row100 head">
                                                <th class="column100 column1" data-column="column1">Estado Cotización</th>
                                                <th class="column100 column2" data-column="column2">Nombre</th>
                                                <th class="column100 column3" data-column="column3">Descripción</th>
                                                <th class="column100 column3" data-column="column3">Edición</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0, aux = 1;
                                                while (i < datosCotizaciones.size()) {
                                            %>
                                            <tr class="row100">
                                                <td style="display:none;" class="column100 column1" data-column="column1"><%=(String) datosCotizaciones.get(i)%></td>
                                                <td class="column100 column1" data-column="column1"><%=(String) datosCotizaciones.get(i + 1)%></td>
                                                <td class="column100 column1" data-column="column1"><%=(String) datosCotizaciones.get(i + 2)%></td>
                                                <td class="column100 column1" data-column="column1"><%=(String) datosCotizaciones.get(i + 3)%></td>
                                                <td class="boton"><input type="button" value="Ver" class="boton"/></td>
                                        <input type="hidden" name="idCotizacion" id="idCotizacion" value="">
                                        </tr>
                                        <%
                                                i = i + 4;
                                                aux++;
                                            }
                                        %>
                                        </tbody>
                                    </table> 
                                </div>
                                <input type="hidden" name="opcion" value="5">
                                <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
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
<% 
    }
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