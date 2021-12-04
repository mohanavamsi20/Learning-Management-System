<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Course Test Home</title>
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<% 
	if(session.getAttribute("email")==null) {
		response.sendRedirect("studentLogin.jsp"); 	
	} 
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    	  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="studentHome.jsp">Home</a>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-right" action="studentLogout" method="post">
           		<button class="btn btn-outline-dark" type="submit">Logout</button>	
     	  </form>
	    </div>
	</nav>
	<br>
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="studentHome.jsp">Home</a></li>
	    <li class="breadcrumb-item"><a href="studentCourseHome.jsp">Course Home</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Course Test Home</li>
	  </ol>
	</nav>
	<br>
	<%
	Connection connection = JdbcConnection.getConnection(); 
	%>
	<%
	String courseId = (String)session.getAttribute("courseId");
	PreparedStatement s = connection.prepareStatement("SELECT * FROM COURSE WHERE COURSEID=?");
    s.setString(1, courseId);
    ResultSet res = s.executeQuery();
    while(res.next()){
	%>	
    <h1><%=res.getString("COURSEID")%>-<%=res.getString("COURSENAME")%>-<%=res.getString("YR")%>YR-<%=res.getString("SEM")%>SEM</h1>
    <% } %>
    <br>
	<% 
		String testId = (String)session.getAttribute("testId");
	  	PreparedStatement ps2 = connection.prepareStatement("SELECT * FROM COURSETESTS WHERE COURSEID=? AND TEST_TITLE=?");
	  	ps2.setString(1, courseId);
		ps2.setString(2, testId);
	  	ResultSet rs2 = ps2.executeQuery();
	    while(rs2.next()){
	%>
	<a href="studentCourseTestHome.jsp"><%=rs2.getString("TEST_TITLE")%></a><br/>
	<br />
	<p>AUTHOR: <%=rs2.getString("AUTHOR")%></p>
	<p>UPLOAD TIME: <%=rs2.getTimestamp("PUBLISHED_TIME")%></p>
	<% } %>
	<% JdbcConnection.closeConnection(); %>
</body>
</html>