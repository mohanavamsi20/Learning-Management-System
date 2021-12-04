package com.common.all;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.faculty.FetchFaculty;
import com.jdbc.JdbcConnection;

/**
 * Servlet implementation class addcourse
 */
@WebServlet("/addcourse")
public class addcourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addcourse() {
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
        String couname = request.getParameter("couname");
        String couyear = request.getParameter("couyear");
        String cousem = request.getParameter("cousem");
        try {
        	Connection con = JdbcConnection.getConnection();
			PrintWriter out=response.getWriter();
            response.setContentType("text/html");
			if(fetchCourse.fetchcourse(couid)) {
				out.println("<script type=\"text/javascript\">");
            	out.println("alert('Course is already added !!!');");
            	out.println("location='addcourse.jsp';");
            	out.println("</script>");
			}
			else {
				String sql="INSERT INTO COURSE(COURSEID,COURSENAME,YR,SEM) VALUES(?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, couid);
	            ps.setString(2, couname);
	            ps.setString(3, couyear);
	            ps.setString(4, cousem);
	            int i = ps.executeUpdate();
	            if(i>0) {
	    			out.println("<script type=\"text/javascript\">");
	            	out.println("alert('Registration Successfull!!!');");
	            	out.println("location='addcourse.jsp';");
	            	out.println("</script>");
	            }
	    		else {
	    			out.println("<script type=\"text/javascript\">");
	            	out.println("alert('Registration UnSuccessfull!!!');");
	            	out.println("location='addcourse.jsp';");
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
