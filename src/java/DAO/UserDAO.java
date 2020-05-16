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
            
             String query="INSERT INTO `user` (`name`,`email`,`password`, `gender`, `about`) VALUES (?,?,?,?,?)";
             PreparedStatement pstmt=this.con.prepareStatement(query);
             pstmt.setString(1,user.getName());
             pstmt.setString(2,user.getEmail());
             pstmt.setString(3,user.getPassword());
             pstmt.setString(4,user.getGender());
             pstmt.setString(5,user.getAbout());
             
             pstmt.executeUpdate();
             f=true;
             
         }catch(Exception e)
         {
             e.printStackTrace();
         }
         return f;
     }

    // get user 
     public User getUser(String email, String password)
     {
         User user = null;
         try
         {
            String query="SELECT * FROM user WHERE email=? AND password=?";
            PreparedStatement pstmt= con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            
            ResultSet rs=pstmt.executeQuery();
            if(rs.next())
            {
                user= new User();
                String name=rs.getString("name");
              
                user.setName(name);
               
                user.setId(rs.getInt("id"));
                 user.setEmail(rs.getString("email"));
                  user.setPassword(rs.getString("password"));
                   user.setGender(rs.getString("gender"));
                    user.setAbout(rs.getString("about"));
                    user.setProfile(rs.getString("profile"));
            }
            
         }catch (Exception e)
         {
          e.printStackTrace();
         }
         return user;
     }
     
     public boolean updateUser(User user)
     {
         boolean f=false;
         try{
             String query="update user set name=? , email=? , password=? , gender=? , about=? , profile=? , where id=? ";
             PreparedStatement ps= con.prepareStatement(query);
            
             ps.setString(1, user.getName());
             ps.setString(2, user.getEmail());
             ps.setString(3, user.getPassword());
             ps.setString(4, user.getGender());
             ps.setString(5, user.getAbout());
             ps.setString(6, user.getProfile());
              ps.setInt(7, user.getId());
             
             ps.executeUpdate();
             f=true;
             
             
         }catch(Exception e){
             e.printStackTrace();
         }
         return f;
     }
    
}
