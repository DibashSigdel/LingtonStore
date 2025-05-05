<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css" />
  <meta charset="UTF-8">
  <title>Header</title>
</head>
<body>



<header class="navbar">
  <div class="navbar-container">
    
    <!-- Logo on the far left -->
    <div class="logo-container">
      <img class="logo" src="https://i.ibb.co/ZR2xJj1p/Screenshot-2025-04-17-185040-removebg-preview.png" alt="Logo" />
    </div>

    <!-- Navigation Links -->
    <nav class="nav-links">
      <a href="${pageContext.request.contextPath}/home">Home</a>
      <a href="${pageContext.request.contextPath}/product">Shop</a>
      <a href="${pageContext.request.contextPath}/Registration">Register</a>
      <a href="${pageContext.request.contextPath}/AboutUs">About Us</a>
      <c:if test="${sessionScope.role == 'admin'}">
        <a href="${pageContext.request.contextPath}/AdminDashboard">Admin Dashboard</a>
        <a href="${pageContext.request.contextPath}/AddProductForm">Product Management</a>
      </c:if>
      <c:if test="${empty sessionScope.username}">
        <a href="${pageContext.request.contextPath}/signincontroller">Login/Signin</a>
      </c:if>
      <c:if test="${not empty sessionScope.username}">
        <a href="${pageContext.request.contextPath}/logoutcontroller">Logout</a>
      </c:if>
    </nav>

    <!-- Profile & Search -->
    <div style="display: flex; align-items: center;">
      <c:if test="${not empty sessionScope.username}">
        <div class="username-container">
          <img class="profile-image" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE_x6NwUWccs5uiI2OVZdtWRFfDMNbVbhkn6g925096hRD8KP1S5kqEYw4dDp11-EERhw&usqp=CAU" alt="Profile" />
          <span>${sessionScope.username}</span>
        </div>
      </c:if>

      <div class="search">
        <input type="text" placeholder="Search product">
      </div>
    </div>

  </div>
</header>

</body>
</html>
