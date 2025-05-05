<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Product Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AddProduct.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
   
</head>
<body>

<!-- Top Banner -->
<div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

<!-- Navbar -->
<%@ include file="/WEB-INF/page/Header.jsp" %>

<!-- Page Content -->
<main>
<h2>Admin - Manage Products</h2>

<!-- Category Filter -->
<div class="FilterLine">
<form method="get" action="${pageContext.request.contextPath}/AddProductForm">
    <label>Filter by Category:</label>
    <select name="category" onchange="this.form.submit()">
        <option value="">All</option>
        <c:forEach var="cat" items="${categories}">
            <option value="${cat.id}" ${cat.id == currentCategoryId ? "selected" : ""}>${cat.name}</option>
        </c:forEach>
    </select>
</form>

<!-- Add Product Button -->
<button class="AddProductBtn" onclick="document.getElementById('popupForm').style.display='block'">+ Add Product</button>
</div>
<!-- Product Table -->
<div class="table-container">
<table border="1" cellpadding="8">
    <tr>
        <th>ID</th><th>Name</th><th>Description</th><th>Price</th><th>Stock</th><th>Category</th><th>Image</th><th>Action</th>
    </tr>
    <c:forEach var="p" items="${products}">
        <tr>
            <td>${p.id}</td>
            <td>${p.name}</td>
            <td>${p.description}</td>
            <td>${p.price}</td>
            <td>${p.stockQuantity}</td>
            <td>
                <c:forEach var="cat" items="${categories}">
                    <c:if test="${cat.id == p.categoryId}">${cat.name}</c:if>
                </c:forEach>
            </td>
            <td><img src="${p.imageUrl}" width="40" height="40" /></td>
            <td>
                <button type="button" onclick="openEditPopup(${p.id}, '${p.name}', '${p.description}', ${p.price}, ${p.stockQuantity}, '${p.imageUrl}', ${p.categoryId})">Edit</button>
                <form method="post" action="${pageContext.request.contextPath}/deleteproductcontroller" style="display:inline;">
                    <input type="hidden" name="productId" value="${p.id}" />
                    <button type="submit" onclick="return confirm('Delete this product?')">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
<!-- Add/Edit Product Popup -->
<div id="popupForm" class="popup">
    <div class="popup-content">
        <span class="close-btn" onclick="document.getElementById('popupForm').style.display='none'">&times;</span>
        <h3 id="formTitle">Add New Product</h3>
        <form method="post" action="${pageContext.request.contextPath}/addproductcontroller">
            <input type="hidden" name="productId" id="productId" />

            <label>Name:</label><br>
            <input type="text" name="name" id="name" required><br><br>

            <label>Description:</label><br>
            <textarea name="description" id="description" required></textarea><br><br>

            <label>Price:</label><br>
            <input type="number" name="price" step="0.01" id="price" required><br><br>

            <label>Stock Quantity:</label><br>
            <input type="number" name="stockQuantity" id="stockQuantity" required><br><br>

            <label>Image URL:</label><br>
            <input type="text" name="imageUrl" id="imageUrl"><br><br>

            <label>Category:</label><br>
            <select name="categoryId" id="categoryId" required>
                <c:forEach var="cat" items="${categories}">
                    <option value="${cat.id}">${cat.name}</option>
                </c:forEach>
            </select><br><br>

            <button type="submit">Submit</button>
        </form>
    </div>
</div>

</main>

<!-- Footer -->
<%@ include file="/WEB-INF/page/Footer.jsp" %>

<script>
    function openEditPopup(id, name, desc, price, stock, imageUrl, categoryId) {
        document.getElementById('popupForm').style.display = 'block';
        document.getElementById('formTitle').innerText = 'Edit Product';
        document.getElementById('productId').value = id;
        document.getElementById('name').value = name;
        document.getElementById('description').value = desc;
        document.getElementById('price').value = price;
        document.getElementById('stockQuantity').value = stock;
        document.getElementById('imageUrl').value = imageUrl;
        document.getElementById('categoryId').value = categoryId;
    }

    window.onclick = function(e) {
        const popup = document.getElementById('popupForm');
        if (e.target === popup) {
            popup.style.display = "none";
        }
    }
</script>

</body>
</html>
