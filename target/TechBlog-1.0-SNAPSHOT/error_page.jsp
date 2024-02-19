<%-- 
    Document   : error_page
    Created on : 19-Feb-2024, 1:35:01 pm
    Author     : haris
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Page</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"><!-- comment -->
           <link href="css/style.css" rel="stylesheet" type="text/css"/>

    
    </head>
    <body>
        
        <div class="container text-center">
        
            <img src="img/error2.png" alt="error" class="img-fluid"/>
            <h4 class="display-4">Sorry ! Something Went Wrong</h4>
            <%=exception%>
            
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
        </div>
        
        
    </body>
</html>
