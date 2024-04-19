<%@page import="com.tech.blog.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User nav_bar_user = (User) session.getAttribute("currentUser");
    if (nav_bar_user == null) {
        response.sendRedirect("login_page.jsp");
        return;
    }
%>
<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

        <h1 class="logo"><a href="index.jsp">TechBlog<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

        <nav id="navbar" class="navbar">
            <ul >
                <li><a class="nav-link scrollto active" href="profile_page.jsp">Home</a></li>
                <li><a class="nav-link scrollto" href="index.jsp#about">About</a></li>
                <!--<li><a class="nav-link scrollto" href="#services">Services</a></li>-->
                
                 <li class="nav-item">
                    <a class="nav-link" data-toggle="modal" data-target = "#post-modal" href="#">New Post</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link"  href="profile.jsp?user_id=<%= nav_bar_user.getId() %>">My Post</a>
                </li>
           
                <li class="nav-item">

                    <a class="nav-link" data-toggle="modal" data-target="#exampleModal" style="cursor:pointer;">  <%= nav_bar_user.getName() %></a>
                </li>
                 <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"> logout</a>
                </li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
