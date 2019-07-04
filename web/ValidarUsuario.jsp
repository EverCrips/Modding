<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Modelos.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%

Conexion con = new Conexion();
Connection acces = con.getConexion();
String nombre = request.getParameter("nombre");
String sql = "select * from clientes where emailCliente LIKE '%"+ nombre +"%'";
PreparedStatement pstm = acces.prepareStatement(sql);
ResultSet rs = null;
rs = pstm.executeQuery(sql);
if(rs.next()){
    out.println("<div id='Error'>El correo ya está registrado. Intente con otro.</div>");
    
}else{
    out.println("<div id='Success'>El correo está disponible.</div>");
}
%>