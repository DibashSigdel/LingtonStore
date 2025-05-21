<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Contact Us</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Contact.css" />
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/page/Header.jsp" %>
<main>
  <div class="container">
    <h1 class="title">Contact Us</h1>
    <div class="contact-info">
      <div><i class="fas fa-envelope"></i> <span>LingtonStore@Lington.com</span></div>
      <div><i class="fas fa-phone"></i> <span>9867125323</span></div>
      <div><i class="fas fa-map-marker-alt"></i> <span> Jhamsikhel, Lalitpur-4, Nepal </span></div>
    </div>
    <div class="map-container">
      <iframe
        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3532.5529703616267!2d85.3108352143836!3d27.67833003270725!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39eb1906a30714b7%3A0x173e5e1bb5cefe6b!2sJhamsikhel%2C%20Lalitpur%2044600%2C%20Nepal!5e0!3m2!1sen!2snp!4v1685547492421!5m2!1sen!2snp"
        allowfullscreen=""
        loading="lazy"
        referrerpolicy="no-referrer-when-downgrade">
      </iframe>
    </div>
  </div>
  </main>
  <%@ include file="/WEB-INF/page/Footer.jsp" %>
</body>
</html>