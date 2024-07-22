<%-- 
    Document   : EditarPublicaciones
    Created on : Nov 26, 2022, 9:52:25 PM
    Author     : humbe
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Publicacion</title>
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
            ResultSet rs = null;
        %>

        <nav class="navbar navbar-dark navbar-expand-md bg-dark py-3 sticky-top">
            <div class="container">
                <a class="navbar-brand d-flex align-items-center" href="Dashboard.jsp"><span class="bs-icon-sm bs-icon-rounded bs-icon-primary d-flex justify-content-center align-items-center me-2 bs-icon">
                        <img src="logoforo.png" width="50" height="50" alt="">
                    </span><span>Genesis</span></a><button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navcol-5"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
                <div id="navcol-5" class="collapse navbar-collapse">
                    <input type="search" style="width: 805px;" />                  
                </div>
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="CrearPubli.jsp">Publicar</a></li>
                    <li class="nav-item"><a href="DatosUsuario.jsp" class="nav-link"><%= sesion.getAttribute("nombreUsuario")%></a></li>                                          
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Opciones
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">

                            <a class="dropdown-item" href="EditarPublicaciones.jsp">Editar Publicaciones</a>
                            <a class="dropdown-item" href="EliminarPublicacion.jsp">Eliminar Publicaciones</a>
                            <a class="dropdown-item" href="BusquedaAvanzada.jsp">Busqueda Avanzada</a
                            <form action="logout.jsp">

                                <button class="dropdown-item" type="submit"> Cerrar Sesion</button>
                            </form>

                        </div>
                    </li>           
                </ul>
            </div>
        </nav>
        <div class="nuevaPubli"><h1>Editar Publicaciones</h1> </div>




        <%
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProgramacionWeb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Widow1234");
                st = con.createStatement();
                rs = st.executeQuery("SELECT * FROM Publicacion where Publicacion.userPost = '" + sesion.getAttribute("idUsuario") + "' AND Publicacion.spoiler = '1';");
                while (rs.next()) {


        %> 
        <div class="nuevaPubli"> 
            <form action="EditarPublicaciones.jsp" method="post">
                <div class="container" style="margin-bottom: 80px;">

                    <div class="row">
                        <div class="col-75">
                            <label><b>Titulo</b></label>
                            <input name="tituloPubli" value="<%=rs.getString(4)%>"></input>


                        </div>
                    </div>
                    <div class="row">
                        <div class="col-75">
                            <textarea name="cuerpoPubli"><%=rs.getString(5)%></textarea>
                            <textarea style="visibility: hidden"name="identificador"><%=rs.getString(1)%></textarea>

                            <button type="submit" name="guardar" class="btn btn-primary">Guardar</button>
                            <!--textarea id="subject" name="subject" placeholder="Texto" style="height:200px"></textarea-->
                        </div>
                    </div>
                </div>  
            </form>
        </div>
        <!//<!-- Aqui edito la publicacion -->
        <%
            if (request.getParameter("guardar") != null) {
                String titulo = request.getParameter("tituloPubli");
                String cuerpo = request.getParameter("cuerpoPubli");
                String id = request.getParameter("identificador");
                // String correo = request.getParameter("correo");
                java.sql.Timestamp fecha = new java.sql.Timestamp(new java.util.Date().getTime());

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProgramacionWeb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "Widow1234");
                    st = con.createStatement();
                    st.executeUpdate("update Publicacion set tituloPubli='" + titulo + "',cuerpoPubli='" + cuerpo + "', fechaCrea='" + fecha + "' where idPublicacion='" + id + "';");
                    
         

                } catch (Exception e) {
                    out.print(e);
                }

            }
        %>
        <%
                }
            } catch (Exception e) {
                out.print("error mysql" + e);
            }


        %>




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
    </body>
</html>