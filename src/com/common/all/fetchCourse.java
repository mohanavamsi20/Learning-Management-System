package com.common.all;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.jdbc.JdbcConnection;

public class fetchCourse {
	public static boolean fetchcourse(String couid) {
		boolean found = false;
		 try {
		     Connection con = JdbcConnection.getConnection();
		     PreparedStatement ps = con.prepareStatement("SELECT * FROM COURSE WHERE COURSEID=?");
		     ps.setString(1, couid);
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
