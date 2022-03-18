<%@page import="com.test.beans.Location"%>
<%@page import="com.test.dao.LocationDAO"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>location</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        	<link href="css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <link rel='stylesheet' href="..//style//css//bootstrap.css">
        <script type="text/javascript" src="..//style//js//jquery.min.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>
    </head>
<%  
    LocationDAO ddd=new LocationDAO();
    String idstring=request.getParameter("id");
    Location loc;
    if(idstring==null)
    {   
         loc=ddd.getLocation(4);
    }else{
        int id=Integer.parseInt(idstring);
         loc=ddd.getLocation(id);
    }
%>    
<jsp:include page="..//adminpages//header.jsp"></jsp:include>
<jsp:include page="..//adminpages//leftpanel.jsp"></jsp:include>
<div style="margin-left:20%;padding:50px 0px;height:1000px;">    
<body>
<div class="container">
    <div class="form-style-10">
        <h1>Edite Loacation<span>modify location </span></h1>
        <form method="post" action="../EditLocationServlet" enctype="multipart/form-data">
            <div class="row">
            	<div class="col-sm-4">
            		<div class="section"><span>1</span>le titre et la reference</div>
                    <div class="inner-wrap">
                        <label>id <input type="text" name="id" value='<%= loc.getId() %>' /></label>
                        <label>titre <input type="text" name="titre" value='<%= loc.getTitre() %>' required/></label>
                        <label>slogan <input type="text" name="slogan" value='<%= loc.getSlogan() %>' required/></label>
                    </div>
                    <div class="section"><span>4</span>Frais & Prix</div>
                        <div class="inner-wrap">
                        <label>Prix <input type="text" name="prix" value='<%= loc.getPrix() %>' required/></label>
                    </div>
                    <div class="section"><span>2</span>Regle and Description</div>
                    <div class="inner-wrap">
                        <label>Regle <textarea name="regle" value='' required><%= loc.getRegle()%></textarea></label>
                        <label>Description <textarea name="description" value='' required><%= loc.getDescription() %></textarea></label>
                    </div>
                    <div class="section"><span>2</span>Address and Region</div>
                    <div class="inner-wrap">
                        <label>Ville <input type="text" name="ville" value='<%= loc.getVille()%>'required/></label>
                        <label>Region <input type="text" name="region" value='<%= loc.getRegion() %>'required/></label>
                        <label>Address <textarea name="address" required><%= loc.getAddress()%></textarea></label>
                    </div> 
            	</div>
            	<div class="col-sm-4">
                        <div class="section"><span>5</span>Types</div>
                        <div class="inner-wrap">
                            <label>type </label>
                            <select name="type" >
                                    <option value='<%= loc.getType() %>'><%= loc.getType() %></option>
                                    <option value="Maison">Maison</option>
                                    <option value="Appartement">Appartement</option>
                                    <option value="Riad">Riad</option>
                                    <option value="villa">villa</option>
                            </select>
                        </div>
            		<div class="section"><span>4</span>Other options</div>
                        <div class="inner-wrap">
                        <label>surface <input type="text" name="surface" value='<%= loc.getSurface()%>'required/></label>
                        <label>nombre de chambre <input type="text" name="nbrchambre"value='<%= loc.getNbrchambre() %>' required/></label>
                        <label>nombre de salon <input type="text" name="nbrsalon" value='<%= loc.getNbrsalon() %>'required/></label>
                        <label>nombre de salle de bain <input type="text" name="nbrsalledebain" value='<%= loc.getNbrsalledebain()%>' required/></label>
                        <label>balcon</label>
                        <select name="balcon" required type="text" >
                                <option value="<%= loc.getBalcon() %>"><%= loc.getBalcon() %></option>
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                        </select>
                        <label>Garage</label>
                        <select name="garage" required type="text" >
                                <option value="<%= loc.getGarage()%>"><%= loc.getGarage()%></option>
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                        </select>
                        <label>parking</label>
                        <select name="parking" required type="text" >
                                <option value='<%= loc.getParking()%>'><%= loc.getParking()%></option>
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                        </select>
                        <label>jardin </label>
                        <select name="jardin" required type="text" >
                                <option value='<%= loc.getJardin()%>'><%= loc.getJardin()%></option>
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                        </select>
                        <label>grenier </label>
                        <select name="grenier" required type="text" >
                                <option value="<%= loc.getGrenier()%>"><%= loc.getGrenier()%></option>
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                        </select>
                    </div>
            		

                    
            	</div>
            	<div class="col-sm-4">

            		<div class="section"><span>3</span>Images </div>
                    <div class="inner-wrap">
                        <img id="img1" src="data:image/jpg;base64,<%= loc.getBase64Image1() %>" height="100px" width="100%" />
                        <label>Image 1 <input type="file" name="image1" ></label>
                        
                        <img id="img2" src="data:image/jpg;base64,<%= loc.getBase64Image2() %>" height="100px" width="100%"/>
                        <label>Image 2 <input type="file" name="image2"  ></label>
                        
                        <img id="img3" src="data:image/jpg;base64,<%= loc.getBase64Image3() %>" height="100px" width="100%"/>
                        <label>Image 3 <input type="file" name="image3"  ></label>
                        
                        <img id="img4" src="data:image/jpg;base64,<%= loc.getBase64Image4() %>" height="100px" width="100%"/>
                        <label>Image 4 <input type="file" name="image4"  ></label>
                        
                        <img id="img5" src="data:image/jpg;base64,<%= loc.getBase64Image5() %>" height="100px" width="100%"/>
                        <label>Image 5 <input type="file" name="image5"  ></label>
                    </div>
                    <div class="row" style="padding:15px;margin-top: 50px;">
                        <div class="col-sm-6">
                            <div >
                                <input type="submit" style="width:100px;height: 50px;float:right;" class="btn btn-success" value='valider' />
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div >
                            <input type="reset"  style="width:100px;height: 50px;" class="btn btn-danger"  value="reset "/>
                            </div>
                        </div>
                    </div>
            	</div>
            </div>  
		</form>
	</div>
</div>
  <img class="myimages" id="myimg1" src="data:image/jpg;base64,<%= loc.getBase64Image1() %>" width="600px" height="400px">
  <img class="myimages" id="myimg2" src="data:image/jpg;base64,<%= loc.getBase64Image2() %>" width="600px" height="400px">
  <img class="myimages" id="myimg3" src="data:image/jpg;base64,<%= loc.getBase64Image3() %>" width="600px" height="400px">
  <img class="myimages" id="myimg4" src="data:image/jpg;base64,<%= loc.getBase64Image4() %>" width="600px" height="400px">
  <img class="myimages" id="myimg5" src="data:image/jpg;base64,<%= loc.getBase64Image5() %>" width="600px" height="400px"> 
</div>
                 
                    
   
 </body>
 <style type="text/css">
      	.myimages{
  		position: absolute;
  		top:30%;
  		left: 26%;
  		display: none;
  	}
 </style>  

<style type="text/css">
.form-style-10{
	width:1000px;
	padding:30px;
	margin:40px auto;
	background: #eee;
	border-radius: 10px;
	-webkit-border-radius:10px;
	-moz-border-radius: 10px;
	box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
	-moz-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
	-webkit-box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.13);
}
.form-style-10 .inner-wrap{
	padding: 30px;
	background: #F8F8F8;
	border-radius: 6px;
	margin-bottom: 15px;
}
.form-style-10 h1{
	background: #0e1a35;
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
.form-style-10 h1 > span{
	display: block;
	margin-top: 2px;
	font: 13px Arial, Helvetica, sans-serif;
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

.form-style-10 .section{
	font: normal 20px 'Bitter', serif;
	color: #0e1a35;
	margin-bottom: 5px;
}
.form-style-10 .section span {
	background: /*2A88AD*/#0e1a35;
	padding: 5px 10px 5px 10px;
	position: absolute;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	border: 4px solid #fff;
	font-size: 14px;
	margin-left: -45px;
	color: #fff;
	margin-top: -3px;
}


.form-style-10 input[type="button"]:hover, 
.form-style-10 input[type="submit"]:hover{
	background: #23e86d;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
}
.form-style-10 input[type="reset"]:hover{
	background: #ff0055;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.28);
}
.form-style-10 .privacy-policy{
	float: right;
	width: 250px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #4D4D4D;
	margin-top: 10px;
	text-align: right;
}
</style>
   <script type="text/javascript">
 $(document).ready(function(){
  $("#img1").mouseenter(function(){
  	$("#myimg1").show();
 });
    $("#img1").mouseleave(function(){
  	$("#myimg1").hide();
 });
 /**/
   $("#img2").mouseenter(function(){
  	$("#myimg2").show();
 });
    $("#img2").mouseleave(function(){
  	$("#myimg2").hide();
 });/**/
    $("#img3").mouseenter(function(){
  	$("#myimg3").show();
 });
    $("#img3").mouseleave(function(){
  	$("#myimg3").hide();
 });
 /**/
    $("#img4").mouseenter(function(){
  	$("#myimg4").show();
        $("#myimg4").css("top","400px");
 });
    $("#img4").mouseleave(function(){
  	$("#myimg4").hide();
 });
 /**/
    $("#img5").mouseenter(function(){
  	$("#myimg5").show();
        $("#myimg5").css("top","600px");
 });
    $("#img5").mouseleave(function(){
  	$("#myimg5").hide();
        
 });
});
   </script> 
   
</html>