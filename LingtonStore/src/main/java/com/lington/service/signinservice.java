package com.lington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.lington.Model.usermodel;
import com.lington.config.Dbconfig;

public class signinservice {

    public Boolean loginUser(usermodel user) {
        String query = "SELECT * FROM user WHERE username = ? AND password = ?";

        try (Connection conn = Dbconfig.getDbConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());

            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next(); // returns true if a matching row is found
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null; // return null for DB error
        }
    }
}