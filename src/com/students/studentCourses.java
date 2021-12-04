package com.students;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.JdbcConnection;

/**
 * Servlet implementation class studentCourses
 */
@WebServlet("/studentCourses")
public class studentCourses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public studentCourses() {
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
	        	String stu[]=request.getParameterValues("listcheckbox");
	        	Statement stmt = con.createStatement();
    		    for(int i=0;i<stu.length;i++){
    		    	for(int k=0;k<courses.length;k++) {
    		    		String sql1="SELECT * FROM STUDENTCOURSES WHERE REGID=? and COURSEID=?";
        		    	PreparedStatement ps=con.prepareStatement(sql1);
        		    	ps.setString(1, stu[i]);
        		    	ps.setString(2, courses[k]);
        		    	ResultSet rs = ps.executeQuery();
        		    	if(rs.next()) {
            		    	out.println("<script type=\"text/javascript\">");
            		        out.println("alert('Some of the courses are already registred');");
            		        out.println("location='addFacultyCourses.jsp';");
            		        out.println("</script>");
        		    	}
        		    	else {
        		    		String sql="INSERT INTO STUDENTCOURSES VALUES ('"+stu[i]+"','"+courses[k]+"')";
        		    		stmt.addBatch(sql);
        	        		j=stmt.executeBatch();
        		    	}
    		    	}
    		    }
    		    for(int i=0;i<j.length;i++) {
    		    	if(j[i]>0) {
    		    		out.println("<script type=\"text/javascript\">");
    		        	out.println("alert('Student Courses Registration Successful');");
    		        	out.println("location='addStudentCourses.jsp';");
    		        	out.println("</script>");
    		    	}
    		    	else{
    		    		out.println("<script type=\"text/javascript\">");
    		        	out.println("alert('Student Courses Registration UnSuccessful');");
    		        	out.println("location='addStudentCourses.jsp';");
    		        	out.println("</script>");
    		    	}
    		    }
    		  }
		catch(NullPointerException e) {
			out.println("<script type=\"text/javascript\">");
        	out.println("alert('PLEASE SELECT COURSES!!!');");
        	out.println("location='addStudentCourses.jsp';");
        	out.println("</script>");
		}
        catch(NumberFormatException e) {
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('PLEASE SELECT STUDENT!!!');");
        	out.println("location='addStudentCourses.jsp';");
        	out.println("</script>");
        }
       catch(Exception e) {
        	System.out.println(e);
        }
	}

}
