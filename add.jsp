<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
<%@page import="java.io.*" %>
<%@page import="javax.sql.*" %>
<%@page import="java.sql.Connection" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 
<%
 
String username=request.getParameter("username");
 
String password=request.getParameter("password");
 
String firstname=request.getParameter("firstname");
 
String lastname=request.getParameter("lastname");
 
String mail=request.getParameter("email");
 
 
Class.forName("com.mysql.jdbc.Driver");
 
Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3306/db","nashwa","qwerty");
 
Statement st=con.createStatement();
 
String sql="insert into members values('"+username+"','"+firstname+"','"+lastname+"','"+mail+"','"+password+"')";
 
int flag=st.executeUpdate(sql);
 
if(flag==1)
 
{
	session.setAttribute("username",username);
	response.sendRedirect("show.jsp");
 
}
 
else
 
{
 
out.println("Failed to sign up");
 
}
 
 
%>


</body>
</html>