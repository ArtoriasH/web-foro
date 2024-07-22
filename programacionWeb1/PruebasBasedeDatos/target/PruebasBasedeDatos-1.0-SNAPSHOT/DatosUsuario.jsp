<%-- 
    Document   : DatosUsuario
    Created on : Nov 23, 2022, 2:19:56 AM
    Author     : humbe
--%>


<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
        <!--Bootstrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        <!-- JavaScript Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" media="all" href="style.css">
    </head>
    <body>

        <%
            HttpSession sesion = request.getSession();
            if (sesion.getAttribute("logueado") == null || sesion.getAttribute("logueado").equals("0")) {
                response.sendRedirect("index.jsp");
            }
            Connection con = null;
            Statement st = null;


        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">

                    <form action="DatosUsuario.jsp" method="post"> 
                        <div class="form-group">
                            <label >Nombre</label>
                            <input type="text" class="form-control" name="nombre" placeholder="Nombre" value="<%=sesion.getAttribute("nombre")%>">
                        </div>
                         <div class="form-group">
                            <label >Apellido</label>
                            <input type="text" class="form-control" name="apellido" placeholder="Apellido"value="<%=sesion.getAttribute("apellido")%>">
                        </div>
                        <div class="form-group">
                            <label >Correo</label>
                            <input type="text" class="form-control" name="correo" placeholder="Correo"value="<%=sesion.getAttribute("correo")%>">
                        </div>
                        <div class="form-group">
                            <label >Nombre de usuario</label>
                            <input type="text" class="form-control" name="usuario" placeholder="Nombre de usuario" value="<%=sesion.getAttribute("nombreUsuario")%>">
                        </div>
                         <div class="form-group">
                            <label >password</label>
                            <input type="text" class="form-control" name="pass" placeholder="Password" value="<%=sesion.getAttribute("pass")%>">
                        </div>
                       
                        
                        <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                        <a href="Dashboard.jsp" class="btn btn-danger">Salir</a>
                    </form>
                </div>
            </div>
        </div>
    </body>

    <%
        if (request.getParameter("guardar") != null) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String correo = request.getParameter("correo");
            String usuario = request.getParameter("usuario");
            String pass = request.getParameter("pass");
            
           // String correo = request.getParameter("correo");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProgramacionWeb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Widow1234");
                    st = con.createStatement();
                    st.executeUpdate("update Usuario set nombre='" + nombre + "', apellido='" + apellido + "', correo='" + correo + "', nombreUsuario='" + usuario + "', pass='" + pass + "' where idUsuario='" + sesion.getAttribute("idUsuario") + "';");
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("apellido", apellido);
                    sesion.setAttribute("correo", correo);
                    sesion.setAttribute("nombreUsuario", usuario);
                    sesion.setAttribute("pass", pass);
                    
                    response.sendRedirect("Dashboard.jsp");

            } catch (Exception e) {
                out.print(e);
            }

        }
    %>


</html>
