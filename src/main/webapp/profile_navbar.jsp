<%-- 
    Document   : profile_navbar
    Created on : 22-Feb-2024, 10:50:08 pm
    Author     : haris
--%>

<%@page import="com.tech.blog.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%
    User nav_bar_user = (User) session.getAttribute("currentUser");
    if (nav_bar_user == null) {
        response.sendRedirect("login_page.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <!--navbar - start-->
    <nav class="navbar  navbar-expand-lg navbar-dark primary-background">
        <a class="navbar-brand" href="index.jsp"><span class="fa fas fa-terminal"></span>&nbsp;TechBlog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">


                <li class="nav-item dropdown ">

                    <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Categaories
                    </a>
                    <div class="dropdown-menu dropdown1" aria-labelledby="navbarDropdown">

                        <% PostDao dao1 = new PostDao(ConnectionProvider.getConnection());
                           ArrayList<Category> categories1 = dao1.getAllCategories();

                           for(Category cat : categories1){
                        %>
                        <a href="#" onclick="getPosts(<%= cat.getId() %> , this)" class="dropdown-item c-link"><%= cat.getName() %></a>


                        <% } %>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure</a>


                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa-solid fa-address-book"></span>&nbsp;Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="profile_page.jsp"><span class="fa-solid fa-address-book"></span>&nbsp;Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target = "#post-modal" href="#"><span class="fa-solid fa-star"></span>&nbsp;Do Post</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"  href="profile.jsp?user_id=<%= nav_bar_user.getId() %>"><span class="fa fa-sticky-note-o"></span>&nbsp;My Post</a>
                </li>



            </ul>
            <ul class="navbar-nav mr-right">
                <li class="nav-item">

                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal" style="cursor:pointer;"> <span class="fa fa-user-circle"></span> <%= nav_bar_user.getName() %></a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> logout</a>
                </li>
            </ul>
        </div>
   
                        
     