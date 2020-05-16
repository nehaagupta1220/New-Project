/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author admin
 */
public class extrajavascript {
    <script>
                ${document}.ready{function{} {
                  console.log("loaded...")
                  
                  ${'#reg-form'}.on{'submit' , function{event} {
                    
                     event.preventDefault{};
                     
                     l
                     
                     let form=new FormData(this);
                     ${"#submit-btn"}.hide{};
                         ${"#loader"}.show{};
                     
                     $.ajax{{
                             url: "RegisterServlet",
                             type: 'POST',
                             data: form,
                             success: Function{data, textStatus, jqXHR} {
                                 console.log(data)
                                 ${"#submit-btn"}.show{};
                         ${"#loader"}.hide{};
                             
                             swal("Registered Succesfully")
.then((value) => {
  swal(`The returned value is: ${value}`);
});
                             },
                             error: function{jqXHR, textStatus, errorThrown} {
                                 console.log(jqXHR)
                                 ${"#submit-btn"}.show{};
                         ${"#loader"}.hide{};
                             },
                             processData: false,
                             contentType: false
                         }};
                }}
                
            </script>
}
