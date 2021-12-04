<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>FACULTY COURSES</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="Semantic-UI-CSS-master/components/dropdown.min.css">
	<script src="Semantic-UI-CSS-master/components/dropdown.min.js"></script>
</head>
<body>
<% if(session.getAttribute("adminusername")==null){
    response.sendRedirect("adminLogin.jsp"); } %>
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
	<%Connection connection = JdbcConnection.getConnection();%>
    <form align="center" action="facultyCourses.jsp" method="post"><br>
    	<select class="ui fluid search selection dropdown" name="opt" style="height:20%">
		  <option value="">Select Faculty</option>
    <%PreparedStatement ps = connection.prepareStatement("SELECT * FROM FACULTY");
    ResultSet rs = ps.executeQuery();
    while(rs.next()){%>
		  <option value="<%=rs.getString(1) %>"><%=rs.getString(1)%> <%=rs.getString(2) %></option>
    <%} %>
    	</select> <button type="submit">SEARCH</button>
    	<h1>FACULTY REGISTERED COURSES</h1>
    	 <table class="table table-bordered table-condensed table-hover table-striped text-center">
		    <tr>
		    	<td>FACULTYID</td>
		    	<td>COURSEID</td>
		    </tr>
		    <%
		    String id=request.getParameter("opt");
		    PreparedStatement ps1 = connection.prepareStatement("SELECT * FROM FACULTYCOURSES WHERE FACULTYID=?");
		    ps1.setString(1,id);
		    ResultSet rs1 = ps1.executeQuery();
		    while(rs1.next()){%>
		    <tr>
		    	<td><%=rs1.getString(1)%></td>
		    	<td><%=rs1.getString(2)%></td>
		    </tr>
		    <% }%>
    	</table>
    </form>
    <form align="center" action="addFacultyCourses.jsp" method="post">
    	<button type="submit">ADD FACULTY COURSES</button>
    </form><br>
    <form align="center" action="deleteFacultyCourses.jsp" method="post">
    	<button type="submit">DELETE FACULTY COURSES</button>
    </form>
</body>
</html>