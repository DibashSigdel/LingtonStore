package com.lington.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.lington.config.dbconfig;
import com.lington.Model.usermodel;

public class signupservice {

    private Connection dbConn;

    /**
     * Constructor initializes the database connection.
     */
    public signupservice() {
        try {
            this.dbConn = dbconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    /**
     * Registers a new user in the database.
     *
     * @param userModel the user details to be registered
     * @return Boolean indicating the success of the operation
     */
    public Boolean addUser(usermodel userModel) {
        if (dbConn == null) {
            System.err.println("Database connection is not available.");
            return null;
        }

        String insertQuery = "INSERT INTO users (username, first_name, last_name, gender, dob, email, password, phone_number) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(insertQuery)) {
            stmt.setString(1, userModel.getUsername());
            stmt.setString(2, userModel.getFirstName());
            stmt.setString(3, userModel.getLastName());
            stmt.setString(4, userModel.getGender());
            stmt.setDate(5, Date.valueOf(userModel.getDob())); // Ensure DOB is in YYYY-MM-DD format
            stmt.setString(6, userModel.getEmail());
            stmt.setString(7, userModel.getPassword());
            stmt.setString(8, userModel.getPhoneNumber());

            return stmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error during user registration: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
