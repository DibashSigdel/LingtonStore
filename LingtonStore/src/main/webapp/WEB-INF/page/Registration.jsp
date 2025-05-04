<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Herbal Tea Shop</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Registration.css" />
</head>
<body>

  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
 <%@ include file="/WEB-INF/page/Header.jsp" %>

  <!-- Main Section -->
  <div class="main-wrapper">
    <div class="register-container">
      <h2>Create Your Account</h2>
      <form action="signupcontroller" method="post">
        <div class="form-group">
          <label for="Username">Username</label>
          <input type="text" id="Username" name="Username" required />
        </div>

        <div class="form-row">
          <div class="form-group">
            <label for="FirstName">First Name</label>
            <input type="text" id="FirstName" name="FirstName" required />
          </div>
          <div class="form-group">
            <label for="LastName">Last Name</label>
            <input type="text" id="LastName" name="LastName" required />
          </div>
        </div>

        <div class="form-group">
          <label for="Birthday">Birthday</label>
          <input type="date" id="Birthday" name="Birthday" required />
        </div>

        <div class="form-group">
          <label for="Gender">Gender</label>
          <input type="text" id="Gender" name="Gender" required />
        </div>

        <div class="form-group">
          <label for="Email">Email</label>
          <input type="email" id="Email" name="Email" required />
        </div>

        <div class="form-group">
          <label for="Phone">Phone</label>
          <input type="text" id="Phone" name="Phone" required />
        </div>

        <div class="form-group">
          <label for="Password">Password</label>
          <input type="password" id="Password" name="Password" required />
        </div>

        <button type="submit" class="submit-btn">Register</button>
      </form>
    </div>
  </div>

  <!-- Footer -->
  <%@ include file="/WEB-INF/page/Footer.jsp" %>

</body>
</html>
