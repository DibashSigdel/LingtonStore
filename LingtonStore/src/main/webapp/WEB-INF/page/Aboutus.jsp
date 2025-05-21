<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

  <!-- Navbar -->
  <%@ include file="/WEB-INF/page/Header.jsp" %>

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

    <!-- Vision and Values Section -->
    <section class="about-sections">
      <div class="about-box">
        <h2>Our Vision</h2>
        <p>
          To create the most trusted and eco-friendly grocery platform in Nepal. We aim to empower every household with convenient access to quality products while supporting local farmers and sustainable practices.
        </p>
      </div>
      <div class="about-box">
        <h2>Our Values</h2>
        <p>
          At Lington Store, we believe in transparency, community, and responsibility. Our values guide every decision — from fair pricing and customer-first service to reducing waste and uplifting local producers.
        </p>
      </div>
    </section>

    <!-- Our Team Heading -->
    <h2 style="text-align:center; margin: 40px 0 20px;">Our Team</h2>

    <!-- Member Portfolio / Team Cards -->
    <section class="team-section">
      <div class="team-card">
       <img src="${pageContext.request.contextPath}/images/adrian.png" alt="adrian poudyal" class="team-photo" />

        <h3>Adrian Poudyal</h3>
        <p>UI/UX lead who designs smooth and engaging user interfaces that elevate the shopping experience on all devices.</p>
      </div>
      <div class="team-card">
        <img src="${pageContext.request.contextPath}/images/aayush.jpg" alt="Aayush Sapkota" class="team-photo" />
        <h3>Aayush Sapkota</h3>
        <p>Backend specialist ensuring secure, scalable, and fast handling of user data, inventory, and payments.</p>
      </div>
     
      
      <div class="team-card">
        <img src="${pageContext.request.contextPath}/images/manish.jpg" alt="Manish Lama" class="team-photo" />
        <h3>Manish Lama</h3>
        <p>UI/UX designer dedicated to creating user journeys that are visually pleasing, intuitive, and accessible to all.</p>
      </div>
      <div class="team-card">
        <img src="${pageContext.request.contextPath}/images/dibash.png" alt="Dibash Sigdel" class="team-photo" />
        <h3>Dibash Sigdel</h3>
        <p>Operations expert managing eco-friendly deliveries and vendor coordination across the Kathmandu Valley.</p>
      </div>
      <div class="team-card">
        <img src="${pageContext.request.contextPath}/images/gautam.png" alt="Gautam Raj Mandal" class="team-photo" />
        <h3>Gautam Raj Mandal</h3>
        <p>Handles customer feedback, live support, and helps us constantly adapt the platform to user needs.</p>
      </div>
    </section>

    <!-- Why Choose Us -->
    <section class="full-section">
      <h2>Why Choose Us</h2>
      <ul class="timeline">
        <li>Fast and on-time delivery across all wards of Kathmandu Valley.</li>
        <li>100% freshness guaranteed or your money back.</li>
        <li>Local support, local produce — empowering our farmers and community.</li>
        <li>Eco-conscious packaging and minimal waste logistics.</li>
        <li>Live order tracking and easy returns/refunds.</li>
      </ul>
    </section>

    <!-- Company Milestones -->
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
  <%@ include file="/WEB-INF/page/Footer.jsp" %>

</body>
</html>
