<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.jdbc.JdbcConnection"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<head>
    <meta charset="ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>ADD STUDENT COURSES</title>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<style>
tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
    }
</style>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css">
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
    <%Connection connection = JdbcConnection.getConnection();%>
    <form align="center" action="studentCourses" method="post">
	<script type="text/javascript">
    $(document).ready(function(){
    	$('#select_all').on('click',function(){
    		if(this.checked){
		            $('.checkbox').each(function(){
		                this.checked = true;
		            });
		        }else{
		             $('.checkbox').each(function(){
		                this.checked = false;
		            });
		        }
		    });
		    
		    $('.checkbox').on('click',function(){
		        if($('.checkbox:checked').length == $('.checkbox').length){
		            $('#select_all').prop('checked',true);
		        }else{
		            $('#select_all').prop('checked',false);
		        }
		    });
		});
	</script>
	<script type="text/javascript">
    $(document).ready(function(){
    	$('#fac_select_all').on('click',function(){
    		if(this.checked){
		            $('.listcheckbox').each(function(){
		                this.checked = true;
		            });
		        }else{
		             $('.listcheckbox').each(function(){
		                this.checked = false;
		            });
		        }
		    });
		    
		    $('.listcheckbox').on('click',function(){
		        if($('.listcheckbox:checked').length == $('.listcheckbox').length){
		            $('#fac_select_all').prop('checked',true);
		        }else{
		            $('#fac_select_all').prop('checked',false);
		        }
		    });
		});
	</script>
    <h1>UNIVERSITY COURSES</h1>
    <table class="table table-bordered table-condensed table-hover table-striped text-center" id="example">
    <thead>
    <tr>
    	<td><input type="checkbox" id="select_all"/></td>
    	<td>COURSE ID</td>
    	<td>COURSE NAME</td>
    	<td>COURSE YEAR</td>
    	<td>COURSE SEMESTER</td>
    </tr>
    <thead>
    <tbody>
    <%
	PreparedStatement ps2 = connection.prepareStatement("SELECT * FROM COURSE");
    ResultSet rs2 = ps2.executeQuery();
    while(rs2.next()){%>
    <tr>
    	<td><input type="checkbox" name="checkbox" class="checkbox" value="<%=rs2.getString(1)%>"></td>
    	<td><%=rs2.getString(1) %></td>
    	<td><%=rs2.getString(2) %></td>
    	<td><%=rs2.getString(3) %></td>
    	<td><%=rs2.getString(4) %></td>
    </tr>
    <%}%>
    </tbody>
    <tfoot>
    <tr>
    	<td style="visibility: hidden"></td>
        <td>COURSE ID</td>
		<td>COURSE NAME</td>
		<td>COURSE YEAR</td>
		<td>COURSE SEMESTER</td>
    </tr>
    </tfoot>
    </table>
    <button id="myBtn" type="button">ADD COURSE TO STUDENT</button>
    <div id="myModal" class="modal">
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <table class="table table-bordered table-condensed table-hover table-striped text-center" id="exemp">
	    <thead>
    <tr>
    	<td>SELECT<br><input type="checkbox" id="fac_select_all"/></td>
    	<td>STUDENT ID</td>
    	<td>STUDENT NAME</td>
    </tr>
    </thead>
    <tbody>
    <%
	PreparedStatement ps3 = connection.prepareStatement("SELECT * FROM STUDENT");
    ResultSet rs3 = ps3.executeQuery();
    while(rs3.next()){%>
    <tr>
    	<td><input type="checkbox" name="listcheckbox" class="listcheckbox" value="<%=rs3.getInt(1)%>"></td>
    	<td><%=rs3.getInt(1) %></td>
    	<td><%=rs3.getString(2) %></td>
    </tr>
    <%}%>
    </tbody>
    <tfoot>
    		<tr>
            	<td style="visibility: hidden"></td>
                <td>STUDENT ID</td>
		    	<td>STUDENT NAME</td>
            </tr>
    </tfoot>
    </table>
    	<button type="submit">Register</button>
	  </div>
	</div>
	</form><br>
	<form align="center" action="studentsCourses.jsp"method="post">
		<button type="submit">STUDENT COURSES</button>
	</form>
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script>
	$(document).ready(function() {
	    // Setup - add a text input to each footer cell
	    $('#example tfoot td').each( function () {
	        var title = $(this).text();
	        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
	    } );
	 
	    // DataTable
	    var table = $('#example').DataTable({
	        initComplete: function () {
	            // Apply the search
	            this.api().columns().every( function () {
	                var that = this;
	 
	                $( 'input', this.footer() ).on( 'keyup change clear', function () {
	                    if ( that.search() !== this.value ) {
	                        that
	                            .search( this.value )
	                            .draw();
	                    }
	                } );
	            } );
	        }
	    });
	 
	} );
	</script>
	<script>
	$(document).ready(function() {
	    // Setup - add a text input to each footer cell
	    $('#exemp tfoot td').each( function () {
	        var title = $(this).text();
	        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
	    } );
	 
	    // DataTable
	    var table = $('#exemp').DataTable({
	        initComplete: function () {
	            // Apply the search
	            this.api().columns().every( function () {
	                var that = this;
	 
	                $( 'input', this.footer() ).on( 'keyup change clear', function () {
	                    if ( that.search() !== this.value ) {
	                        that
	                            .search( this.value )
	                            .draw();
	                    }
	                } );
	            } );
	        }
	    });
	 
	} );
	</script>
	<script>
	var modal = document.getElementById("myModal");

	// Get the button that opens the modal
	var btn = document.getElementById("myBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];

	// When the user clicks on the button, open the modal
	btn.onclick = function() {
	  modal.style.display = "block";
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	</script>
	<style>
	.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
	</style>
</html>