

<%@page import="com.test.beans.Person"%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <script type="text/javascript" src="..//style//js//jquery.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>        
    </head>
    <body>
            <jsp:include page="..//adminpages//header.jsp"></jsp:include>
    <jsp:include page="..//adminpages//leftpanel.jsp"></jsp:include>
        <style>
            body{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
}
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img{
    text-align: center;
    
}
.profile-img img{
    width: 70%;
    height: 50%;
}


.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab p{
    font-weight: 600;
    color: #0062cc;
}
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
<div style="margin-left:20%;padding:50px 16px;height:1000px;">       
<div class="container emp-profile" id="panelprincipale">
            
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img">
                            <img id="imaged" src="data:image/jpg;base64,<%= person.getBase64Image()%>"  alt="none"/>
                            
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        Kshiti Ghelani
                                    </h5>
                                    <h6>
                                        The Admin Of Myhome
                                    </h6>
                            <br>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary" id="editbtn" >edit profile</button>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-work">
                            <p>Mes Infos</p>
                            <a href="">Mes Infos Personel</a><br/>
                            <a href="">Notifications</a><br/>
                            <a href="">Messages</a>
                            <p>Mes Missions</p>
                            <a href="">Mes Reservations</a><br/>
                            <a href="">Mes Locations</a><br/>
                            <a href="">Settings</a><br/>
                            <a href="">Statistics</a><br/>
                            <a href="">WebSite Details</a><br/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>User Id</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>1</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Nom</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=person.getNom() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Prenom</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=person.getPrenom() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%=person.getEmail() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%= person.getPhone()%></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Address</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><%= person.getAddress() %></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Profession</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p>Web Developer and Designer</p>
                                            </div>
                                        </div>
                            </div>
                        </div>
                    </div>
                </div>
                       
        </div>
<div class="container " id="panelsecondaire">
        <div class="row">
            <div class="col-md-10"></div>
            <div class="col-md-2">
                  
                     <button class="btn btn-primary" id="return" >return</button>
                </div>  
    </div>
    <div class="row">
        <div class="col-sm-3"><!--left col-->
              

          <div class="text-center">
            <img src="data:image/jpg;base64,<%= person.getBase64Image()%>" class="avatar img-circle img-thumbnail" alt="avatar">
            
          </div><br>

          
        </div><!--/col-3-->
        <div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#messages">Menu 1</a></li>
            </ul>
            <form class="form" action="EditServlet" method="post" id="registrationForm">
                <div class="row">
                                <div class="col-sm-6">
                                    <br>
                                    <label for="nom"><h4>Nom</h4></label>
                                    <input type="text" class="form-control" name="nom" id="first_name" placeholder="entrer new nom" value="<%= person.getNom()%>" >
                                    <br>
                                    <label for="email"><h4>Email</h4></label>
                                    <input type="text" class="form-control" name="email" id="phone" placeholder="enter new email" value="<%=person.getEmail() %>" >
                                    <br>
                                    <label for="Password"><h4>Password</h4></label>
                                    <input type="password" class="form-control" name="password" id="phone" placeholder="enter new pass" value="<%=person.getPassword() %>">
                                    <br>
                                    <label for="address"><h4>Address</h4></label>
                                    <input type="text" class="form-control" name="address" id="phone" placeholder="enter new address" value="<%=person.getAddress() %>">
                                    <h6>Upload a different photo...</h6>
                                    <input type="file" name="file" class="text-center center-block file-upload">

                                </div>
                                <div class="col-sm-6">
                                    <br>
                                    <label for="prenom"><h4>Prenom</h4></label>
                                    <input type="text" class="form-control" name="prenom" id="first_name" placeholder="Prenom " value="<%=person.getPrenom() %>">
                                    <br>
                                    <label for="phone"><h4>Phone</h4></label>
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="enter new phone" value="<%=person.getPhone() %>">
                                    <br>
                                    <label for="password_confirmation"><h4>Password Confirmation</h4></label>
                                    <input type="password" class="form-control" name="password_confirmation" id="phone" placeholder="enter password confirmation" value="<%=person.getPassword_confirmation() %>">
                                    <br>
                                    <label for="birthday"><h4>Birth day</h4></label>
                                    <input type="date" class="form-control" name="birthday" id="phone" placeholder="enter phone" value="<%=person.getBirthday() %>">

                                    <br>
                                    <input type="submit" class="btn btn-success"  value="enregistrer">
                                    <input type="reset" class="btn btn-danger"  value="reset">
                                </div>
                                    
                </div>
            </form>    
        </div>
        
    </div>
</div>
</div>                                   <br><br>
<style type="text/css">
    body{
        background:-webkit-linear-gradient(bottom, #3931af, #00c6ff);
    }
    #panelsecondaire{
        background-color: white;
        padding-top: 50px;
        padding-bottom: 10px;
        border-radius: 10px;
        display: none;
    }
</style>  

<script type="text/javascript">


$(document).ready(function(){
  $("#editbtn").click(function(){
    $("#panelprincipale").hide(); 
    $("#panelsecondaire").show();
  });
  $("#return").click(function(){
    $("#panelprincipale").show(); 
    $("#panelsecondaire").hide();
  });
});
</script>
    </body>
</html>
