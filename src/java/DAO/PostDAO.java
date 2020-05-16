package DAO;
import Entities.Category;
import Entities.Posts;
import static java.nio.file.Files.list;
import java.sql.*;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;
public class PostDAO
{
    Connection con;
    private List<Posts> list;

    public PostDAO(Connection con) {
        this.con = con;
    }
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        
        
        try{
            String q="select * from categories";
            Statement st= this.con.createStatement();
            ResultSet rs= st.executeQuery(q);
            while(rs.next())
            {
                int cid=rs.getInt("cid");
                String name=rs.getString("name");
                 String description=rs.getString("description");
                 Category c= new Category(cid, name, description);
                 list.add(c);
                
            }
            
        }catch(Exception e)
        {
            
        }
        
        return list;
    }
    
    public boolean savePost(Posts p)
    {
      boolean f=false;
      try{
       
          String q="insert into posts (ptitle, pcontent, ppic, catid, id) values(?,?,?,?,?)";
          PreparedStatement ps= con.prepareStatement(q);
          ps.setString(1, p.getPtitle());
           ps.setString(2, p.getPcontent());
            ps.setString(3, p.getPpic());
             ps.setString(4, p.getCatid());
              ps.setInt(5, p.getId());
              
              ps.executeUpdate();
              f=true;
       
          
      }catch(Exception e)
      {
          e.printStackTrace();
      }
      return f;
    }
    //get all posts
     public List<Posts> getAllPosts()
     {
        List<Posts> list = new ArrayList<>();
        //fetch all the posts
        try{
            PreparedStatement ps= con.prepareStatement("select * from posts");
            
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                
                int pid=rs.getInt("pid");
                String ptitle= rs.getString("ptitle");
                String pcontent= rs.getString("pcontent");
                String ppic= rs.getString("ppic");
                Timestamp date= rs.getTimestamp("pdate");
                int cid= rs.getInt("cid");
                int id=rs.getInt("id");
                Posts post= new Posts(pid, ptitle, pcontent, ppic, date, ppic, id);
                list.add(post);
                
            }
         
     }catch(Exception e){
         e.printStackTrace();
         
     }
        
        
        
        return list;
        
     }
     public List<Posts> getPostByCatId(int cId)
     {
         try{
            PreparedStatement ps= con.prepareStatement("select * from posts where cid=?");
       
            ps.setInt(1,cId);
            ResultSet rs= ps.executeQuery();
            while(rs.next())
            {
                
                int pid=rs.getInt("pid");
                String ptitle= rs.getString("ptitle");
                String pcontent= rs.getString("pcontent");
                String ppic= rs.getString("ppic");
                Timestamp date= rs.getTimestamp("pdate");
                int cid= rs.getInt("cid");
                int id=rs.getInt("id");
                Posts post= new Posts(pid, ptitle, pcontent, ppic, date, ppic, id);
                list.add(post);
                
            }
         
     }catch(Exception e){
         e.printStackTrace();
         
     }
        
         return list;
     }
    
}
