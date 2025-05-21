package com.lington.controller;

import com.lington.config.Dbconfig;
import com.lington.dao.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/deleteordercontroller")
public class DeleteOrderController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int orderId = Integer.parseInt(request.getParameter("orderId"));
            Connection conn = Dbconfig.getDbConnection();
            OrderDAO dao = new OrderDAO(conn);
            dao.deleteOrder(orderId);

            response.sendRedirect(request.getContextPath() + "/OrderManagementController");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ Order deletion failed: " + e.getMessage());
        }
    }
}
