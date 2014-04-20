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
<title>Delete a Profile</title>
<link href="css/style.css" type="text/css" rel="stylesheet"/>
<link href="css/pages.css" type="text/css" rel="stylesheet"/>
</head>
<body>

<%
String username=request.getParameter("username");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection
("jdbc:mysql://localhost:3306/db",
"nashwa","qwerty");
Statement st=con.createStatement();
%>
<div id="wrap">
<nav>
<form>
<input type="button" id="signup" value="Sign Up" onClick="document.location.href='signup.html';"/>
</form>
</nav>
<section>
<%try
{
st.executeUpdate("DELETE FROM members WHERE username = '"+username+"'");
boolean flag=true;
if(flag==true)
{
out.println("<h1>"+"Deactivated successfully"+"</h1>");
session.removeAttribute("username");
session.removeAttribute("password");
session.invalidate(); 
}
else
{
out.println("<h1>"+"Not possible : error!"+"</h1>");
}
}
catch(Exception e)
{
out.println("Exception");
}
%>
</section>
<footer>
<a href="mailto:nashwaay@gmail.com">Contact Us</a>
</footer>
</div>

</body>
</html>