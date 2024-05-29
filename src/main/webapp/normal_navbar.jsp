<%-- 
    Document   : index
    Created on : 18-Feb-2024, 7:05:46 pm
    Author     : haris
--%>

<%@page import="com.tech.blog.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!--<nav class="navbar  navbar-expand-lg navbar-dark primary-background navbar-sticky">
    <a href="index.jsp" class="navbar-brand" href="#"><span class="fa fas fa-terminal"></span>&nbsp;TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">Code With Harish <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categaories
        </a>
          <div class="dropdown-menu  dropdown1" aria-labelledby="navbarDropdown" >

<% PostDao dao1 = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Category> categories1 = dao1.getAllCategories();

    for (Category cat : categories1) {
%>
<a href="#" onclick="getPosts(<%= cat.getId()%> , this)" class="dropdown-item c-link"><%= cat.getName()%></a>


<% }%>

</div>
</li>
<li class="nav-item">
<a class="nav-link" href="#"><span class="fa-solid fa-address-book"></span>&nbsp;Contact</a>
</li>
<li class="nav-item">
<a class="nav-link" href="login_page.jsp"><span class="fa fas fa-sign-in"></span>&nbsp;Login</a>
</li>
<li class="nav-item">
<a class="nav-link" href="register_page.jsp"><span class="fa fas fa-user-plus"></span>&nbsp;SignUp</a>
</li>

</ul>
<form class="d-flex">
<input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
<button class="btn btn-outline-light" type="submit">Search</button>
</form>
</div>
</nav>-->



<header id="header" class="d-flex align-items-center">
    <div class="container d-flex align-items-center justify-content-between">

        <h1 class="logo"><a href="index.jsp">TechBlog<span>.</span></a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt=""></a>-->

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                <li><a class="nav-link scrollto" href="index.jsp#about">About</a></li>
                <!--<li><a class="nav-link scrollto" href="#services">Services</a></li>-->
                <li><a class="nav-link scrollto " href="index.jsp#portfolio">Blogs</a></li>

                <li><a class="nav-link scrollto" href="index.jsp#contact">Contact</a></li>
                
                <%
                User nav_bar_user1 = (User) session.getAttribute("currentUser");
                if (nav_bar_user1 == null) {
       
                   %>
                <li><a class="nav-link scrollto" href="login_page.jsp">Login</a></li>
                
                <li><a class="nav-link scrollto" href="register_page.jsp">SignUp</a></li>
                
                <%}else{
                %>
                   <li><a class="nav-link scrollto" href="LogoutServlet">Logout</a></li>

            <%}
            %>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->
