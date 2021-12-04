<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Student - Upload Assignment</title>
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
    <br>
    <nav aria-label="breadcrumb">
	  <ol class="breadcrumb">
	    <li class="breadcrumb-item"><a href="studentHome.jsp">Home</a></li>
	    <li class="breadcrumb-item"><a href="studentCourseHome.jsp">Course Home</a></li>
	    <li class="breadcrumb-item active" aria-current="page">Submit Assignment</li>
	  </ol>
	</nav>
	<br>
    <form action="studentUploadAssignment" method="post" enctype="multipart/form-data">
	 <label>Select a file to upload: </label><br /><br />
	 <input type="file" name="file" size="50" required/><br /><br />
	 <input type="submit" value="Add Submission"/>
	</form>
</body>
</html>