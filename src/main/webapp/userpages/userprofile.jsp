
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.test.dao.PersonDAO"%>
<%@page import="com.test.beans.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
	<title>profile</title>
	<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <script type="text/javascript" src="..//style//js//jquery.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>  
</head>
<style type="text/css">
        body{background-color: #eee;}
	#paneluser{background-color: #eee;height: 800px;}
	#ismail{background-color: #0e1a35;color:white;height: 70px;}
	#ismail #image1{padding: 5px;margin: 17px 5px 10px 70px;height: 40px;}
	#ismail #image2{padding: 5px;margin: 17px 5px 10px 0px;height: 40px;}
	#la_date{position: absolute;top:95px;left:500px;font-weight: bold;font-size: 45px;font-family: timenewroman;}
	#status{position: absolute;top:125px;left:800px;font-weight: bold;font-size: 12px;font-family: timenewroman;}
	#statusimage{height: 40px;position: absolute;left: 1020px;top:110px;}
	#nameofuser{position: absolute;left: 1065px;top:120px;font-size: 20px;font-weight:bolder;}
	.navbarme{padding-top: 15px;padding-left: 25px;padding-right: 25px; }
	#image4{height: 40px;}
	#informations{margin-top: 8px; padding-top: 15px;padding-left: 25px;padding-right: 25px; background-color: #f8f9fa;border-radius: 15px; height: 500px;}
	.item {vertical-align: top;display: inline-block;text-align: center;padding-top: 15px;}
        
	#image5 {background-color: #f8f9fa;width: 100%;}
	.caption {display: block;}
	#valeurs{padding-left: 100px;}
	#titleinformations{padding-left: -15px; font-family: OPEN SANS;}
	#keyss{font-family: open sans;font-weight: bold;}
	#item{background-color: #fff;}
	#infopanel{background-color: #fff;}
	#myvalues{color: #0062cc;}
	#butn{width: 100%;margin: 5px; color: white;}
	#item1{background-color:  #fff;padding-top: 25px;}
	#box1 h5{font-family: open sans;font-weight: bolder;text-align: center;font-size:35px;}
	/*the second container wich is task*/
	#informations2{margin-top: 8px; padding-top: 15px;padding-left: 25px;padding-right: 25px; background-color: #f8f9fa;border-radius: 15px; }
	#informations2 h3{color:white; background-color: #0e1a35;}
	#NewTask{float: right;padding-right: 10px;}
	/*the table reservation*/
	#NewReservation{float: right;padding-right: 10px;}
	#informations3{margin-top: 8px; padding-top: 15px;padding-left: 25px;padding-right: 25px; background-color: #f8f9fa;border-radius: 15px; }
	#informations3 h3{color:white; background-color: #0e1a35;}
	/*the table logments*/
	#NewLogement{float: right;padding-right: 10px;}
	#informations4{margin-top: 8px; padding-top: 15px;padding-left: 25px;padding-right: 25px; background-color: #f8f9fa;border-radius: 15px; }
	#informations4 h3{color:white; background-color: #0e1a35;}
	#informations4 input{width:75%;}
</style>
<%
     
      
      String idstring=(String) session.getAttribute("idstring");
      
      
      Person person =new Person();
      if(idstring!=null){
          Integer id=Integer.parseInt(idstring);
       PersonDAO dao =new PersonDAO();
         person = dao.get(id);
      }else{
          person.setAddress("null");person.setBirthday("null");person.setEmail("null");
          person.setNom("null");person.setPhone("null");person.setPrenom("null");
      }
    %>
    <jsp:include page="..//commonpages//navbar.jsp"></jsp:include>
    
    
    <! --get element from data base --->
    <sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/javaee?serverTimezone=UTC" user="root" password="root" />
    <sql:query dataSource="${dbSource}" var="result">
        select * from location where etat !='reserve'
    </sql:query>
        
    <!--for reservations -->
    <c:set var = "empId" value = "<%= person.getId() %>"/>
    <sql:query dataSource="${dbSource}" var="reservations">
        select reservation.id,location.id as id_location ,location.titre,person.nom,person.prenom,location.ville,location.region from reservation,location,person where reservation.idperson=person.id and location.id=reservation.idlocation and person.id=?  ;
        <sql:param value = "${empId}" />
    </sql:query>
    <body><br><br>
	<br><br>
	<div  class="container" id="paneluser">
		<header id="ismail">
			<img id="image1" src="..//images//icon//bell.png">
			<img id="image2" src="..//images//icon//email.png">

                        <p id="la_date"><%= person.getBirthday() %></p>

			<p id="status">Status</p>
                        
			<img id="statusimage" src="data:image/jpg;base64,<%= person.getBase64Image()%>">
			<p id="nameofuser"><%= person.getNom() +" "+person.getPrenom() %></p>
		</header>
		
		<div class="navbarme">
			<nav class="navbar navbar-expand-lg navbar-light bg-light" style="border-radius: 15px;height: 60px;">
			  <a class="navbar-brand" href="#"><img src="data:image/jpg;base64,<%= person.getBase64Image()%>" id="image4"/></a>
			  <a class="navbar-brand" href="#"><%= person.getNom() +" "+person.getPrenom() %></a>
			  
			  <div class="collapse navbar-collapse" id="navbarNav">
			    <ul class="navbar-nav">
			      <li class="nav-item ">
			        <a class="nav-link" href="#" id="general">General </a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link" href="#" id="tasks">Tasks</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link " href="#" id="reservations">Reservations</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link " href="#" id="logements">Logements</a>
			      </li>
			      <li class="nav-item">
			        <a class="nav-link " href="#" id="history">History</a>
			      </li>
			    </ul>
			  </div>
			</nav>
			<div class="container" id="informations">
				<div class="row">
					<div class="col-sm-4" id="item">
						<div class="item">
						    <img id="image5" src="data:image/jpg;base64,<%= person.getBase64Image()%>"/>
						    <span class="caption">Text below the image</span>
						</div>
					</div>
					<div class="col-sm-5" id="infopanel">
						<br><br>
						<!---GENERAL INFORMATION------------------------------------------>
						<h4  id="titleinformations"><a class="card-link" href="#">Contact Information</a></h4>
						<div class="row">
							<div class="col-sm-6" id="valeurs">
								<p id="keyss">email</p>
								<p id="keyss">phone</p>
							</div>
							<div class="col-sm-6">
								<p id="myvalues"><%= person.getEmail() %></p>
								<p id="myvalues"><%= person.getPhone() %></p>
							</div>
						</div>
						<!---PERSONEL INFORMATION------------------------------------------>
						<h4 id="titleinformations"><a class="card-link" href="#">General Information</a></h4>
						<div class="row">
							<div class="col-sm-6" id="valeurs">
								<p id="keyss">First Name</p>
								<p id="keyss">Last Name</p>
								<p id="keyss">Birthday</p>
								<p id="keyss">Address</p>
							</div>
							<div class="col-sm-6">
								<p id="myvalues"><%= person.getPrenom() %></p>
								<p id="myvalues"><%= person.getNom() %></p>
								<p id="myvalues"><%= person.getBirthday() %></p>
								<p id="myvalues"><%=  person.getAddress() %></p>
							</div>
						</div>
						<!---ADDITIONAL INFORMATION------------------------------------------>
						<h4 id="titleinformations"><a class="card-link" href="#">Other Information</a></h4>
						<div class="row">
							<div class="col-sm-6" id="valeurs">
								<p id="keyss">Facebook</p>
							</div>
							<div class="col-sm-6">
								<p id="myvalues">Value</p>
							</div>
						</div>
					<!----actions--->	<!--actions------------------------------------------------------------------->
					</div>
					<div class="col-sm-3" id="item1">
						<div id="box1">
							<h5>Actions</h5>
							<a id="butn"  class="btn btn-primary">Start Reservation </a>
							<a  id="butn" class="btn btn-primary">Abort Reservation </a>
							<a id="butn"  class="btn btn-primary">Propose Logement </a>
							<a  id="butn" class="btn btn-primary">Contact Admin </a>
                                                        <a  id="butn" class="btn btn-warning" href="../otherpages/editprofile.jsp">Edit Profile </a>
							<a id="butn"  class="btn btn-primary">Show Card informations </a>
						</div>
					</div>
				</div>
				
			</div>

		<!-----Informations--------------------------------------------------------------------->
			<div class="container" id="informations2">
				<!-- Editable table -->

				<div class="card">
				  <h3 class="card-header text-center font-weight-bold text-uppercase py-4">Tasks</h3>
				  <div class="card-body">
				    <div id="table" class="table-editable">
				      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i class="fas fa-plus fa-2x"
				            aria-hidden="true"></i></a></span>
				      <button id="NewTask" class="btn btn-success btn-rounded btn-sm my-2">New</button>
				      
				      <table id="tabres" class="table table-bordered table-responsive-md table-striped text-center">
				        <tr>
				          <th class="text-center">Person Name</th>
				          <th class="text-center">Age</th>
				          <th class="text-center">Company Name</th>
				          <th class="text-center">Country</th>
				          <th class="text-center">City</th>
				          
				          <th class="text-center">Remove</th>
				        </tr>
				        <tr>
				          <td class="pt-3-half" contenteditable="true">Aurelia Vega</td>
				          <td class="pt-3-half" contenteditable="true">30</td>
				          <td class="pt-3-half" contenteditable="true">Deepends</td>
				          <td class="pt-3-half" contenteditable="true">Spain</td>
				          <td class="pt-3-half" contenteditable="true">Madrid</td>
				          <td>
				            <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
				          </td>
				        </tr>
				        <!-- This is our clonable table line -->
				        <tr>
				          <td class="pt-3-half" contenteditable="true">Guerra Cortez</td>
				          <td class="pt-3-half" contenteditable="true">45</td>
				          <td class="pt-3-half" contenteditable="true">Insectus</td>
				          <td class="pt-3-half" contenteditable="true">USA</td>
				          <td class="pt-3-half" contenteditable="true">San Francisco</td>
				          <td>
				            <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
				          </td>
				        </tr>
				        <!-- This is our clonable table line -->
				        <tr>
				          <td class="pt-3-half" contenteditable="true">Guadalupe House</td>
				          <td class="pt-3-half" contenteditable="true">26</td>
				          <td class="pt-3-half" contenteditable="true">Isotronic</td>
				          <td class="pt-3-half" contenteditable="true">Germany</td>
				          <td class="pt-3-half" contenteditable="true">Frankfurt am Main</td>
				          <td>
				            <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
				          </td>
				        </tr>
				        <!-- This is our clonable table line -->
				        <tr class="hide">
				          <td class="pt-3-half" contenteditable="true">Elisa Gallagher</td>
				          <td class="pt-3-half" contenteditable="true">31</td>
				          <td class="pt-3-half" contenteditable="true">Portica</td>
				          <td class="pt-3-half" contenteditable="true">United Kingdom</td>
				          <td class="pt-3-half" contenteditable="true">London</td>
				          
				          <td>
				            <span class="table-remove"><button type="button" class="btn btn-danger btn-rounded btn-sm my-0">Remove</button></span>
				          </td>
				        </tr>
				      </table>
				    </div>
				  </div>
				</div>
				<!-- Editable table -->				
			</div>
		<!-------------------------------------------->	
		<!--Reservation ----------------------------->
			<div class="container" id="informations3">
				<!-- Editable table -->

				<div class="card">
				  <h3 class="card-header text-center font-weight-bold text-uppercase py-4">Your Reservations</h3>
				  <div class="card-body">
				    <div id="table" class="table-editable">
				      <span class="table-add float-right mb-3 mr-2"><a href="#!" class="text-success"><i class="fas fa-plus fa-2x"
				            aria-hidden="true"></i></a></span>
				      <button id="NewReservation" class="btn btn-success btn-rounded btn-sm my-2">New</button>
				      
				      <table id="tabres" class="table table-bordered table-responsive-md table-striped text-center">
				        <tr>
				          <th class="text-center">Id location</th>
				          <th class="text-center">titre</th>
				          <th class="text-center">Name</th>
				          <th class="text-center">City</th>
				          <th class="text-center">Region</th>
				          <th class="text-center">More Details</th>
				          <th class="text-center">Remove</th>
				        </tr>
				        <tr>
				          <c:forEach var="row" items="${reservations.rows}">
                                            <tr>
                                                <td><c:out value="${row.id}"/></td>
                                                <td><c:out value="${row.titre}"/></td>
                                                <td><c:out value="${row.nom} ${row.prenom}"/></td>
                                                <td><c:out value="${row.ville}"/></td>
                                                <td><c:out value="${row.region}"/></td>
                                                <td>
                                                    <form method="post" action="../otherpages/ReservationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="${row.id}">
                                                        <button type="submit" name="submit_param" value="submit_value" class="btn btn-primary">
                                                          More Details
                                                        </button>
                                                    </form>
                                                </td>
                                                <td>
                                                    
                                                        <button  id="abort" class="btn btn-danger">
                                                          Abort Reservation
                                                        </button>
                                                    
                                                        <div id="abortpanel" style="display:none;position:absolute;top:10px;left:25%;width:400px;background: #f8f9fa;">
                                                            <form method="post" action="../AbortReservation" class="inline">
                                                                <label ><h3 style="background: #f8f9fa ;color:black">Are you sure you want to delete</h3></label>
                                                                <input type="hidden" name="idlocation" value="${row.id}">
                                                                <button type="submit" name="submit_param" class="btn btn-success">
                                                                Abort
                                                                </button>
                                                                <input id="anulabort" class="btn btn-danger" value="cancel">
                                                                
                                                            </form>
                                                        </div>
                                                </td>
                                            </tr>
                                           </c:forEach>
				        
				        
				      
				      </table>
				    </div>
				  </div>
				</div>
				<!-- Editable table -->				
			</div>
		<!-- ------------------------------------------->
		<!--Logement table  ---->	
			<div class="container" id="informations4">
				<!-- Editable table -->

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
				          <th class="text-center">Slogan</th>
				          <th class="text-center">Ville</th>
				          <th class="text-center">Region</th>
                                          <th class="text-center">Prix</th>
				          <th class="text-center">Reserver</th>
				          <th class="text-center">MoreDetails</th>
				        </tr>
                                        <c:forEach var="row" items="${result.rows}">
                                            <tr>
                                                <td><c:out value="${row.id}"/></td>
                                                <td><c:out value="${row.titre}"/></td>
                                                <td><c:out value="${row.slogan}"/></td>
                                                <td><c:out value="${row.ville}"/></td>
                                                <td><c:out value="${row.region}"/></td>
                                                <td><c:out value="${row.prix}"/></td>
                                              <td>
                                                  <form method="post" action="../otherpages/reservation.jsp" class="inline">
                                                        
                                                        <input type="hidden" name="id" value="${row.id}">
                                                        <input type="hidden" name="idperson" value="<%= person.getId()  %>">
                                                        <button type="submit"  class="btn btn-success">
                                                          Start
                                                        </button>
                                                  </form>
                                              </td>
                                              <td>
                                                    <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="${row.id}">
                                                        <button type="submit"  class="btn btn-primary">
                                                          More
                                                        </button>
                                                    </form>
                                              </td>
                                            </tr>
                                        </c:forEach>
				  
				      </table>
				    </div>
				  </div>
				</div>
				<!-- Editable table -->				
			</div>		
		<!---------------------------------------------------->	
                
                	
		</div>
	</div>





<style>
	/*controll the panels
	first hide the task panel
	*/
	#informations2,#informations3,#informations4{
		display: none;
	}
         .inline {
  display: inline;
}


</style>	
</body>
</html>


<!--
 the script to add new row in the array
 -->
<script>
$(document).ready(function(){
  $("#tasks").click(function(){
  	$("#informations").hide();
    $("#informations2").show();
    $("#informations3").hide(); 
    $("#informations4").hide();
    
  });
  $("#general").click(function(){
    $("#informations").show(); 
    $("#informations2").hide();
    $("#informations3").hide();
    $("#informations4").hide();
  });
  $("#reservations").click(function(){
    $("#informations3").show();
    $("#informations").hide(); 
    $("#informations2").hide();
    $("#informations4").hide();
  });
   $("#logements").click(function(){
    $("#informations4").show();
    $("#informations").hide(); 
    $("#informations2").hide();
    $("#informations3").hide();
  });
  $("#abort").click(function(){
    $("#abortpanel").show();
    
  });
  $("#anulabort").click(function(){
    $("#abortpanel").hide();
    
  });
  
});
	

</script>