<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Category"%>
<%@page import="DAO.PostDAO"%>
<%@page import="Service.Connect"%>
<%@page import="Entities.User"%>
<%@page errorPage="Error.jsp" %>


<%

User user= (User)session.getAttribute("currentUser");
if(user==null)
{
response.sendRedirect("LoginForm.jsp");
}else{
}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <%@include file="bootstrap.jsp" %>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Profile Page</title>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
    <a class="navbar-brand" href="LoginForm.jsp"> <span class="fa fa-star"></span> BlogNeh</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="index.jsp"><span class="fa fa-bank"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="#"> <span class="fa fa-image"></span>Gallery</a>
      </li>
      <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="fa fa-automobile"></span>
          Explore
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Travel</a>
          <a class="dropdown-item" href="#">Food</a>
          <a class="dropdown-item" href="#">Fashion</a>
          <a class="dropdown-item" href="#">Writing</a>
          <a class="dropdown-item" href="#">Art & Culture</a>
          <a class="dropdown-item" href="#">Technology</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
          <a class="nav-link disabled" href="#"><span class="fa fa-address-book-o"></span>Contact Us</a>
          
      </li>
      <li class="nav-item">
    <a class="nav-link" href="#"data-toggle="modal" data-target="#add-post"><span class="fa fa-asterisk"></span>
  Add post
    </a>
      </li>
      
    
       
    </ul>
      <ul class="navbar-nav mr-right">
          <li class="nav-item">
              <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"> 
                  <span class="fa fa-user-circle"></span><%= user.getName()%></a>
      </li>
          <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"> <span class="fa fa-user-plus"></span>LogOut</a>
      </li>
      </ul>
  </div>
</nav>
    </head>
    <body>
        

<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel"> BlogNeh!</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
              <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width: 150px">
              
          <h5 class="modal-title mt-3" id=""> <%= user.getName()%></h5>
          
          
          <div id="profile-details">
          <table class="table">
 
  <tbody>
    <tr>
      <th scope="row">Id:</th>
      <td><%= user.getId()%></td>
      
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><%= user.getEmail()%></td>
      
    </tr>
    <tr>
      <th scope="row">Gender:</th>
      <td><%= user.getGender()%></td>
      
    </tr>
    
    <tr>
      <th scope="row">Status:</th>
      <td><%= user.getAbout()%></td>
      
    </tr>
  </tbody>
</table>
 </div>
      
      <div id="profile-edit" style="display: none;" >
          <h3>Please Edit Carefully...</h3>
          <form action="Edit_Servlet" method="get" enctype="multipart/form-data">
              <table class="table">  
       <tr>
      <th scope="row">Id:</th>
      <td><%= user.getId()%></td>
     
      </tr>
        <tr>
      <th scope="row">Name:</th>
      <td><input type="text" class="form-control" name="name" value="<%= user.getName()%>"</td>
      
    </tr>
    <tr>
      <th scope="row">Email:</th>
      <td><input type="email" class="form-control" name="email" value="<%= user.getEmail()%>"</td>
      
    </tr>
   
    
     
     <tr>
      <th scope="row">Password:</th>
      <td><input type="password" class="form-control" name="password" value="<%= user.getPassword()%>"</td>
      
    </tr>
    <tr>
      <th scope="row">Gender:</th>
      <td><%= user.getGender().toUpperCase()%></td>
      
    </tr>
    
   
    <tr>
      <th scope="row">About:</th>
      <td><textarea rows="3" class="form-control" name="about"> <%= user.getAbout()%></textarea></td>
      
    </tr>
    <tr>
      <th scope="row">New Profile Picture:</th>
     
      <td><input type="file" name="image" class="form-control"></td>
      
    </tr>
    
    
    
    
              </table>
      <div class="container">
          <button type="submit" class="btn btn-outline-primary">Save</button>
      </div>
          </form>
          
          
          
          
         </div>
          </div>
      </div>
      
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
  </div>
         
</div>



 <!-- add post modal-->
 

<!-- Modal -->
<div class="modal fade" id="add-post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          
          
          <form id="add-post-form" action="AddPostServlet" method="post">
              <div class="form-group">
                  
              
                  <select class="form-control" name="cid">
                      <option selected disabled>---Select Category---</option>
                      <% 
                      PostDAO postd= new PostDAO(Connect.getConnection());
                      ArrayList<Category> list= postd.getAllCategories();
                      for(Category c: list)
                      {
                          %>
                          <option value="<%= c.getCid() %>"> <%= c.getName()%></option> 
                      <%
                      }
                      %>
                   
              </select>
              </div>
              <div class="form-group">
                  <input name="ptitle" type="text" placeholder="Enter post title" class="form-control">
                  
              </div>
              <div class="form-group">
                  <textarea  name="pcontent" class="form-control" style="height:200px" placeholder="Enter the content"></textarea>
              </div>
              <div class="form-group">
                  <label>Select the picture</label>
                  <br>
                  <input type="file" name="ppic">
                  
              </div>
                      <div class="container text-center">
                          <button type="submit" class="btn btn-outline-primary"> Post</button>
                          
                      </div>
              
          </form>
      </div>
      
    </div>
  </div>
</div>     
          
          
  
<!-- end post modal-->  
<!-- main body of the page-->
<main>
    <div class="container">
        <div class="row mt-4">
            <!--first col-->
            <div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">
    All Posts
  </a>
                
                <%
                    PostDAO dao= new PostDAO(Connect.getConnection());
                    ArrayList<Category> list1=dao.getAllCategories();
                    for(Category cc: list1)
                    {
                        %>
                          <a href="#" class="list-group-item list-group-item-action"><%= cc.getName()%></a>
                    
                    <%
                        }
                    %>
  
</div>
                
                
                
        </div>
            <!--Second col-->
            <div class="col-md-14">
                <div class="container text-center" id="loader">
                    <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2">Loading...
                        </h3>
                </div>
                <div class="container-fluid" id="post-container">
                    
                </div>
                       
                   
                
            </div>
                 
                 
        
        
    </div>
    
    
</main>






<!--  end main body of the page-->




      <script>
          $(document).ready(function() {
              let editStatus=false;
              
              
             $('#edit-profile-button').click(function(){
               //alert("Button clicked")  
               if(editStatus==false)
               {
                   $("#profile-details").hide()
                   $("#profile-edit").show()
                   editStatus=true;
                   console.log(data);
                   $(this).text("Back")
               }
               else{
                   $("#profile-details").show()
                   $("#profile-edit").hide()
                   editStatus=false;
                   $(this).text("Edit")
               }
             })
          });
          
          </script>
          
          
          
          
          <!-- add post JS-->
          <script>
              
              $(document).ready(function(e) {
                //
                $("#add-post-form").on("submit", function(event){
                    // code is called when the function is submitted..
                    event.preventDefault();
                    console.log("you have clicked on submit")
                    let form= new FormData(this);
                    
                    // now request to server
                    
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function ( data, textStatus, jqXHR){
                            //success
                            console.log(data);
                            if(data.trim() =='done')
                            {
                                swal("Good job!", "Saved Sucessfully", "success");
                            }else
                            {
                                swal("Error!", "Something went wrong try again", "error");
                            }
                        },
                        error:function ( data, textStatus, errorThrown) {
                            swal("Error!", "Something went wrong try again", "error");
                            //error
                        },
                        processData: false,
                        contentType: false
                    })
                })
              })
              </script>
              
              <!--loading posts using ajax-->
              <script>
                  $(document).ready(function (e) {
                  $.ajax({
                          url:"loadposts.jsp",
                          success: function (data, textStatus, jqXHR) {
                              console.log(data);
                              $("#loader").hide();
                              $("#post-container").html(data);
                          }
                  })
              })
                  </script>
    </body>
    
</html>
