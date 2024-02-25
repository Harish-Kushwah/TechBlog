<%-- 
    Document   : show_blog_page
    Created on : 22-Feb-2024, 9:57:16 pm
    Author     : haris
--%>

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.entity.User"%>
<%@page import="com.tech.blog.dao.UserDao"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
           <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
   
       


        <style>
           
            img{
               max-height: 400px;
               max-width: 400px;
               /*border:1px solid red;*/
               
            }
            .img-box{
                display: flex;
                align-items: center;
                justify-content: center;

            }
            .mycard-body-head{
                display:flex;
                align-items: center;
                justify-content:space-between;
               border: 1px  solid blue;
               border-width: 0px 0px 1px 0px;
            }
            .mycard-footer{
                  display:flex;
                align-items: center;
                justify-content:space-between;
            }
            body{
                /*background-image: linear-gradient(to right top, #ffffff, #f4f3ff, #e7e8fe, #d8deff, #c7d4ff, #afbff1, #96aae2, #7e95d4, #5e70b4, #404c94, #232a74, #000954);*/
                background-attachment: fixed;
               
            }
            .mycolor{
                color: blue;
            }

        </style>
    </head>
    <body>
        
          

        <%
            PostDao postDao = new PostDao(ConnectionProvider.getConnection());
             LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
            int post_id = Integer.parseInt(request.getParameter("post_id"));

            Post post = postDao.getPostById(post_id);
           
           String name = null;
           String likedStatus = "disliked";
           String thumbsStatus = "fa-thumbs-o-up";
           if (post != null) {
               UserDao userDao = new UserDao(ConnectionProvider.getConnection());
               User postUser = userDao.userById(post.getUser_id());
               name = postUser.getName();

               if (likeDao.isPostLikedByUser(post.getId(), user.getId())) {
                   likedStatus = "liked";
                   thumbsStatus = "fa-thumbs-up";
               }

           } else {
               out.println("<h3 class='display-3'>No Post Available</h3>");
               return;
           }
        
           
            

        %>
          <nav class="navbar  navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"><span class="fa fas fa-terminal"></span>&nbsp;TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                                        <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa-solid fa-address-book"></span>&nbsp;Contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target = "#post-modal" href="#"><span class="fa-solid fa-star"></span>&nbsp;Do Post</a>
                    </li>
                    
                   

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                       
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal" style="cursor:pointer;"> <span class="fa fa-user-circle"></span> <%= user.getName() %></a>
                    </li>
                     <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container center-align mt-4 mycontainer">
            <!--<div class="row">-->
                <!--<div class="col-md-12">-->
                    <div class="card mb-3 p-2 mycard">
                        <div class="card-head ">
                          
                           
                        </div>
                        <div class="container center-align md-3 img-box">
                                <img class="card-img-top" src="blogPic/<%= post.getPic()%>" alt="Bolg Image" >
                       </div>
                        <div class="card-body">
                            <div class="container mb-2 p-2 mycard-body-head" >
                               
                                <h5 class="card-title"> <b> <%= post.getTitle()%></b></h5>
                                 <div>
                                     <a  class="<%= likedStatus %> btn  btn-small" onclick="addLike(<%= post.getId()%> , <%= user.getId() %> , this )" id="like"><i class="fa <%= thumbsStatus %>"></i>&nbsp;<span id="total-like"><%= likeDao.getTotalLikes( post.getId()) %></span></a>
                                  <a  class="btn btn-small"><i class="fa fa-commenting-o"></i><span>10</span></a>
                                   </div>
                                </div>
                                <p class="card-text"><%= post.getContent()%></p>
                            <p class="card-text"><pre><%= post.getCode()%></pre></p>
                        </div>
                        <div class="card-footer mycard-footer">
                            <small class="text-muted"> Author <a href=""#><%= name %></a></small>
                              <small class="text-muted">Post at <%= DateFormat.getDateTimeInstance().format(post.getDate()) %></small>
                            
                               
                           
                        </div>
                             
                            
                             
                    </div>
                                <div class="container mycard-footer mb-2">
                <a href="show_blog_page.jsp?post_id=<%= post.getId()-1 %>" class="btn btn-outline-primary" >Previous</a>
                <a href="profile_page.jsp" class="btn btn-outline-primary" >Home</a>
                <a href="show_blog_page.jsp?post_id=<%= post.getId()+1 %>" class="btn btn-outline-primary" >Next</a>
            </div>
                <!--</div>-->
            <!--</div>-->
          
        </div>
               
                <%@include file="all_modals.jsp" %>
                        
            <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
            <script src="https://code.jquery.com/jquery-migrate-3.4.1.js"></script>

            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
            <script src="js/main.js" type="text/javascript" ></script>
            <script src='https://kit.fontawesome.com/5db7c9bc47.js' crossorigin='anonymous'></script>
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
            
            <script>

            function likedPost(postid , userid,temp)
            {
                $.ajax({
                    url:"AddLikeServlet",
                   
                    data:{pid:postid , uid:userid},
                    success:function(data,textStatus ,jqHXR){
                        let thumb = $($(temp).children()[0]);
                        thumb.removeClass("fa-thumbs-o-up");
                        thumb.addClass("fa-thumbs-up");
                        $($(temp).children()[1]).text(data);
                        console.log($(temp).children()[1]);
                    }
                });
            }
            function dislikedPost(postid , userid,temp){
                $.ajax({
                    url:"DeleteLikeServlet",
                   
                    data:{pid:postid , uid:userid},
                    success:function(data,textStatus ,jqHXR){
                        let thumb = $($(temp).children()[0]);
                        thumb.removeClass("fa-thumbs-up");
                        thumb.addClass("fa-thumbs-o-up");
                        $($(temp).children()[1]).text(data);
                        console.log($(temp).children()[1]);
                    }
                });
            }
            function addLike(postid , userid , temp )
            {
                let classList = $(temp).attr('class').split(" ");
              
               if(Object.values(classList).includes('disliked')){
                 likedPost(postid , userid,temp);
                $(temp).removeClass('disliked');
                $(temp).addClass('liked');
               
               }
               else{
                  dislikedPost(postid , userid,temp);
                   $(temp).removeClass('liked');
                  $(temp).addClass('disliked');
                 
               }
               
            }
                
           
                
        </script>
        
        

    </body>
</html>
