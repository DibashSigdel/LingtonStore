<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Herbal Tea Shop</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/Home.css" />
</head>
<body>

  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
  <header class="navbar">
    <div class="navbar-container">
      <div class="logo"><img src="./Screenshot_2025-04-17_185040-removebg-preview.png"></div>
      <nav class="nav-links">
    	<a href="${pageContext.request.contextPath}/Home.jsp">Home</a>
		<a href="${pageContext.request.contextPath}/Product.jsp">Shop</a>
		<a href="${pageContext.request.contextPath}/Registration.jsp">Register</a>
		<a href="${pageContext.request.contextPath}/Aboutus.jsp">About Us</a>
		<a href="${pageContext.request.contextPath}/Login.jsp">Login/Signin</a>

      </nav>
      <div class="search">
        <input type="text" placeholder="Search product">
      </div>
    </div>
  </header>

  <!-- Content -->
  <main>
    <section class="hero">
      <div class="text">
        <h1>Fresh Groceries Delivered to You</h1>
        <p>Browse our curated categories of fresh produce, dairy, snacks, and more. Get fast delivery across Kathmandu!</p>
        <a href="./product.html"><button>Start Shopping</button></a>
      </div>
      <div class="img-wrapper">
        <img src="https://static.vecteezy.com/system/resources/previews/048/560/473/non_2x/shopping-cart-filled-with-grocery-items-and-vegetables-isolated-on-a-transparent-background-png.png">
      </div>
    </section>
  
    <!-- Featured Products -->
    <section class="features">
      <h2>Our categories</h2>
      <div class="product-grid">
        <div class="product-card">
          <img src="https://cdn-icons-png.flaticon.com/512/1046/1046784.png" alt="Vegetables">
          <h3>InstantFood and Drinks</h3>
          
        </div>
        <div class="product-card">
          <img src="https://cdn-icons-png.flaticon.com/512/1046/1046786.png" alt="Fruits">
          <h3>Fruits and Veletables</h3>
          
        </div>
        <div class="product-card">
          <img src="https://cdn-icons-png.flaticon.com/512/3075/3075977.png" alt="Dairy">
          <h3>Milk & Dairy</h3>
          
        </div>
        <div class="product-card">
          <img src="https://cdn-icons-png.flaticon.com/512/3600/3600923.png" alt="Snacks">
          <h3>Kitchen utensils and accessories</h3>
        
        </div>
        <div class="product-card">
          <img src="https://cdn-icons-png.flaticon.com/512/3600/3600923.png" alt="Snacks">
          <h3>Extras</h3>
          
        </div>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <footer class="footer">
    <div class="footer-container">
        <div> <div class="footer-logo"><img style="width: 100px;" src="./Screenshot_2025-04-17_185040-removebg-preview.png"></div></div>
        <div class="footer-links">
            <div><strong>Shop</strong><br>All Teas<br>Best Sellers</div>
            <div><strong>About</strong><br>Our Story<br>Contact Us</div>
            <div><strong>Help</strong><br>FAQs<br>Shipping Info</div>
          </div>
  
      <div class="footer-right">
      <h3>sign in to the store</h3>
       
        <a href="./signin.html"><button>Sign In</button></a>
        </div>

    </div>
    <div class="footer-bottom">
     
      <p style="text-align: center;">&copy; 2025 Lington Store. All rights reserved.</p>
    </div>
  </footer>

</body>
</html>
