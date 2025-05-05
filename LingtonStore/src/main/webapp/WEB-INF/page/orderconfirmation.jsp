<%@ page import="com.lington.Model.OrderModel" %>
<%@ page import="com.lington.Model.Cartitemmodel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    OrderModel order = (OrderModel) session.getAttribute("order");
    if (order == null) {
        response.sendRedirect("Home.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .container { max-width: 700px; margin: auto; background: #f5f5f5; padding: 20px; border-radius: 8px; }
        h2 { text-align: center; color: #4CAF50; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; border: 1px solid #ccc; text-align: center; }
        .summary { margin-top: 20px; font-size: 16px; }
    </style>
</head>
<body>
<div class="container">
    <h2>Thank You! Your Order Has Been Placed</h2>

    <div class="summary">
        <p><strong>Order Date:</strong> <%= order.getOrderDate() %></p>
        <p><strong>Payment Status:</strong> <%= order.getPaymentStatus() %></p>
        <p><strong>Shipping Status:</strong> <%= order.getShippingStatus() %></p>
        <p><strong>Total Amount:</strong> $<%= order.getTotalAmount() %></p>
    </div>

    <table>
        <thead>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Subtotal</th>
        </tr>
        </thead>
        <tbody>
        <% for (Cartitemmodel item : order.getItems()) { %>
            <tr>
                <td><%= item.getProduct().getName() %></td>
                <td>$<%= item.getProduct().getPrice() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= item.getProduct().getPrice() * item.getQuantity() %></td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
