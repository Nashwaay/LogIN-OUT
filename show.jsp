<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 
<%@page import="javax.sql.*" %>
 
<%@page import="java.sql.Connection" %>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" type="text/css" rel="stylesheet"/>
<link href="css/pages.css" type="text/css" rel="stylesheet"/>
<title>Home</title>
</head>
<body>
<% 
String username=session.getAttribute("username").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","nashwa","qwerty");
Statement st=con.createStatement();
String query="select * from members where username='"+username+"'";
ResultSet rs=st.executeQuery(query);
%>
<nav>
<a href="index.html"><img alt="logo" src="images/LOGO.png"/></a>
<form>
<input type="button" id="logout" value="logout" onClick="document.location.href='logout.jsp';"/>
</form>
</nav>
<section>
<div id="tagline">
	<h1><%out.println(username+", nice to see you! :)"); %></h1>
</div>
</section>
<footer>
<br/>
<a href="mailto:nashwaay@gmail.com">Contact Us</a>
<p>Copyrights</p>
<form>
<input type="button" id="logout" value="deactivate" onClick="document.location.href='deactivate.jsp';"/>
</form>
</footer>
</body>
</html>