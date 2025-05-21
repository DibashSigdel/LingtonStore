package com.lington.dao;
import com.lington.Model.Cartitemmodel;
import com.lington.Model.OrderModel;
import java.sql.*;
import java.util.List;
public class OrderDAO {
    private final Connection conn;
    
    public OrderDAO(Connection conn) {
        this.conn = conn;
    }
    
    public int saveOrder(OrderModel order, String fullname, String email, String address) throws SQLException {
        // For guest checkout, use a default user ID if needed
        int userId = order.getUserId();
        if (userId <= 0) {
            // Option 1: Create a guest user entry (recommended if you need to track orders)
            userId = createOrGetGuestUser(email, fullname);
            order.setUserId(userId);
            
            // Option 2: If your DB allows NULL for User_ID, modify the SQL below to use NULL
            // This would require removing the foreign key constraint
        }
        
        String insertOrderSQL = "INSERT INTO orders (User_ID, TotalAmount, PaymentStatus, ShippingStatus, OrderDate, Fullname, Email, ShippingAddress) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String insertItemSQL = "INSERT INTO order_items (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
        
        PreparedStatement orderStmt = null;
        PreparedStatement itemStmt = null;
        ResultSet rs = null;
        
        try {
            // Begin transaction
            conn.setAutoCommit(false);
            
            // Insert order
            orderStmt = conn.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, userId);
            orderStmt.setDouble(2, order.getTotalAmount());
            orderStmt.setString(3, order.getPaymentStatus());
            orderStmt.setString(4, order.getShippingStatus());
            orderStmt.setDate(5, new java.sql.Date(order.getOrderDate().getTime()));
            orderStmt.setString(6, fullname);
            orderStmt.setString(7, email);
            orderStmt.setString(8, address);
            
            int affectedRows = orderStmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }
            
            // Get generated order ID
            rs = orderStmt.getGeneratedKeys();
            int orderId;
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }
            
            // Insert order items
            itemStmt = conn.prepareStatement(insertItemSQL);
            for (Cartitemmodel item : order.getItems()) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getProduct().getId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setDouble(4, item.getProduct().getPrice());
                itemStmt.addBatch();
            }
            itemStmt.executeBatch();
            
            // Commit transaction
            conn.commit();
            return orderId;
        } catch (SQLException e) {
            // Rollback on error
            if (conn != null) {
                conn.rollback();
            }
            throw e;
        } finally {
            // Cleanup
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (orderStmt != null) try { orderStmt.close(); } catch (SQLException ignore) {}
            if (itemStmt != null) try { itemStmt.close(); } catch (SQLException ignore) {}
            if (conn != null) conn.setAutoCommit(true);
        }
    }
    
    private int createOrGetGuestUser(String email, String fullname) throws SQLException {
        // Check if a guest user with this email exists
        String checkSQL = "SELECT User_ID FROM user WHERE Email = ? AND Role = 'GUEST'";
        String insertSQL = "INSERT INTO user (Email, FirstName, LastName, Username, Gender, Password, Role) VALUES (?, ?, ?, ?, 'Not Specified', 'guest', 'GUEST')";
        
        try (PreparedStatement checkStmt = conn.prepareStatement(checkSQL)) {
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                return rs.getInt("User_ID");
            }
        }
        
        // Split fullname into first and last name (basic implementation)
        String firstName = fullname;
        String lastName = "";
        if (fullname.contains(" ")) {
            String[] nameParts = fullname.split(" ", 2);
            firstName = nameParts[0];
            lastName = nameParts[1];
        }
        
        // Create a new guest user
        try (PreparedStatement insertStmt = conn.prepareStatement(insertSQL, Statement.RETURN_GENERATED_KEYS)) {
            insertStmt.setString(1, email);
            insertStmt.setString(2, firstName);
            insertStmt.setString(3, lastName);
            insertStmt.setString(4, "guest_" + System.currentTimeMillis());
            
            insertStmt.executeUpdate();
            ResultSet rs = insertStmt.getGeneratedKeys();
            
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                throw new SQLException("Creating guest user failed, no ID obtained.");
            }
        }
    }
}