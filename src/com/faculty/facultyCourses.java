package com.faculty;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jdbc.JdbcConnection;
import java.sql.*;
import java.io.*;

/**
 * Servlet implementation class facultyCourses
 */
@WebServlet("/facultyCourses")
public class facultyCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String courses[];
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facultyCourses() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
        response.setContentType("text/html");
        try {
	        	Connection con = JdbcConnection.getConnection();
	        	int [] j= null;
	        	String [] m = null;
	        	String courses[]=request.getParameterValues("checkbox");
	        	String fac[]=request.getParameterValues("listcheckbox");
	        	Statement stmt = con.createStatement();
    		    for(int i=0;i<fac.length;i++){
    		    	for(int k=0;k<courses.length;k++) {
    		    		String sql1="SELECT * FROM FACULTYCOURSES WHERE FACULTYID=? and COURSEID=?";
        		    	PreparedStatement ps=con.prepareStatement(sql1);
        		    	ps.setString(1, fac[i]);
        		    	ps.setString(2, courses[k]);
        		    	ResultSet rs = ps.executeQuery();
        		    	if(rs.next()) {
            		    	out.println("<script type=\"text/javascript\">");
            		        out.println("alert('Some of the courses are already registred');");
            		        out.println("location='addFacultyCourses.jsp';");
            		        out.println("</script>");
        		    	}
        		    	else {
        		    		String sql="INSERT INTO FACULTYCOURSES VALUES ('"+fac[i]+"','"+courses[k]+"')";
        		    		stmt.addBatch(sql);
        	        		j=stmt.executeBatch();
        		    	}
    		    	}
    		    }
    		    for(int i=0;i<j.length;i++) {
    		    	if(j[i]>0) {
    		    		out.println("<script type=\"text/javascript\">");
    		        	out.println("alert('Faculty Courses Registration Successful');");
    		        	out.println("location='addFacultyCourses.jsp';");
    		        	out.println("</script>");
    		    	}
    		    	else{
    		    		out.println("<script type=\"text/javascript\">");
    		        	out.println("alert('Faculty Courses Registration UnSuccessful');");
    		        	out.println("location='addFacultyCourses.jsp';");
    		        	out.println("</script>");
    		    	}
    		    }
    		  }
		catch(NullPointerException e) {
			out.println("<script type=\"text/javascript\">");
        	out.println("alert('PLEASE SELECT COURSES!!!');");
        	out.println("location='addFacultyCourses.jsp';");
        	out.println("</script>");
		}
        catch(NumberFormatException e) {
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('PLEASE SELECT FACULTY!!!');");
        	out.println("location='addFacultyCourses.jsp';");
        	out.println("</script>");
        }
       catch(Exception e) {
        	System.out.println(e);
        }
	}
}
