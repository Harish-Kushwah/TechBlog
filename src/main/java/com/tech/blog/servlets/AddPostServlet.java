/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.dao.StatsDao;
import com.tech.blog.entity.Message;
import com.tech.blog.entity.Post;
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
public class AddPostServlet extends HttpServlet {

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

            //get the session details
            HttpSession s = request.getSession();
            User user = (User) s.getAttribute("currentUser");

            String title = request.getParameter("title");
            String content = request.getParameter("content");
            String code = request.getParameter("code");
            int category_id = Integer.parseInt(request.getParameter("selected_cat"));

            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();
            boolean isProfilePicEdit = false;
            if (part != null) {
                imageName = part.getSubmittedFileName();
                isProfilePicEdit = true;
                if (imageName.length() == 0) {
                    imageName = null;
                    isProfilePicEdit = false;

                }
            }

            Post post = new Post();
            post.setCode(code);
            post.setTitle(title);
            post.setContent(content);
            post.setCategories_id(category_id);
            post.setPic(imageName);
            post.setUser_id(user.getId());

//            out.println(post);
            try {
                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                StatsDao statDao = new StatsDao(ConnectionProvider.getConnection());

                boolean status = false;
                if (dao.addPost(post)) {
                    status = true;
                    if (isProfilePicEdit) {
                        String path = s.getServletContext().getRealPath("/") + "blogPic" + File.separator + imageName;

                        if (FileHelper.saveFile(part.getInputStream(), path)) {
                            status = true;
                        } else {
                            status = false;
                            out.println("File not Saved");
                        }
                    }

                }

                if (status == true &&  statDao.updateTotalPostCount(user.getId())) {
                    out.println("done");
                   
                } else {
                    out.println("Post Not saved ");
                }
            } catch (Exception exp) {
                exp.printStackTrace();
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
