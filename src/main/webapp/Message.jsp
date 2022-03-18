<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Message</title>
</head>
<body>
    <center>
        <h3><%=request.getAttribute("Message")%></h3>
    </center>
    
    <BR>  <%
      String nom=(String) session.getAttribute( "nom");
      String prenom=(String) session.getAttribute( "prenom");
      String email=(String) session.getAttribute( "email");
    %>
    
    
    
    <h7>hello mr <%= nom+" "+prenom %> your email is <%= email %> </h7>
    
    
    
    <%
        
if (session == null) {
    // Not created yet. Now do so yourself.
    session = request.getSession();
} else {
    out.println("<h1>fuck you</h1>");
}%>



<br><br><br>

<h1>
    <% String id=request.getParameter("id"); %>
    <%= id %>
</h1>
</body>
</html>