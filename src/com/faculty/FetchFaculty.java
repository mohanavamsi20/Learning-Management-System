package com.faculty;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jdbc.JdbcConnection;

public class FetchFaculty {
	public static boolean fetchFaculty(String facemail) {
		boolean found = false;
		 try {
		     Connection con = JdbcConnection.getConnection();
		     PreparedStatement ps = con.prepareStatement("SELECT * FROM FACULTY WHERE EMAIL=?");
		     ps.setString(1, facemail);
		     ResultSet rs = ps.executeQuery();
		     found = rs.next();
		     JdbcConnection.closeConnection();
		 }
		 catch(Exception e) {
		          e.printStackTrace();
		 }
		 return found;    	 
	}
}
