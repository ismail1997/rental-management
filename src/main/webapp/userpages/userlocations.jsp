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



    <jsp:include page="..//commonpages//navbar.jsp"></jsp:include>
    <br>
<div class="section">
    <div class="container-fluid">
                                                <style>
                                                    #titre{margin-top: 12px;}
                                                    #myInput {
                                                            background-image: url('/css/searchicon.png');
                                                            background-position: 10px 10px;
                                                            background-repeat: no-repeat;
                                                            width: 60%;
                                                            font-size: 16px;
                                                            padding: 12px 20px 12px 40px;
                                                            border: 1px solid #ddd;
                                                            margin-bottom: 12px;
                                                            margin-left: 200px;
                                                            margin-top: 12px;
}                                               </style>						
                                                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names.."  >
    	<div class="row">
            <% for(Location l : mylist){ %>
    		<div class="col-sm-3">
    		    <div class="card profile-card-1" >
                    <div class="card-img">
                        <img class="img-fluid" id="myimg" src="data:image/jpg;base64,<%= l.getBase64Image1() %>" alt="Card image cap" />
                    </div>
                    <div class="card-body pt-1" >
                        
                        <h5 class="card-title"><%= l.getTitre() %></h5>
                       
                            <table id="myTable" class="table table-bordered table-responsive-sm table-striped text-left">
                                    
                                    <tr>
                                          <td>Ref</td>
                                          <td><%= l.getId() %></td>
                                    </tr>
                                    <tr>
                                          <td>Prix</td>
                                          <td><%= l.getPrix() %></td>
                                    </tr>
                                    <tr>
                                          <td>type</td>
                                          <td><%= l.getType() %></td>
                                    </tr> 
                                    <tr id="ville">
                                          <td>Ville</td>
                                          <td><%= l.getVille() %></td>
                                    </tr> 
                                    <tr>
                                          <td>Region</td>
                                          <td><%= l.getRegion() %></td>
                                    </tr> 
                                     
                                      
                            </table>
                            
                                    <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="<%= l.getId() %>">
                                                        <button type="submit"  class="btn btn-primary">
                                                          More
                                                        </button>
                                    </form>
                        
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
    
<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>     
</html>



