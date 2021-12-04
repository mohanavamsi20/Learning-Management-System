<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>ADD COURSES - LMS</title>
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
      <form name="courseForm" action="addcourse" method="post">
      	<label>ADDING COURSE</label><br>
        <label for="couid">COURSE ID:</label>
        <input
          type="text"
          id="couid"
          name="couid"
          class="input-box"
          placeholder="Enter your COURESE ID"
          required
          autofocus
        />

        <label for="couname">Course name:</label>
        <input
          type="text"
          id="couname"
          name="couname"
          class="input-box"
          placeholder="Enter course name"
          required
        />

        <label for="couyear">Year</label>
        <input
          type="text"
          class="input-box"
          name="couyear"
          placeholder="Enter course year"
          required
        />

        <label for="cousem">SEMESTER</label>
        <input
          type="text"
          class="input-box"
          name="cousem"
          placeholder="Enter course semester"
          required
        />
    	<div class="d-grid gap-2 col-6 mx-auto">	
        	<input class="btn btn-outline-primary" type="submit" value="ADD COURSE">
 		</div>
      </form>     
    </div>
	</body>
</html>