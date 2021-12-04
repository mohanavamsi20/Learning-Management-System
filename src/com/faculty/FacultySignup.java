package com.faculty;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.JdbcConnection;

/**
 * Servlet implementation class FacultySignupServlet
 */
@WebServlet("/facultySignup")
public class FacultySignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultySignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String facid = request.getParameter("facid");
        String facname = request.getParameter("facname");
        String facphone = request.getParameter("facphone");
        String facemail = request.getParameter("facemail");
        String facpassword = request.getParameter("facpassword");
        try {
        	Connection con = JdbcConnection.getConnection();
			PrintWriter out=response.getWriter();
            response.setContentType("text/html");
			if(FetchFaculty.fetchFaculty(facemail)) {
				out.println("<script type=\"text/javascript\">");
            	out.println("alert('You are already registered with this email!!!');");
            	out.println("location='facultySignup.jsp';");
            	out.println("</script>");
			}
			else {
				String sql="INSERT INTO FACULTY(FACULTYID,FULLNAME,PHONE,EMAIL,PASSWORD) VALUES(?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, facid);
	            ps.setString(2, facname);
	            ps.setString(3, facphone);
	            ps.setString(4, facemail);
	            ps.setString(5, facpassword);
	            int i = ps.executeUpdate();
	            if(i>0) {
	    			out.println("<script type=\"text/javascript\">");
	            	out.println("alert('Registration Successfull!!!');");
	            	out.println("location='facultySignup.jsp';");
	            	out.println("</script>");
	            }
	    		else {
	    			out.println("<script type=\"text/javascript\">");
	            	out.println("alert('Registration UnSuccessfull!!!');");
	            	out.println("location='facultySignup.jsp';");
	            	out.println("</script>");
	    		}
	            JdbcConnection.closeConnection();
			}
        }
		catch(Exception e) {
			System.out.println(e);
		}
	}

}
