package com.lington.service;

import com.lington.Model.OrderModel;
import com.lington.dao.OrderDAO;
import com.lington.config.Dbconfig;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class orderservice {

    public List<OrderModel> getAllOrders() throws ClassNotFoundException {
        try (Connection conn = Dbconfig.getDbConnection()) {
            OrderDAO dao = new OrderDAO(conn);
            return dao.getAllOrders();
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
}
