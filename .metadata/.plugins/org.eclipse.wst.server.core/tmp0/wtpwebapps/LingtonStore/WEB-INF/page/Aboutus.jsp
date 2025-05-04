<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>About Us - Lington Store</title>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Aboutus.css" />
</head>
<body>

  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
  <header class="navbar">
    <div class="navbar-container">
      <div class="logo"><img src="./Screenshot_2025-04-17_185040-removebg-preview.png" alt="Logo"></div>
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

  <!-- Main -->
  <main>
    <!-- Hero Section -->
    <section class="about-hero">
      <h1>About Lington Store</h1>
      <p>
        Lington Store is on a mission to revolutionize the grocery shopping experience across Kathmandu.
        Our goal is to make your daily essentials accessible, affordable, and sustainable — without compromising on quality.
      </p>
    </section>

    <!-- Core Sections -->
    <section class="about-sections">
      <div class="section-card">
        <h3>Our Vision</h3>
        <p>We envision a smarter, greener future where every home can access fresh goods within hours — effortlessly and affordably.</p>
      </div>
      <div class="section-card">
        <h3>Our Values</h3>
        <p>Transparency. Trust. Freshness. We're committed to local sourcing, fair pricing, and ethical delivery practices.</p>
      </div>
      <div class="section-card">
        <h3>Our Team</h3>
        <p>From farmers and vendors to delivery agents and engineers — our team is built with passionate people who care deeply about your experience.</p>
      </div>
    </section>

    <!-- Extended Philosophy -->
    <section class="full-section">
      <h2>Why Choose Us</h2>
      <p>
        Lington Store brings together convenience and quality in one unified platform. We focus on:
        <ul class="timeline">
          <li>Fast and on-time delivery across all wards of Kathmandu Valley.</li>
          <li>100% freshness guaranteed or your money back.</li>
          <li>Local support, local produce — empowering our farmers and community.</li>
          <li>Eco-conscious packaging and minimal waste logistics.</li>
          <li>Live order tracking and easy returns/refunds.</li>
        </ul>
      </p>
    </section>

    <!-- Company Journey -->
    <section class="full-section">
      <h2>Our Milestones</h2>
      <ul class="timeline">
        <li><strong>2022</strong> – Founded with just 20 SKUs and a dream to change local shopping.</li>
        <li><strong>2023</strong> – Expanded delivery to all of Kathmandu and Lalitpur districts.</li>
        <li><strong>2024</strong> – Reached 10,000+ regular customers and launched eco-packaging.</li>
        <li><strong>2025</strong> – Partnered with 50+ local vendors, farmers, and cooperatives.</li>
      </ul>
    </section>
  </main>

  <!-- Footer -->
  <footer class="footer">
    <div class="footer-container">
      <div class="footer-logo">
        <img style="width: 100px;" src="./Screenshot_2025-04-17_185040-removebg-preview.png" alt="Logo">
      </div>
      <div class="footer-links">
        <div><strong>Shop</strong><br>All Products<br>Best Sellers</div>
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
