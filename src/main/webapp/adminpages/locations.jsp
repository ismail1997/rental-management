<%@page import="com.test.dao.LocationDAO"%>
<%@page import="com.test.beans.Location"%>
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
  <% List<Location> mylist =LocationDAO.getAllLocations(); 
    
  %>   
   <jsp:include page="..//adminpages//header.jsp"></jsp:include>
   <jsp:include page="..//adminpages//leftpanel.jsp"></jsp:include> 


<div style="margin-left:20%;padding:50px 0px;height:1000px;">  
    
<div class="section">
    
    <div class="container-fluid"><a class="btn btn-success" href="locationtable.jsp">Table</a><br>
    	<div class="row">
            <% for(Location l : mylist){ %>
    		<div class="col-sm-4">
    		    <div class="card profile-card-2" >
                    <div class="card-img">
                        <img class="img-fluid" id="myimg" src="data:image/jpg;base64,<%= l.getBase64Image1() %>" alt="Card image cap" />
                    </div>
                    <div class="card-body pt-1" >
                        
                        <h5 class="card-title"><%= l.getTitre() %></h5>
                       
                            <table class="table table-bordered table-responsive-sm table-striped text-left">
                                    
                                    <tr>
                                          <td>Ref</td>
                                          <td><%= l.getId() %></td>
                                    </tr>
                                    <tr>
                                          <td>Prix</td>
                                          <td><%= l.getPrix() %> Dh</td>
                                    </tr>
                                    <tr>
                                          <td>type</td>
                                          <td><%= l.getType() %></td>
                                    </tr> 
                                    <tr>
                                          <td>Ville</td>
                                          <td><%= l.getVille() %></td>
                                    </tr> 
                                    <tr>
                                          <td>Region</td>
                                          <td><%= l.getRegion() %></td>
                                    </tr> 
                                    <tr>
                                        <td><form method="post" action="../adminpages/adminlocsDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="<%= l.getId() %>">
                                                        <input type="submit"  class="btn btn-primary" value="More"/>
                                                        
                                            </form>
                                        </td>
                                        <td><form method="post" action="../otherpages/editlocation.jsp" class="inline">
                                                        <input type="hidden" name="id" value="<%= l.getId() %>">
                                                        <input type="submit"  class="btn btn-warning" value="edit"/>
                                                        
                                            </form>
                                        </td>
                                    </tr>
                                      
                            </table>
                            
                                    
                                    
                        
                    </div>
                </div>
                </div><br><br>
                  <% } %>      
            
        </div>
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


