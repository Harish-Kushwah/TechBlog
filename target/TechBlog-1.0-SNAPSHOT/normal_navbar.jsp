<%-- 
    Document   : index
    Created on : 18-Feb-2024, 7:05:46 pm
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>




<nav class="navbar fixed-top navbar-expand-lg navbar-dark primary-background navbar-sticky">
  <a href="index.jsp" class="navbar-brand" href="#"><span class="fa fas fa-terminal"></span>&nbsp;TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
<!--      <li class="nav-item active">
        <a class="nav-link" href="#">Code With Harish <span class="sr-only">(current)</span></a>
      </li>-->
     
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Categaories
        </a>
          <div class="dropdown-menu  dropdown1" aria-labelledby="navbarDropdown" >
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
          
          
        </div>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="login_page.jsp">Login</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="register_page.jsp">SignUp</a>
      </li>
      
    </ul>
    <form class="d-flex">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-light" type="submit">Search</button>
    </form>
  </div>
</nav>

