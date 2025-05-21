<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>${product.name} - Product Detail</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ProductDetail.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</head>
<body>

  <%@ include file="/WEB-INF/page/Header.jsp" %>

  <main>
    <!-- ✅ Back Button -->
    <div class="back-button">
      <a href="${pageContext.request.contextPath}/product">
        <i class="fa-solid fa-arrow-left"></i> Back to Products
      </a>
    </div>

    <div class="product-detail-container">
      <div class="product-image-section">
        <img src="${product.imageUrl}" alt="${product.name}" />
      </div>

      <div class="product-info-section">
        <h1>${product.name}</h1>
        <p class="price">Rs. ${product.price}</p>
        <p class="description">${product.description}</p>

        <!-- ✅ Add to Cart Form -->
        <form action="${pageContext.request.contextPath}/cart" method="post">
  <input type="hidden" name="action" value="add" />
  <input type="hidden" name="productId" value="${product.id}" />
  <input type="hidden" name="redirect" value="product" />
  <input type="number" name="quantity" value="1" min="1" />
  <button type="submit" class="btn">Add to Cart</button>
</form>

      </div>
    </div>
  </main>

  <%@ include file="/WEB-INF/page/Footer.jsp" %>
</body>
</html>
