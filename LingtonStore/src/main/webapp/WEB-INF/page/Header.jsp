<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<header class="navbar">
  <div class="navbar-container">
    <div class="logo">
      <img src="${pageContext.request.contextPath}/Screenshot_2025-04-17_185040-removebg-preview.png" />
    </div>
    <nav class="nav-links">
    <a href="${pageContext.request.contextPath}/home">Home</a>
    <a href="${pageContext.request.contextPath}/product">Shop</a>
    <a href="${pageContext.request.contextPath}/Registration">Register</a>
    <a href="${pageContext.request.contextPath}/AboutUs">About Us</a>

    <!-- Only show Admin Dashboard if role is admin -->
    <c:if test="${sessionScope.role == 'admin'}">
        <a href="${pageContext.request.contextPath}/AdminDashboard">Admin Dashboard</a>
    </c:if>

    <!-- Show Login/Signin if not logged in -->
  
        <a href="${pageContext.request.contextPath}/signincontroller">Login/Signin</a>
  

    <!-- Optional: Show Logout if user is logged in -->

</nav>

    <div class="search">
      <input type="text" placeholder="Search product">
    </div>
  </div>
</header>


</body>
</html>