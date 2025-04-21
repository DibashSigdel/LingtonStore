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

	public Boolean loginUser(usermodel Usermodel) {
		if (isConnectionError) {
			System.out.println("Connection Error!");
			return null;
		}

		String query = "SELECT username, password FROM `user` WHERE username = ?";
		try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
			stmt.setString(1, Usermodel.getUsername());
			ResultSet result = stmt.executeQuery();

			if (result.next()) {
				return validatePassword(result, Usermodel);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return false;
	}
	
	private boolean validatePassword(ResultSet result, usermodel Usermodel) throws SQLException {
		String dbUsername = result.getString("username");
		String dbPassword = result.getString("password");

		return dbUsername.equals(Usermodel.getUsername())
				&& PasswordUtil.decrypt(dbPassword, dbUsername).equals(Usermodel.getPassword());
	}

}