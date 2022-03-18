<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap CRUD Data Table for Database with Modal Form</title>

        <link rel='stylesheet' href="..//style//css//bootstrap.min.css">
        <link rel='stylesheet' href="..//style//css//bootstrap.css">
        <script type="text/javascript" src="..//style//js//jquery.min.js" ></script>
        <script type="text/javascript" src="..//style//js//bootstrap.min.js" ></script>
</head>        
<style type="text/css">
    body {

		
		
                background-image:url("..//images//appartement3.jpg"); 
                background-repeat: no-repeat;
                background-attachment: fixed; 
	}

</style>
<style type="text/css">
    
    .table-wrapper {
        background: #f7f9fb;
        padding: 20px 25px;
        margin: 30px 0;
        border-radius: 15px;
        box-shadow: 0 1px 1px rgba(0,0,0,.05);
    }
   
    .table-title {        
        padding-bottom: 15px;
        background: #0e1a35;
        color: #fff;
        padding: 16px 30px;
        margin: -20px -25px 10px;
       
    }
    .table-title h2 {
        margin: 5px 0 0;
        font-size: 30px;
    }
    .table-title .searchbar{
        float: right;
    }
    .table-title .btn-group {
        float: right;
    }
    table.table tr th, table.table tr td {
        border-color: #e9e9e9;
        padding: 12px 15px;
        vertical-align: middle;
    }
    

    table.table-striped tbody tr:nth-of-type(odd) {
        background-color: #fcfcfc;
    }
    table.table-striped.table-hover tbody tr:hover {
        background: #ffe8a1;
    }
    #edit1,#edit2{width: 300px;}
    #edit1{display: none;}
    
</style>

<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %><!--annoncer que on doit utiser la lib sql -->
<body>
    <!--include les page de navigation et sidebar -->
    <jsp:include page="..//adminpages//header.jsp"></jsp:include>
    <jsp:include page="..//adminpages//leftpanel.jsp"></jsp:include>
    <!-------------------------------------------------------> 
    
    <!--faire appel a la base de donne  ----------------------------->
    <sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/javaee?serverTimezone=UTC" user="root" password="root" />
    <sql:query dataSource="${dbSource}" var="result">
        select * from person where type!='admin'
    </sql:query>
    <!-------------------------------------------------------> 
    <!-- ce div est notre div principale-->
    <div style="margin-left:250px;padding:50px 16px;height:1000px;">
        <div class="editmethods" style="padding-top:20px ;padding-left: 15px;">
            <button class="btn btn-primary" id="edit1">simple details</button>
            <button class="btn btn-primary" id="edit2">advanced details</button>
        </div>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-4" id="titre">
                            <h2>Manage <b>Members</b></h2>
                        </div>
                        <div class="col-sm-4" id="titre">

                        </div>
                        <div class="col-lg-3" id="titre">
                            <input class="searchbar" type="text" id="myInput" onkeyup="myFunction()"/>

                        </div>
                        <div class="col-sm-1" id="titre">
                            
                        </div>

                    </div>
                </div>
                <table class="table table-bordered table-responsive-md table-striped text-center table-hover" id="myTable">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>Name</th>
                            
                            <th>Email</th>
                            <th>phone</th>
                            <th>birthday</th>
                            <th>address</th>
                            <th>contacter</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="row" items="${result.rows}">
                        <tr>  
                            <td><c:out value="${row.id}"/></td>
                            
                            <td><c:out value="${row.prenom}  ${row.nom}"/></td>
                            <td><c:out value="${row.email}"/></td>
                            <td><c:out value="${row.phone}"/></td>
                            <td><c:out value="${row.birthday}"/></td>
                            <td><c:out value="${row.address}"/></td>
                            <td><button class="btn btn-success" style="width:100%;">Call</button></td>

                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        </div>

        
        
        
 <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>        
    
</body>
</html>     