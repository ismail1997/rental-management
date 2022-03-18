<%@page import="com.test.beans.Location"%>
<%@page import="com.test.dao.LocationDAO"%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page import="com.test.beans.Person"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <script type="text/javascript" src="..//style//js//jquery.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>  
    </head>
    <% String idperson=request.getParameter("idperson"); 
       String idlocation=request.getParameter("id");
       LocationDAO ddd=new LocationDAO();
    
        Location loc;
        if(idlocation==null)
        {   
             loc=ddd.getLocation(1);
        }else{
            int id=Integer.parseInt(idlocation);
            loc=ddd.getLocation(id);
        }
    
       Person person =new Person();
      if(idperson!=null){
          Integer idd=Integer.parseInt(idperson);
        PersonDAO dao =new PersonDAO();
         person = dao.get(idd);
      }else{
          person.setAddress("null");person.setBirthday("null");person.setEmail("null");
          person.setNom("null");person.setPhone("null");person.setPrenom("null");
      } 
    %>
    <body>
        <jsp:include page="..//commonpages//navbar.jsp"></jsp:include>
        <br>
        <div class="container form-style-10">
            <form role="form" method="post" action="../ReserverServlet">
                <h1>RESERVATION DETAILS :</h1>
                <div class="form-group">
                  <label for="name">Person Name :</label>
                  <input type="text" class="form-control" disabled="" id="name" value="<%= person.getNom()+" "+ person.getId() %>">
                  <input type="text" class="form-control" name="idperson" hidden="" value="<%= person.getId() %>">
                </div>
                <div class="form-group">
                  <label for="pwd">Location titre:</label>
                  <input type="text" class="form-control" disabled=""  id="pwd" value="<%= loc.getTitre() %>">
                  <input type="text" class="form-control" name="idlocation" hidden="" value="<%= loc.getId()  %>">
                </div>
                <div class="form-group">
                  <label for="datedepart">Date depart:</label>
                  <input type="date" id="datedepart" name="datedepart" value="<%= person.getBirthday() %>" disabled="" > 
                </div>
                <div class="form-group">
                  <label for="datefin">Date fin:</label>
                  <input type="date" id="datefin" class="" name="datefin"> 
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
        </div>
    </body>
    <style>
 .form-style-10 h1{
	background: #2A88AD;
	padding: 20px 30px 15px 30px;
	margin: -30px -30px 30px -30px;
	border-radius: 10px 10px 0 0;
	-webkit-border-radius: 10px 10px 0 0;
	-moz-border-radius: 10px 10px 0 0;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	border: 1px solid #257C9E;
}       
.form-style-10{
	width:600px;
	padding:30px;
	margin:40px auto;
	background: #fff;
	border-radius: 10px;
	-webkit-border-radius:10px;
	-moz-border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
	-moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
	-webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
}
.form-style-10 label{
	display: block;
	font: 13px Arial, Helvetica, sans-serif;
	color: #888;
	margin-bottom: 15px;
}
.form-style-10 input[type="text"],
.form-style-10 input[type="date"],
.form-style-10 input[type="datetime"],
.form-style-10 input[type="email"],
.form-style-10 input[type="number"],
.form-style-10 input[type="search"],
.form-style-10 input[type="time"],
.form-style-10 input[type="url"],
.form-style-10 input[type="password"],
.form-style-10 textarea,
.form-style-10 select {
	display: block;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	width: 100%;
	padding: 8px;
	border-radius: 6px;
	-webkit-border-radius:6px;
	-moz-border-radius:6px;
	border: 2px solid #fff;
	box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
	-moz-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
	-webkit-box-shadow: inset 0px 1px 1px rgba(0, 0, 0, 0.33);
}

    </style>    
</html>
