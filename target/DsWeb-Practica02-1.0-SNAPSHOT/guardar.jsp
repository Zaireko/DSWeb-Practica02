<%-- 
    Document   : guardar
    Created on : 26 sept 2024, 20:53:46
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Guardar</title>
    </head>
    <body>
        <h1>Se guardó</h1>
        <%
            String URL = "jdbc:postgresql://localhost:5432/ejemplo";
            String USER = "postgres";
            String PASSWORD = "postgres";
            
            Class.forName("org.postgresql.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
            Statement stm = con.createStatement();
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String telefono = request.getParameter("telefono");
            
            String sql="insert into usuarios (nombre, direccion, telefono) values ('" + nombre + "' , '" + direccion + "' , '" + telefono + "') ";
            stm.execute(sql);
            %>
    </body>
</html>
 