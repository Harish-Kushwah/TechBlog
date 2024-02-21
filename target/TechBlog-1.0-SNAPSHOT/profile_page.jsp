<%-- 
    Document   : profile_page
    Created on : 19-Feb-2024, 2:32:43 pm
    Author     : haris
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entity.Message"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page import="com.tech.blog.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
         <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
        
    </head>
    <body>

        <!--navbar - start-->
        <nav class="navbar  navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="#"><span class="fa fas fa-terminal"></span>&nbsp;TechBlog</a>
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
                        <div class="dropdown-menu dropdown1" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Project Implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>


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

        <!-- Modal start-->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header primary-background text-white text-center">
                  <h5> TechBlog</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                  <div class="container text-center ">
                      <% String name =user.getProfile();
                           
//                            if(name == null){
//                            name = "default.jpg";
//                          } 
//                            name = "error.png";
                            
                      
                      %>
                      <img src="pic/<%= name %>" class="img-fluid " style="border-radius: 50%; max-width: 150px">
                      <h5 class="modal-title" id="exampleModalLabel"><%= user.getName() %></h5>
                  
                      <!--details-->
                      <div id="profile-detail">
                      <table class="table">
                          
                          <tbody>
                            <tr>
                              <th scope="row">ID :</th>
                              <td><%= user.getId() %></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Email :</th>
                              <td><%= user.getEmail() %></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Gender :</th>
                              <td><%= user.getGender() %></td>
                            </tr>
                            <tr>
                              <th scope="row">About :</th>
                              <td><%= user.getAbout()%></td>
                            </tr>
                            <tr>
                              <th scope="row">Registered on :</th>
                              <td><%= user.getReg_date().toString()  %></td>
                            </tr>
                          </tbody>
                        </table>
                    </div>
                            
                      <!--profile edit form-->
                      <div id="profile-edit" style="display:none;" class="table-responsive-sm">
                          <h5 class="mt-3">Please Edit Carefully</h5>
                          <form action="EditServlet" method="POST" enctype="multipart/form-data" >
                              <table class="table " style=" ">
                          
                                  <tbody >
                            <tr>
                               
                              <th scope="row">ID :</th>
                              <td><%= user.getId() %></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Gender :</th>
                              <td><%= user.getGender().toUpperCase() %></td>
                            </tr>
                              <tr>
                              <th scope="row">Name :</th>
                              <td><input class="form-control" type="text" name="user_name" value="<%= user.getName()%>"></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Email :</th>
                              <td><input class="form-control" type="email" name="user_email" value="<%= user.getEmail() %>"></td>
                              
                            </tr>
                            
                            
                            <tr>
                              <th scope="row">New Profile:</th>
                              <td><input type="file" name="image" class="form-contorl"></td>
                            </tr>
                            
                            <tr>
                              <th scope="row">Password:</th>
                              <td><input class="form-control" type="password" name="user_pass" value="<%= user.getPassword()%>"></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">About :</th>
                              <td><textarea class="form-control" name="user_about" value=""><%= user.getAbout()%></textarea></td>
                            </tr>
                          </tbody>
                        </table>
                              <div class="container">
                                  <button class="btn btn-outline-success">Save</button>
                              </div>
                            
                          </form>
                          
                      </div>
                      
                  
                  </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id ="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
              </div>
            </div>
          </div>
        </div>

        <!--profile model end-->

        <!--Add Post Model-->

            <div class="modal fade" id="post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog" role="document">
                  <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                      <form action="AddPostServlet" method="POST" id="addPostForm" enctype="multipart/form-data" >

                          <div class="form-group">
                              <select class="form-control" name="selected_cat">
                                  <option selected disabled>---Select Category---</option>
                                  <%
                                      PostDao post = new PostDao(ConnectionProvider.getConnection());
                                      ArrayList<Category> list = post.getAllCategories();

                                      for (Category cat : list) {
                                  %>
                                  <option value="<%=cat.getId()%>"><%= cat.getName()%></option>
                                  <%}%>
                              </select>
                          </div>
                          <div class="form-group">
                              <input type="text" placeholder="Enter post title" class="form-control" name="title">
                          </div>

                          <div class="form-group">
                              <textarea class="form-control" placeholder="Enter your content" style="height: 200px" name="content" ></textarea>
                          </div>
                          <div class="form-group">
                              <textarea class="form-control" placeholder="Enter program (if any)" style="height: 200px" name="code"></textarea>
                          </div>
                          <div class ="form-group">
                              <label>Select your pic</label><br>

                              <input type="file" name="image" >
                          </div>
                          <div class=" container text-center">
                              <button type="submit" class="btn btn-outline-primary ">Post</button>

                          </div>
                   </form>
                  </div>
                 
                </div>
                         
              </div>
            </div>

      <!--end post model-->
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
                      
                       console.log(form);
//                       $.ajax({
//                           url:"AddPostServlet",
//                           type:'POST',
//                           data:form,
//                           success:function(data,textStatus , jqXHR){
//                               console.log(data);
//                           },
//                           error:function(jqXHR , textStatus,errorThrown){
//                               
//                           }
//                           
//                       });

                          $.ajax({
                          url : "AddPostServlet",
                          type : 'POST',
                          data : form,

                          success:function(data , textStatus , jqXHR){     


                          console.log(data);

                            if(data.trim() === 'done'){
                            swal({title:"Post Send Successfully",
                                text :"",
                                icon:"success"})
                            .then((value) => {
                                       window.location ="profile_page.jsp";
                             });
                          }
                          else{
                              swal({title:"Registration Failed..",
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
    </body>
</html>
