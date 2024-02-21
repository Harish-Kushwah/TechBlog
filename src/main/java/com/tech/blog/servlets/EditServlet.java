/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entity.Message;
import com.tech.blog.entity.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.FileHelper;
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
 * @author haris
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            String email = request.getParameter("user_email");
            String name = request.getParameter("user_name");

            String password = request.getParameter("user_pass");
            String about = request.getParameter("user_about");
            Part part = request.getPart("image");
            String imageName = user.getProfile();
            String oldProfileName = user.getProfile();
            boolean isProfilePicEdit = false;
            if (part != null) {
                imageName = part.getSubmittedFileName();
                isProfilePicEdit = true;
                if (imageName.length() == 0) {
                    imageName = user.getProfile();
                    isProfilePicEdit = false;
                    out.println("image name is not send from the form");
                }
            }
            //get user from the session
            user.setEmail(email);
            user.setAbout(about);
            user.setPassword(password);
            user.setPassword(password);
            user.setName(name);
            user.setProfile(imageName);

            try {
                //update database

                UserDao dao = new UserDao(ConnectionProvider.getConnection());
                Message msg = null;
                if (dao.updateUser(user)) {
                    msg = new Message("Profile  Updated Sucessfull", "success", "alert-success");
                     
                    if(isProfilePicEdit){
                        String path = s.getServletContext().getRealPath("/") + "pic" + File.separator + user.getProfile();
                        String oldFilePath = s.getServletContext().getRealPath("/") + "pic" + File.separator + oldProfileName;
                        if (!oldProfileName.equals("default.jpg")) {
                        FileHelper.deleteFile(oldFilePath);
                   

                    if (FileHelper.saveFile(part.getInputStream(), path)) {
                        msg = new Message("Profile  Updated Sucessfull", "success", "alert-success");
                    } else {
                        msg = new Message("Profile Pic Not Updated ", "error", "alert-danger");
                    }
                    }
                  }
                    
                } else {
                    msg = new Message("Profile Not Updated ", "error", "alert-danger");
                }

                s.setAttribute("msg", msg);
                response.sendRedirect("profile_page.jsp");

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
