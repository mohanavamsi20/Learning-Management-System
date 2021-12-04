package com.students;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class StudentSelectAssignment
 */
@WebServlet("/selectStudentAssignment")
public class StudentSelectAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentSelectAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String assignmentId = request.getParameter("assignmentId");
		HttpSession session=request.getSession();
        session.setAttribute("assignmentId", assignmentId);
        RequestDispatcher rs = request.getRequestDispatcher("studentCourseAssignmentHome.jsp");
        rs.include(request, response);
	}

}
