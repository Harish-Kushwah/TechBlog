<%-- 
    Document   : profile
    Created on : 27-Feb-2024, 3:44:40 pm
    Author     : haris
--%>

<%@page import="com.tech.blog.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if ((User) session.getAttribute("currentUser") == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Author Profile</title>
        <link rel="icon" type="image/x-icon" href="img/ink96.png">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
    </head>
    <style>
        .personal-info{
            border-bottom: 1px solid blue;
        }
        .my-table{
            text-align: left;
        }
        .my-table span{
            font-weight: 400;
            margin-left: 10px;
        }
       
        
    </style>
    <body>
        <%@include file="profile_navbar.jsp" %>


    <main>
        <div class="container">
            <div class="row mt-4">
             <div class="col-md-12 " >
                  <div class="container personal-info">                            
                       <div class="row">
                       <div class="container text-center col-md-4 d-flex align-items-center align-self-center flex-column">
                           <%
                               UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                               int user_id =Integer.parseInt(request.getParameter("user_id"));
                               User author =userDao.userById(user_id);
                              
                           %>

                           <img src="pic/<%= author.getProfile()%>" class="img-fluid " style="border-radius: 10px; max-width: 150px">
                           <div class="">
                               <div class="container d-flex justify-content-center" >
                                   <a
                                       class="btn btn-link btn-floating btn-lg text-dark "
                                       href="#!"
                                       role="button"
                                       data-mdb-ripple-color="dark"
                                       ><i class="fab fa-facebook-f"></i
                                       ></a>

                                   <!-- Twitter -->
                                   <a
                                       class="btn btn-link btn-floating btn-lg text-dark "
                                       href="#!"
                                       role="button"
                                       data-mdb-ripple-color="dark"
                                       ><i class="fab fa-twitter"></i
                                       ></a>

                                   <!--       Google 
                                         <a
                                           class="btn btn-link btn-floating btn-lg text-dark "
                                           href="#!"
                                           role="button"
                                           data-mdb-ripple-color="dark"
                                           ><i class="fab fa-google"></i
                                         ></a>-->

                                   <!-- Instagram -->
                                   <a
                                       class="btn btn-link btn-floating btn-lg text-dark "
                                       href="#!"
                                       role="button"
                                       data-mdb-ripple-color="dark"
                                       ><i class="fab fa-instagram"></i
                                       ></a>

                                   <!-- Linkedin -->
                                   <a
                                       class="btn btn-link btn-floating btn-lg text-dark "
                                       href="#!"
                                       role="button"
                                       data-mdb-ripple-color="dark"
                                       ><i class="fab fa-linkedin"></i
                                       ></a>
                                   <!-- Github -->
                                   <!--      <a
                                           class="btn btn-link btn-floating btn-lg text-dark "
                                           href="#!"
                                           role="button"
                                           data-mdb-ripple-color="dark"
                                           ><i class="fab fa-github"></i
                                         ></a>-->


                               </div>
                           </div>
                       </div>
                        <div class=" container  col-md-5">
                            <!--details-->
                            <div id="profile-detail">

                                <table class="table table-borderless">
                                    <tbody>

                                        <tr>
                                            <th scope="row">Username:</th>
                                            <td><%= author.getName()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email :</th>
                                            <td><%= author.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Country :</th>
                                            <td>India</td>

                                        </tr>

                                        <tr>
                                            <th scope="row">About :</th>
                                            <td><%= author.getAbout()%></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="container col-md-3">

                            <div class="profile1">

                                <table class="table table-borderless my-table">
                                    <tbody>

                                        <tr>
                                            <th scope="row">Blog Score :<span>200</span></th>

                                        </tr>
                                        <tr>
                                            <th scope="row">Total Posts :<span>20</span></th>

                                        </tr>
                                        <tr>
                                            <th scope="row">Total Likes: <span>201</span></th>

                                        </tr>
                                        <tr>
                                            <th scope="row">Longest Streek: <span>30</span></th>

                                        </tr>
                                    </tbody>
                                </table>
                           </div>
                       </div>
                      </div>
                  </div>
                  
                    <!--post-->                      
                    <div class="container  d-flex align-items-center justify-content-between m-3">
                        <!--<div class="row">-->
                        <div class="title">
                            <h5>All Posts</h5>
                        </div>
                        <div>
                        <span>Filter The blogs :</span>
                            <select class="form-select" aria-label="Default select example">
                              <option selected>Open this select menu</option>
                              <option value="1">One</option>
                              <option value="2">Two</option>
                              <option value="3">Three</option>
                            </select>
                        </div>
                        <!--</div>-->
                    </div>     
                 
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




<%@include file="all_modals.jsp" %>
<%@include file="footer.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="https://code.jquery.com/jquery-migrate-3.4.1.js"></script>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src='https://kit.fontawesome.com/5db7c9bc47.js' crossorigin='anonymous'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


<!--loading post using ajax-->
<script>

    $("loader").show();
    $("#post-container").hide();
    function getPosts(catId, temp) {

        $(".c-link").removeClass("active");
        $(temp).addClass("active");

        $.ajax({
            url: "load_post.jsp",
            data: {cid: catId},
            success: function (data, textStatus, jqHXR) {
                $("#loader").hide();
                $("#post-container").show();
                $("#post-container").html(data);


            }
        });
    }
    $(document).ready(function (e) {

        getPosts(0, $("#all-post"));
    });
</script>

</body>
</html>
