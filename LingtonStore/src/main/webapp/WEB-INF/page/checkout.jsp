<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        form { max-width: 500px; margin: auto; background: #f9f9f9; padding: 20px; border-radius: 8px; }
        input, textarea { width: 100%; padding: 10px; margin-top: 10px; border: 1px solid #ccc; border-radius: 5px; }
        button { padding: 10px 20px; margin-top: 20px; background-color: #4CAF50; color: white; border: none; border-radius: 5px; cursor: pointer; }
        button:hover { background-color: #45a049; }
        h2 { text-align: center; }
    </style>
</head>
<body>

<h2>Checkout</h2>

<form action="checkout" method="post">
    <label for="fullname">Full Name</label>
    <input type="text" id="fullname" name="fullname" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>

    <label for="address">Shipping Address</label>
    <textarea id="address" name="address" rows="4" required></textarea>

    <button type="submit">Place Order</button>
</form>

</body>
</html>
