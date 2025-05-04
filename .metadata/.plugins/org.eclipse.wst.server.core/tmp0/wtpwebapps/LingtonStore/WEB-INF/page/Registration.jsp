<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Herbal Tea Shop</title>
  <style>
    
  </style>
</head>
<body>

  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
  <header class="navbar">
    <div class="navbar-container">
      <div class="logo"><img src="./Screenshot_2025-04-17_185040-removebg-preview.png"></div>
      <nav class="nav-links">
        <a href="/index.html">Home</a>
        <a href="/product.html">Shop</a>
        <a href="./registration.html">Register</a>
        <a href="./aboutus.html">About Us</a>
        <a href="/signin.html">Login/Signin</a>
      </nav>
      <div class="search">
        <input type="text" placeholder="Search product">
      </div>
    </div>
  </header>

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
  <footer class="footer">
    <div class="footer-container">
      <div class="footer-logo"><img style="width: 100px;" src="./Screenshot_2025-04-17_185040-removebg-preview.png"></div>
      <div class="footer-links">
        <div><strong>Shop</strong><br>All Teas<br>Best Sellers</div>
        <div><strong>About</strong><br>Our Story<br>Contact Us</div>
        <div><strong>Help</strong><br>FAQs<br>Shipping Info</div>
      </div>
      <div class="footer-right">
        <h3>Sign in to the store</h3>
        <a href="./signin.html"><button>Sign In</button></a>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2025 Lington Store. All rights reserved.</p>
    </div>
  </footer>

</body>
</html>
