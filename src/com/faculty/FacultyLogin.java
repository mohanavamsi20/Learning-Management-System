package com.faculty;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jdbc.JdbcConnection;


/**
 * Servlet implementation class FacultyLoginServlet
 */
@WebServlet("/facultyLogin")
public class FacultyLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static String facultyid;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath() + "/facultyLogin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String facultyemail = request.getParameter("facultyemail");
        String facultypassword = request.getParameter("facultypassword");
    	PrintWriter out = response.getWriter();
        if(checkFaculty(facultyemail, facultypassword))
        {
        	try {        		
        		Connection con = JdbcConnection.getConnection();
                HttpSession session=request.getSession();
            	session.setAttribute("facultyid", facultyid);
            	session.setAttribute("facultyemail", facultyemail);
        		PreparedStatement ps = con.prepareStatement("INSERT INTO FACLOGINDATA(FACEMAIL,FACLOGINTIME) VALUES(?,CURRENT_TIMESTAMP)");
        		ps.setString(1, facultyemail);
                ps.executeQuery();
        		JdbcConnection.closeConnection();
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        	}
        	response.sendRedirect("facultyHome.jsp");
        }
        else
        {
        	response.setContentType("text/html");
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('Email or password is incorrect');");
        	out.println("location='facultyLogin.jsp';");
        	out.println("</script>");
        	RequestDispatcher rs = request.getRequestDispatcher("facultyLogin.jsp");
        	rs.include(request, response);
        }
	}
	public static boolean checkFaculty(String facultyemail,String facultypassword) 
    {
        boolean st =false;
        try {
        	Connection con = JdbcConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM FACULTY WHERE EMAIL=? and PASSWORD=?");
            ps.setString(1, facultyemail);
            ps.setString(2, facultypassword);
            ResultSet rs = ps.executeQuery();
            st = rs.next();
            facultyid=rs.getString("FACULTYID");
            JdbcConnection.closeConnection();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;                 
    }
}
