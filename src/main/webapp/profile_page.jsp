<%-- 
    Document   : profile_page
    Created on : 19-Feb-2024, 2:32:43 pm
    Author     : haris
--%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.tech.blog.entity.Message"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
        return;
    }
%>
<%@page import="com.tech.blog.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>
          <link rel="icon" type="image/x-icon" href="img/ink96.png">
         <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        
    </head>
    <body>

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
<!--                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>-->


                        </div>
                    </li>
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

    <% 
           Message msg =(Message)session.getAttribute("msg");
           if(msg != null){
               %>
                <!--<div class="alert alert-success alert-dismissible fade show " id="success-alert" role="alert">-->

                <div class="alert <%=msg.getCssClass() %>" role="alert" id="msg" role="alert">
                  <%= msg.getContent() %>
                  
               </div>
               <%

                   session.removeAttribute("msg");
                }
                %>

        <!--navbar-end-->         
        <!--main body start-->
        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-4">
                        <!--categories-->
                        <div class="container">
                        <div class="list-group">
                          <a href="#" onclick="getPosts(0 , this)" class="list-group-item list-group-item-action  c-link" id="all-post">
                            All Posts
                          </a>
                            <% PostDao dao = new PostDao(ConnectionProvider.getConnection());
                               ArrayList<Category> categories = dao.getAllCategories();
                            
                               for(Category cat : categories){
                            %>
                            <a href="#" onclick="getPosts(<%= cat.getId() %> , this)" class="list-group-item list-group-item-action c-link"><%= cat.getName() %></a>
                          <% } %>
                        </div>
                        </div>
                    </div>
                    
                    <!--second column-->
                    <div class="col-md-8" >
                        <!--post-->                      
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-3x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        
                        <div class="container-fluid" id="post-container">
                            
                        </div>
                    </div>
                </div>
            </div>
        </main>
          
        <!--main body ends-->
        <!--Modal ================================================================================-->
    <%@include file="all_modals.jsp" %>
    <%@include file="footer.jsp" %>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://code.jquery.com/jquery-migrate-3.4.1.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js" type="text/javascript" ></script>
        <script src='https://kit.fontawesome.com/5db7c9bc47.js' crossorigin='anonymous'></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
        <script>
            $(document).ready(function(){
                let edit_status = false;
                $("#edit-profile-button").click( function(){
                    
                    if(edit_status === false){
                        $("#profile-detail").hide();
                        $("#profile-edit").show();
                        $(this).text("Back");
                         edit_status = true;
                    }
                    else{
                         $("#profile-detail").show();
                        $("#profile-edit").hide();
                        $(this).text("Edit");

                         edit_status = false;
                    }
                    
                });
                
                
                
            });
        </script>
        
        <!--add post js-->
        <script>
            $(document).ready(function(){
                    $("#addPostForm").on("submit",function(event){
                       //When form is submited
                       event.preventDefault(); 
                       
                       let form = new FormData(this);
                      
                          $.ajax({
                          url : "AddPostServlet",
                          type : 'POST',
                          data : form,

                          success:function(data , textStatus , jqXHR){     
                            if(data.trim() === 'done'){
                            swal({title:"Post Send Successfully",
                                text :"",
                                icon:"success"})
                            .then((value) => {
                                       window.location ="profile_page.jsp";
                             });
                          }
                          else{
                              swal({title:"Post Failed..",
                                text :data,
                                icon:"warning"});
                          }

                          },
                          error:function(jqXHR , textStatus , errorThrown){
                              console.log(jqXHR);                        
                             
                               swal("Try again..");
                          },
                          processData:false,
                          contentType:false
                       });



                        });

                });

        </script>
    
        <!--loading post using ajax-->
        <script>
            
            $("loader").show();
            $("#post-container").hide();
            function getPosts(catId,temp){
                
                $(".c-link").removeClass("active");
                $(temp).addClass("active");
            
                $.ajax({
                    url:"load_post.jsp",
                    data:{cid:catId},
                    success:function(data,textStatus ,jqHXR){
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);

                        
                    }
                });
            }
            $(document).ready(function(e){

                getPosts(0 , $("#all-post"));
            });
        </script>
        
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
