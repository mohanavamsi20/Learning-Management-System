package com.students;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jdbc.JdbcConnection;

public class FetchStudent {
	public static boolean fetchStudent(String email) {
		boolean found = false;
		 try {
			 Connection con = JdbcConnection.getConnection();
		     PreparedStatement ps = con.prepareStatement("SELECT * FROM STUDENT WHERE EMAIL=?");
		     ps.setString(1, email);
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
