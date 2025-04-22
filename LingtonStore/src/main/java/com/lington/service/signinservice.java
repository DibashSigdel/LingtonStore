package com.lington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.lington.Model.usermodel;
import com.lington.config.Dbconfig;
import com.lington.util.PasswordUtil;

public class signinservice {
	
	private Connection dbConn;
	private boolean isConnectionError = false;
	
	public signinservice() {
		try {
			dbConn = Dbconfig.getDbConnection();
		} catch (SQLException | ClassNotFoundException ex) {
			ex.printStackTrace();
			isConnectionError = true;
		}
	}

	public Boolean signinUser(usermodel Usermodel) {
	    if (isConnectionError) {
	        System.out.println("Connection Error!");
	        return null;
	    }

	    String query = "SELECT username, password FROM `user` WHERE username = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, Usermodel.getUsername());
	        ResultSet result = stmt.executeQuery();

	        if (result.next()) {
	            String dbPassword = result.getString("password");
	            // Simple plain text comparison
	            return Usermodel.getPassword().equals(dbPassword);
	        }
	        return false; // User not found
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
	 
}