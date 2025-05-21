<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- Make sure this is included -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Herbal Tea Shop</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css" />
</head>
<body>

  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000. Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
  <%@ include file="/WEB-INF/page/Header.jsp" %>

  <!-- Content -->
  <main>
    <section class="hero">
      <div class="text">
        <h1>Fresh Groceries Delivered to You</h1>
        <p>Browse our curated categories of fresh produce, dairy, snacks, and more. Get fast delivery across Kathmandu!</p>
        <a href="${pageContext.request.contextPath}/product"><button>Start Shopping</button></a>
      </div>
      <div class="img-wrapper">
        <img src="https://static.vecteezy.com/system/resources/previews/048/560/473/non_2x/shopping-cart-filled-with-grocery-items-and-vegetables-isolated-on-a-transparent-background-png.png" alt="Shopping Cart Full of Groceries">
      </div>
    </section>

    <!-- Featured Categories -->
    <section class="features">
      <h2>Our Categories</h2>
      <div class="product-grid">
        <c:forEach var="cat" items="${categories}">
          <div class="product-card">
            <a href="${pageContext.request.contextPath}/product?category=${cat.id}" style="text-decoration: none; color: #111;">
              <h3>${cat.name}</h3>
            </a>
          </div>
        </c:forEach>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <%@ include file="/WEB-INF/page/Footer.jsp" %>

</body>
</html>
