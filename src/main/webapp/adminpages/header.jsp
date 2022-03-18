
<%@page import="com.test.beans.Person"%>
<%@page import="com.test.dao.PersonDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<div id="header1">
      <div id="image_admin"><img id="image3" src="data:image/jpg;base64,<%= person.getBase64Image()%>"></div>
      <div id="logo_image" ><img id="image1" src="..//images//icon//home_logo.png" /></div>
    
      <div id="btnaddlocation"><a href="../otherpages/ajoutlocation.jsp" class="btn btn-primary text-sans-serif text-white"><strong>+</strong>new location</a></div>
      <div id="nottification"><img id="image2" src="..//images//icon//bell.png" /></div>
      <div id="message"><img id="image2" src="..//images//icon//email.png" /></div>

      
</div>


<style>

#image1{height: 45px;}
    #logo_image{padding-left: 50px;}
    #nottification{position: absolute;left:1200px;top:8px;}
    
    #btnaddlocation{position: absolute;top:5px;left:75%;}
    #message{position: absolute;left:1250px;top:8px;}
    #image2{height:30px;}
    #image3{height:40px;border-radius: 50px;}
    #image_admin{position: absolute;left: 1300px;}
    #header1{background:-webkit-linear-gradient(bottom, #0e1a35, #0e1a35);height: 50px; position: fixed;width: 100%; z-index: 9999;}
</style>

