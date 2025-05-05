<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.lington.Model.Cartitemmodel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
    <style>
        table { border-collapse: collapse; width: 80%; margin: auto; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #f2f2f2; }
        h2 { text-align: center; }
        .empty-message { text-align: center; color: gray; margin-top: 50px; }
        .btn-remove { background: red; color: white; padding: 5px 10px; border: none; cursor: pointer; }
        /* NEW STYLES */
        .qty-form { display: inline-flex; align-items: center; gap: 5px; }
        .qty-btn { 
            width: 25px; height: 25px; 
            background: #f0f0f0; border: 1px solid #ddd; 
            cursor: pointer; 
        }
        .qty-input { width: 40px; text-align: center; }
    </style>
</head>
<body>

<h2>🛒 Your Shopping Cart</h2>

<%
    List<Cartitemmodel> cart = (List<Cartitemmodel>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p class="empty-message">Your cart is empty.</p>
<%
    } else {
        double grandTotal = 0;
%>
    <table>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Qty</th>
            <th>Total</th>
            <th>Action</th>
        </tr>
        <%
            for (Cartitemmodel item : cart) {
                double price = item.getProduct().getPrice();
                int qty = item.getQuantity();
                double total = price * qty;
                grandTotal += total;
        %>
        <tr>
            <td><%= item.getProduct().getName() %></td>
            <td>Rs. <%= String.format("%.2f", price) %></td>
            <td>
                <!-- Quantity Update Form (NEW) -->
                <form class="qty-form" action="cart" method="post">
				    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>" />
				    <button type="submit" name="action" value="dec" class="qty-btn">-</button>
				    <input type="number" name="quantity" value="<%= qty %>" min="1" class="qty-input" onchange="this.form.submit()">
				    <button type="submit" name="action" value="inc" class="qty-btn">+</button>
				</form>

            </td>
            <td>Rs. <%= String.format("%.2f", total) %></td>
            <td>
                <form action="cart" method="post" style="margin:0;">
                    <input type="hidden" name="action" value="remove" />
                    <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>" />
                    <button type="submit" class="btn-remove">Remove</button>
                </form>
            </td>
        </tr>
        <% } %>
        <tr>
            <td colspan="3"><strong>Grand Total:</strong></td>
            <td colspan="2"><strong>Rs. <%= String.format("%.2f", grandTotal) %></strong></td>
        </tr>
    </table>
<% } %>

<p style="text-align:center; margin-top: 30px;">
    <a href="product">⬅️ Continue Shopping</a>
    <!-- NEW: Checkout Button -->
    <a href="${pageContext.request.contextPath}/checkout" style="margin-left: 20px; background: #4CAF50; color: white; padding: 10px 15px; text-decoration: none;">
        Checkout ➡️
    </a>
</p>

</body>
</html>