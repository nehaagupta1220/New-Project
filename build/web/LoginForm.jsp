<%-- 
    Document   : LoginForm
    Created on : 8 Apr, 2020, 2:29:39 PM
    Author     : admin
--%>

<%@page import="Entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="bootstrap.jsp" %>
    <%@include file="navbar.jsp" %>
    <head>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LoginForm </title>
    </head>
    <body>
        
        <main class="d-flex align-items-center primary-background banner-background" style="height: 70vh">
            <div class="container">
                <div class="row"> 
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-circle fa-3x"></span>
                                <br>
                                <p> Login here!</p>
                            </div>
                            <%
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null)
                                {
                                    %>
                                    <div class="alert <%= m.getCssClass()%>" role="alert">
                                        <%= m.getContent()%>
                                 
                                    </div>
                                    <%
                                        session.removeAttribute("msg");
                                }
                            %>
                            
                            
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="container text-center">
    <button type="submit" class="btn btn-primary primary-background text-white">Submit</button>
  </div>
  
</form>
                                
                            </div>
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
        </main>
    </body>
</html>
