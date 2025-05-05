<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Generic Footer</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Footer.css" />
</head>
<body>

<footer class="footer">
  <div class="footer-container">

    <div class="footer-section">
      <h4>Company</h4>
      <ul>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Careers</a></li>
        <li><a href="#">Blog</a></li>
      </ul>
    </div>

    <div class="footer-section">
      <h4>Support</h4>
      <ul>
        <li><a href="#">Contact</a></li>
        <li><a href="#">FAQs</a></li>
        <li><a href="#">Shipping & Returns</a></li>
      </ul>
    </div>

    <div class="footer-section">
      <h4>Follow Us</h4>
      <div class="socials">
        <a href="#"><img src="https://img.icons8.com/ios-filled/24/ffffff/facebook.png"/></a>
        <a href="#"><img src="https://img.icons8.com/ios-filled/24/ffffff/instagram-new.png"/></a>
        <a href="#"><img src="https://img.icons8.com/ios-filled/24/ffffff/twitter.png"/></a>
      </div>
    </div>

    <div class="footer-section">
      <h4>Sign In</h4>
      <a href="${pageContext.request.contextPath}/signincontroller"><button class="sign-btn">Sign In</button></a>
    </div>

  </div>

  <div class="footer-bottom">
    <p>&copy; 2025 Lington Store. All rights reserved.</p>
  </div>
</footer>

</body>
</html>
