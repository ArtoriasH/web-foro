<%-- 
    Document   : index
    Created on : Nov 22, 2022, 7:45:07 PM
    Author     : humbe
--%>



<%@page import="javax.script.ScriptEngineManager"%>
<%@page import="javax.script.ScriptEngine"%>
<%@page import="java.sql.*"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="JDBC.conexion"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio de Sesion</title>
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
        <div class="login">
            <div class="login__content">
                <img src="profile.png">
                <form method="post" action="index.jsp">
                    <div class="login__content-campo"><input name="user" id="user" type="text" class="form-control" placeholder="Usuario"></div>
                    <div class="login__content-campo"><input name="password" type="password" placeholder="Password"></div>                        
                    <div class="login__content-campo"><input name="login" id="btnCampo" type="submit" value="Iniciar Sesion"></div>
                </form>
                <a href="Crear.jsp">Registrarse</a>

            </div>
        </div>
       <footer class="bg-dark text-white pt-5 pb-4">
            <div class="container text-center text-md-left">
                <div class="row text-center text-md-left">
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning"> Company Name</h5>
                        <p>
                            It is a long established fact that a reader will be distracted by
                            the readable content of a page when looking at its layout. 
                        </p>

                    </div>

                    <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Products</h5>                        
                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">TheProviders</a> 
                        </p>

                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">Creativity</a> 
                        </p>

                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">SourceFiles</a> 
                        </p>

                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">bootstrap 5</a> 
                        </p>

                    </div>

                    <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Useful links</h5>
                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">Your account</a> 
                        </p>

                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">Become an affiliates</a> 
                        </p>

                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">Shipping rates</a> 
                        </p>

                        <p>
                            <a href="#" class="text-white" style="text-decoration: none;">Help </a> 
                        </p>

                    </div>
                    
                    <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h5 class="text-uppercase mb-4 font-weight-bold text-warning">Contact</h5>
                        <p>
                            <i class="fas fa-home mr-3"></i>New York, NY 2333, US
                        </p>
                        
                        <p>
                            <i class="fas fa-envelope mr-3"></i>theproviders98@gmail.com
                        </p>
                        
                        <p>
                            <i class="fas fa-home mr-3"></i>+92 3162859445
                        </p>
                        
                        <p>
                            <i class="fas fa-home mr-3"></i>+01 335 633 77
                        </p>
                    </div>

                </div>

            </div>
        </footer>
        <script src="JS/script.js"></script>
        <%

            Connection con = null;
            Statement st = null;
            ResultSet rs = null;

            if (request.getParameter("login") != null) {
                String user = request.getParameter("user");
                String password = request.getParameter("password");
                HttpSession sesion = request.getSession();
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProgramacionWeb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Widow1234");
                    st = con.createStatement();
                    rs = st.executeQuery("SELECT * FROM Usuario where nombreUsuario = '"+user+"' and pass = '"+password+"'; ");
                
                while(rs.next()){
                sesion.setAttribute("logueado", "1");
                sesion.setAttribute("nombreUsuario", rs.getString("nombreUsuario")); 
                sesion.setAttribute("idUsuario", rs.getString("idUsuario"));
                sesion.setAttribute("nombre", rs.getString("nombre"));
                sesion.setAttribute("apellido", rs.getString("apellido"));
                sesion.setAttribute("correo", rs.getString("correo"));
                sesion.setAttribute("pass", rs.getString("pass"));
                response.sendRedirect("Dashboard.jsp");
            }
            out.print("Usuario no valido");
           
           
                
                } catch (Exception e) {
                }
            } 

            /* LOGIN ESTATICO
            if(request.getParameter("login")!= null){
            String user = request.getParameter("user");
            String password = request.getParameter("password");
            HttpSession sesion = request.getSession();
            if(user.equals("admin") && password.equals("admin")){
                sesion.setAttribute("logueado", "1");
                sesion.setAttribute("user", user);
                response.sendRedirect("CrearPubli.jsp");
            }
            else{
            
            //JOptionPane.showMessageDialog(null, "Te has equivocado de usuario o contraseña");
             
            }
            }*/

        %>
    </body>
</html>
