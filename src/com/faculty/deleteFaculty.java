package com.faculty;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.JdbcConnection;

/**
 * Servlet implementation class deleteFaculty
 */
@WebServlet("/deleteFaculty")
public class deleteFaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteFaculty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String cnfemail = request.getParameter("cnfrmemail");
        String password = request.getParameter("password");
        String cnfpassword = request.getParameter("cnfrmpassword");
        PrintWriter out = response.getWriter();
        if(email.compareTo(cnfemail)==0 && password.compareTo(cnfpassword)==0) {
        	if(FacultyLogin.checkFaculty(email, password))
            {
            	try {
            		Connection con = JdbcConnection.getConnection();
            		PreparedStatement ps = con.prepareStatement("DELETE FROM FACULTY WHERE EMAIL = ?");
            		ps.setString(1, email);
                    ps.executeQuery();
                    JdbcConnection.closeConnection();
                    response.setContentType("text/html");
                	out.println("<script type=\"text/javascript\">");
                	out.println("alert('Faculty Deleted Successfully');");
                	out.println("location='facultyDelete.jsp';");
                	out.println("</script>");
            	}
            	catch(Exception e) {
            		e.printStackTrace();
            	}
            	
            }
            else
            {
            	response.setContentType("text/html");
            	out.println("<script type=\"text/javascript\">");
            	out.println("alert('Email or password is incorrect');");
            	out.println("location='facultyDelete.jsp';");
            	out.println("</script>");
            	RequestDispatcher rs = request.getRequestDispatcher("facultyDelete.jsp");
            	rs.include(request, response);
            }
        }
        else {
        	response.setContentType("text/html");
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('Email or password do not match');");
        	out.println("location='facultyDelete.jsp';");
        	out.println("</script>");
        	RequestDispatcher rs = request.getRequestDispatcher("facultyDelete.jsp");
        	rs.include(request, response);
        } 	       
	}

}
