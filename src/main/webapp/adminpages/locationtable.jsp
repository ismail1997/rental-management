<%-- 
    Document   : locationtable
    Created on : 19 janv. 2019, 12:48:45
    Author     : bouaddi_ismail
--%>
<%@page import="java.util.List"%>
<%@page import="com.test.dao.LocationDAO"%>
<%@page import="com.test.dao.LocationDAO"%>
<%@page import="com.test.beans.Location"%>
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
    <% List<Location> mylist =LocationDAO.getAllLocations(); %>
    <body>
           <jsp:include page="..//adminpages//header.jsp"></jsp:include>
   <jsp:include page="..//adminpages//leftpanel.jsp"></jsp:include>
<div style="margin-left:20%;padding:50px 0px;height:1000px;">   
        <!--Logement table  ---->	
<div class="container" id="informations4">
				<!-- Editable table -->
                                <a class="btn btn-success" href="locations.jsp">Advanced</a>
				<div class="card">
				  <h3 class="card-header text-center font-weight-bold text-uppercase py-4">Logements</h3>
				  <div class="card-body">
				    <div id="table" class="table-editable">
				      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i class="fas fa-plus fa-2x"
				            aria-hidden="true"></i></a></span>
				      
				      
				      <table id="tabres" class="table table-bordered table-responsive-md table-striped text-center">
				        <tr>
				          <th class="text-center">Id</th>
				          <th class="text-center">Titre</th>
				          <th class="text-center">Type</th>
				          <th class="text-center">Ville</th>
				          <th class="text-center">Region</th>
                                          <th class="text-center">Prix</th>
				          <th class="text-center">MoreDetails</th>
				          <th class="text-center">Edit</th>
                                          <th class="text-center">Remove</th>
				        </tr>
                                        <% for (Location l :mylist){ %>
                                            <tr>
                                                <td><c:out value="<%= l.getId()  %>"/></td>
                                                <td><c:out value="<%= l.getTitre()  %>"/></td>
                                                <td><c:out value="<%= l.getType()  %>"/></td>
                                                <td><c:out value="<%= l.getVille()  %>"/></td>
                                                <td><c:out value="<%= l.getRegion()  %>"/></td>
                                                <td><c:out value="<%= l.getPrix()  %>"/></td>
                                              <td>
                                                    <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="<%= l.getId()  %>">
                                                        <button type="submit"  class="btn btn-primary">
                                                          More details
                                                        </button>
                                                    </form>
                                              </td>
                                              <td>
                                                    <form method="post" action="../otherpages/editlocation.jsp" class="inline">
                                                        <input type="hidden" name="id" value="<%= l.getId() %>">
                                                        <input type="submit"  class="btn btn-warning" value="edit"/>
                                                        
                                                    </form>
                                              </td>
                                              <td>
                                                    <button  id="abort" class="btn btn-danger">
                                                          Remove
                                                        </button>
                                                    
                                                        <div id='abortpanel' style='display:none;position:absolute;top:10px;left:25%;width:400px;background: #f8f9fa;'>
                                                            <form method='post' action='../DeleteLogement' class='inline'>
                                                                <label ><h3 style='background: #f8f9fa ;color:black'>Are you sure you want to delete</h3></label>
                                                                <input type='hidden' name='idlocation' value='<%= l.getId()  %>'>
                                                                <button type='submit' name='submit_param' class='btn btn-success'>
                                                                Remove Logement
                                                                </button>
                                                                <input id='anulabort' class='btn btn-danger' value='cancel'>
                                                                
                                                            </form>
                                                        </div>
                                              </td>
                                            </tr>
                                            
                                        <% }%>
				  
				      </table>
				    </div>
				  </div>
				</div>
				<!-- Editable table -->				
</div>	
</div>  
    </body>
    
    <style>
        #informations4{margin-top: 8px; padding-top: 15px;padding-left: 25px;padding-right: 25px; background-color: #f8f9fa;border-radius: 15px; }
	#informations4 h3{color:white; background-color: #0e1a35;}
	#informations4 input{width:75%;}
        #deleteEmployeeModal{display:none;}
    </style>  
    <script>
        $(document).ready(function(){
            $("#del").click(function (){
                $("$(document")
            });

  $("#anulabort").click(function(){
    $("#abortpanel").hide();
    
  });
  
});
	
        });
    </script>
</html>
