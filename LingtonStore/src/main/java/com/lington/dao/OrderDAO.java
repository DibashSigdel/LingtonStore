package com.lington.dao;

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

    public int saveOrder(OrderModel order, String fullname, String email, String address) throws SQLException {
		return 0;
        // full implementation...
    }

}
