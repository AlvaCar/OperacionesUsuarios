<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>OperacionesUsuarios</title>
    </head>
    <body>
        <%
            Connection conexion;
            String url = "jdbc:mysql://localhost:3306/registrousuarios";
            String driver = "com.mysql.jdbc.Driver";
            String consulta = "SELECT * FROM usuarios";
            String usuario = "root";
            String password = "";
            Class.forName(driver);
            
            conexion = DriverManager.getConnection(url,usuario,password);
            
            PreparedStatement ps = conexion.prepareStatement(consulta);
            ResultSet rs;
            rs = ps.executeQuery();
        %>
        
        <div class="container">
            <h1>Listado de usuarios</h1>
            <hr>
            <table class="table table-bordered">
                <tr>
                    <td class="text-center">ID</td>
                    <td class="text-center">Nombre</td>
                    <td class="text-center">DNI</td>
                    <td class="text-center">Edad</td>
                    <td class="text-center">Acciones</td>
                </tr>
                <%while(rs.next()){%>
                <tr>
                    <td class="text-center"><%=rs.getInt("id")%></td>
                    <td class="text-center"><%=rs.getString("nombre")%></td>
                    <td class="text-center"><%=rs.getInt("dni")%></td>
                    <td class="text-center"><%=rs.getInt("edad")%></td>
                    <td class="text-center">
                        <a class="btn btn-warning btn-sm">Editar</a>
                        <a class="btn btn-danger btn-sm">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
