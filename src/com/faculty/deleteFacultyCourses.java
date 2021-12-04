package com.faculty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.*;
import com.jdbc.JdbcConnection;
import java.io.*;
/**
 * Servlet implementation class deleteFacultyCourses
 */
@WebServlet("/deleteFacultyCourses")
public class deleteFacultyCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteFacultyCourses() {
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
    		    		String sql1="DELETE FROM FACULTYCOURSES WHERE FACULTYID=? and COURSEID=?";
        		    	String sql="SELECT * FROM FACULTYCOURSES WHERE FACULTYID=? and COURSEID=?";
        		    	PreparedStatement ps=con.prepareStatement(sql);
        		    	PreparedStatement ps1=con.prepareStatement(sql1);
        		    	ps.setString(1, fac[i]);
        		    	ps.setString(2, courses[k]);
        		    	ps1.setString(1, fac[i]);
        		    	ps1.setString(2, courses[k]);
        		    	ResultSet rs=ps.executeQuery();
        		    	if(rs.next()) {
            		    	int e = ps1.executeUpdate();
            		    	if(e>0) {
                		    	out.println("<script type=\"text/javascript\">");
                		        out.println("alert('Faculty Courses Deleted Successful');");
                		        out.println("location='deleteFacultyCourses.jsp';");
                		        out.println("</script>");
            		    	}
            		    	else {
            		    		out.println("<script type=\"text/javascript\">");
                		        out.println("alert('Faculty Courses Deleted UnSuccessful');");
                		        out.println("location='deleteFacultyCourses.jsp';");
                		        out.println("</script>");
            		    	}
        		    	}
        		    	else {
        		    		out.println("<script type=\"text/javascript\">");
            		        out.println("alert('Faculty Courses Not Found');");
            		        out.println("location='deleteFacultyCourses.jsp';");
            		        out.println("</script>");
        		    	}
    		    	}
    		    }
    		  }
		catch(NullPointerException e) {
			out.println("<script type=\"text/javascript\">");
        	out.println("alert('PLEASE SELECT COURSES!!!');");
        	out.println("location='deleteFacultyCourses.jsp';");
        	out.println("</script>");
		}
        catch(NumberFormatException e) {
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('PLEASE SELECT FACULTY!!!');");
        	out.println("location='deleteFacultyCourses.jsp';");
        	out.println("</script>");
        }
       catch(Exception e) {
        	System.out.println(e);
        }
	}

}
