package com.lington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;

import com.lington.Model.usermodel;
import com.lington.config.Dbconfig;

public class signinservice {

    public Boolean signinUser(usermodel user) {
        String username = user.getUsername();
        String password = user.getPassword();
        
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            return false;
        }
        
        try (Connection conn = Dbconfig.getDbConnection()) {
            String sql = "SELECT * FROM user WHERE Username = ? AND Password = ?";
            
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, username);
                stmt.setString(2, password);
                
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Set all user properties from database
                        int userId = rs.getInt("User_ID");
                        String firstName = rs.getString("FirstName");
                        String lastName = rs.getString("LastName");
                        String gender = rs.getString("Gender");
                        String email = rs.getString("Email");
                        String phoneNumber = rs.getString("PhoneNumber");
                        String role = rs.getString("Role");
                        
                        // Get date of birth if it exists
                        LocalDate dob = null;
                        if (rs.getDate("DOB") != null) {
                            dob = rs.getDate("DOB").toLocalDate();
                        }
                        
                        // Update the user model with all data
                        user.setId(userId);
                        user.setFirstName(firstName);
                        user.setLastName(lastName);
                        user.setGender(gender);
                        user.setEmail(email);
                        user.setPhoneNumber(phoneNumber);
                        user.setDob(dob);
                        user.setRole(role);
                        
                        // Debug output
                        System.out.println("User authenticated and details loaded:");
                        System.out.println("ID: " + userId);
                        System.out.println("Username: " + username);
                        System.out.println("Email: " + email);
                        System.out.println("Role: " + role);
                        
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        
        return false;
    }
}