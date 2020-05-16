
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Something Went wrong</title>
        <%@include file="bootstrap.jsp" %>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="container text-center">
             
            <img src="img/error.png" class="img-fluid">
            <h3 class="display-3">Sorry! Something went Wrong...</h3>
            <%= exception%>
            <a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Home</a>
            
</div>
        
    </body>
</html>
