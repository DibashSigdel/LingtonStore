<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Product Management</title>
    <style>
        .popup {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0; top: 0;
            width: 100%; height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        .popup-content {
            background-color: white;
            margin: 10% auto;
            padding: 20px;
            width: 400px;
            border-radius: 8px;
        }
        .close-btn {
            float: right;
            font-size: 18px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2>Admin - Manage Products</h2>

<!-- Category Filter -->
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
<button onclick="document.getElementById('popupForm').style.display='block'">+ Add Product</button>

<!-- Table of Products -->
<!-- Table of Products -->
<table border="1" cellpadding="8" style="margin-top: 20px;">
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


<!-- Add Product Form Popup -->
<!-- Add/Edit Product Form Popup -->
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
</script>


<script>
    window.onclick = function(e) {
        const popup = document.getElementById('popupForm');
        if (e.target === popup) {
            popup.style.display = "none";
        }
    }
</script>

</body>
</html>
