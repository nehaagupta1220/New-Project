
<%@page import="Service.Connect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="bootstrap.jsp"%>
<%@ include file="navbar.jsp" %>
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
        <title>Index page</title>
        <style>
            .banner-background{
          clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 65% 81%, 34% 100%, 0 78%, 0 0);
            }
        </style>
    </head>
    <body>
        
        <div class="container-fluid p-0 m-0">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                <h3 class="display-3">Welcome to BlogNeh!</h3>
                
                <p>Welcome to My personal blog, exploring the World. This blog contains my personal experiences related to every field people are interested in.</p>
                <button class=" btn btn-outline-light btn-lg"><span class="fa fa fa-user-plus"></span>Explore, its Free</button>
                <a href="LoginForm.jsp" class=" btn btn-outline-light btn-lg"><span class="fa fa-user-circle fa-spin"></span>Login</a>
                </div>
                
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
   <div class="card" >
   <div class="card-body">
    <h5 class="card-title">Travel</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
   </div>
                </div>
                <div class="col-md-4">
   <div class="card" >
   <div class="card-body">
    <h5 class="card-title">Food</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
   </div>
                </div>
                <div class="col-md-4">
   <div class="card" >
   <div class="card-body">
    <h5 class="card-title">Fashion</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
   </div>
                </div>
       
            </div><br>
            <div class="row">
                <div class="col-md-4">
   <div class="card" >
   <div class="card-body">
    <h5 class="card-title">Writing</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
   </div>
                </div>
                <div class="col-md-4">
   <div class="card" >
   <div class="card-body">
    <h5 class="card-title">Art & Culture</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
   </div>
                </div>
                <div class="col-md-4">
   <div class="card" >
   <div class="card-body">
    <h5 class="card-title">Technology</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    <a href="#" class="btn primary-background text-white">Go somewhere</a>
  </div>
   </div>
                </div>
       
            </div>
         
        </div>
        
    </body>
</html>
