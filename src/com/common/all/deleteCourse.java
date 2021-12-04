package com.common.all;

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

import com.faculty.FacultyLogin;
import com.jdbc.JdbcConnection;

/**
 * Servlet implementation class deleteCourse
 */
@WebServlet("/deleteCourse")
public class deleteCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String couid = request.getParameter("couid");
        PrintWriter out = response.getWriter();
            	try {
            		Connection con = JdbcConnection.getConnection();
            		PreparedStatement ps = con.prepareStatement("DELETE FROM COURSE WHERE COURSEID = ?");
            		ps.setString(1, couid);
                    ps.executeQuery();
                    JdbcConnection.closeConnection();
                    response.setContentType("text/html");
                	out.println("<script type=\"text/javascript\">");
                	out.println("alert('Course Deleted Successfully');");
                	out.println("location='deleteCourse.jsp';");
                	out.println("</script>");
            	}
            	catch(Exception e) {
            		e.printStackTrace();
            	}
	}

}
