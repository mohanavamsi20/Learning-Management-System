<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.sql.*" %>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Delete a Student</title>
		<link rel="stylesheet" href="styles.css"/>
		<script src="js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="css/bootstrap.min.css">
	</head>
	<body>
	<%
	  	if(session.getAttribute("adminusername")==null){
	  		response.setContentType("text/html");
	    	out.println("<script type=\"text/javascript\">");
	    	out.println("alert('Admin Access Only!!!');");
	    	out.println("location='adminLogin.jsp';");
	    	out.println("</script>");
	    	RequestDispatcher rs = request.getRequestDispatcher("adminLogin.jsp");
	    	rs.include(request, response);
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
 	<div class="sign-up-form">
		<form class="signForm" action="deleteStudent" method="post">
		    <label for="email">Email address:</label>
		    <input type="email" class="input-box" id="email" name="email" placeholder="Enter email" required>
		    <label for="cnfrmemail">Confirm Email address:</label>
		    <input type="email" class="input-box" id="cnfrmemail" name="cnfrmemail" placeholder="Enter email again" required>
		    <label for="password">Enter Password:</label>
		    <input type="password" class="input-box" id="password" name="password" placeholder="Enter Password" required>
		    <label for="cnfrmpassword">Confirm Password:</label>
		    <input type="password" class="input-box" id="cnfrmpassword" name="cnfrmpassword" placeholder="Enter Password again" required>
	        <div class="d-grid gap-2 col-6 mx-auto">	
		        <input class="btn btn-outline-primary" type="submit" value="DELETE STUDENT">
	  		</div>			  
		</form>
    </div>
    </body>
</html>