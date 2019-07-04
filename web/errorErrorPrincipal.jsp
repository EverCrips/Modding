<!--Diseñado by: Ignacio Viacava - Cristopher Perez - KING MAFIRE DEADLINE GOD LABARCA.-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String error = (String) request.getAttribute("errorErrorPrincipal");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
    </head>
    <body>
        <h1>Error Página Modding No Soportada</h1>
        
        <H3><%=error%></H3>
        <a href="index.jsp">Inicio</a>
    </body>
</html>
<% 
   request.removeAttribute("errorErrorPrincipal");
%>
