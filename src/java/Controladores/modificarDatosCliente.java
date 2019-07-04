/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.ConsultasGenerales;
import Modelos.ConsultasUsuario;
import Modelos.CorreoElectronico;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author MSINote
 */
public class modificarDatosCliente extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            request.removeAttribute("exitoExitoUsuario");
            request.removeAttribute("errorErrorUsuario");
            
            //PARA QUE NO ACCEDAN A SERVLET POR URL
            String opcionJSP = request.getParameter("opcion");
            if (opcionJSP == null) {               
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                //Decido qué formulario se ha activado
                switch (opcionJSP) {
                    case "1":
                        //OBTENGO DATOS DEL JSP
                        String id = request.getParameter("idCliente");
                        String nombre = request.getParameter("nombreUser");
                        String apellidos = request.getParameter("apellidoUser");
                        String celular = request.getParameter("celularUser");
                        String correo = request.getParameter("correoUser");

                        ConsultasUsuario conus = new ConsultasUsuario();
                        ConsultasGenerales conge = new ConsultasGenerales();

                        //VALIDO QUE EL CORREO NO HA SIDO MODIFICADO
                        //ES EL MISMO
                        if (conus.contrastarCorreo(id, correo)) {
                            //MODIFICACION COMPLETA
                            conus = new ConsultasUsuario();
                            if (conus.modificarDatos(id, nombre, apellidos, celular, correo)) {

                                //OBTENGO LOS DATOS NUEVAMENTE
                                conus = new ConsultasUsuario();
                                ArrayList listaAl = new ArrayList();
                                listaAl = conus.ObtenerFullDatosUsuarios(id);

                                HttpSession sesion = request.getSession();

                                sesion.setAttribute("datosUsuario", listaAl);

                                request.setAttribute("exitoExitoUsuario", "¡Se han guardado sus datos correctamente!");
                                request.getRequestDispatcher("ClientesDatos.jsp").forward(request, response);

                                //NO SE PUDO MODIFICAR
                            } else {
                                request.setAttribute("errorErrorUsuario", "¡CORREO YA REGISTRADO! INTENTE CON OTRO.");
                                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                            }
                            //NO ES EL MISMO
                        } else {
                            conge = new ConsultasGenerales();
                            //VALIDO SI EXISTE EL CORREO EN OTRA CUENTA
                            //EXISTE                      
                            if (conge.existeCorreo(correo)) {
                                request.setAttribute("errorErrorUsuario", "¡CORREO YA REGISTRADO! INTENTE CON OTRO.");
                                request.getRequestDispatcher("ClientesDatos.jsp").forward(request, response);

                                //NO EXISTE
                            } else {
                                conus = new ConsultasUsuario();
                                //MODIFICO LOS DATOS DE LA CUENTA
                                //MODIFICACION COMPLETA
                                if (conus.modificarDatos(id, nombre, apellidos, celular, correo)) {
                                    //OBTENGO LOS DATOS NUEVAMENTE
                                    conus = new ConsultasUsuario();
                                    ArrayList listaAl = new ArrayList();
                                    listaAl = conus.ObtenerFullDatosUsuarios(id);

                                    HttpSession sesion = request.getSession();

                                    sesion.setAttribute("datosUsuario", listaAl);

                                    request.setAttribute("exitoExitoUsuario", "¡Se han guardado sus datos correctamente!");
                                    request.getRequestDispatcher("ClientesDatos.jsp").forward(request, response);

                                    //NO SE PUDO MODIFICAR
                                } else {
                                    request.setAttribute("errorErrorUsuario", "Ha ocurrido un error. Intente nuevamente.");
                                    request.getRequestDispatcher("ClientesDatos.jsp").forward(request, response);
                                }
                            }

                        }
                        break;
                    case "2":
                        //OBTENGO DATOS DEL JSP
                        String id2 = request.getParameter("idCliente");
                        String pass1 = request.getParameter("passUser1");
                        String pass2 = request.getParameter("passUser2");

                        ConsultasUsuario conus1 = new ConsultasUsuario();
                        //PASS CAMBIADA
                        if (conus1.modificarPass(id2, pass2)) {
                            request.setAttribute("exitoExitoUsuario", "¡Se han guardado su nueva contraseña!");
                            request.getRequestDispatcher("ClientesPass.jsp").forward(request, response);
                            //NO SE PUDO CAMBIAR LA PASS
                        } else {
                            request.setAttribute("exitoExitoUsuario", "Ha ocurrido un error. Intente nuevamente.");
                            request.getRequestDispatcher("ClientesPass.jsp").forward(request, response);
                        }
                        break;
                    case "3":
                        //OBTENGO DATOS DEL JSP
                        String idDireccion = request.getParameter("idDireccion");
                        String email = request.getParameter("correoUsuario");

                        ConsultasUsuario conus3 = new ConsultasUsuario();
                        //PASS CAMBIADA
                        if (conus3.eliminarDireccion(idDireccion)) {
                            //CREO OTRO ARREGLO CON LAS DIRECCIONES DEL USUARIO
                            conus3 = new ConsultasUsuario();
                            ArrayList listaDir = new ArrayList();
                            listaDir = conus3.ObtenerFullDatosDirecciones(email);

                            HttpSession sesion = request.getSession();

                            //LISTA CON LoS DATOS DE LAS DIRECCIONES
                            sesion.setAttribute("datosDirecciones", listaDir);

                            request.setAttribute("exitoExitoUsuario", "Dirección eliminada satisfactoriamente");
                            request.getRequestDispatcher("ClientesDirecciones.jsp").forward(request, response);
                            //NO SE PUDO CAMBIAR LA PASS
                        } else {
                            request.setAttribute("exitoExitoUsuario", "Ha ocurrido un error. Intente nuevamente.");
                            request.getRequestDispatcher("ClientesDirecciones.jsp").forward(request, response);
                        }
                        break;
                    case "4":
                        String direccionCliente = request.getParameter("direccionUser");
                        String ciudadCliente = request.getParameter("ciudadUser");
                        String regionCliente = request.getParameter("regionUser");
                        String comunaCliente = request.getParameter("comunaUser");

                        String idUsuario = request.getParameter("idUsuario");
                        String email1 = request.getParameter("correoUsuario");

                        ConsultasGenerales conge2 = new ConsultasGenerales();

                        //SE REGISTRO NUEVA DIRECCION
                        if (conge2.registrarDireccion(direccionCliente, ciudadCliente, regionCliente, comunaCliente, Integer.parseInt(idUsuario))) {
                            //CREO OTRO ARREGLO CON LAS DIRECCIONES DEL USUARIO
                            ConsultasUsuario conus4 = new ConsultasUsuario();
                            ArrayList listaDir = new ArrayList();
                            listaDir = conus4.ObtenerFullDatosDirecciones(email1);

                            HttpSession sesion = request.getSession();

                            //LISTA CON LoS DATOS DE LAS DIRECCIONES
                            sesion.setAttribute("datosDirecciones", listaDir);

                            request.setAttribute("exitoExitoUsuario", "Se ha registrado una nueva dirección a su cuenta");
                            request.getRequestDispatcher("ClientesDirecciones.jsp").forward(request, response);
                        } else {
                            //NO SE REGISTRO  
                            request.setAttribute("exitoExitoUsuario", "Ha ocurrido un erro. Intente nuevamente.");
                            request.getRequestDispatcher("ClientesDirecciones.jsp").forward(request, response);
                        }

                        break;
                    case "5":
                        String correo2 = request.getParameter("correoUsuario");
                        String idCotizacion = request.getParameter("idCotizacion");
                        
                        ConsultasGenerales conge3 = new ConsultasGenerales();
                        
                        ArrayList listaDetCot = new ArrayList();
                        listaDetCot = conge3.ObtenerFullDatosDetallesCotizaciones(correo2, Integer.parseInt(idCotizacion));
                        
                        HttpSession sesion = request.getSession();
                        
                        //LISTA CON LoS DATOS DETALLES COTIZACIONES
                        sesion.setAttribute("datosDetallesCotizaciones", listaDetCot);
                        
                        request.setAttribute("NO", "NO");
                        request.getRequestDispatcher("ClientesDetallesPedidos.jsp").forward(request, response);
                        
                        break;
                    case "6":
                        String correo3 = request.getParameter("email");
                        String nombre3 = request.getParameter("nombre");
                        String tipo = request.getParameter("tipo");
                        String detalle = request.getParameter("detalle");

                        
                        CorreoElectronico cor = new CorreoElectronico();
                        String asunto="Solicitud Cotización Modding Mafires";
                        String plantilla = "Se ha recibido una solicitud de cotización de la cuenta: " + correo3 + ".\nDentro de poco, un administrador se comunicará con usted mediante éste mismo correo para poder tomar la solicitud."
                            + "\n---------------------------------------------------------------------------------------\n"
                            + "---------------------------------------------------------------------------------------\n"
                            + "\nAtte. Administración Modding Mafires";
                        //ENVIAR CORREO CLIENTE SI
                        if (cor.enviarCorreoCliente(plantilla, correo3, asunto)) {
                            cor = new CorreoElectronico();
                            String asunto2="Solicitud Cotización Modding Mafires";
                            String plantilla2 = "Se ha recibido una solicitud de cotización de la cuenta: " + correo3 + ".\n\n*Cliente: "+nombre3+" \n*Tipo Solicitud: "+tipo+" \n*Detalle: "+detalle+" \nComunicarse a la brevedad con el cliente."
                                    + "\n---------------------------------------------------------------------------------------\n"
                                    + "---------------------------------------------------------------------------------------\n"
                                    + "Archivar mensaje en casilla pertinente.\nAtte. Administración Modding Mafires";
                            //ENVIAR CORREO ADMINISTRACION SI
                            if (cor.enviarCorreoAdministracion(plantilla2, asunto2)) {
                                request.setAttribute("exitoExitoUsuario", "Se ha enviado correctamente la solicitud. Revise su casilla dentro de unos minutos.");
                                request.getRequestDispatcher("ClientesSolicitarCotizacion.jsp").forward(request, response);
                                //ENVIAR CORREO ADMINISTRACION NO     
                            } else {
                                request.setAttribute("errorErrorUsuario", "ERROR [106] - CORREO NO ENVIADO ADMINISTRADOR");
                                request.getRequestDispatcher("ClientesSolicitarCotizacion.jsp").forward(request, response);
                            }
                            //ENVIAR CORREO CLIENTE NO
                        } else {
                            request.setAttribute("errorErrorUsuario", "ERROR [105] - CORREO NO ENVIADO CLIENTE");
                            request.getRequestDispatcher("ClientesSolicitarCotizacion.jsp").forward(request, response);
                        }
                        break;
                        
                }
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
