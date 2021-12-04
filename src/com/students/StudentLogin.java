package com.students;

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/studentLogin")
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public static String regid;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect(request.getContextPath() + "/studentLogin.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub		else
		String email = request.getParameter("email");
        String password = request.getParameter("password");
    	PrintWriter out = response.getWriter();
        if(checkStudent(email, password))
        {
        	try {
        		Connection con = JdbcConnection.getConnection();
        		HttpSession session=request.getSession();
        		session.setAttribute("regid", regid);
        		session.setAttribute("email", email);
            	PreparedStatement ps = con.prepareStatement("INSERT INTO STULOGINDATA(STUEMAIL,STULOGINTIME) VALUES(?,CURRENT_TIMESTAMP)");
        		ps.setString(1, email);
                ps.executeQuery();
                JdbcConnection.closeConnection();
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        	}
        	response.sendRedirect("studentHome.jsp");
        }
        else
        {
        	response.setContentType("text/html");
        	out.println("<script type=\"text/javascript\">");
        	out.println("alert('Email or password is incorrect');");
        	out.println("location='studentLogin.jsp';");
        	out.println("</script>");
        	RequestDispatcher rs = request.getRequestDispatcher("studentLogin.jsp");
        	rs.include(request, response);
        }
	}
	public static boolean checkStudent(String email,String password) 
    {
        boolean st =false;
        try {
        	Connection con = JdbcConnection.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM STUDENT WHERE EMAIL=? AND PASSWORD=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            st = rs.next();
            regid=rs.getString("REGID");
            JdbcConnection.closeConnection();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return st;                 
    }
}