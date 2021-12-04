package com.admin;

import java.sql.*;
import com.jdbc.JdbcConnection;

public class AdminValidate {
	public static boolean checkAdmin(String uname,String pass) {
		boolean valid =false;
        try {
        	Connection con = JdbcConnection.getConnection();
        	PreparedStatement ps = con.prepareStatement("SELECT * FROM ADMINCRED WHERE ADMINUSERNAME=? AND ADMINPASSWORD=?");
            ps.setString(1, uname);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();
            valid = rs.next();
            JdbcConnection.closeConnection();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return valid;
	}
}