package com.faculty;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.JdbcConnection;

/**
 * Servlet implementation class Logout
 */
@WebServlet("/facultyLogout")
public class FacultyLogout extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		try {
			Connection con = JdbcConnection.getConnection();
    		PreparedStatement ps = con.prepareStatement("INSERT INTO FACLOGOUTDATA(FACEMAIL,FACLOGOUTTIME) VALUES(?,CURRENT_TIMESTAMP)");
    		ps.setString(1, (String) session.getAttribute("facultyemail"));
            ps.executeQuery();
            JdbcConnection.closeConnection();
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
		session.invalidate();
		response.sendRedirect("facultyLogin.jsp");
	}
}
