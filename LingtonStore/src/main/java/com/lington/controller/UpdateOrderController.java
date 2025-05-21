package com.lington.controller;

import com.lington.dao.OrderDAO;
import com.lington.config.Dbconfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/UpdateOrderController")
public class UpdateOrderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderId = Integer.parseInt(request.getParameter("orderId"));
        String paymentStatus = request.getParameter("paymentStatus");
        String shippingStatus = request.getParameter("shippingStatus");
        String deliveryDateStr = request.getParameter("deliveryDate");

        try (Connection conn = Dbconfig.getDbConnection()) {
            OrderDAO dao = new OrderDAO(conn);
            Date deliveryDate = null;
            if (deliveryDateStr != null && !deliveryDateStr.isEmpty()) {
                java.util.Date parsed = new SimpleDateFormat("yyyy-MM-dd").parse(deliveryDateStr);
                deliveryDate = new Date(parsed.getTime());
            }

            dao.updateOrderStatus(orderId, paymentStatus, shippingStatus, deliveryDate);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("OrderManagementController");
    }
}
