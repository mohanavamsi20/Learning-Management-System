<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>FACULTY SIGN UP - LMS</title>
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
      <form name="signForm" action="facultySignup" method="post">
      	<label>FACULTY SIGNUP</label><br>
        <label for="facid">Faculty ID:</label>
        <input
          type="text"
          id="facid"
          name="facid"
          class="input-box"
          pattern="[0-9]{4}"
          title="Faculty Id should be 4 digits"
          placeholder="Enter your Faculty ID"
          required
          autofocus
        />

        <label for="facname">Full name:</label>
        <input
          type="text"
          id="facname"
          name="facname"
          class="input-box"
          placeholder="Enter your full name"
          required
        />

        <label for="facphone">Phone number: </label>
        <input
          type="text"
          class="input-box"
          name="facphone"
          pattern="[0-9]{10}"
          title="mobile number should be 10 digits"
          placeholder="Enter your phone number"
          required
        />

        <label for="facemail">Office Email: </label>
        <input
          type="email"
          class="input-box"
          name="facemail"
          pattern = "[a-z0-9._%+-]+@kluniversity.in"
          title="Enter your kluniversity.in email address"
          placeholder="Enter your email"
          required
        />

        <label for="facpassword">Password: </label>
        <input
          type="password"
          name="facpassword"
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