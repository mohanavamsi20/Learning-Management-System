package com.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class JdbcConnection {
	public static Connection con;
	public static Connection getConnection() {
		try {
        	Class.forName("oracle.jdbc.driver.OracleDriver");
			String dbuser = "LMSEP";
			String dbpswd = "33535";
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",dbuser,dbpswd);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
		return con;
	}
	public static void closeConnection() {
        try {
			con.close();
		} 
        catch (Exception e) {
			e.printStackTrace();
		}
	}
}
