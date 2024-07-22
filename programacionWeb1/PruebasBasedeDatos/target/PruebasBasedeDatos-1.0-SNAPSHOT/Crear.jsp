<%-- 
    Document   : Crear
    Created on : Nov 22, 2022, 8:23:08 PM
    Author     : humbe
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="JDBC.conexion"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <title>Registro Usuario</title>
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
        <div class="register">    
            <div class="register-content">
                <h1 class="text-center">Registrarse</h1>

                <form action="Crear.jsp" name="formulario" id="formulario" class="formulario" method="post">
                    <div class="form-group">
                        <label class="form-label">Nombre:</label>
                        <input class="form-control" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" type="text" id="nombre" name="nombre" placeholder="Nombre" required="required">
                    </div>
                    <div class="form-group">
                        <label class="form-label">Apellidos:</label>
                        <input class="form-control" pattern="[a-zA-ZñÑáéíóúÁÉÍÓÚ\s]+" type="text" id="apellidos" name="apellido" placeholder="Apellidos" required="required">  
                    </div>
                    <div class="form-group">
                        <label class="form-label">Correo:</label>
                        <input class="form-control" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+.[a-z]{2,}$" name="correo" type="email" id="email" placeholder="Correo" required="required">  
                    </div>
                    <div class="form-group">
                        <label class="form-label">Usuario:</label>
                        <input class="form-control" type="text" name="usuario" id="usuario" placeholder="Usuario" required="required">  
                    </div>
                    <div class="form-group">
                        <label class="form-label">Contraseña:</label>
                        <input class="form-control" pattern="^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$" type="password" name="password" id="password" placeholder="Contraseña" required="required" >  
                    </div>
                    <div class="form-group">
                        <label class="form-label">Confirmar contraseña:</label>
                        <input class="form-control" pattern="^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$" type="password" id="passwordConfirm" required="required" >  
                    </div>
                    <div class="form-group">
                        <label class="form-label">Fecha de nacimiento:</label>
                        <input type="date" name="birthDate" id="DOB" required="required">
                    </div>
                    <div class="form-group">
                        <label class="form-label" >Imagen de Perfil:</label>
                        <input type="file" id="archivo" name="archivo" >
                        <img src="" id="preview" height="200">
                    </div>

                    <h3 style="color:32A80F" id="resultado" ></h3> 
                    <input class="btn btn-success w-100" name="enviar"  type="submit" value="Registrarse">                    
                </form>
                <h6 style="margin-top: 150px" >Ya tienes cuenta?
                    <a href="index.jsp">
                        Iniciar sesion
                    </a>
                </h6>
                
            </div>
        </div>
        <footer>
            <div class="footbar">
                <p>Este es el footer</p>
            </div>
        </footer>

        <!--        <div class="container mt-5">
                    <div class="row">
                        <div class="col-sm">
        
                            <form action="Crear.jsp" method="post">
                                <div class="form-group">
                                    <label for="nombre">Nombre</label>
                                    <input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="contraseña">Contraseña</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Contraseña" required="required">
                                </div>
                                <div class="form-group">
                                    <label for="telefono">Correo</label>
                                    <input type="text" class="form-control" id="correo" name="correo" placeholder="Correo" required="required">
                                </div>
                                <button type="submit" name="enviar" class="btn btn-primary">Guardar <i class="fa fa-floppy-o" aria-hidden="true"></i></button>
                            </form>
        
                        </div>
                    </div>
                </div>-->
        <%
            if (request.getParameter("enviar") != null) {
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correo = request.getParameter("correo");
                String usuario = request.getParameter("usuario");
                String password = request.getParameter("password");
                String birthDate = request.getParameter("birthDate");
                java.sql.Timestamp fecha = new java.sql.Timestamp(new java.util.Date().getTime());
                String imagen = request.getParameter("archivo");

                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProgramacionWeb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Widow1234");
                    st = con.createStatement();
                    st.executeUpdate("insert into usuario (nombre, apellido, correo, nombreUsuario, pass, fechaNac,fechaCrea, imgPerfl) values('" + nombre + "','" + apellido + "','" + correo + "','" + usuario + "','" + password + "','" + birthDate + "', '" + fecha + "', '" + imagen + "');");

                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
        <script src="script.js"></script>
    </body>
</html>
