package com.lington.dao;

import com.lington.config.Dbconfig;
import com.lington.Model.usermodel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private Connection conn;

    public UserDao() throws Exception {
        conn = Dbconfig.getDbConnection();
        if (conn == null) {
            throw new SQLException("❌ DB connection is null.");
        } else {
            System.out.println("✅ DB connection established.");
            if (!conn.getAutoCommit()) {
                conn.setAutoCommit(true);
            }
        }
    }

    // ✅ DELETE USER method
    public void deleteUser(int userId) throws SQLException {
        String sql = "DELETE FROM user WHERE User_ID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            int rows = ps.executeUpdate();
            System.out.println("🗑️ Deleted user rows: " + rows);
            if (rows == 0) {
                throw new SQLException("No user found with ID: " + userId);
            }
        }
    }



    // (Optional) Example: get all users (used in user management page)
    public List<usermodel> getAllUsers() {
        List<usermodel> userList = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                usermodel u = new usermodel(
                        rs.getInt("UserID"),
                        rs.getString("FirstName"),
                        rs.getString("LastName"),
                        rs.getString("Username"),
                        rs.getDate("DOB").toLocalDate(),
                        rs.getString("Gender"),
                        rs.getString("Email"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Password"),
                        rs.getString("Role")
                );
                userList.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }
}
