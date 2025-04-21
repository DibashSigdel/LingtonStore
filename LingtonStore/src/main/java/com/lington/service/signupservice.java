package com.lington.service;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.lington.config.Dbconfig;
import com.lington.Model.usermodel;

public class signupservice {

    private Connection dbConn;

    /**
     * Constructor initializes the database connection.
     */
    public signupservice() {
        try {
        	
            this.dbConn = Dbconfig.getDbConnection();
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
    public Boolean addUser(usermodel user) {
        String insertQuery = "INSERT INTO user (username, firstName, lastName, gender, dob, email, password, phoneNumber) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement pstmt = dbConn.prepareStatement(insertQuery)) {
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getFirstName());
            pstmt.setString(3, user.getLastName());
            pstmt.setString(4, user.getGender());
            pstmt.setDate(5, java.sql.Date.valueOf(user.getDob()));
            pstmt.setString(6, user.getEmail());
            pstmt.setString(7, user.getPassword());
            pstmt.setInt(8, Integer.parseInt(user.getPhoneNumber())); // 🔥 fixed line

            int rows = pstmt.executeUpdate();
            return rows > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }
}
