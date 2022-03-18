<%-- 
    Document   : test
    Created on : 14 janv. 2019, 20:37:10
    Author     : bouaddi_ismail
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <a href="Message.jsp">go This is a regular link </a>
        
        

<form method="post" action="Message.jsp" class="inline">
  <input type="hidden" name="id" value="2">
  <button type="submit" name="submit_param" value="submit_value" class="link-button">
    This is a link that sends a POST request
  </button>
</form>
        <style>
            .inline {
  display: inline;
}

.link-button {
  background: none;
  border: none;
  color: blue;
  text-decoration: underline;
  cursor: pointer;
  font-size: 1em;
  font-family: serif;
}
.link-button:focus {
  outline: none;
}
.link-button:active {
  color:red;
}
        </style>  
    </body>
</html>
