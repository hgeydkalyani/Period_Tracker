package com.period_tacker;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/periodtacker",
            "root",   // your MySQL username
            "Kalyani@123" // your MySQL password
        );
    }
}
