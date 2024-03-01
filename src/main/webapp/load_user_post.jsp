<%-- 
    Document   : load_post
    Created on : 22-Feb-2024, 8:33:06 pm
    Author     : haris
--%>

<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="com.tech.blog.entity.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entity.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page errorPage="error_page.jsp" %>
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
         <meta name="viewport" content="width=device-width, initial-scale=1">
         <link rel="icon" type="image/x-icon" href="img/ink96.png">
         <title>Load Page</title>
    </head>
    <style>
        .liked{
            background-color:#def9fa;
            
        }    
        .disliked{
            background-color: white;
        }
        .mycard-body{
            min-height: 100px;
            max-height: 100px;
        }
    </style>
    <body>
        <div class="row">
            <%

               
                PostDao dao = new PostDao(ConnectionProvider.getConnection());
                LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                int catId = Integer.parseInt(request.getParameter("cid"));
                int userId = Integer.parseInt(request.getParameter("uid"));
                ArrayList<Post> posts = null;
                if (catId == 0) {
                    posts = dao.getPostByUserId(userId);
                } else {
                    posts = dao.getPostByCatUserId(userId , catId);
                }
                if (posts.size() == 0) {
                    out.println("<h3 class='display-3 text-center'>No Blog In This Category<h3>");
                    return;
                }
                for (Post post : posts) {

                    String content = post.getContent();
                    int total_words = 0;
                    int i;
                    for (i = 0; i < content.length(); i++) {
                        if (content.charAt(i) == ' ') {
                            total_words++;
                        }
                        if (total_words == 20) {
                            break;
                        }
                    }
                    content = content.substring(0, i);

                    content += "...";
                    
                    String likedStatus = "disliked";
                    String thumbsStatus = "fa-thumbs-o-up";
                    if(likeDao.isPostLikedByUser(post.getId(), user.getId())){
                      likedStatus = "liked";
                      thumbsStatus = "fa-thumbs-up";
                     }
                  
            %> 

            <div class="col-md-6">
                <div class="card mt-2">
                    <img class="card-img-top" src="blogPic/<%= post.getPic()%>" alt="Bolg Image">
                    <div class="card-body ">
                        <b> <%= post.getTitle()%></b>
                        <p><%= content%></p>
                        <!--<pre><%= post.getCode()%></pre>-->
                    </div>
                    <div class="card-footer bg-light">   
                        
                        <a  class="<%= likedStatus %> btn btn-outline-primary btn-small" onclick="addLike(<%= post.getId()%> , <%= user.getId() %> , this )" id="like"><i class="fa <%= thumbsStatus %>"></i>&nbsp;<span id="total-like"><%= likeDao.getTotalLikes( post.getId()) %></span></a>
                        <a href="show_blog_page.jsp?post_id=<%= post.getId()%>" class="btn btn-outline-primary btn-small">Read More...</a>
                        <a href="#" class="btn btn-outline-primary btn-small"><i class="fa fa-commenting-o"></i><span>10</span></a>
                    </div>
                </div>
            </div>
            <% }%>
        </div>

       
    </body>
</html>
