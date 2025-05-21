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

    public void saveOrderItems(int orderId, List<Cartitemmodel> items) throws SQLException {
        String sql = "INSERT INTO order_items (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            for (Cartitemmodel item : items) {
                stmt.setInt(1, orderId);
                stmt.setInt(2, item.getProduct().getId());
                stmt.setInt(3, item.getQuantity());
                stmt.setDouble(4, item.getProduct().getPrice());
                stmt.addBatch();
            }
            stmt.executeBatch();
        }
    }
    public void updateOrderStatus(int orderId, String paymentStatus, String shippingStatus, java.sql.Date deliveryDate) throws SQLException {
        String sql = "UPDATE orders SET PaymentStatus = ?, ShippingStatus = ?, DeliveryDate = ? WHERE OrderID = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, paymentStatus);
            stmt.setString(2, shippingStatus);
            if (deliveryDate != null) {
                stmt.setDate(3, deliveryDate);
            } else {
                stmt.setNull(3, Types.DATE);
            }
            stmt.setInt(4, orderId);
            stmt.executeUpdate();
        }
    }

    public int saveOrder(OrderModel order, String fullname, String email, String address) throws SQLException {
        // Modified SQL statement to match exact database column names
        String insertOrder = "INSERT INTO orders (User_ID, TotalAmount, PaymentStatus, ShippingStatus, OrderDate, DeliveryDate, Fullname, Email, ShippingAddress) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        try (PreparedStatement stmt = conn.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, order.getUserId());
            stmt.setDouble(2, order.getTotalAmount());
            stmt.setString(3, order.getPaymentStatus());
            stmt.setString(4, order.getShippingStatus());
            stmt.setTimestamp(5, new Timestamp(order.getOrderDate().getTime()));
            stmt.setTimestamp(6, null); // deliveryDate can be updated later
            stmt.setString(7, fullname);
            stmt.setString(8, email);
            stmt.setString(9, address); // This maps to ShippingAddress in the database

            // Debug information
            System.out.println("Executing SQL: " + insertOrder);
            System.out.println("Order userId: " + order.getUserId());
            System.out.println("Order totalAmount: " + order.getTotalAmount());

            int rows = stmt.executeUpdate();
            if (rows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    int orderId = generatedKeys.getInt(1);
                    saveOrderItems(orderId, order.getItems());
                    System.out.println("Order successfully created with ID: " + orderId);
                    return orderId;
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.err.println("Error saving order: " + e.getMessage());
            e.printStackTrace();
            throw e;
        }
    }
}