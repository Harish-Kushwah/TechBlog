<%-- 
    Document   : login_page
    Created on : 18-Feb-2024, 11:17:19 pm
    Author     : haris
--%>

<%@page import="com.tech.blog.entity.Message"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login Page</title>
          <link rel="icon" type="image/x-icon" href="img/ink96.png">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->

        <style>
                .banner-background{
                    /*clip-path: polygon(30% 0%, 100% 0, 100% 30%, 100% 88%, 73% 95%, 44% 90%, 0 95%, 0 0);*/
                }
        </style>
        
        <link rel="icon" type="image/x-icon" href="img/ink96.png">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Roboto:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">
    </head>


    <body>

        <%@include file="normal_navbar.jsp" %>
         <section>
        <main class="d-flex align-items-center primary-background banner-background" style="height:80vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <form action="LoginServlet" method="POST" id="login_form">
                            <div class="card">
                                <div class="card-header primary-background  text-white text-center">
                                    <span class="fa fa-user-plus fa-3x"></span>
                                    <br>
                                    <p>Login here</p>
                                </div>
                                
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
                               
                                <div class="card-body">
                                    
                                    <div class="form-group ">
                                        <label for="inputEmail3" >Email</label>
                                        <input type="email" class="form-control" id="email" placeholder="Email" name="user_email" required>
                                    </div>
                                    <div class="form-group ">
                                        <label for="inputPassword3" >Password</label>
                                        <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="user_pass" required autocomplete>
                                    </div>
<!--                                     <div class="form-check ">
                                        <input type="checkbox" class="form-check-input" id="check" >
                                        <label class="form-check-label"for="inputPassword3" >Check me out</label>

                                    </div>-->




                                </div>
                                <div class="card-footer ">
                                 
                                    <div class="form-group  text-center">
                                        <button type="submit" class="btn btn-primary ">Login</button>
                                                                        <p>Don't have Accout <a href="register_page.jsp">Click here</a></p>

                                    </div>
                                    </div>
                                


                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </main>
                                
         
            <div class="wave wave1"></div>
            <div class="wave wave2"></div>
            <div class="wave wave3"></div>
            <div class="wave wave4"></div>
        </section>                       

   <%@include file="footer.jsp" %>
        <!--scripts-->
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://code.jquery.com/jquery-migrate-3.4.1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js" type="text/javascript" ></script>
        <script src='https://kit.fontawesome.com/5db7c9bc47.js' crossorigin='anonymous'></script>
         <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
         <script>
//             ${document}.ready((event)=>{
//                 
//                 
//                 $("#msg").hide();
//                 
//             });
             
         </script>
         
         <script>
//            $(document).ready((event)=>{
//                
//                $("#login_form").on("submit",function(event){
//                    event.preventDefault();
//
//                   let form = new FormData(this);
//                   
//                   $.ajax({
//                      url:"LoginServlet",
//                      type:'POST',
//                      data:form,
//                      
//                      success:function(data , textStatus,jqXHR){
//                          if(data.trim() === 'done'){
//                              swal({title:"Login successfull..",
//                            text :"we are redirecting to home page",
//                            icon:"success"})
//                        .then((value) => {
//                                   window.location ="profile_page1.jsp";
//                         });
//                          }
//                          else{
//                              swal({title:"Login Failed..",
//                            text :data,
//                            icon:"warning"});
//                          }
//                      },
//                      error:function(jqXHR,textStatus,errorThrown)
//                      {
//                          swal("Try Again..");
//                      },
//                      processData:false,
//                      contentType:false
//                   });
//                });
//                
//                
//            });
//            
        </script>
        
    
    </body>
</html>
