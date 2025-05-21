package com.lington.dao;

import com.lington.Model.Cartitemmodel;
import com.lington.Model.OrderModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDAO {
    private final Connection conn;

    public OrderDAO(Connection conn) {
        this.conn = conn;
    }

    public int saveOrder(OrderModel order, String fullname, String email, String address) throws SQLException {
        int userId = order.getUserId();
        if (userId <= 0) {
            userId = createOrGetGuestUser(email, fullname);
            order.setUserId(userId);
        }

        String insertOrderSQL = "INSERT INTO orders (User_ID, TotalAmount, PaymentStatus, ShippingStatus, OrderDate, Fullname, Email, ShippingAddress) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String insertItemSQL = "INSERT INTO order_items (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";

        PreparedStatement orderStmt = null;
        PreparedStatement itemStmt = null;
        ResultSet rs = null;

        try {
            conn.setAutoCommit(false);

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
            if (affectedRows == 0) throw new SQLException("Creating order failed, no rows affected.");

            rs = orderStmt.getGeneratedKeys();
            int orderId;
            if (rs.next()) {
                orderId = rs.getInt(1);
            } else {
                throw new SQLException("Creating order failed, no ID obtained.");
            }

            itemStmt = conn.prepareStatement(insertItemSQL);
            for (Cartitemmodel item : order.getItems()) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getProduct().getId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setDouble(4, item.getProduct().getPrice());
                itemStmt.addBatch();
            }
            itemStmt.executeBatch();

            conn.commit();
            return orderId;

        } catch (SQLException e) {
            if (conn != null) conn.rollback();
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (orderStmt != null) orderStmt.close();
            if (itemStmt != null) itemStmt.close();
            if (conn != null) conn.setAutoCommit(true);
        }
    }

    public List<OrderModel> getAllOrders() throws SQLException {
        List<OrderModel> orders = new ArrayList<>();
        String sql = "SELECT OrderID, User_ID, TotalAmount, PaymentStatus, ShippingStatus, OrderDate, DeliveryDate FROM orders";

        try (PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                OrderModel order = new OrderModel();
                order.setOrderId(rs.getInt("OrderID"));
                order.setUserId(rs.getInt("User_ID"));
                order.setTotalAmount(rs.getDouble("TotalAmount"));
                order.setPaymentStatus(rs.getString("PaymentStatus"));
                order.setShippingStatus(rs.getString("ShippingStatus"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setDeliveryDate(rs.getDate("DeliveryDate"));
                orders.add(order);
            }
        }
        return orders;
    }

    private int createOrGetGuestUser(String email, String fullname) throws SQLException {
        String checkSQL = "SELECT User_ID FROM user WHERE Email = ? AND Role = 'GUEST'";
        String insertSQL = "INSERT INTO user (Email, FirstName, LastName, Username, Gender, Password, Role) VALUES (?, ?, ?, ?, 'Not Specified', 'guest', 'GUEST')";

        try (PreparedStatement checkStmt = conn.prepareStatement(checkSQL)) {
            checkStmt.setString(1, email);
            ResultSet rs = checkStmt.executeQuery();

            if (rs.next()) {
                return rs.getInt("User_ID");
            }
        }

        String firstName = fullname;
        String lastName = "";
        if (fullname.contains(" ")) {
            String[] nameParts = fullname.split(" ", 2);
            firstName = nameParts[0];
            lastName = nameParts[1];
        }

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
