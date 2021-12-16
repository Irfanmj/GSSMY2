<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import ="java.sql.DriverManager"%>
<%@page import= "java.sql.SQLException"%>
<%
   
	String custIC = request.getParameter(custIC);

String DB_DRIVER = "org.postgresql.Driver";
String DB_HOST = "jdbc:postgresql://ec2-54-204-128-96.compute-1.amazonaws.com:5432" + "/dclgjbnt12qtde";
String DB_USER = "bxatgjnyrydewa";
String DB_PASSWORD = "57c8fed2ad071c2ff13fc104aba11684990d8cd93839b01631db30ea46640cb3";



	Class.forName(DB_DRIVER);
	Connection conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	
    Statement st = conn.createStatement();
    st.executeUpdate("delete from customer where custIC = '"+custIC+"'");
    //st.executeUpdate(dlteQuery);
    out.println("Deleted!!");
    response.sendRedirect("DeleteProduct.jsp");
%>