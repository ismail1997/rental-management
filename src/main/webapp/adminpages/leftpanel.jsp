
<%@page import="com.test.beans.Person"%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="ul2">
    <h3 id ="DASHBOARD"><li><a href="../adminpages/adminpanel.jsp">DASHBOARD</a></li></h3>
                <br>
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
                <img id="imageprincipale" src="data:image/jpg;base64,<%= person.getBase64Image()%>" width="50" height="50"/>
                <h6 id="myname1"><%= person.getNom() %></h6>
                <h6 id="myname2">sdsd</h6>
                <h7 id="typeofme">The Admin</h7>
                <div id="divper">
                    <img src="..//images//icon//other_admins.png" id="other_admins"/>
                    <img src="..//images//icon//admin_profile.png" id="admin_profile"/>
                    <img src="..//images//icon//users.png" id="usersimage"/>
                    <img src="..//images//icon//top_member.png" id="topmember"/>
                    <img src="..//images//icon//static.png" id="staticimage"/>
                    <img src="..//images//icon//locationtable.png" id="locationtableimage"/>
                    <img src="..//images//icon//rent.png" id="rentimage"/>
                    <img src="..//images//icon//static.png" id="staticimage2"/>
                    <img src="..//images//icon//locationtable.png" id="reservationimage"/>
                    <img src="..//images//icon//reserved.png" id="reservationinimage"/>
                    <img src="..//images//icon//reservation.png" id="reservationoutimage"/>
                    <br><br><br>
                    <h4 id="tee">Profil</h4>
                    <ul>
                        <li><a href="../adminpages/adminprofile.jsp">my profil</a></li>
                        <li><a href="">members admin</a></li>
                    </ul>
                </div>
                <div id="divper">
                    <h4 id="tee">Member Profil</h4>
                    <ul>
                        <li><a href="../adminpages/membertable.jsp">member table</a></li>
                        <li><a href="">top members</a></li>
                        <li><a href="">statistics</a></li>
                    </ul>                    
                </div>
                <div id="divper">
                    <h4 id="tee">Locations</h4>
                    <ul>
                        <li><a href="../adminpages/locationtable.jsp">location table</a></li>
                        <li><a href="">location type</a></li>
                        <li><a href="">statistics</a></li>
                    </ul>
                </div>
                <div id="divper">
                    <h4 id="tee">Reservation</h4>
                    <ul>
                        <li><a href="">reservation table</a></li>
                        <li><a href="">reservation in </a></li>
                        <li><a href="">reservation out</a></li>
                    </ul>
                    <br><br>
                </div>
</div>
<style>
    
body {
  margin: 0;
}


#ul2 {
  padding-top: 10px;
  list-style-type: none;
  margin-top:50px;

  width:250px;
  background-color: #0e1a35;
  position: fixed;
  height: 100%;
  overflow: auto;
}
    ul{list-style-type: none;}
#divper{margin-left:20px;}
#DASHBOARD{margin-left: 10px;margin-top: 6px; font-family:verdana;color: #2e9cca;text-decoration: none; }
li a {
  display: inline-block;
  color: #2e9cca;
  padding: 0px;
  text-decoration: none;
}
ul{
  text-decoration-style: none;
  list-style-type: none;
  list-style: none;
  text-decoration: none;
}
li a.active {
  background-color: #4CAF50;
  color: white;
  text-decoration: none;
}

li a:hover:not(.active) {
  background-color: #ff5522;
  color: white;
  width: 100%;
  text-decoration: none;
}
a :hover{
  text-decoration: none;
}
#admin_profile{height: 20px;position: absolute;top:190px;}
#other_admins{height: 20px;position: absolute;top:215px;}
#usersimage{height: 20px;position: absolute;top:287px;}
#topmember{height: 20px;position: absolute;top:312px;}
#staticimage{height: 20px;position: absolute;top:337px;}
#locationtableimage{height: 20px;position: absolute;top:415px;}
#rentimage{height: 20px;position: absolute;top:438px;}
#staticimage2{height: 20px;position: absolute;top:462px;}
#reservationimage{height: 20px;position: absolute;top:537px;}
#reservationinimage{height: 20px;position: absolute;top:560px;}
#reservationoutimage{height: 20px;position: absolute;top:585px;}
#imageprincipale{
    position: absolute;
    top:80px;left:20px;
    border-radius: 50px;
}
#myname1{
        position: absolute;
    top:80px;left:80px;
    color: #ff5522;

}
#myname2{
        position: absolute;
    top:80px;left:150px;
    color: #ff5522;

}
#typeofme{
        position: absolute;
    top:100px;left:94px;
    color: gold;

}
#tee{
    color:white;
}
</style>