<%@page import="com.test.beans.Person"%>
<%@page import="com.test.dao.PersonDAO"%>
<!DOCTYPE html>

<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' href="style//css//bootstrap.min.css">
        <link rel='stylesheet' href="style//css//bootstrap.css">
        <script type="text/javascript" src="style//js//jquery.min.js" ></script>
        <script type="text/javascript" src="style//js//bootstrap.min.js" ></script>
    </head>
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
    <body>
       
        <BR>
        <style>
            #signupbutton{
                display: none;
            }
        </style>

   
        <div class="container-fluid">
            <form method="post" action="EditServlet" enctype="multipart/form-data">
                <div class='row form-style-10'>
                    <div class='col-sm-6'>
                        <div class="section"><span>1</span>le nom et le prenom</div>
                        <div class="inner-wrap">
                            <label>Nom <input type="text" name="nom"  value="<%= person.getNom() %>" required/></label>
                            <label>Prenom<input type="text" name="prenom" value="<%= person.getPrenom() %>" required/></label>
                        </div>
                        <br>
                        <div class="section"><span>2</span>Email & Phone</div>
                        <div class="inner-wrap">
                            <label>Email Address <input type="email" name="email" value="<%= person.getEmail() %>"required/></label>
                            <label>Phone Number <input type="text" name="phone" value="<%= person.getPhone() %>" required/></label>
                        </div>
                        
                        <div class="section"><span>4</span>Date de Naisssance et Address</div>
                        <div class="inner-wrap">
                            <label>Date de naissance <input type="date" name="birthday"  value="<%= person.getBirthday() %>" required/></label>
                            <label>Address <input type="text" name="address" value="<%= person.getAddress() %>" required/></label>
                        </div>
                    </div>
                        <div class='col-sm-6'>
                            <div class="section"><span>1</span>Picture or Image</div>
                            <div class="inner-wrap">
                                <img src="images/image1/login.png" height="100px"/>
                                <label>Change Image<input type="file" name="image" /></label>
                            </div>
                            
                            <div class="section"><span>3</span>Passwords</div>
                            <div class="inner-wrap">
                                <label>Password <input type="password" name="password" value="<%= person.getPassword() %>" required/></label>
                                <label>Confirm Password <input type="password" name="password_confirmation" value="<%= person.getPassword_confirmation() %>" required/></label>
                            </div>
                            
                            <div class="button-section">
                                <br><br><br><br><br><br>
                                <input id="cc" type="submit" value="register" class="btn btn-success" />
                                <input  id="cc2" type="reset"  value="  reset  " class="btn btn-danger" />
                            </div>
                        </div>
                </div>
            </form>
        </div>

<style type="text/css">
#cc{ 
    width: 100px;
   margin-left: 50px;
}  
#cc2{ 
    width: 100px;
   
}    
.form-style-10{
	width:700px;
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
.form-style-10 .inner-wrap{
	padding: 30px;
	background: #F8F8F8;
	border-radius: 6px;
	margin-bottom: 15px;
}
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
	color: #2A88AD;
	margin-bottom: 5px;
}
.form-style-10 .section span {
	background: #2A88AD;
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
.form-style-10 .privacy-policy{
	float: right;
	width: 250px;
	font: 12px Arial, Helvetica, sans-serif;
	color: #4D4D4D;
	margin-top: 10px;
	text-align: right;
}
</style>
    </body>
</html>