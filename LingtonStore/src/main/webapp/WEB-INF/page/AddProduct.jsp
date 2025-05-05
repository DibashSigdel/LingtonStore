<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<h2>Add New Product</h2>
<form method="post" action="${pageContext.request.contextPath}/addproductcontroller">

    <label>Product Name:</label><br>
    <input type="text" name="name" required><br><br>

    <label>Description:</label><br>
    <textarea name="description" required></textarea><br><br>

    <label>Price:</label><br>
    <input type="number" name="price" step="0.01" required><br><br>

    <label>Stock Quantity:</label><br>
    <input type="number" name="stockQuantity" required><br><br>

    <label>Image URL:</label><br>
    <input type="text" name="imageUrl"><br><br>

    <label>Category:</label><br>
    <select name="categoryId" required>
        <c:forEach var="cat" items="${categories}">
            <option value="${cat.id}">${cat.name}</option>
        </c:forEach>
    </select><br><br>

    <button type="submit">Submit</button>
</form>
</body>
</html>
