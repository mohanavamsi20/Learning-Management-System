package com.common.all;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdbc.*;

/**
 * Servlet implementation class StudentDownloadCourseAssignment
 */
@WebServlet("/downloadCourseAssignment")
public class DownloadCourseAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// size of byte buffer to send file
    private static final int BUFFER_SIZE = 4096;   

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadCourseAssignment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadId = (String)(request.getParameter("filename")); 

        try {
        	Connection conn = JdbcConnection.getConnection();
            PreparedStatement statement = conn.prepareStatement("SELECT * FROM COURSEASSIGNMENTS WHERE ASSIGN_TITLE = ?");

            statement.setString(1, uploadId);

            ResultSet result = statement.executeQuery();
            if (result.next()) {

                // gets file name and file blob data
                String fileName = result.getString("ASSIGN_TITLE");
                Blob blob = result.getBlob("ASSIGN_FILE");
                InputStream inputStream = blob.getBinaryStream();
                long fileLength = blob.length();
                //System.out.println(fileName);
                //System.out.println(fileLength);

                ServletContext context = getServletContext();

                // sets MIME type for the file download
                String mimeType = context.getMimeType(fileName);
                if (mimeType == null) {        
                    mimeType = "application/octet-stream";
                }              

                // set content properties and header attributes for the response
                response.setContentType(mimeType);
                response.setContentLengthLong(fileLength);
                String headerKey = "Content-Disposition";
                String headerValue = String.format("attachment; filename=\"%s\"", fileName);
                response.setHeader(headerKey, headerValue);

                //System.out.println(response);

                // writes the file to the client
                OutputStream outStream = response.getOutputStream();

                byte[] buffer = new byte[BUFFER_SIZE];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outStream.write(buffer, 0, bytesRead);
                }

                inputStream.close();
                outStream.close();             
            } else {
                response.getWriter().print("File not found: " + uploadId);  
            }
        } 
        catch(Exception e) {
            System.out.println(e);
        }
	}

}