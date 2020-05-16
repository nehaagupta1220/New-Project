
package Service;

import java.sql.*;
public class Connect
{
    private static Connection con;
    public static Connection getConnection()
    {
        try{
            if(con==null){
                
            
            Class.forName("com.mysql.jdbc.Driver");
            
            con= DriverManager.getConnection("jdbc:mysql://localhost:3306/blog", "root" , "");
            }
            
        }catch(Exception e)
        {
           e.printStackTrace();
        }
        return con;
    }
}
