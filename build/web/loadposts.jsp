<%@page import="Entities.Posts"%>
<%@page import="java.util.List"%>
<%@page import="DAO.PostDAO"%>
<%@page import="Service.Connect"%>

<div class="row">
<%
PostDAO d=new PostDAO(Connect.getConnection());
List<Posts> posts=d.getAllPosts (); 
for(Posts p:posts)
{
    %>
    
    <div class="col-md-6 mt-2">
        <div class="card">
            <div class="card-body">
                <b><%=p.getPtitle()%></b>
                <p><%=p.getPcontent()%>
                </p>
                <p>
                    <%=p.getPpic()%>
                </p>
            </div>
        </div>
        
    </div>
    
    
    
    
    <%
}

%>
</div>