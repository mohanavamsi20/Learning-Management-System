<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>View Faculties</title>
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <body>
  	<% if(session.getAttribute("adminusername")==null){
    		response.sendRedirect("adminLogin.jsp"); 
    	} 
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    	  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="adminHome.jsp">Home</a>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-right" action="adminLogout" method="post">
           		<button class="btn btn-outline-dark" type="submit">Logout</button>	
     	  </form>
	    </div>
	</nav>  
  	<%
	Connection connection = JdbcConnection.getConnection(); 
	%>
    <h1>List of faculties</h1>
	<table border="1">
		<tr>
			<td>FACULTYID</td>
			<td>FULLNAME</td>
			<td>PHONE</td>
			<td>EMAIL</td>
			<td>PASSWORD</td>
		</tr>
		<%
		PreparedStatement ps1 = connection.prepareStatement("SELECT * FROM FACULTY");
		ResultSet resultSet = ps1.executeQuery();
		while(resultSet.next()){
		%>
		<tr>
			<td><%=resultSet.getString("FACULTYID") %></td>
			<td><%=resultSet.getString("FULLNAME") %></td>
			<td><%=resultSet.getString("PHONE") %></td>
			<td><%=resultSet.getString("EMAIL") %></td>
			<td><%=resultSet.getString("PASSWORD") %></td>
		</tr>
		<%
		}
		JdbcConnection.closeConnection();
		%>
	</table>
  </body>
</html>
