package com.lington.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * DbConfig is a configuration class for managing database connections.
 * It handles the connection to a MySQL database using JDBC.
 */
public class Dbconfig {

    // Database configuration
    private static final String DB_NAME = "lingtonstore";
    private static final String URL = "jdbc:mysql://localhost:3306/" + DB_NAME;
    private static final String USERNAME = "root";    
    private static final String PASSWORD = "";  
    /** 
     * Establishes and returns a connection to the database.
     *
     * @return Connection object
     * @throws SQLException if connection fails
     * @throws ClassNotFoundException if JDBC driver is missing
     */
    public static Connection getDbConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL JDBC driver
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}


/*
public class dbconfig {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        // step 1 register the driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // step 2 Establish the connection
        @SuppressWarnings("unused")
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/lington-store", "root", "");
        System.out.println("connection created");
    }
}*/

