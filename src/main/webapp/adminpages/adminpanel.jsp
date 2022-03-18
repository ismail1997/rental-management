

<%@page import="com.test.dao.LocationDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.test.beans.Location"%>
<%@page import="com.test.beans.Person"%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ela Admin - HTML5 Admin Template</title>
    <meta name="description" content="Ela Admin - HTML5 Admin Template">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel='stylesheet' href="..//style//css//bootstrap.min.css">
      
    
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
<% List<Location> mylist =LocationDAO.getAllLocations(); 
   List<Location> mylist1 =LocationDAO.getAllReservations();
   List<Person> list=PersonDAO.getAllAdmins();
   List<Person> list1=PersonDAO.getAllPersons();
%> 
<body>
   <jsp:include page="..//adminpages//header.jsp"></jsp:include>
   <jsp:include page="..//adminpages//leftpanel.jsp"></jsp:include> 


<div style="margin-left:20%;padding:50px 0px;height:1000px;">
    <div class="container">
        <div class="row">
            <div class="col-sm-2 text-primary">Locations : <% out.print(mylist.size()); %></div>
            <div class="col-sm-2 text-primary">Reservations :<% out.print(mylist1.size()); %></div>
            <div class="col-sm-2 text-primary">Admins : <% out.print(list.size()); %></div>
            <div class="col-sm-2 text-primary">Members : <% out.print(list1.size()); %></div>
        </div>
        <div class="row">
            
            <div class="col-sm-4">
                The Propositions
                <p>Hello mr Admin ,hope you had a great day</p>
                <p>the Member Mr meber have suggested his logement and he needs your validations</p>
                
                    <div class="card profile-card-2" >
                        <div class="card-img">
                            <img class="img-fluid" id="myimg" src="data:image/jpg;base64," alt="Card image cap" />
                        </div>
                        <div class="card-body pt-1" >

                            <h5 class="card-title"></h5>
                       
                            <table class="table table-light  table-responsive-sm  text-left">
                                    
                                    <tr>
                                          <td>Ref</td>
                                          <td></td>
                                    </tr>
                                    <tr>
                                          <td>Prix</td>
                                          <td></td>
                                    </tr>
                                    <tr>
                                          <td>type</td>
                                          <td></td>
                                    </tr> 
                                    <tr>
                                          <td>Ville</td>
                                          <td></td>
                                    </tr> 
                                    <tr>
                                          <td>Region</td>
                                          <td></td>
                                    </tr> 
                                     <tr>
                                         <td>
                                             <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="">
                                                        <button type="submit"  class="btn btn-primary">
                                                          More
                                                        </button>
                                              </form>
                                         </td>
                                         <td>
                                             <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="">
                                                        <button type="submit"  class="btn btn-primary">
                                                          UserProfile
                                                        </button>
                                              </form>
                                         </td>
                                         
                                    </tr>
                                    <tr>
                                         <td>
                                             <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="">
                                                        <button type="submit"  class="btn btn-success">
                                                          Validate
                                                        </button>
                                              </form>
                                         </td>
                                         <td>
                                             <form method="post" action="../otherpages/locationDetails.jsp" class="inline">
                                                        <input type="hidden" name="id" value="">
                                                        <button type="submit"  class="btn btn-danger">
                                                          Remove
                                                        </button>
                                              </form>
                                         </td>
                                         
                                    </tr>
                                      
                            </table>
                            
                                    
                            
                        </div>
                    </div>
            </div>  
            <div class="col-sm-4"></div>
            
        </div>
        
        
    </div>
</div>
    <style>
        .col-sm-2{
            background-color: #f8f9fa;
            font-family: sans-serif;
            font-weight: bolder;
            margin:40px;
            padding: 30px;
            text-align: left;
        }
    </style>
</body>
</html>

<!--<img src="data:image/jpg;base64,<%= person.getBase64Image()%>" width="100" height="100"/>-->