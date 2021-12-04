<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="ISO-8859-1" />
    <title>Welcome to KL LMS</title>
    <link rel="stylesheet" href="styles.css" />
    <script src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
  </head>
  <body>
  <%
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
 	if(session.getAttribute("adminusername")!=null){
		response.setContentType("text/html");
	  	out.println("<script type=\"text/javascript\">");
	  	out.println("alert('You were Already Logged in');");
	  	out.println("location='adminHome.jsp';");
	  	out.println("</script>");
	  	RequestDispatcher rs = request.getRequestDispatcher("adminHome.jsp");
	  	rs.include(request, response);
	}
  %>
  <header>
	<ul class="nav nav-tabs nav-fill">
	  <li class="nav-item">
	    <a class="nav-link active" aria-current="page" href="#">Home</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="facultyLogin.jsp">Faculty</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="studentLogin.jsp">Student</a>
	  </li>
	  <li class="nav-item">
	    <a class="nav-link" href="adminLogin.jsp">Admin</a>
	  </li>
	</ul>
  </header>
  <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="5000">
	       <img src="backgroundimg1.png" class="d-block w-100" alt="image1">
	    </div>
	    <div class="carousel-item" data-bs-interval="5000">
		  <img src="backgroundimg2.jpg" class="d-block w-100" alt="image2">    
		</div>
	    <div class="carousel-item" data-bs-interval="5000">
	      <img src="backgroundimg3.jpg" class="d-block w-100" alt="image3">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval"  data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval"  data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
  </div>
  <marquee behavior="scroll" direction="left" style="font-size: 200%">
  	Check out latest updates on your courses here.
  </marquee>
  <footer class="footer">
  	<p>For any queries <a href="mailto:190031065@kluniversity.in">mail us</a></p>	
	<p>Made with <span style="color: #e25555;">&hearts;</span> 
	by project6-Enterprise Programming</p>
	<p>© 2021 Copyright: Project6-Enterprise Programming</p>
  </footer>
  </body>
</html>
