package com.lington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.lington.Model.OrderModel;
import com.lington.service.orderservice;

@WebServlet("/OrderManagementController")
public class OrderManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        orderservice service = new orderservice();
        List<OrderModel> orderList = null;
		try {
			orderList = service.getAllOrders();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("orders", orderList);
        request.getRequestDispatcher("/WEB-INF/page/OrderManagement.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
