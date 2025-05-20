package com.lington.service;

import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.lington.config.Dbconfig;
import com.lington.Model.usermodel;

public class signupservice {

    private Connection dbConn;

    public signupservice() {
        try {
            this.dbConn = Dbconfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
        }
    }

    public Boolean addUser(usermodel user) {
        String insertQuery = "INSERT INTO user (firstName, lastName ,username, dob,gender, email, phoneNumber,password,role) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = dbConn.prepareStatement(insertQuery)) {
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getUsername());
            pstmt.setDate(4, Date.valueOf(user.getDob()));
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getEmail());
            pstmt.setString(7, user.getPhoneNumber());
            pstmt.setString(8, user.getPassword());
            pstmt.setString(9, user.getRole());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public boolean updateUser(usermodel user) {
        String updateQuery = "UPDATE user SET firstName=?, lastName=?, username=?, dob=?, gender=?, email=?, phoneNumber=?, password=?, role=? WHERE user_id=?";
        try (PreparedStatement pstmt = dbConn.prepareStatement(updateQuery)) {
            pstmt.setString(1, user.getFirstName());
            pstmt.setString(2, user.getLastName());
            pstmt.setString(3, user.getUsername());
            pstmt.setDate(4, Date.valueOf(user.getDob()));
            pstmt.setString(5, user.getGender());
            pstmt.setString(6, user.getEmail());
            pstmt.setString(7, user.getPhoneNumber());
            pstmt.setString(8, user.getPassword());
            pstmt.setString(9, user.getRole());
            pstmt.setInt(10, user.getId());
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public List<usermodel> getAllUsers() {
        List<usermodel> users = new ArrayList<>();
        String query = "SELECT * FROM user";
        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                users.add(new usermodel(
                    rs.getInt("user_id"),
                    rs.getString("firstName"),
                    rs.getString("lastName"),
                    rs.getString("username"),
                    rs.getDate("dob").toLocalDate(),
                    rs.getString("gender"),
                    rs.getString("email"),
                    rs.getString("phoneNumber"),
                    rs.getString("password"),
                    rs.getString("role")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
}
