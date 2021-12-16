<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
  <title>4Wheel Car rental</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
   <header>
         <nav class="navbar navbar-expand-md navbar-dark" style="background-color: #ffff">
         <div>
            <a href="index.jsp" class="navbar-brand"> 4Wheel car rental </a>
          </div>
         </nav>
      </header>
            <br>
			<div class="row">
                <!-- <div class="alert alert-success" *ngIf='message'>{{message}}</div> -->

                <div class="container">
                    <h3 class="text-center">View customer Details</h3>
                    <hr>
       <%
       
       String DB_DRIVER = "org.postgresql.Driver";
       String DB_HOST = "jdbc:postgresql://ec2-54-204-128-96.compute-1.amazonaws.com:5432" + "/dclgjbnt12qtde";
       String DB_USER = "bxatgjnyrydewa";
       String DB_PASSWORD = "57c8fed2ad071c2ff13fc104aba11684990d8cd93839b01631db30ea46640cb3";

       Connection conn = null;
       Statement stat = null;
       ResultSet res = null;
       PreparedStatement stmt = null;
       Class.forName(DB_DRIVER).newInstance();
       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
       %>
       <form action="" method="post">
       <%
       stat = conn.createStatement();
       String u = request.getParameter("u");
       String data = "select * from customer where custIC='"+custIC+"'";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
            <input type="hidden" name="custIC" value='<%=res.getString("custIC") %>'/>
   			<div class="form-group">
     			<label>Name</label>
     			<input type="text" class="form-control" name="custName" value='<%=res.getString("custName") %>'/>
   			</div>
   			<div class="form-group">
     			<label>username</label>
     			<input type="text" class="form-control" name="custUname" value='<%=res.getString("custUname") %>'/>
   			</div>
   			<div class="form-group">
     			<label>password</label>
     			<input type="text" class="form-control" name="custPassword" value='<%=res.getString("custPassword") %>'/>
   			</div>
   			<div class="form-group">
     			<label>Email</label>
     			<input type="email" class="form-control" name="custEmail" value='<%=res.getString("custEmail") %>'/>
   			</div>
   			<div class="form-group">
     		<label>Phone Number</label>
     		<input type="tel" class="form-control" name="custPhoneNum" value='<%=res.getString("custPhoneNum") %>'/>
   			</div>
   			<div class="form-group">
     		<label>Address</label>
     		<textarea type="text" class="form-control" name="custAddress" value='<%=res.getString("custAddress") %>'/></textarea>
   			</div>
   			<%
            }
   			%>
   			<button type="submit" class="btn btn-warning">Update</button>
   			<a href="index.jsp" class="btn btn-default">Back</a>
   			</form>
   			</div></div>
   			</body>
   			</html>
   			<%
   			String a = request.getParameter("custIC");
   			String b = request.getParameter("custName");
   			String c = request.getParameter("custUname");
   			String d = request.getParameter("custPassword");
   			String e = request.getParameter("custEmail");
   			String f = request.getParameter("custPhoneNum");
   			String g = request.getParameter("custAddress");
   			if(a!=null && b!=null && c!=null && d!=null){
   				String query = "update customer set custName=?,custUname=?,custPassword=?, custEmail=?, custPhoneNum=?, custAddress=? where custIC='"+a+"'";
   				stmt = conn.prepareStatement(query);
   				stmt.setString(1,b);
   				stmt.setString(2,c);
   				stmt.setString(3,d);
   				stmt.setString(4,e);
   				stmt.setString(5,f);
   				stmt.setString(6,g);
   				stmt.executeUpdate();
   				response.sendRedirect("index.jsp");
   			}
   			%>
   			
   			
       
       
       
