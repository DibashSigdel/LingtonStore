package com.lington.controller;

import com.lington.Model.Cartitemmodel;
import com.lington.Model.OrderModel;
import com.lington.Model.usermodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {

    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        usermodel user = (usermodel) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("signincontroller");
            return;
        }

        List<Cartitemmodel> cart = (List<Cartitemmodel>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            request.setAttribute("message", "Your cart is empty.");
            request.getRequestDispatcher("/WEB-INF/page/cart.jsp").forward(request, response);
            return;
        }

        // Calculate total
        double total = 0;
        for (Cartitemmodel item : cart) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }

        // Create and store order in session
        OrderModel order = new OrderModel(user.getId(), total, new Date(), cart);
        order.setPaymentStatus("Pending");
        order.setShippingStatus("Pending");

        session.setAttribute("order", order);
        session.removeAttribute("cart");

        // Redirect to confirmation JSP (ensure this file is NOT inside WEB-INF)
        response.sendRedirect(request.getContextPath() + "/orderconfirmation.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // ✅ This will successfully load the JSP if accessed via "/checkout"
        request.getRequestDispatcher("/WEB-INF/page/checkout.jsp").forward(request, response);
    }
}