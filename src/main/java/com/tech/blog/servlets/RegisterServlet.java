package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Hashtable;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author haris
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {

     public static String getTrimString(String str){
        if(str!=null){
            str = str.trim();
        }
        return str;
    }
     
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
//            fetch all form data

            String check = request.getParameter("check");
            if (check == null) {
                out.println("Please check terms and conditions");
            } else {
              
                String name = getTrimString(request.getParameter("user_name"));
                String email = getTrimString(request.getParameter("user_email"));
                String password = getTrimString(request.getParameter("user_pass"));
                String about = getTrimString(request.getParameter("about"));
                String gender = getTrimString(request.getParameter("gender"));
                
                //create a user dao object
                User user = new User(name, email, password, gender, about);
                user.setProfile("default.jpg");
                UserDao dao;
                try {

                    dao = new UserDao(ConnectionProvider.getConnection());

                    if (dao.saveUser(user)) {
                        out.println("done");
                    } else {
                        out.println("error");
                    }

                } catch (ClassNotFoundException ex) {
                    out.println("error");
                }

            }

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
