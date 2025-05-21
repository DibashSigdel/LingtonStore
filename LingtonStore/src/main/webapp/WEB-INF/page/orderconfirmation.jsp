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
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/orderconfirmation.css" />
</head>
<body>
  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000. Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
  <%@ include file="/WEB-INF/page/Header.jsp" %>
  <main>
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
        <% for (Cartitemmodel item : order.getItems()) {
       if (item.getProduct() == null) continue;
		%>
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
</main>
  <!-- Footer -->
  <%@ include file="/WEB-INF/page/Footer.jsp" %>
</body>
</html>
