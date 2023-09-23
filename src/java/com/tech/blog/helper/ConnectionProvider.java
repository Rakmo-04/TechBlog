package com.tech.blog.helper;

import java.sql.*;

public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection() {
        try {
            if (con == null) {
                Class.forName("com.mysql.jdbc.Driver");
                // Assuming MySQL server is running on the default port (3306)
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "Hare@Krishna2004");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Log the exception or use a logging framework
        }
        return con;
    }
}
