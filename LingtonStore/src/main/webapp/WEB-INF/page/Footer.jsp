<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer class="footer">
  <div class="footer-container">
    <div class="footer-logo"><img style="width: 100px;" src="${pageContext.request.contextPath}/Screenshot_2025-04-17_185040-removebg-preview.png"></div>
    <div class="footer-links">
      <div><strong>Shop</strong><br>All Teas<br>Best Sellers</div>
      <div><strong>About</strong><br>Our Story<br>Contact Us</div>
      <div><strong>Help</strong><br>FAQs<br>Shipping Info</div>
    </div>
    <div class="footer-right">
      <h3>sign in to the store</h3>
      <a href="${pageContext.request.contextPath}/signincontroller"><button>Sign In</button></a>
    </div>
  </div>
  <div class="footer-bottom">
    <p style="text-align: center;">&copy; 2025 Lington Store. All rights reserved.</p>
  </div>
</footer>

</body>
</html>