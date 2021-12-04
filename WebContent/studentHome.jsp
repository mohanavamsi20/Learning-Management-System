<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Home-LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <body>
    <% if(session.getAttribute("email")==null) {
    response.sendRedirect("studentLogin.jsp"); } %>
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
    <%
	Connection connection = JdbcConnection.getConnection(); 
	%>
	<%
	String sessionemail = (String)session.getAttribute("email");
	String sessionid = (String)session.getAttribute("regid");
	PreparedStatement ps = connection.prepareStatement("SELECT * FROM STUDENT WHERE EMAIL=?");
    ps.setString(1, sessionemail);
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
    %>	
    <h1>Welcome <%=rs.getString("FULLNAME")%> <%=rs.getString("REGID")%></h1>
    <% } %>
    <h1>Dashboard</h1>
	<%
	PreparedStatement ps1 = connection.prepareStatement("SELECT C.* FROM COURSE C INNER JOIN STUDENTCOURSES SC ON C.COURSEID=SC.COURSEID WHERE SC.REGID=?");
	ps1.setString(1,sessionid);	
	ResultSet resultSetCourses = ps1.executeQuery();
	while(resultSetCourses.next()){
	%>
	<div class="row row-cols-1 row-cols-md-2 g-4">
	  <div class="col">
	    <div class="card">
	      <h5 class="card-title"><%=resultSetCourses.getString("COURSENAME")%></h5>
	      <form action="selectStudentCourse" method="post">
	      	<input type="hidden" id="courseId" name="courseId" value="<%=resultSetCourses.getString("COURSEID")%>">
	      	<button type="submit" class="btn btn-link">Go to Course</button>
	      </form>
	      <p class="card-text">COURSE ID:<%=resultSetCourses.getString("COURSEID")%></p>
	      <p class="card-text">YEAR:<%=resultSetCourses.getString("YR")%></p>
	      <p class="card-text">SEM:<%=resultSetCourses.getString("SEM")%></p>
	    </div>
	  </div>
	</div>
	<% } %>
	<%
		JdbcConnection.closeConnection();
	%>
  </body>
</html>
