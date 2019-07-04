//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Controladores;

import Modelos.ConsultasGenerales;
import Modelos.CorreoElectronico;
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
public class cambiarPassCliente extends HttpServlet {

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

            String emailUser = request.getParameter("emailUser");

            ConsultasGenerales con = new ConsultasGenerales();

            //PARA QUE NO ACCEDAN A SERVLET POR URL
            if (emailUser == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                //EXISTE CORREO SI
                if (con.existeCorreo(emailUser)) {
                    String plantilla = "Se ha recibido una petición para resetear la contraseña actual de la cuenta: " + emailUser + ".\nDentro de una hora, un administrador se comunicará con usted mediante el mismo correo para poder resetear su contraseña."
                            + "\n---------------------------------------------------------------------------------------\n"
                            + "---------------------------------------------------------------------------------------\n"
                            + "Si usted no ha solicitado un cambio de contraseña, ignorar dicho correo.\nAtte. Administración Modding Mafires";
                    CorreoElectronico cor = new CorreoElectronico();
                    //ENVIAR CORREO CLIENTE SI
                    if (cor.enviarCorreoCliente(plantilla, emailUser)) {
                        cor = new CorreoElectronico();
                        String plantilla2 = "Se ha recibido una petición para resetear la contraseña actual de la cuenta: " + emailUser + ".\nComunicarse a la brevedad con dicho cliente."
                                + "\n---------------------------------------------------------------------------------------\n"
                                + "---------------------------------------------------------------------------------------\n"
                                + "Archivar mensaje en casilla pertinente.\nAtte. Administración Modding Mafires";
                        //ENVIAR CORREO ADMINISTRACION SI
                        if (cor.enviarCorreoAdministracion(plantilla2)) {
                            request.setAttribute("exitoExitoPrincipal", "EXITO");
                            request.getRequestDispatcher("recuperarContraseña.jsp").forward(request, response);
                            //ENVIAR CORREO ADMINISTRACION NO     
                        } else {
                            request.setAttribute("errorErrorPrincipal", "ERROR [106] - CORREO NO ENVIADO ADMINISTRADOR");
                            request.getRequestDispatcher("errorErrorPrincipal.jsp").forward(request, response);
                        }
                        //ENVIAR CORREO CLIENTE NO
                    } else {
                        request.setAttribute("errorErrorPrincipal", "ERROR [105] - CORREO NO ENVIADO CLIENTE");
                        request.getRequestDispatcher("errorErrorPrincipal.jsp").forward(request, response);
                    }
                    //EXISTE CORREO NO
                } else {
                    request.setAttribute("errorErrorPrincipal", "ERROR [104] - CORREO INEXSISTENTE");
                    request.getRequestDispatcher("recuperarContraseña.jsp").forward(request, response);
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
