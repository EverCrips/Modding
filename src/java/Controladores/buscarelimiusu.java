/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.ConsultasUsuario;
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
 * @author Ignacio
 */
public class buscarelimiusu extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String ID = request.getParameter("ID");
            
            ConsultasUsuario co = new ConsultasUsuario();
            ArrayList listaUs = new ArrayList();
            listaUs = co.ObtenerFullDatosUsuarios(ID);
            
            if(!listaUs.get(0).equals("null")){
                HttpSession sesion = request.getSession(true);
                co=new ConsultasUsuario();
                String idUsuario = (String)listaUs.get(0);
                String nombreUsuario = (String)listaUs.get(1);
                String apellidosUsuario= (String)listaUs.get(2);
                String runUsuario= (String)listaUs.get(3);
                String celularUsuario= (String)listaUs.get(4);
                String emailUsuario= (String)listaUs.get(5);
                String passUsuario= (String)listaUs.get(6);
                String categoriaUsuario= (String)listaUs.get(7);
                
                request.setAttribute("idUsuario", idUsuario);
                request.setAttribute("nombreUsuario", nombreUsuario);
                request.setAttribute("apellidosUsuario", apellidosUsuario);
                request.setAttribute("runUsuario", runUsuario);
                request.setAttribute("celularUsuario", celularUsuario);
                request.setAttribute("emailUsuario", emailUsuario);
                request.setAttribute("passUsuario", passUsuario);
                request.setAttribute("categoriaUsuario", categoriaUsuario);
                request.setAttribute("idAntigua", request.getParameter("ID"));
                
                request.getRequestDispatcher("mant_eliminarUsuAdmin.jsp").forward(request, response);
            }else{
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("ERROR", "Error 104 | No se pudieron obtener los datos de la busqueda.");
                request.getRequestDispatcher("errorErrorPrincipal.jsp").forward(request, response);
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
