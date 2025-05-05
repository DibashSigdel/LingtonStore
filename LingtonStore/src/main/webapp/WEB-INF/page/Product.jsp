	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!DOCTYPE html>
	<html lang="en">
	<head>
	  <meta charset="UTF-8" />
	  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	  <title>Grocery Product Page</title>
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Product.css" />
	</head>
	<body>
	
	  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>
	  <%@ include file="/WEB-INF/page/Header.jsp" %>
	
	  <div class="main">
	    <aside class="sidebar">
	      <h2>Categories</h2>
	      <ul>
			  <c:forEach var="cat" items="${categories}">
			    <li><a style="text-decoration:;" href="product?category=${cat.id}">${cat.name}</a></li>
			  </c:forEach>
		</ul>

	    </aside>

	    <div class="container">
	      <c:if test="${empty products}">
	        <p>No products found in this category.</p>
	      </c:if>

	      <c:forEach var="product" items="${products}">
	        <div class="product-card">
	          <img src="${product.imageUrl}" alt="Image" />
	          <div class="product-details">
	            <h3>${product.name}</h3>
	            <p>${product.description}</p>
	            <div class="price">Rs. ${product.price}</div>
	            <button class="btn">Add to Cart</button>
	          </div>
	        </div>
	      </c:forEach>
	    </div>
	  </div>

	  <%@ include file="/WEB-INF/page/Footer.jsp" %>
	</body>
	</html>
