package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Message;
import com.tech.blog.entity.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author haris
 */
@MultipartConfig
public class LoginServlet extends HttpServlet {

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

            String email = request.getParameter("user_email");
            String password = request.getParameter("user_pass").trim();

            try {
                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                User user = dao.userByEmailAndPassword(email, password);

                if (user != null) {
                    out.println("done");
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("currentUser", user);
                    response.sendRedirect("profile_page.jsp");
                    
                } else {
                    out.println("Login Failed");
                    Message msg = new Message("Invalid Details ! try with another" , "error" , "alert-danger");
                    
                    HttpSession session  = request.getSession();
                    session.setAttribute("msg", msg);
                    response.sendRedirect("login_page.jsp");
                
                }

            } catch (ClassNotFoundException ex) {
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
