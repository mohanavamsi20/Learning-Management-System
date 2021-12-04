<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>ADMIN - LOGIN</title>
	<link rel="stylesheet" href="styles.css">
	<script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<%
  	if(session.getAttribute("adminusername")!=null){
  		response.setContentType("text/html");
    	out.println("<script type=\"text/javascript\">");
    	out.println("alert('You were Already Logged in');");
    	out.println("location='adminHome.jsp';");
    	out.println("</script>");
    	RequestDispatcher rs = request.getRequestDispatcher("adminHome.jsp");
    	rs.include(request, response);
  	}
	if(session.getAttribute("email")!=null){
  		response.setContentType("text/html");
    	out.println("<script type=\"text/javascript\">");
    	out.println("alert('You were Already Logged in');");
    	out.println("location='studentHome.jsp';");
    	out.println("</script>");
    	RequestDispatcher rs = request.getRequestDispatcher("studentHome.jsp");
    	rs.include(request, response);
  	}
	if(session.getAttribute("facultyemail")!=null){
		response.setContentType("text/html");
	  	out.println("<script type=\"text/javascript\">");
	  	out.println("alert('You were Already Logged in');");
	  	out.println("location='facultyHome.jsp';");
	  	out.println("</script>");
	  	RequestDispatcher rs = request.getRequestDispatcher("facultyHome.jsp");
	  	rs.include(request, response);
	}
  	%>
	<header>
		<ul class="nav nav-tabs nav-fill">
		  <li class="nav-item">
		    <a class="nav-link" href="index.jsp">Home</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="facultyLogin.jsp">Faculty</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" href="studentLogin.jsp">Student</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link active" aria-current="page" href="adminLogin.jsp">Admin</a>
		  </li>
		</ul>
    </header>
	<div class="sign-up-form">
      <form action="adminLogin" method="post">
      	<label>ADMIN LOGIN</label><br>
        <label for="adminusername">username: </label>
        <input
          name="adminusername"
          type="text"
          class="input-box"
          placeholder="Enter your username"
          required
        />
        <label for="adminpassword">password: </label>
        <input
          name="adminpassword"
          type="password"
          class="input-box"
          placeholder="Enter your password"
          required
        />
        <div class="d-grid gap-2 col-6 mx-auto">	
	        <input class="btn btn-outline-primary" type="submit" value="LOGIN">
  		</div>
      </form>
      </div>
  </body>
</html>