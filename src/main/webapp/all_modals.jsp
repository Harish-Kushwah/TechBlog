<%-- 
    Document   : all_modals
    Created on : 23-Feb-2024, 9:55:00 am
    Author     : haris
--%>

<%@page import="com.tech.blog.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%
    User user1 = (User) session.getAttribute("currentUser");
    if (user1 == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                      <% 
                          String name1 =user1.getProfile();
                      %>
                      <img src="pic/<%= name1 %>" class="img-fluid " style="border-radius: 50%; max-width: 150px">
                      <h5 class="modal-title" id="exampleModalLabel"><%= user1.getName() %></h5>
                  
                      <!--details-->
                      <div id="profile-detail">
                      <table class="table">
                          
                          <tbody>
                            <tr>
                              <th scope="row">ID :</th>
                              <td><%= user1.getId() %></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Email :</th>
                              <td><%= user1.getEmail() %></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Gender :</th>
                              <td><%= user1.getGender() %></td>
                            </tr>
                            <tr>
                              <th scope="row">About :</th>
                              <td><%= user1.getAbout()%></td>
                            </tr>
                            <tr>
                              <th scope="row">Registered on :</th>
                              <td><%= user1.getReg_date().toString()  %></td>
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
                              <td><%= user1.getId() %></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Gender :</th>
                              <td><%= user1.getGender().toUpperCase() %></td>
                            </tr>
                              <tr>
                              <th scope="row">Name :</th>
                              <td><input class="form-control" type="text" name="user_name" value="<%= user1.getName()%>"></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">Email :</th>
                              <td><input class="form-control" type="email" name="user_email" value="<%= user1.getEmail() %>"></td>
                              
                            </tr>
                            
                            
                            <tr>
                              <th scope="row">New Profile:</th>
                              <td><input type="file" name="image" class="form-contorl"></td>
                            </tr>
                            
                            <tr>
                              <th scope="row">Password:</th>
                              <td><input class="form-control" type="password" name="user_pass" value="<%= user1.getPassword()%>"></td>
                              
                            </tr>
                            <tr>
                              <th scope="row">About :</th>
                              <td><textarea class="form-control" name="user_about" value=""><%= user1.getAbout()%></textarea></td>
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
                          PostDao post1 = new PostDao(ConnectionProvider.getConnection());
                          ArrayList<Category> list1 = post1.getAllCategories();

                          for (Category cat : list1) {
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
