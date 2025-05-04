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
      <a href="${pageContext.request.contextPath}/Home.jsp">Home</a>
      <a href="${pageContext.request.contextPath}/Product.jsp">Shop</a>
      <a href="${pageContext.request.contextPath}/Registration.jsp">Register</a>
      <a href="${pageContext.request.contextPath}/Aboutus.jsp">About Us</a>
      <a href="${pageContext.request.contextPath}/signincontroller">Login/Signin</a>
    </nav>
    <div class="search">
      <input type="text" placeholder="Search product">
    </div>
  </div>
</header>


</body>
</html>