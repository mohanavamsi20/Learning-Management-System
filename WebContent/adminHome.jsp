<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ADMIN HOME</title>
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
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
    <%
	Connection connection = JdbcConnection.getConnection(); 
	%><%
	String sessionemail = session.getAttribute("adminusername").toString();
	PreparedStatement ps = connection.prepareStatement("SELECT * FROM ADMINCRED WHERE ADMINUSERNAME=?");
    ps.setString(1, sessionemail);
    ResultSet rs = ps.executeQuery();
    while(rs.next()){
	%>	
    <h1>Welcome <%=rs.getString("ADMINUSERNAME")%></h1>
    <% } %>
  	<div class="row row-cols-1 row-cols-md-2 g-4">
	  <div class="col">
	    <div class="card">
	      <img src="images/student.png" class="card-img-top" alt="..." height="500px">
	      <div class="card-body">
	        <h5 class="card-title">Student</h5>
	        <p class="card-text">Select your operation</p>
	      	<a class="card-link" href="studentSignup.jsp">ADD A STUDENT</a>
		    <a class="card-link" href="studentDelete.jsp">DELETE A STUDENT</a>
		    <a class="card-link" href="viewStudents.jsp">VIEW STUDENTS</a>
		    <a class="card-link" href="studentsCourses.jsp">STUDENTS COURSES</a>
	      </div>
	    </div>
	  </div>
	    <div class="card">
	      <img src="images/teacher.png" class="card-img-top" alt="..." height="500px">
	      <div class="card-body">
	        <h5 class="card-title">Faculty</h5>
	        <p class="card-text">Select your operation.</p>
	      	<a class="card-link" href="facultySignup.jsp">ADD A FACULTY</a>
		    <a class="card-link" href="facultyDelete.jsp">DELETE A FACULTY</a>
		    <a class="card-link" href="viewFaculties.jsp">VIEW FACULTIES</a>
		    <a class="card-link" href="facultyCourses.jsp">FACULTY COURSES</a>
	      </div>
	    </div>
	    <div class="card">
	      <img src="images/course.jpg" class="card-img-top" alt="..." height="500px">
	      <div class="card-body">
	        <h5 class="card-title">Course</h5>
	        <p class="card-text">Select your operation.</p>
	      	<a class="card-link" href="addcourse.jsp">ADD A COURSE</a>
		    <a class="card-link" href="deleteCourse.jsp">DELETE A COURSE</a>
		    <a class="card-link" href="viewCourses.jsp">VIEW COURSES</a>
		    <!-- ------<a class="card-link" href="facultyCourses.jsp">FACULTY COURSES</a>-->
	      </div>
	    </div>
	</div>
  </body>
</html>
