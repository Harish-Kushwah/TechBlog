<%-- 
    Document   : login_page
    Created on : 18-Feb-2024, 11:17:19 pm
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->

        <style>
                .banner-background{
                    clip-path: polygon(30% 0%, 100% 0, 100% 30%, 100% 88%, 73% 95%, 44% 90%, 0 95%, 0 0);
                }
        </style>
    </head>


    <body>

        <%@include file="normal_navbar.jsp" %>
        <section id="register-section">
        <main class="d-flex align-items-center primary-background banner-background p5" style="padding-bottom: 80px">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 offset-md-4">
                        <form action="RegisterServlet" method="POST" id="reg_form">
                            <div class="card">
                                <div class="card-header primary-background  text-white text-center">
                                    <span class="fa fa-user-circle fa-3x"></span>
                                    <br>
                                    <p>Register here</p>
                                </div>
                                <div class="card-body">

                                    <div class="form-group ">
                                        <label for="user_name" >Name</label>
                                        <input type="text" class="form-control" id="user_name" placeholder="Name" name="user_name">
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label for="user_email" >Email</label>
                                        <input type="email" class="form-control" id="user_email" placeholder="Email" name="user_email">
                                    </div>
                                    <div class="form-group ">
                                        <label for="user_pass" >Password</label>
                                        <input type="password" class="form-control" id="user_pass" placeholder="Password" name="user_pass" autocomplete="true">
                                    </div>
                                    <div class="form-group ">
                                        <label for="gender" >Gender</label><br>
                                        <input type="radio" id="male" name="gender" value="male">Male
                                        <input type="radio" id="female"name="gender" value="female">Female
                                    </div>
                                    <div class="form-group ">
                                        <textarea class="form-control" name="about" id="" cols="40" rows="2" placeholder="Enter something about yourself"></textarea>
                                        
                                    </div>
                                    <div class="form-check ">
                                        <input type="checkbox" class="form-check-input" id="check" name="check" >
                                        <label class="form-check-label"for="check" >Check me out</label>
                                    </div>
                                </div>
                                <!--<div class="card-footer ">-->
                                <div class="form-group ">
                                    <div class="container text-center" style="display:none" id="loading">
                                    <div class="container">
                                    <span class="fa fa-refresh fa-spin fa-2x"><span>
                                     </div>
                                     <h4>Please wait..</h4>
                                     </div>
                                        <button type="submit" id="submit-btn" class="btn btn-primary ml-3">SignUp</button>
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

        <!--scripts-->
      
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://code.jquery.com/jquery-migrate-3.4.1.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/main.js" type="text/javascript" ></script>
        <script src='https://kit.fontawesome.com/5db7c9bc47.js' crossorigin='anonymous'></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
        
        <script>
            $(document).ready((event)=>{
               console.log("loaded"); 
               
               $("#reg_form").on("submit" , function(event){
                   event.preventDefault();
                   let form = new FormData(this);
                   
                   $("#submit-btm").hide();
                   $("#loading").show();
                   $.ajax({
                      url : "RegisterServlet",
                      type : 'POST',
                      data : form,
                      
                      success:function(data , textStatus , jqXHR){     
                         
        
                         $("#submit-btm").show();
                         $("#loading").hide();
                         
                        if(data.trim() === 'done'){
                        swal({title:"Registration successfull..",
                            text :"we are redirecting to login page",
                            icon:"success"})
                        .then((value) => {
                                   window.location ="login_page.jsp";
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
                          $("#submit-btm").show();
                          $("#loading").hide();
                           swal("Try again..");
                      },
                      processData:false,
                      contentType:false
                   });
                   console.log(form);
               });
            });        
        </script>
    </body>
</html>
