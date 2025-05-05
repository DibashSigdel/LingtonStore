package com.lington.dao;

import com.lington.Model.Cartitemmodel;
import com.lington.Model.OrderModel;

import java.sql.*;
import java.util.List;

public class OrderDao {

    private Connection conn;

    public OrderDao(Connection conn) {
        this.conn = conn;
    }

    public boolean placeOrder(OrderModel order) {
        boolean result = false;

        try {
            conn.setAutoCommit(false);

            // Insert into `order` table
            String sqlOrder = "INSERT INTO `order` (User_ID, TotalAmount, PaymentStatus, ShippingStatus, OrderDate, DeliveryDate) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sqlOrder, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalAmount());
            ps.setString(3, order.getPaymentStatus());
            ps.setString(4, order.getShippingStatus());
            ps.setTimestamp(5, new Timestamp(order.getOrderDate().getTime()));
            ps.setTimestamp(6, null); // You can update delivery date later
            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            int orderId = 0;
            if (rs.next()) {
                orderId = rs.getInt(1);
            }

            // Insert into `order_items` table
            String sqlItem = "INSERT INTO order_items (OrderID, ProductID, Quantity, Price) VALUES (?, ?, ?, ?)";
            PreparedStatement itemStmt = conn.prepareStatement(sqlItem);

            for (Cartitemmodel item : order.getItems()) {
                itemStmt.setInt(1, orderId);
                itemStmt.setInt(2, item.getProduct().getId());
                itemStmt.setInt(3, item.getQuantity());
                itemStmt.setDouble(4, item.getProduct().getPrice());
                itemStmt.addBatch();
            }

            itemStmt.executeBatch();

            conn.commit();
            result = true;

        } catch (Exception e) {
            e.printStackTrace();
            try {
                conn.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

        return result;
    }
}
