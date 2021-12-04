<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>STUDENT SIGN UP - LMS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="styles.css" />
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
      <form name="signForm" action="studentSignup" method="post">
      	<label>STUDENT SIGNUP</label><br>
      	<label for="regid">REG ID:</label>
        <input
          type="text"
          id="regid"
          name="regid"
          class="input-box"
          placeholder="Enter your ID number"
          pattern="[0-9]{9}"
          title="ID number should be 9 digits"
          required
          autofocus
        />
        <label for="fullname">Full name:</label>
        <input
          type="text"
          id="fullname"
          name="fullname"
          class="input-box"
          placeholder="Enter your Full name"
          required
          autofocus
        />

        <label for="phone">Phone number: </label>
        <input
          type="text"
          class="input-box"
          name="phone"
          pattern="[0-9]{10}"
          title="mobile number should be 10 digits"
          placeholder="Enter your phone number"
          required
        />

        <label for="email">Email: </label>
        <input
          type="email"
          class="input-box"
          name="email"
          pattern = "[a-z0-9._%+-]+@kluniversity.in"
          title="Enter your kluniversity.in email address"
          placeholder="Enter your email"
          required
        />

        <label for="password">Password: </label>
        <input
          type="password"
          name="password"
          class="input-box"
          pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
          title="Password must contain at least
          one number, 
          one uppercase and lowercase letter,
          at least 8 or more characters."
          placeholder="Enter your password"
          required
        /> 
        <div class="d-grid gap-2 col-6 mx-auto">	
	        <input class="btn btn-outline-primary" type="submit" value="SIGNUP">
  		</div>
      </form>
	</div>  
	</body>
</html>
