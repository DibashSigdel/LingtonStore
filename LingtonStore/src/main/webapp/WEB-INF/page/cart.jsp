<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.lington.Model.Cartitemmodel" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Shopping Cart</title>
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cart.css" />
   
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

<p class="actions">
    <a href="product">  <i class="fa-solid fa-arrow-left"></i>
     Continue Shopping</a>
    <a href="${pageContext.request.contextPath}/checkout" class="checkout-btn">Checkout
    
      <i class="fa-solid fa-arrow-right"></i>
    </a>
</p>


</body>
</html>