<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Grocery Product Page</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Product.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <%@ include file="/WEB-INF/page/Header.jsp" %>

  <!-- ✅ Hidden iframe for background cart actions -->
  <iframe name="cart-action-frame" style="display: none;"></iframe>

  <div class="main">
    <aside class="sidebar">
      <h2>Categories</h2>
      <ul>
        <c:forEach var="cat" items="${categories}">
          <li><a href="product?category=${cat.id}">${cat.name}</a></li>
        </c:forEach>
      </ul>
    </aside>

    <!-- ✅ Search form -->
    <div style="padding: 20px;">
      <form action="product" method="get">
        <input 
          type="text" 
          name="search" 
          placeholder="Search products..." 
          value="${searchQuery}" 
          style="padding: 8px; width: 250px;" />
        <button type="submit" style="padding: 8px;">Search</button>
      </form>
    </div>

    <!-- Optional: Show current search keyword -->
    <c:if test="${not empty searchQuery}">
      <div style="padding-left: 20px;">
        <p>Showing results for "<strong>${searchQuery}</strong>"</p>
      </div>
    </c:if>

    <div class="container">
      <c:if test="${empty products}">
        <p>No products found.</p>
      </c:if>

      <c:forEach var="product" items="${products}">
        <div class="product-card">
          <img src="${product.imageUrl}" alt="Image" />
          <div class="product-details">
<<<<<<< Updated upstream
          <div style="display:flex; gap:50%;">
          <h3><a href="productDetail?id=${product.id}">${product.name}</a></h3>
              <div class="price">Rs. ${product.price}</div>
              </div>
            
            <p>${product.description}</p>
        
            <form action="${pageContext.request.contextPath}/cart" method="post" target="cart-action-frame">
=======
            <h3><a href="productDetail?id=${product.id}">${product.name}</a></h3>
            <p>${product.description}</p>
            <div class="price">Rs. ${product.price}</div>

            <!-- 🛒 Add to cart form -->
            <form action="${pageContext.request.contextPath}/cart" method="post">
>>>>>>> Stashed changes
              <input type="hidden" name="action" value="add" />
              <input type="hidden" name="productId" value="${product.id}" />
              <input type="hidden" name="quantity" value="1" />
              <button type="submit" class="btn">Add to Cart</button>
            </form>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>

  <div>
   <!-- ✅ View Cart Floating Button -->
<!-- ✅ View Cart Floating Button -->
<a href="${pageContext.request.contextPath}/cart">
  <button class="ViewCart">
    <i class="fa-solid fa-cart-shopping"></i>
    View Cart
    <i class="fa-solid fa-arrow-right"></i>
  </button>
</a>

  </div>

  <%@ include file="/WEB-INF/page/Footer.jsp" %>
</body>
</html>
