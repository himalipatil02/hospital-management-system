package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
	private static Connection con;
	public static Connection getcon() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital_management_system","root","Lokhande#123");
			
			} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
}
