/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package PAG;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author humbe
 */
@WebServlet(urlPatterns = {"/pagina"})
public class pagina {
protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException { 
        int next2 = Integer.parseInt(request.getParameter("next"));
        if (next2<0){
           request.setAttribute("next", next2);
        } int paginacion = paginacion(next2);
{
        request.setAttribute("next", paginacion);
        request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);


}
        
}
    int paginacion(int next) {
    next= next +  10;
    return next;
  }
    
    
    
    
//  protected void doGet(HttpServletRequest request, HttpServletResponse response)
//    throws ServletException, IOException { 
//        int pagina2 = Integer.parseInt(request.getParameter("next"));
//        if (pagina2<0){
//           request.setAttribute("next", pagina2);
//        }
//       String pagina = request.getParameter("next");
//       String IdUsuarioFK = request.getParameter("idUsuarioFK");
//       ArrayList<notasDTO> notas = notasDAO.consultar(IdUsuarioFK, pagina);
//       request.setAttribute("notas", notas );
//       request.getRequestDispatcher("/Dashboard.jsp").forward(request, response);   
   }
