<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Admin Dashboard - Lington Store</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Adminpannel.css" />
</head>
<body>

  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <%@ include file="/WEB-INF/page/Header.jsp" %>

  <main>
    <h1 class="dashboard-header">Admin Dashboard</h1>

    <div class="summary-cards">
      <div class="card">
        <h3>Total Users</h3>
        <p>356</p>
      </div>
      <div class="card">
        <h3>Total Orders</h3>
        <p>742</p>
      </div>
      <div class="card">
        <h3>Total Products</h3>
        <p>132</p>
      </div>
      <div class="card">
        <h3>Low Stock Items</h3>
        <p>7</p>
      </div>
    </div>

    <div class="table-section">
      <h3>Recent Orders</h3>
      <table>
        <thead>
          <tr>
            <th>Order ID</th>
            <th>User</th>
            <th>Items</th>
            <th>Total</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>#ORD1001</td>
            <td>manish123</td>
            <td>3</td>
            <td>Rs. 1220</td>
            <td>Delivered</td>
          </tr>
          <tr>
            <td>#ORD1002</td>
            <td>nkboy</td>
            <td>2</td>
            <td>Rs. 890</td>
            <td>Pending</td>
          </tr>
          <tr>
            <td>#ORD1003</td>
            <td>dibasKTM</td>
            <td>5</td>
            <td>Rs. 1995</td>
            <td>Shipped</td>
          </tr>
        </tbody>
      </table>
    </div>

    <div class="table-section">
      <h3>System Status</h3>
      <table>
        <tr>
          <th>Service</th>
          <th>Status</th>
        </tr>
        <tr>
          <td>Payment Gateway</td>
          <td style="color:green;">✔ Running</td>
        </tr>
        <tr>
          <td>Database</td>
          <td style="color:green;">✔ Connected</td>
        </tr>
        <tr>
          <td>Inventory Sync</td>
          <td style="color:orange;">⚠ Delayed</td>
        </tr>
      </table>
    </div>

  </main>

  <%@ include file="/WEB-INF/page/Footer.jsp" %>

</body>
</html>
