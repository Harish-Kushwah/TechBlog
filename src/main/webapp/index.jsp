<%-- 
    Document   : index
    Created on : 18-Feb-2024, 7:05:46 pm
    Author     : haris
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>TechBlog</title>
        <link rel="icon" type="image/x-icon" href="img/ink96.png">
    <!--<img src="img/ink16.png" alt=""/>-->

        <!-- Compiled and minified CSS -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 100% 0, 100% 30%, 100% 88%, 73% 95%, 44% 90%, 0 95%, 0 0);

            }
            .card-content{
                min-height: 100px;
                max-height: 100px;
                
            }


        </style>


    </head>
    <body>

        <%
            Connection con = ConnectionProvider.getConnection();
        %>

        <%@include file="normal_navbar.jsp" %>

        <section id="home-section">
            <div class="container-fluid   pt-3">
                <div class="jumbotron primary-background text-white banner-background1 banner  ">
                    <div class="container center-align mb-4">
                        <h3 class="display-4">Welcome to TechBlog</h3>

                        <p id="">Where tech meets innovation! <br>Explore the latest trends, engage with our vibrant community, and unlock the potential of tomorrow's technology today.<br> Join us on this exciting journey!</p>

                        <a href="#blogs" class="btn btn-outline-light btn-lg"><span class="fa fa-external-link "></span>&nbsp; Trending Blog's</a>
                        <a href="login_page.jsp"class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle  "></span>&nbsp;Login</a>
                    </div>
                </div>
            </div>
            <!--<div class="wave1 "></div>-->  
        </section>

        <!--cards-->
        
        <div class="container mt-2 " id="blogs">
            <div style="text-align: center;  margin:10px;" >
              <h4>Trending Blogs</h4>
              </div>
            <div class="row mb-3 ">
                <% 
                   PostDao dao = new PostDao(ConnectionProvider.getConnection());
                   ArrayList<Post> posts = dao.getAllPost();
                   
                   for(Post post : posts){
                       String content = post.getContent();
                        int total_words = 0;
                        int i;
                        for(i=0; i<content.length(); i++){
                            if(content.charAt(i)==' '){
                                total_words++;
                         }
                     if(total_words==20){
                     break;
                   }
                 }
                 content = content.substring(0, i);
                 content+="...";
                %>
                <div class="col-md-4">
                    <div class="card mb-1" >
                        <div class="card-body">
                            <h5 class="card-title"><%= post.getTitle() %></h5>
                            <p class="card-text card-content"><%= content %></p>
                            <a href="show_blog_page.jsp?post_id=<%= post.getId() %>" class="btn btn-primary primary-background text-white">Read More</a>
                        </div>
                    </div>
                </div>
                <% } %>
                              
                </div>
        </div>

                    <!--Javascript Library-->
                    <!-- Compiled and minified JavaScript -->

                    <!--JQuery-->
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                    <!--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
                            <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
                            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>-->

                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                    <script src="js/main.js" type="text/javascript" ></script>
                    <script src='https://kit.fontawesome.com/5db7c9bc47.js' crossorigin='anonymous'></script>


                    <script>
                        $(document).ready(() => {
                            console.log("Website is ready.");
                        });

                    </script>

                     <%@include file="footer.jsp" %>
                    </body>
                    </html>
