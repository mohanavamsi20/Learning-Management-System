<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Course Home</title>
		<meta name="viewport" content="width=device-width, initial-scale=1" />
	    <script src="js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
<body>
	<% if(session.getAttribute("facultyemail")==null){
    response.sendRedirect("facultyLogin.jsp"); } %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    	  <ul class="navbar-nav me-auto mb-2 mb-lg-0">
	        <li class="nav-item">
	          <a class="nav-link active" aria-current="page" href="facultyHome.jsp">Home</a>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-right" action="facultyLogout" method="post">
           		<button class="btn btn-outline-dark" type="submit">Logout</button>	
     	  </form>
	    </div>
	</nav>
	<br>
	<nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="facultyHome.jsp">Home</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Course Home</li>
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
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">Course Content</button>
	  </li>
	  <li class="nav-item" role="presentation">
	    <button class="nav-link" id="assignments-tab" data-bs-toggle="tab" data-bs-target="#assignments" type="button" role="tab" aria-controls="assignments" aria-selected="false">Assignments</button>
	  </li>
	</ul>
	<div class="tab-content" id="myTabContent">
	  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
	  	<% 
			String contentId = (String)session.getAttribute("contentId");
	  		PreparedStatement ps = connection.prepareStatement("SELECT * FROM COURSEMATERIALS WHERE COURSEID=?");
			ps.setString(1, courseId);
 	  		ResultSet rs = ps.executeQuery();
			while(rs.next()){
		%>
		<div class="card">
		    <div class="card-header">
		        <form action="selectFacultyCourseContent" method="post">
			      	<input type="hidden" id="contentId" name="contentId" value="<%=rs.getString("FILE_TITLE")%>">
			      	<button type="submit" class="btn btn-link"><%=rs.getString("FILE_TITLE")%></button>
			  	</form>
		    </div>
		  </div>
		<% } %>
		<br />
		<a href="facultyUploadCourseContent.jsp">Upload Course Material</a>
	  </div>
	  <div class="tab-pane fade" id="assignments" role="tabpanel" aria-labelledby="assignments-tab">
	  	<% 
		  	PreparedStatement ps1 = connection.prepareStatement("SELECT * FROM COURSEASSIGNMENTS WHERE COURSEID=?");
		  	ps1.setString(1, courseId);
			ResultSet rs1 = ps1.executeQuery();
			while(rs1.next()){
		%>
		<div class="card">
		    <div class="card-header">
		        <form action="selectFacultyAssignment" method="post">
			      	<input type="hidden" id="assignmentId" name="assignmentId" value="<%=rs1.getString("ASSIGN_TITLE")%>">
			      	<button type="submit" class="btn btn-link"><%=rs1.getString("ASSIGN_TITLE")%></button>
			    </form>
		    </div>
		</div>
		<% } %>
		<br />
		<a href="facultyUploadCourseAssignment.jsp">Upload assignment</a>
	  </div>
	</div>
	<% JdbcConnection.closeConnection(); %> 
</body>
</html>