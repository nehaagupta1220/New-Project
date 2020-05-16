package DAO;
import Entities.User;
import java.sql.*;
public class UserDAO 
{
   private Connection con; 

    public UserDAO(Connection con) {
        this.con = con;
    }
    //insert data in user
     public boolean insertUser(User user){
             boolean f=false;
     
         try
         {
            
             String query="INSERT INTO `buser` (`name`,`email`,`password`, `gender`, `about`) VALUES (?,?,?,?,?)";
             PreparedStatement pstmt=this.con.prepareStatement(query);
             pstmt.setString(1,user.getName());
             pstmt.setString(2,user.getEmail());
             pstmt.setString(3,user.getPassword());
             pstmt.setString(4,user.getGender());
             pstmt.setString(5,user.getAbout());
             
             pstmt.executeUpdate();
             System.out.println("Neha");
             f=true;
             
         }catch(Exception e)
         {
             e.printStackTrace();
         }
         return f;
     }

    
}
