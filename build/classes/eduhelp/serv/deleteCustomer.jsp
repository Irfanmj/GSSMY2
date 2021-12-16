
<%@page import="java.sql.ResultSet"%>
<%@page import=" java.sql.Connection"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import= "java.sql.SQLException"%>
<%@page import ="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html UBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;
%>
<h1><center>4Wheel car rental<center></h1>
<form action="delete.jsp" method="post">
<div style="background-color:#ffff">
	<div class="container">
		<div class="row">

			<div class="col-md-8 pt-2 pb-2" >
				<a class="pl-3" style="color:black" href="ViewProduct.jsp">View customer</a>
				<a class="pl-3 " style="color:black" href="index.jsp">Add customer</a>
				<a class="pl-3" style="color:black" href="edit.jsp">Edit customer</a>
				<a class="pl-3" style="color:black" href="DeleteProduct.jsp">Delete customer</a>
			</div>

		
		</div>
	</div>
</div>
<div class="container"><br><br>
<div class="card">
	  <div class="card-header"style="background-color:#ffffff">
		Delete Product 
	  </div>
	  <div class="card-body"style="background-color:#dfe4ea">
		<blockquote class="blockquote mb-0">
			<div class="form-row">
				
			<table class="table">
			  <thead class="thead-light">
				<tr>
				  <th scope="col">IC Number</th>
				  <th scope="col">Name</th>
				  <th scope="col">Username</th>
				  <th scope="col">Password</th>
				  <th scope="col">Email</th>
				  <th scope="col">Phone Number</th>
				  <th scope="col">Address</th>
				</tr>
			  </thead>
			  <tbody>
				   </tr>
        <%
        String DB_DRIVER = "org.postgresql.Driver";
        String DB_HOST = "jdbc:postgresql://ec2-54-204-128-96.compute-1.amazonaws.com:5432" + "/dclgjbnt12qtde";
        String DB_USER = "bxatgjnyrydewa";
        String DB_PASSWORD = "57c8fed2ad071c2ff13fc104aba11684990d8cd93839b01631db30ea46640cb3";
    	
        
        Class.forName(DB_DRIVER);
        conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
 
       		 Statement st = conn.createStatement();

            String selectQuery = "SELECT * FROM customer";
            pst = conn.prepareStatement(selectQuery);
            rs = pst.executeQuery();
            
           
          
            while(rs.next()){
        %>
            <tr width="100%">
                <td align="center"><%=rs.getString("custIC") %></td>
                <td align="center"><%=rs.getString("custName") %></td>
                <td align="center"><%=rs.getString("custUname") %></td>
                <td align="center"><%=rs.getString("custPassword") %></td>
                <td align="center"><%=rs.getString("custEmail") %></td>
                <td align="center"><%=rs.getString("custPhoneNum") %></td>
                 <td align="center"><%=rs.getString("custAddress") %></td>
                <td><a href="delete.jsp?id=<%=rs.getString("custIC")%>" class="btn btn-primary btn-lg active" role="button" aria-pressed="true">DELETE</a></td>   
              
            </tr>
        <%} %>
			  				   
			  </tbody>
			</table>
			</div>
		</blockquote>

	</div>
</div>
</div>

</form>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
</body>
</html>