<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>location</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
       <div class="form-style-10">
<h1>Create Loacation<span>creer location </span></h1>
<form method="post" action="../uploadServlet" enctype="multipart/form-data">
        <div class="section"><span>1</span>le titre et la reference</div>
    <div class="inner-wrap">
        <label>titre <input type="text" name="titre" required/></label>
        <label>slogan <input type="text" name="slogan" required/></label>
    </div>
    
    <div class="section"><span>2</span>Regle and Description</div>
    <div class="inner-wrap">
        <label>Regle <textarea name="regle" required></textarea></label>
        <label>Description <textarea name="description" required></textarea></label>
    </div>
    
    <div class="section"><span>2</span>Address and Region</div>
    <div class="inner-wrap">
        <label>Ville <input type="text" name="ville" required/></label>
        <label>Region <input type="text" name="region" required/></label>
        <label>Address <textarea name="address" required></textarea></label>
    </div>
    

    <div class="section"><span>3</span>Images </div>
    <div class="inner-wrap">
        <label>Image 1 <input type="file" name="image1" value="fileupload" ></label>
        <label>Image 2 <input type="file" name="image2" value="fileupload" ></label>
        <label>Image 3 <input type="file" name="image3" value="fileupload" ></label>
        <label>Image 4 <input type="file" name="image4" value="fileupload" ></label>
        <label>Image 5 <input type="file" name="image5" value="fileupload" ></label>
    </div>

    <div class="section"><span>4</span>Frais & Prix</div>
        <div class="inner-wrap">
        <label>Prix <input type="text" name="prix" required/></label>
       <!-- <label>Confirm Password <input type="password" name="confirmpassword" required/></label>-->
    </div>
    <div class="section"><span>5</span>Types</div>
        <div class="inner-wrap">
        <label>type </label>
        <select name="type">
                <option value="Maison">Maison</option>
                <option value="Appartement">Appartement</option>
                <option value="Riad">Riad</option>
                <option value="villa">villa</option>
        </select>
       <!-- <label>Confirm Password <input type="password" name="confirmpassword" required/></label>-->
    </div>
    <div class="section"><span>4</span>Other options</div>
        <div class="inner-wrap">
        <label>surface <input type="text" name="surface" required/></label>
        <label>nombre de chambre <input type="text" name="nbrchambre" required/></label>
        <label>nombre de salon <input type="text" name="nbrsalon" required/></label>
        <label>nombre de salle de bain <input type="text" name="nbrsalledebain" required/></label>
        <label>balcon <input type="text" name="balcon" required/></label>
        <label>Garage <input type="text" name="garage" required/></label>
        <label>parking <input type="text" name="parking" required/></label>
        <label>jardin <input type="text" name="jardin" required/></label>
        <label>grenier <input type="text" name="grenier" required/></label>
       <!-- <label>Confirm Password <input type="password" name="confirmpassword" required/></label>-->
    </div>
    <div class="button-section">
            <input type="submit" value='valider'name="Sign Up" />
    </div>
    <div class="button-section">
            <input type="reset" value="   reset "/>
    </div>    
    </div>
</form>
</div>
  
<style type="text/css">
.form-style-10{
	width:450px;
	padding:30px;
	margin:40px auto;
	background: #FFF;
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
.form-style-10 input[type="button"], 
.form-style-10 input[type="submit"]{
	background: #4CAF50;
	padding: 8px 20px 8px 20px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	border: 1px solid #257C9E;
	font-size: 15px;
}
.form-style-10 input[type="reset"]{
	background: #f11131;
	padding: 8px 20px 8px 20px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	color: #fff;
	text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.12);
	font: normal 30px 'Bitter', serif;
	-moz-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	-webkit-box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	box-shadow: inset 0px 2px 2px 0px rgba(255, 255, 255, 0.17);
	border: 1px solid #257C9E;
	font-size: 15px;
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
    </body>
</html>

