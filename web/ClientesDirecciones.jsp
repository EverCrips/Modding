<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page import="java.util.ArrayList"%>
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
            String correo = (String) datosCliente.get(5);
            String idUsuario = (String) datosCliente.get(0);
    
            ArrayList datosDirecciones = (ArrayList) sesion.getAttribute("datosDirecciones");   
            
            if((datosDirecciones.get(0) == "null") && (exito == null) && (error == null)){ 

%>
<!DOCTYPE HTML>
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
    </head>
    <script>
        $(document).ready(function () {
            $(".boton").click(function () {

                var mensaje = confirm("¿Está seguro de eliminar la dirección?");
                //Detectamos si el usuario acepto el mensaje
                if (mensaje) {
                    var valores = new Array();
                    i = 0;

                    $(this).parents("tr").find("td").each(function () {
                        valores[i] = $(this).html();
                        i++;
                    });

                    document.getElementById("idDireccion").value = valores[0];
                    document.tablaDireccion.submit();
                }
                //Detectamos si el usuario denegó el mensaje
                else {
                    
                }
                
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
                                <h3>Edición Direcciones</h3><br />
                            </header>
                            <h5>No existen direcciones anexadas a la cuenta</h5>
                            <h3>Anexe una dirección por favor</h3>

                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                            </header>
                            <h5>Nueva Dirección</h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <div class="10u">
                                                <small id="ayudaDireccion" class="form-text text-muted">
                                                    Dirección
                                                </small>
                                                <input type="text" name="direccionUser" id="direccionUser" value="" placeholder="Dirección" required=""/>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCiudad" class="form-text text-muted">
                                                    Ciudad
                                                </small>
                                                <input type="text" name="ciudadUser" id="ciudadUser" value="" placeholder="Ciudad" required=""/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRegion" class="form-text text-muted">
                                                    Región
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
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="hidden" name="idUsuario" value="<%= idUsuario.trim()%>">
                                        <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                                        <br>
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Registrar Nueva" class="special" /></li>
                                            </ul>
                                        </div>
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
        <script type="text/javascript" src="js/regionYcomuna.js"></script>
        <script type="text/javascript" src="js/validarPass.js"></script>

    </body>
</html>
<%  
    }else if((datosDirecciones.get(0) != "null") && (exito == null) && (error == null)){
                    
%>
<!DOCTYPE HTML>
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
    </head>
    <script>
        $(document).ready(function () {
            $(".boton").click(function () {

                var mensaje = confirm("¿Está seguro de eliminar la dirección?");
                //Detectamos si el usuario acepto el mensaje
                if (mensaje) {
                    var valores = new Array();
                    i = 0;

                    $(this).parents("tr").find("td").each(function () {
                        valores[i] = $(this).html();
                        i++;
                    });

                    document.getElementById("idDireccion").value = valores[0];
                    document.tablaDireccion.submit();
                }
                //Detectamos si el usuario denegó el mensaje
                else {
                    
                }
                
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
                                <h3>Edición Direcciones</h3><br />
                            </header>
                            <h5>Direcciones Actuales </h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="tablaDireccion">

                                <div class="table100 ver1 m-b-110">
                                    <br>
                                    <table data-vertable="ver1"> <!-- all the table; data-toggle="collapse" data-target="#demo" -->
                                        <thead>
                                            <tr class="row100 head">
                                                <th class="column100 column1" data-column="column1">Dirección</th>
                                                <th class="column100 column2" data-column="column2">Región</th>
                                                <th class="column100 column3" data-column="column3">Comuna</th>
                                                <th class="column100 column3" data-column="column3">Ciudad</th>
                                                <th class="column100 column4" data-column="column4">Edición</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0, aux = 1;
                                                while (i < datosDirecciones.size()) {
                                            %>
                                            <tr class="row100">
                                                <td style="display:none;" class="column100 column1" data-column="column1"><%=(String) datosDirecciones.get(i)%></td>
                                                <td class="column100 column1" data-column="column1"><%=(String) datosDirecciones.get(i + 1)%></td>
                                                <td class="column100 column2" data-column="column2"><%=(String) datosDirecciones.get(i + 3)%></td>
                                                <td class="column100 column3" data-column="column3"><%=(String) datosDirecciones.get(i + 4)%></td>
                                                <td class="column100 column4" data-column="column4"><%=(String) datosDirecciones.get(i + 2)%></td>
                                                <td class="boton"><input type="button" value="Eliminar" class="boton"/></td>
                                        <input type="hidden" name="idDireccion" id="idDireccion" value="">
                                        </tr>
                                        <%
                                                i = i + 5;
                                                aux++;
                                            }
                                        %>
                                        </tbody>
                                    </table> 
                                </div>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                            </form>

                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                            </header>
                            <h5>Nueva Dirección</h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <div class="10u">
                                                <small id="ayudaDireccion" class="form-text text-muted">
                                                    Dirección
                                                </small>
                                                <input type="text" name="direccionUser" id="direccionUser" value="" placeholder="Dirección" required=""/>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCiudad" class="form-text text-muted">
                                                    Ciudad
                                                </small>
                                                <input type="text" name="ciudadUser" id="ciudadUser" value="" placeholder="Ciudad" required=""/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRegion" class="form-text text-muted">
                                                    Región
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
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="hidden" name="idUsuario" value="<%= idUsuario.trim()%>">
                                        <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                                        <br>
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Registrar Nueva" class="special" /></li>
                                            </ul>
                                        </div>
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
        <script type="text/javascript" src="js/regionYcomuna.js"></script>
        <script type="text/javascript" src="js/validarPass.js"></script>

    </body>
</html>
<% 
    request.removeAttribute("datosDirecciones");
    }else if((datosDirecciones.get(0) != "null") && (exito == null) && (error != null)){
%> 
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

                document.getElementById("idDireccion").value = valores[0];
                document.tablaDireccion.submit();
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
                                <h3>Edición Direcciones</h3><br />
                            </header>
                            <h5>Direcciones Actuales </h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="tablaDireccion">

                                <div class="table100 ver1 m-b-110">
                                    <br>
                                    <table data-vertable="ver1"> <!-- all the table; data-toggle="collapse" data-target="#demo" -->
                                        <thead>
                                            <tr class="row100 head">
                                                <th class="column100 column1" data-column="column1">Dirección</th>
                                                <th class="column100 column2" data-column="column2">Región</th>
                                                <th class="column100 column3" data-column="column3">Comuna</th>
                                                <th class="column100 column3" data-column="column3">Ciudad</th>
                                                <th class="column100 column4" data-column="column4">Edición</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0, aux = 1;
                                                while (i < datosDirecciones.size()) {
                                            %>
                                            <tr class="row100">
                                                <td style="display:none;" class="column100 column1" data-column="column1"><%=(String) datosDirecciones.get(i)%></td>
                                                <td class="column100 column1" data-column="column1"><%=(String) datosDirecciones.get(i + 1)%></td>
                                                <td class="column100 column2" data-column="column2"><%=(String) datosDirecciones.get(i + 3)%></td>
                                                <td class="column100 column3" data-column="column3"><%=(String) datosDirecciones.get(i + 4)%></td>
                                                <td class="column100 column4" data-column="column4"><%=(String) datosDirecciones.get(i + 2)%></td>
                                                <td class="boton"><input type="button" value="Eliminar" class="boton"/></td>
                                        <input type="hidden" name="idDireccion" id="idDireccion" value="">
                                        </tr>
                                        <%
                                                i = i + 5;
                                                aux++;
                                            }
                                        %>
                                        </tbody>
                                    </table> 
                                </div>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                            </form>

                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                            </header>
                            <h5>Nueva Dirección</h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <div class="10u">
                                                <small id="ayudaDireccion" class="form-text text-muted">
                                                    Dirección
                                                </small>
                                                <input type="text" name="direccionUser" id="direccionUser" value="" placeholder="Dirección" required=""/>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCiudad" class="form-text text-muted">
                                                    Ciudad
                                                </small>
                                                <input type="text" name="ciudadUser" id="ciudadUser" value="" placeholder="Ciudad" required=""/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRegion" class="form-text text-muted">
                                                    Región
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
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="hidden" name="idUsuario" value="<%= idUsuario.trim()%>">
                                        <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                                        <p style="color:red;"><%= error %></p> 
                                        <br>
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Registrar Nueva" class="special" /></li>
                                            </ul>
                                        </div>
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
        <script type="text/javascript" src="js/regionYcomuna.js"></script>
        <script type="text/javascript" src="js/validarPass.js"></script>

    </body>
</html>
<%  
    request.removeAttribute("errorErrorUsuario");
    }else if((datosDirecciones.get(0) != "null") && (exito != null) && (error == null)){
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Modding Mafires-Cliente</title>
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

                document.getElementById("idDireccion").value = valores[0];
                document.tablaDireccion.submit();
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
                                <h3>Edición Direcciones</h3><br />
                            </header>
                            <h5>Direcciones Actuales </h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="tablaDireccion">

                                <div class="table100 ver1 m-b-110">
                                    <br>
                                    <table data-vertable="ver1"> <!-- all the table; data-toggle="collapse" data-target="#demo" -->
                                        <thead>
                                            <tr class="row100 head">
                                                <th class="column100 column1" data-column="column1">Dirección</th>
                                                <th class="column100 column2" data-column="column2">Región</th>
                                                <th class="column100 column3" data-column="column3">Comuna</th>
                                                <th class="column100 column3" data-column="column3">Ciudad</th>
                                                <th class="column100 column4" data-column="column4">Edición</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                int i = 0, aux = 1;
                                                while (i < datosDirecciones.size()) {
                                            %>
                                            <tr class="row100">
                                                <td style="display:none;" class="column100 column1" data-column="column1"><%=(String) datosDirecciones.get(i)%></td>
                                                <td class="column100 column1" data-column="column1"><%=(String) datosDirecciones.get(i + 1)%></td>
                                                <td class="column100 column2" data-column="column2"><%=(String) datosDirecciones.get(i + 3)%></td>
                                                <td class="column100 column3" data-column="column3"><%=(String) datosDirecciones.get(i + 4)%></td>
                                                <td class="column100 column4" data-column="column4"><%=(String) datosDirecciones.get(i + 2)%></td>
                                                <td class="boton"><input type="button" value="Eliminar" class="boton"/></td>
                                        <input type="hidden" name="idDireccion" id="idDireccion" value="">
                                        </tr>
                                        <%
                                                i = i + 5;
                                                aux++;
                                            }
                                        %>
                                        </tbody>
                                    </table> 
                                </div>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                            </form>

                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                            </header>
                            <h5>Nueva Dirección</h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <div class="10u">
                                                <small id="ayudaDireccion" class="form-text text-muted">
                                                    Dirección
                                                </small>
                                                <input type="text" name="direccionUser" id="direccionUser" value="" placeholder="Dirección" required=""/>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCiudad" class="form-text text-muted">
                                                    Ciudad
                                                </small>
                                                <input type="text" name="ciudadUser" id="ciudadUser" value="" placeholder="Ciudad" required=""/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRegion" class="form-text text-muted">
                                                    Región
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
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="hidden" name="idUsuario" value="<%= idUsuario.trim()%>">
                                        <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                                        <p style="color:red;"><%= exito %></p>
                                        <br>
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Registrar Nueva" class="special" /></li>
                                            </ul>
                                        </div>
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
        <script type="text/javascript" src="js/regionYcomuna.js"></script>
        <script type="text/javascript" src="js/validarPass.js"></script>

    </body>
</html>
<% 
    request.removeAttribute("exitoExitoUsuario");}
    else{
%>
<!DOCTYPE HTML>
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
    </head>
    <script>
        $(document).ready(function () {
            $(".boton").click(function () {

                var mensaje = confirm("¿Está seguro de eliminar la dirección?");
                //Detectamos si el usuario acepto el mensaje
                if (mensaje) {
                    var valores = new Array();
                    i = 0;

                    $(this).parents("tr").find("td").each(function () {
                        valores[i] = $(this).html();
                        i++;
                    });

                    document.getElementById("idDireccion").value = valores[0];
                    document.tablaDireccion.submit();
                }
                //Detectamos si el usuario denegó el mensaje
                else {
                    
                }
                
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
                                <h3>Edición Direcciones</h3><br />
                            </header>
                            <h5>Direcciones Actuales </h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="tablaDireccion">

                                <div class="table100 ver1 m-b-110">
                                    <br>
                                    <table data-vertable="ver1"> <!-- all the table; data-toggle="collapse" data-target="#demo" -->
                                        <thead>
                                            <tr class="row100 head">
                                                <th class="column100 column1" data-column="column1">Dirección</th>
                                                <th class="column100 column2" data-column="column2">Región</th>
                                                <th class="column100 column3" data-column="column3">Comuna</th>
                                                <th class="column100 column3" data-column="column3">Ciudad</th>
                                                <th class="column100 column4" data-column="column4">Edición</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="row100">
                                                <td style="display:none;" class="column100 column1" data-column="column1"></td>
                                                <td class="column100 column1" data-column="column1"></td>
                                                <td class="column100 column2" data-column="column2"></td>
                                                <td class="column100 column3" data-column="column3"></td>
                                                <td class="column100 column4" data-column="column4"></td>
                                        <input type="hidden" name="idDireccion" id="idDireccion" value="">
                                        </tr>
                                        </tbody>
                                    </table> 
                                </div>
                                <input type="hidden" name="opcion" value="3">
                                <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                            </form>

                        </div>
                    </section> 

                    <!-- Banner -->
                    <section id="banner">

                        <div class="content">
                            <header>
                            </header>
                            <h5>Nueva Dirección</h5>
                            <!-- FORMULARIO -->
                            <form method="post" action="datosClientesServlet" name="form1">
                                <div class="posts">
                                    <article> 
                                        <div class="row uniform">
                                            <div class="10u">
                                                <small id="ayudaDireccion" class="form-text text-muted">
                                                    Dirección
                                                </small>
                                                <input type="text" name="direccionUser" id="direccionUser" value="" placeholder="Dirección" required=""/>
                                            </div>
                                            <div class="10u">
                                                <small id="ayudaCiudad" class="form-text text-muted">
                                                    Ciudad
                                                </small>
                                                <input type="text" name="ciudadUser" id="ciudadUser" value="" placeholder="Ciudad" required=""/>
                                            </div>  
                                            <div class="10u">
                                                <small id="ayudaRegion" class="form-text text-muted">
                                                    Región
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
                                        <input type="hidden" name="opcion" value="4">
                                        <input type="hidden" name="idUsuario" value="<%= idUsuario.trim()%>">
                                        <input type="hidden" name="correoUsuario" value="<%= correo.trim()%>">
                                        <br>
                                        <div class="12u">
                                            <ul class="actions">
                                                <li><input type="submit" value="Registrar Nueva" class="special" /></li>
                                            </ul>
                                        </div>
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
        <script type="text/javascript" src="js/regionYcomuna.js"></script>
        <script type="text/javascript" src="js/validarPass.js"></script>

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
