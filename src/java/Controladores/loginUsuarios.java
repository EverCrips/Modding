//Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.
package Controladores;

import Modelos.ConsultasGenerales;
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
public class loginUsuarios extends HttpServlet {

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

            //OBTENGO DATOS DEL JSP
            String correo = request.getParameter("mailUser");
            String contraseña = request.getParameter("passUser");

            ConsultasGenerales con = new ConsultasGenerales();

            //PARA QUE NO ACCEDAN A SERVLET POR URL
            if (correo == null) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                //EXISTE CORREO REGISTRADO SI
                if (con.existeCorreo(correo)) {

                    con = new ConsultasGenerales();
                    //CONTRASEÑA CORRECTA SI

                    if (con.contrastarCorreoPass(correo, contraseña)) {

                        con = new ConsultasGenerales();
                        //CREO UNA LISTA NUEVA PARA OBTENER LOS DATOS CON LA FUNCIÓN
                        ArrayList listaAl = new ArrayList();
                        listaAl = con.ObtenerFullDatosUsuarios(correo, contraseña);

                        //CREO OTRO ARREGLO CON LAS DIRECCIONES DEL USUARIO
                        ArrayList listaDir = new ArrayList();
                        con = new ConsultasGenerales();
                        listaDir = con.ObtenerFullDatosDirecciones(correo, contraseña);

                        //CREO OTRO ARREGLO CON LAS COTIZACIONES DEL USUARIO
                        ArrayList listaCot = new ArrayList();
                        con = new ConsultasGenerales();
                        listaCot = con.ObtenerFullDatosCotizaciones(correo, contraseña);

                        //CATEGORIA USUARIO
                        String categoriaUsuario = (String) listaAl.get(7);
                        //CREAR LA SESION
                        HttpSession sesion = request.getSession();
                        //LISTA CON LOS DATOS PARA CUANDO SE INGRESE CON UNO USUARIO VERIDICO
                        sesion.setAttribute("datosUsuario", listaAl);
                        //LISTA CON LoS DATOS DE LAS DIRECCIONES
                        sesion.setAttribute("datosDirecciones", listaDir);
                        //LISTA CON LoS DATOS DE LAS DIRECCIONES
                        sesion.setAttribute("datosCotizaciones", listaCot);

                        //ROL SESION
                        sesion.setAttribute("categoriaUsuario", categoriaUsuario);
                        //SOLO EL ROL PARA CUANDO SE TRABAJE CON ERRORES O SIN INICIAR SESIÓN
                        request.setAttribute("categoriaUsuario", categoriaUsuario);
                        

                        switch (categoriaUsuario) {
                            case "ADMINISTRADOR":
                                request.getRequestDispatcher("Administradores.jsp").forward(request, response);
                                break;
                            case "CLIENTE":
                                request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                                break;
                        }

                        //CONTRASEÑA CORRECTA NO    
                    } else {
                        request.setAttribute("errorErrorLogin", "CONTRASEÑA ERRONEA");
                        request.getRequestDispatcher("miCuenta.jsp").forward(request, response);
                    }
                    //EXISTE CORREO REGISTRADO NO   
                } else {
                    request.setAttribute("errorErrorLogin", "CORREO NO REGISTRADO");
                    request.getRequestDispatcher("miCuenta.jsp").forward(request, response);
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
