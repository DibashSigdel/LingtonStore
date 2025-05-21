package com.lington.controller;
import com.lington.Model.Cartitemmodel;
import com.lington.Model.OrderModel;
import com.lington.Model.usermodel;
import com.lington.dao.OrderDAO;
import com.lington.config.Dbconfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
@WebServlet("/checkout")
public class CheckoutController extends HttpServlet {
    @SuppressWarnings("unchecked")
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        
        // Diagnostic: Print all session attributes
        System.out.println("==== SESSION DIAGNOSTICS (POST) ====");
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String name = attributeNames.nextElement();
            System.out.println("Session attribute: " + name + " = " + session.getAttribute(name));
        }
        
        usermodel user = (usermodel) session.getAttribute("user");
        System.out.println("User from session: " + (user == null ? "NULL" : "NOT NULL"));
        
        if (user != null) {
            System.out.println("User ID: " + user.getId());
            System.out.println("Username: " + user.getUsername());
            if (user.getEmail() != null) {
                System.out.println("Email: " + user.getEmail());
            } else {
                System.out.println("Email: null");
            }
        }
        
        // Process the checkout
        if (user == null) {
            System.out.println("Redirecting to login: User is null");
            // Save the checkout data in session for resuming after login
            session.setAttribute("pendingCheckout", true);
            session.setAttribute("checkoutName", fullname);
            session.setAttribute("checkoutEmail", email);
            session.setAttribute("checkoutAddress", address);
            
            session.setAttribute("errorMessage", "Please login before checkout");
            response.sendRedirect(request.getContextPath() + "/signincontroller");
            return;
        }
        
        if (user.getId() <= 0) {
            System.out.println("User ID is invalid: " + user.getId());
            // Try to refresh user data from database using username
            boolean refreshed = refreshUserData(session, user);
            
            if (!refreshed || user.getId() <= 0) {
                System.out.println("Could not refresh user data. Redirecting to login.");
                session.setAttribute("errorMessage", "Session expired. Please login again.");
                response.sendRedirect(request.getContextPath() + "/signincontroller");
                return;
            }
        }
        
        List<Cartitemmodel> cart = (List<Cartitemmodel>) session.getAttribute("cart");
        if (cart == null || cart.isEmpty()) {
            request.setAttribute("message", "Your cart is empty.");
            request.getRequestDispatcher("/WEB-INF/page/cart.jsp").forward(request, response);
            return;
        }
        
        System.out.println(">>> User ID from session: " + user.getId());
        
        // Calculate total
        double total = 0;
        for (Cartitemmodel item : cart) {
            total += item.getProduct().getPrice() * item.getQuantity();
        }
        
        // Create the order
        OrderModel order = new OrderModel(user.getId(), total, new Date(), cart);
        order.setPaymentStatus("Pending");
        order.setShippingStatus("Pending");
        
        try (Connection conn = Dbconfig.getDbConnection()) {
            OrderDAO orderDAO = new OrderDAO(conn);
            int orderId = orderDAO.saveOrder(order, fullname, email, address);
            order.setOrderId(orderId);
            session.setAttribute("order", order);
            session.removeAttribute("cart");
            // Redirect to confirmation page
            request.getRequestDispatcher("/WEB-INF/page/orderconfirmation.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", e.getMessage());
            request.setAttribute("message", "Failed to place order. Please try again.");
            request.getRequestDispatcher("/WEB-INF/page/checkout.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        // Diagnostic: Print all session attributes
        System.out.println("==== SESSION DIAGNOSTICS (GET) ====");
        Enumeration<String> attributeNames = session.getAttributeNames();
        while (attributeNames.hasMoreElements()) {
            String name = attributeNames.nextElement();
            System.out.println("Session attribute: " + name + " = " + session.getAttribute(name));
        }
        
        usermodel user = (usermodel) session.getAttribute("user");
        System.out.println("User from session: " + (user == null ? "NULL" : "NOT NULL"));
        
        if (user == null) {
            System.out.println("Redirecting to login: User is null");
            // Remember that user was trying to checkout
            session.setAttribute("pendingCheckout", true);
            session.setAttribute("errorMessage", "Please login before checkout");
            response.sendRedirect(request.getContextPath() + "/signincontroller");
            return;
        }
        
        if (user.getId() <= 0) {
            System.out.println("User ID is invalid: " + user.getId());
            // Try to refresh user data from database using username
            boolean refreshed = refreshUserData(session, user);
            
            if (!refreshed || user.getId() <= 0) {
                System.out.println("Could not refresh user data. Redirecting to login.");
                session.setAttribute("errorMessage", "Session expired. Please login again.");
                response.sendRedirect(request.getContextPath() + "/signincontroller");
                return;
            }
        }
        
        request.getRequestDispatcher("/WEB-INF/page/checkout.jsp").forward(request, response);
    }
    
    private boolean refreshUserData(HttpSession session, usermodel user) {
        try (Connection conn = Dbconfig.getDbConnection()) {
            String sql = "SELECT * FROM user WHERE Username = ?";
            try (java.sql.PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, user.getUsername());
                try (java.sql.ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        // Update user data
                        user.setId(rs.getInt("User_ID"));
                        user.setFirstName(rs.getString("FirstName"));
                        user.setLastName(rs.getString("LastName"));
                        if (rs.getDate("DOB") != null) {
                            user.setDob(rs.getDate("DOB").toLocalDate());
                        }
                        user.setGender(rs.getString("Gender"));
                        user.setEmail(rs.getString("Email"));
                        user.setPhoneNumber(rs.getString("PhoneNumber"));
                        user.setRole(rs.getString("Role"));
                        
                        // Update the session
                        session.setAttribute("user", user);
                        
                        System.out.println("User data refreshed. ID: " + user.getId());
                        return true;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}