<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 
<%@page import="javax.sql.*" %>
 
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm</title>
</head>
<body>
<%
 
String username=request.getParameter("username");
String password=request.getParameter("password");
 
Class.forName("com.mysql.jdbc.Driver");
 
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","nashwa","qwerty");
 
Statement st=con.createStatement();
String query="select * from members where username='"+username+"' and password='"+password+"'";
ResultSet rs=st.executeQuery(query); 

if(rs.next())
{	out.println("Correct information");
	session.setAttribute("username",username);
	response.sendRedirect("show.jsp");
}
else
{
	response.sendRedirect("incorrect.html");
}

 
%>

</body>
</html>