<%-- 
    Document   : persons
    Created on : 18 janv. 2019, 16:56:09
    Author     : bouaddi_ismail
--%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.test.beans.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <link rel='stylesheet' href="..//style//css//bootstrap.css">
        <script type="text/javascript" src="..//style//js//jquery.min.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>
    </head>
    <body>
  <% List<Person> list=PersonDAO.getAllPersons();  %>      
<div class="section">
    <div class="container-fluid">
    	<div class="row">
            <% for(Person p : list){ %>
    		<div class="col-sm-3">
    		    <div class="card profile-card-2" >
                    <div class="card-img">
                        <img class="img-fluid" id="myimg" src="data:image/jpg;base64,<%= p.getBase64Image()%>" alt="Card image cap" />
                    </div>
                    <div class="card-body pt-1" >
                        
                        <h5 class="card-title"><%= p.getNom()+" "+p.getPrenom() %></h5>
                       
                            <table class="table table-bordered table-responsive-sm table-striped text-left">
                                     
                                    <tr>
                                          <td>Email</td>
                                          <td><%= p.getEmail() %></td>
                                    </tr>
                                    <tr>
                                          <td>Phone</td>
                                          <td><%= p.getPhone() %></td>
                                    </tr> 
                                    <tr>
                                          <td>Birthday</td>
                                          <td><%= p.getBirthday() %></td>
                                    </tr> 
                                    <tr>
                                          <td>Address</td>
                                          <td><%= p.getAddress() %></td>
                                    </tr> 
                                     
                                      
                            </table>
                            
                        
                        
                    </div>
                </div>
                </div><br><br>
                  <% } %>      
            
        </div>
    </div>
</div>    
    </body>
    
<style>
/*not necessary*/

@import url("../style/css/font-awesome.min.css");
body{font-family:Nunito,arial,sans-serif;}
.section{float:left;width:100%;background: #fff;padding:30px 0;}
.promote{border:1px dashed #ddd;display:flex; height:100%;justify-content: center;flex-direction: column;align-items: stretch;}
.col-sm-3{padding:10px;}

/*not necessary*/


.card profile-card-2{
    background-color: #007bff;
}

.profile-card-2 h5{
    font-weight:600;
    color:#007bff;
}



.card-img img{
	height: 200px;
        width: 100%;
        /*padding: 5px 50px 0px 80px;*/
}
.card{
    background-color:#eee;
}
    </style>    
</html>







