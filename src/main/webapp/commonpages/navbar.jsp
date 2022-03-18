<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
       session = request.getSession(true);
       String idstring=(String) session.getAttribute( "idstring");
    if (idstring == null) {
        out.println("<style>#logoutbutton{display: none;}</style>");
    
    } else {
     out.println("<style>#signupbutton,#loginbutton{display:none;}#logoutbutton{display:block;}</style>");
    }%>
<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="navbar10">
      <div class="navbar-header">
        <a href="http://localhost:8080/projects3/index.jsp" class="navbar-brand">MyHome</a>
      </div>
	 <div class="collapse navbar-collapse " id="navbarResponsive">
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="http://localhost:8080/projects3/index.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="http://localhost:8080/projects3/userpages/userlocations.jsp">Locations</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
           <ul class="navbar-nav  ml-auto">
            <li class="nav-item">
              <a class="btn btn-primary btn-md" id="loginbutton" href="http://localhost:8080/projects3/otherpages/Login.jsp">Login</a>
            </li>
            &nbsp;&nbsp;
            <li class="nav-item">
              <a  class="btn btn-primary btn-md" id="signupbutton" href="http://localhost:8080/projects3/otherpages/ajouterperson.jsp">Sign up</a>
            </li>&nbsp;&nbsp;
            <li class="nav-item">
              <a  class="btn btn-danger btn-md" id="logoutbutton" href="../LogoutServlet">LOGOUT</a>
            </li>
          </ul>
          
        </div>
</nav> 

<style>
    #navbar10{
        z-index: 10000;
    }
    
</style>
