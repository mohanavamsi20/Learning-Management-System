package com.students;

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
 * Servlet implementation class SignupServlet
 */
@WebServlet("/studentSignup")
public class StudentSignup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSignup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String regid = request.getParameter("regid");
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        try {
        	Connection con = JdbcConnection.getConnection();
			PrintWriter out=response.getWriter();
            response.setContentType("text/html");
			if(FetchStudent.fetchStudent(email)) {
				out.println("<script type=\"text/javascript\">");
            	out.println("alert('You are already registered with this email!!!');");
            	out.println("location='studentSignup.jsp';");
            	out.println("</script>");
			}
			else {
				String sql="INSERT INTO STUDENT(REGID,FULLNAME,PHONE,EMAIL,PASSWORD) VALUES(?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, regid);
	            ps.setString(2, fullname);
	            ps.setString(3, phone);
	            ps.setString(4, email);
	            ps.setString(5, password);
	            int i = ps.executeUpdate();
	            if(i>0) {
	    			out.println("<script type=\"text/javascript\">");
	            	out.println("alert('Registration Successfull!!!');");
	            	out.println("location='studentSignup.jsp';");
	            	out.println("</script>");
	            }
	    		else {
	    			out.println("<script type=\"text/javascript\">");
	            	out.println("alert('Registration UnSuccessfull!!!');");
	            	out.println("location='studentSignup.jsp';");
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
