/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Service;

import DAO.UserDAO;
import Entities.User;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author admin
 */
@MultipartConfig
public class EditServlets extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlets</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlets at " + request.getContextPath() + "</h1>");
            
            //fetch data 
            String name= request.getParameter("name");
          
            String email= request.getParameter("email");
           
            String password= request.getParameter("password");
            String about= request.getParameter("about");
         
            Part part= request.getPart("image");
            
            String imagename=part.getSubmittedFileName();
            
            
            
            
            
            
            //get user from sesseion
            HttpSession s= request.getSession();
            User user= (User)s.getAttribute("currentUser");
            user.setEmail(email);
             user.setName(name);
              user.setPassword(password);
               user.setAbout(about);
               String oldfile= user.getProfile();
               user.setProfile(imagename);
               
               // update to db
               UserDAO dao= new UserDAO(Connect.getConnection());
               boolean ans= UserDAO.updateUser(user);
               if(ans){
                   out.println("Updated to db");
                   
                   String path= request.getRealPath("/")+"pics"+File.separator+user.getProfile();
                   
                   //delete code
                   String patholdfile= request.getRealPath("/")+"pics"+File.separator+ oldfile;
                   if(!oldfile.equals("default.png"))
                   Helper.deleteFile(patholdfile);
                       if(Helper.saveFile(part.getInputStream(), path))
                       {
                           out.println("Profile  photo updated");
                       }
                       else
                       {
                           out.println("Profile photo not updated");
                       }
              
                   
               }else
               {
                   out.println("Not updated");
               }
                
            
            
            out.println("</body>");
            out.println("</html>");
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
