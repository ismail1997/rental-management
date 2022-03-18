<%-- 
    Document   : locationDetails
    Created on : 13 janv. 2019, 17:12:31
    Author     : bouaddi_ismail
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.test.beans.Location"%>
<%@page import="com.test.dao.LocationDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>location</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <link rel='stylesheet' href="..//style//css//bootstrap.css">
        <script type="text/javascript" src="..//style//js//jquery.min.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>
	<link rel="stylesheet" href="..//style//css//doc.css">
</head>
<style type="text/css">
	body{background:#0e1a35;}
	#louer{float: right;width: 100px;margin-top:10px;}
	#agent h5{padding-left: 30px;}
	#btns{padding-top: 20px;padding-left: 25%;}
	.table-wrapper-scroll-y {
display: block;
max-height: 400px;
overflow-y: auto;
-ms-overflow-style: -ms-autohiding-scrollbar;
}
</style>

<%  
    LocationDAO ddd=new LocationDAO();
    String idstring=request.getParameter("id");
    Location loc;
    if(idstring==null)
    {   
         loc=ddd.getLocation(1);
    }else{
        int id=Integer.parseInt(idstring);
         loc=ddd.getLocation(id);
    }
    
   
    
    
%>
<body>
	<div style="margin-top:50px; background-color: #eee;" class="container">
		<h1><%= loc.getTitre() %> </h1>
		<div class="row">
			<div class="col-sm-8" style="background-color: #fff;">
				<!--<img src="images/img4.jpg" width="100%" style="padding: 15px;">-->
				<div class="w3-content" style="max-width:1200px ;padding: 15px;">
				  <img class="mySlides" src="data:image/jpg;base64,<%= loc.getBase64Image1() %>" style="width:100%;height:400px;display:none">
				  <img class="mySlides" src="data:image/jpg;base64,<%= loc.getBase64Image2() %>" style="width:100%;height:400px;">
				  <img class="mySlides" src="data:image/jpg;base64,<%= loc.getBase64Image3() %>" style="width:100%;height:400px;display:none">
				  <img class="mySlides" src="data:image/jpg;base64,<%= loc.getBase64Image4() %>" style="width:100%;height:400px;display:none">
				  <img class="mySlides" src="data:image/jpg;base64,<%= loc.getBase64Image5() %>" style="width:100%;height:400px;display:none">

				  <div class="w3-row-padding w3-section">
				    
				      <img class="demo w3-opacity w3-hover-opacity-off" src="data:image/jpg;base64,<%= loc.getBase64Image1() %>" style="width:100px;height:50px;cursor:pointer" onclick="currentDiv(1)">
				    
				    
				      <img class="demo w3-opacity w3-hover-opacity-off" src="data:image/jpg;base64,<%= loc.getBase64Image2() %>" style="width:100px;height:50px;cursor:pointer" onclick="currentDiv(2)">
				    
				    
				      <img class="demo w3-opacity w3-hover-opacity-off" src="data:image/jpg;base64,<%= loc.getBase64Image3() %>" style="width:100px;height:50px;cursor:pointer" onclick="currentDiv(3)">

				      <img class="demo w3-opacity w3-hover-opacity-off" src="data:image/jpg;base64,<%= loc.getBase64Image4() %>" style="width:100px;height:50px;cursor:pointer" onclick="currentDiv(4)">

				      <img class="demo w3-opacity w3-hover-opacity-off" src="data:image/jpg;base64,<%= loc.getBase64Image5() %>" style="width:100px;height:50px;cursor:pointer" onclick="currentDiv(5)">
				    
				  </div>
				</div>

			</div>
			<div class="col-sm-4" style="background-color: #fff;">
				<img src="../images/image1/login.png"  style="border-radius:50%;width:300px;height: 200px;padding-left:60px;padding-top: 15px;">
				<div id="agent" style="padding-left: 25px;">
					<p><h6><strong>Agent/Societe   </strong></h6><h5 class="text-primary">ismail</h5></p>
					<h6><strong>Propriatire     </strong></h6><h5 class="text-primary">ismail</h5>
				</div>
				<h4 style="padding-left: 25%;color:navy;font-weight: bolder;"><%= loc.getPrix() %> DH</h4>
				<div id="btns">
					<button class="btn btn-success">Contacter l'agent</button>
				</div>

			</div>
		</div>
		<br>
		<h3>Description</h3><br>
		<div class="row">
			<div class="col-sm-8 table-wrapper-scroll-y"  >
				<table class="table table-hover table-bordered table-striped " style="overflow-y: scroll;">
					<tr>
						<td>Price</td>
						<td><%= loc.getPrix() %> DH</td>
					</tr>
					<tr>
						<td>Type</td>
						<td><%= loc.getType() %> </td>
					</tr>
					<tr>
						<td>Ville</td>
						<td><%= loc.getVille() %></td>
					</tr>
					<tr>
						<td>Region</td>
						<td><%= loc.getParking() %></td>
					</tr>
					<tr>
						<td>Addreess</td>
						<td><%= loc.getAddress() %> </td>
					</tr>
					<tr>
						<td>Surface</td>
						<td><%= loc.getSurface() %></td>
					</tr>
					<tr>
						<td>NbrChambre</td>
						<td><%= loc.getNbrchambre() %> </td>
					</tr>
					<tr>
						<td>NbrSalon</td>
						<td><%= loc.getNbrsalon() %></td>
					</tr>
					<tr>
						<td>NbrSalleDeBain</td>
						<td><%= loc.getNbrsalledebain() %></td>
					</tr>
					<tr>
						<td>Balcon</td>
						<td><%= loc.getBalcon() %></td>
					</tr>
					<tr>
						<td>Garage</td>
						<td><%= loc.getGarage() %></td>
					</tr>
					<tr>
						<td>Parking</td>
						<td><%= loc.getParking() %></td>
					</tr>
					<tr>
						<td>Jardin</td>
						<td><%= loc.getJardin() %></td>
					</tr>
					<tr>
						<td>Grenier</td>
						<td><%= loc.getGrenier() %></td>
					</tr>
				</table>
			</div>
			<div class="col-sm-4">
				<div class="card" style="width: 100%;">
				  <div class="card-body">
				    <h5 class="card-title">More Details</h5>
				    <br>
				    <table class="table table-hover table-bordered table-striped ">
				    	<tr>
				    		<td>status</td>
				    		<td class="text-primary">LIBRE</td>
				    	</tr>
				    	<tr>
				    		<td>NfoisReserveé</td>
				    		<td class="text-primary">72</td>
				    	</tr>
				    	<tr>
				    		<td>LastTimeReserved</td>
				    		<td class="text-primary">12/2018</td>
				    	</tr>

				    </table>
				    
				    <a href="#" class="card-link">Add to favorites</a>
				  </div>
				</div>
			</div>
		</div>

		<br>
		<h3 class="text-primary">Regle and Description</h3>
		<div class="row">
			<div class="col-sm-8">
				<div class="row">
					<div class="col-sm-6"><strong>regle:</strong>
						<div><p><%= loc.getRegle() %></p></div>
					</div>
					<div class="col-sm-6"><strong>Description:</strong>
						<p><%= loc.getDescription() %></p>
					</div>
				</div>	
			</div>
			<div class="col-sm-4"></div>
		</div>
	</div>
</body>
</html>

<script>
function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" w3-opacity-off", "");
  }
  x[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " w3-opacity-off";
}
</script>