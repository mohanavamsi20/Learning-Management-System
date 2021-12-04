package com.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/adminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.sendRedirect(request.getContextPath() + "/adminLogin.jsp");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String adminusername = request.getParameter("adminusername");
        String adminpassword = request.getParameter("adminpassword");
        PrintWriter out = response.getWriter();
        if(AdminValidate.checkAdmin(adminusername, adminpassword))
        {
          HttpSession session=request.getSession();
          session.setAttribute("adminusername", adminusername);
          response.sendRedirect("adminHome.jsp");
        }
        else
        {
          response.setContentType("text/html");
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Username or password is incorrect');");
          out.println("location='adminLogin.jsp';");
          out.println("</script>");
          RequestDispatcher rs = request.getRequestDispatcher("adminLogin.jsp");
      	  rs.include(request, response);
        }        
    }
}
