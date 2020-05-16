
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="bootstrap.jsp" %>
    <%@include file="navbar.jsp" %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>RegisterForm</title>
    </head>
    <body>
        <main class="primary-background p-5 banner-background">
            <dic class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header primary-background text-white text-center">
                            <span class="fa fa-3x fa-user-plus"></span>
                            Register Here<br>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterServlets" method="get">
                               <div class="form-group">
                                   
    <label for="exampleInputUsername">User name</label>
    <input name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter name">
    <small id="emailHelp" class="form-text text-muted">We'll never share your username with anyone else.</small>
  </div>
             
                                
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
                                
                                
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
    
     <div class="form-group">
         <label for="exampleInputGender">Select Gender</label> <br>
    <input type="radio" id="Gender" name="gender" value="male">Male
    <input type="radio" id="Gender" name="gender" value="female">Female
  </div>
                                
    <div class="form-group">
        <textarea name="about" class="form-control" id="" cols="20" rows="6" placeholder="Enter something about yourself"></textarea>
  </div>
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree terms & conditions</label>
    <br><br>
  </div>
                                <div class="container text-center" id="loader" style="display:none"> <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h4>Please wait...</h4></div>
  <button id="submit-btn" type="submit" class="btn btn-outline-light primary-background">SignUp</button>
  
</form>
                            
                        </div>
                        <div class="card-footer">
                            
                        </div>                            
                    </div>
                </div>
            </div>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
            <script>
                ${document}.ready{function{} {
                  console.log("loaded...")
                  
                  $('#reg-form').on('submit' , function(event) {
                    
                     event.preventDefault();
                     
                     l
                     
                     let form=new FormData(this);
                     ${"#submit-btn"}.hide{};
                         ${"#loader"}.show{};
                     
                     $.ajax({
                             url: "RegisterServlets",
                             type: 'POST',
                             data: form,
                             success: function(data, textStatus, jqXHR) {
                                 console.log(data)
                             
                                 ${"#submit-btn"}.show{};
                                ${"#loader"}.hide{};
                             if(data.trim() ==='done'){
                              swal("Registered Succesfully")
                             .then((value) => {
                       window.location="LoginForm.jsp"
           
                             });
                             }else
                             {
                             swal(data);
                             },
                             error: function(jqXHR, textStatus, errorThrown) {
                                 ${"#submit-btn"}.show{};
                                ${"#loader"}.hide{};
                                    swal("Something went wrong...");
                             },
                             processData: false,
                             contentType: false
                         }};
                }}
                
            </script>
}

            
        </main>
    </body>
</html>
