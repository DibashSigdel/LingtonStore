<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${product.name} | Product Detail</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Product.css">
</head>
<body>
    <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>
    <%@ include file="Header.jsp" %>

    <div class="product-detail-page">
        <div class="product-detail-container">
            <div class="left">
                <img src="${product.imageUrl}" alt="${product.name}" class="product-detail-image">
            </div>
            <div class="right">
                <h1>${product.name}</h1>
                <p>${product.description}</p>
                <div class="price"><strong>Price:</strong> Rs. ${product.price}</div>
                <p><strong>Stock Available:</strong> ${product.stockQuantity}</p>

                <form action="${pageContext.request.contextPath}/cart" method="post">
                    <input type="hidden" name="action" value="add">
                    <input type="hidden" name="productId" value="${product.id}">
                    <button type="submit" class="btn">Add to Cart</button>
                </form>

                <br><br>
                <a href="${pageContext.request.contextPath}/product" class="btn">← Back to Products</a>
            </div>
        </div>
    </div>

    <%@ include file="Footer.jsp" %>
</body>
</html>
