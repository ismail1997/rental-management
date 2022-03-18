<%-- 
    Document   : showimages
    Created on : 10 déc. 2018, 23:57:44
    Author     : ismail bouaddi
--%>

<%@page import="com.test.beans.Location"%>
<%@page import="com.test.dao.LocationDAO"%>
<%@page import="com.test.beans.Person"%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.test.connectdatabase.ConnectDataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            PersonDAO dao =new PersonDAO();
            Person person = dao.get(1);
            LocationDAO ddd=new LocationDAO();
            Location loc=ddd.getLocation(1);
            
            
        
        %>
            <table style="width:100%">
            <tr>
                <th>image</th>
            </tr>
            <tr>
                <td> <img src="data:image/jpg;base64,<%= person.getBase64Image()%>" width="100" height="100"/></td>
               <td> <img src="data:image/jpg;base64,<%= loc.getBase64Image1() %>" width="100" height="100"/></td>
            </tr>
        </table>
  
    </body>
</html>
