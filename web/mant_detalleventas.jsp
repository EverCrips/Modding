<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
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
<% 
    //SE OBTIENE LA SESION
   // HttpSession sesion = request.getSession(false);
    /*ArrayList datosCliente = (ArrayList) sesion.getAttribute("datosUsuario");

    String categoriaUsuario = (String) sesion.getAttribute("categoriaUsuario");
    //PRIMERO SE VALIDA QUE EL ROL SEA DISTINTO A NULL (SI ES NULL, NO HAY SESION ACTIVA)
    if (categoriaUsuario != null) {
        //EL ROL ES DISTINTO DE NULL (HAY SESION ACTIVA). AHORA, VERIRIFICAR QUE EL ROL CORRESPONDA CON LA PAGINA
        if (categoriaUsuario.equals("CLIENTE")) { */
    
            
                String NumCoti= (String)request.getAttribute("numeroCotizacion");
                String EstadoCoti= (String)request.getAttribute("estadoCotizacion");
                String NombreCoti= (String)request.getAttribute("nombreCotizacion");
                String Descripcion= (String)request.getAttribute("descripcionCotizacion");
                String idUsuarioCoti= (String)request.getAttribute("idUsuarioCotizacion");
                int idUserCoti=(Integer)request.getAttribute("idUserCoti");
                int indice=(Integer)request.getAttribute("INDEX");
                //ArrayList listaFichas=(ArrayList)request.getAttribute("Detalle");
                ArrayList listaDates=(ArrayList)request.getAttribute("Dates");
                
                java.sql.Date date = new java.sql.Date(Calendar.getInstance().getTime().getTime());
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                String text = df.format(date);
%>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Mantenedor Ventas Clientes</title>
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

                    <!-- Content -->
                    <section>
                        <header class="main">
                            <h1>Detalle Ventas Cliente</h1>
                        </header>
                        
                        
                            <form method="post" action="#">
                                <div class="features">

                                    
                                    
                                        <div class="table100 ver2 m-b-110">
					<table data-vertable="ver2">
						<thead>
							<tr class="row100 head">
								<th class="column100 column1" data-column="column1">Number Cotiza</th>
								<th class="column100 column2" data-column="column2">Fecha Detalle</th>
								<th class="column100 column3" data-column="column3">Estado Detalle</th>
                                                                <th class="column100 column4" data-column="column4">Descripción Cotizacion</th>
                                                                <th class="column100 column5" data-column="column5">Id Cotización Detalle</th>
							</tr>
						</thead>
							<%int j=0;%>
                                                        <%for(int i=0;i<indice;i++){%> 
							<tr class="row100">
								<td class="column100 column1" data-column="column1"><%=listaDates.get(j+(i))%></td>
                                                                <%j=j+1; %>
								<td class="column100 column2" data-column="column2"><%=listaDates.get(j+(i))%></td>
                                                                <%j=j+1; %>
								<td class="column100 column3" data-column="column3"><%=listaDates.get(j+(i))%></td>
                                                                <%j=j+1; %>
								<td class="column100 column4" data-column="column4"><%=listaDates.get(j+(i))%></td>
                                                                <%j=j+1; %>
								<td class="column100 column5" data-column="column5"><%=listaDates.get(j+(i))%></td>
							</tr>
                                                        <%}%> 
						</tbody> 
					</table>
                                        </div> 
                                </div>
                            </form>        
                                                
                    <h5>Ingresar Cotizacion</h5>
                        <form method="post" action="IngresarDetalleCoti">
                            <hr>
                            <div class="features">

                                    <div class="row uniform">
                                        <div class="10u">
                                             <small class="form-text text-muted">
                                                   Fecha Detalle
                                            </small>
                                            <input type="date" name="fechaDetalle" id="fechaDetalle" value="" placeholder="" />
                                        </div>  
                                        <div class="10u">
                                            <small class="form-text text-muted">
                                                   Estado Detalle
                                            </small>
                                            <input type="text" name="estadoDetalle" id="estadoDetalle" value="" placeholder="" />
                                        </div>
                                        <div class="10u">
                                            <small class="form-text text-muted">
                                                   Descripcion Cotizacion
                                            </small>
                                            <input type="text" name="descripcionDetalle" id="descripcionDetalle" value="" placeholder="" />
                                        </div>
                                        <div class="10u">
                                            <small class="form-text text-muted">
                                                   Id Cotizacion Detalle
                                            </small>
                                            <input type="text" name="idcotizacionDetalle" id="idcotizacionDetalle" value="" placeholder="" />
                                        </div>
                                   </div>
                                   <div class="12u">
                                       <br>
                                        <ul class="actions">
                                            <li><input type="submit" value="Ingresar" class="special" /></li>
                                        </ul>
                                    </div>
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