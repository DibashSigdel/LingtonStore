<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin - Order Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddProduct.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
</head>
<body>

<!-- Top Banner -->
<div class="top-banner">Track and manage all customer orders from this dashboard. </div>

<!-- Navbar -->
<%@ include file="/WEB-INF/page/Header.jsp" %>

<main>
<h2>Admin - Manage Orders</h2>

<div class="table-container">
<table border="1" cellpadding="8">
    <thead>
    <tr>
        <th>Order ID</th>
        <th>User ID</th>
        <th>Total Amount</th>
        <th>Payment Status</th>
        <th>Shipping Status</th>
        <th>Order Date</th>
        <th>Delivery Date</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.orderId}</td>
            <td>${order.userId}</td>
            <td>Rs. ${order.totalAmount}</td>
            <td>${order.paymentStatus}</td>
            <td>${order.shippingStatus}</td>
            <td>${order.orderDate}</td>
            <td><c:out value="${order.deliveryDate != null ? order.deliveryDate : 'N/A'}"/></td>
            <td><button onclick="alert('Update feature coming soon.')">Update</button></td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</main>

<!-- Footer -->
<%@ include file="/WEB-INF/page/Footer.jsp" %>

</body>
</html>
