//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Controladores;

import Modelos.ConsultasGenerales;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author MSINote
 */
public class registroClienteNuevo extends HttpServlet {

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

            //OBTENER LOS DATOS DEL JSP
            String nombreCliente = request.getParameter("nombreUser");
            String apellidoCliente = request.getParameter("apellidoUser");
            String runCliente = request.getParameter("runUser");
            String celularCliente = request.getParameter("celularUser");
            String correoCliente = request.getParameter("correoUser");

            String direccionCliente = request.getParameter("direccionUser");
            String ciudadCliente = request.getParameter("ciudadUser");
            String regionCliente = request.getParameter("regionUser");
            String comunaCliente = request.getParameter("comunaUser");

            String passCliente = request.getParameter("passUser2");

            //PARA QUE NO ACCEDAN A SERVLET POR URL
            if (nombreCliente == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                ConsultasGenerales con = new ConsultasGenerales();
                //CORREO EXISTENTE SI
                if (con.existeCorreo(correoCliente)) {
                    request.setAttribute("errorErrorPrincipal", "ERROR [101] - CORREO EXISTENTE");
                    request.getRequestDispatcher("errorErrorPrincipal.jsp").forward(request, response);
                    //CORREO EXISTENTE NO    
                } else {
                    con = new ConsultasGenerales();
                    //CLIENTE REGISTRO SI
                    if (con.registrarCliente(nombreCliente, apellidoCliente, runCliente, celularCliente, correoCliente, passCliente)) {
                        con = new ConsultasGenerales();
                        String codigoCliente = con.obtenerCodigoCliente();
                        con = new ConsultasGenerales();
                        //DIRECCION CLIENTE REGISTRO SI
                        if (con.registrarDireccion(direccionCliente, ciudadCliente, regionCliente, comunaCliente, Integer.parseInt(codigoCliente))) {
                            //TODO 100% REGISTRO
                            request.setAttribute("exitoExitoPrincipal", "Se ha creado exitosamente su cuenta de cliente en nuestro sistema");
                            request.getRequestDispatcher("miCuenta.jsp").forward(request, response);
                            //DIRECCION CLIENTE REGISTRO NO
                        } else {
                            request.setAttribute("errorErrorPrincipal", "ERROR [103] - REGISTRO DE DIRECCIÓN CLIENTE NO COMPLETADO");
                            request.getRequestDispatcher("errorErrorPrincipal.jsp").forward(request, response);
                        }
                        //CLIENTE REGISTRO NO  
                    } else {
                        request.setAttribute("errorErrorPrincipal", "ERROR [102] - REGISTRO DE CLIENTE NO COMPLETADO");
                        request.getRequestDispatcher("errorErrorPrincipal.jsp").forward(request, response);
                    }
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
