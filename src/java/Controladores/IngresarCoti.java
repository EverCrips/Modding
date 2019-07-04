/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.ConsultrasAdministrador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ignacio
 */
public class IngresarCoti extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            
            ConsultrasAdministrador co = new ConsultrasAdministrador();
            String estadoCoti= request.getParameter("estadoCoti");
            String nombreCoti= request.getParameter("nombreCoti");
            String descripcionCoti= request.getParameter("descripcionCoti");
            String usuarioCoti= request.getParameter("usuarioCoti");
            String montoCoti= request.getParameter("montoCoti");
            
            
            if(co.registrarCoti(estadoCoti, nombreCoti, descripcionCoti, usuarioCoti, montoCoti)){
                HttpSession sesion = request.getSession(true);
                co = new ConsultrasAdministrador();
                sesion.setAttribute("mensaje", true);
                request.getRequestDispatcher("buscarventasAdmin.jsp").forward(request, response);
            }
            else{
            HttpSession sesion = request.getSession(true);
            sesion.setAttribute("ERROR", "Error 107 | No se pudo añadir la ficha.");
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
