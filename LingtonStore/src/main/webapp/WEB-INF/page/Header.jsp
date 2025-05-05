<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css" />
  <meta charset="UTF-8">
  <title>Insert title here</title>
</head>
<body>

<header class="navbar">
  <div class="navbar-container">
    
    <div class="Welcometext">
      <c:if test="${not empty sessionScope.username}">
        <span>Welcome, ${sessionScope.username}</span>
      </c:if>
    </div>

    <div class="logo">
      <img src="${pageContext.request.contextPath}/Screenshot_2025-04-17_185040-removebg-preview.png" />
    </div>

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

    <div class="search">
      <input type="text" placeholder="Search product">
    </div>

  </div>
</header>

</body>
</html>
