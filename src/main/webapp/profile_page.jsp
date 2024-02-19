<%-- 
    Document   : profile_page
    Created on : 19-Feb-2024, 2:32:43 pm
    Author     : haris
--%>
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
        <nav class="navbar fixed-top navbar-expand-lg navbar-dark primary-background">
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
                            if(name==null){
                            name = "default.jpg";
                          }
                      
                      %>
                      <img src="img/<%= name %>" class="img-fluid " style="border-radius: 50%; max-width: 150px">
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
                          <form  >
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

<!--        <h1>Hello World!</h1>

        <h1> Welcome </h1>
        <h1> Name : <%= user.getName()%> </h1>
        <h1> Email : <%= user.getEmail()%> </h1>
        <h1> Gender : <%= user.getGender()%> </h1>
        <h1> About : <%= user.getAbout()%> </h1>
        -->
        
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
    </body>
</html>
