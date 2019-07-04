/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import Modelos.ConsultasUsuario;
import Modelos.ConsultrasAdministrador;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
public class buscarVentas extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. *//* TODO output your page here. You may use following sample code. */
            String ID = request.getParameter("ID");
            
            ConsultrasAdministrador co = new ConsultrasAdministrador();
            ArrayList listaUs = new ArrayList();
            listaUs = co.cotizaciones(ID);
            if(!listaUs.get(0).equals("null")){
                String numeroCotizacion= (String)listaUs.get(0);
                String estadoCoti= (String)listaUs.get(1);
                String nombreCoti= (String)listaUs.get(2);
                String descripCoti= (String)listaUs.get(3);
                String idUserCoti= (String)listaUs.get(4);
                String montoCoti= (String)listaUs.get(5);
                request.setAttribute("numeroCotizacion",numeroCotizacion);
                request.setAttribute("estadoCotizacion", estadoCoti);
                request.setAttribute("nombreCotizacion", nombreCoti);
                request.setAttribute("descripcionCotizacion", descripCoti);
                request.setAttribute("idUsuarioCotizacion", idUserCoti);
                request.setAttribute("montoCoti", montoCoti);
                ConsultrasAdministrador con = new ConsultrasAdministrador();
                request.setAttribute("INDEX", con.contar(ID));
                ConsultrasAdministrador com = new ConsultrasAdministrador();
                request.setAttribute("idBusqueda", ID);
                request.setAttribute("Detalles", co.detallecotizaciones(ID));
                request.setAttribute("Dates", com.cotizaciones(ID));
                request.getRequestDispatcher("mant_ventas.jsp").forward(request, response);
                
            }else{
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("ERROR", "Error 104 | No se pudieron obtener los datos.");
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
