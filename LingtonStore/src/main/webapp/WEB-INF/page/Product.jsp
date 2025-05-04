<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Grocery Product Page</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/Product.css" />
</head>
<body>

  <!-- Top Banner -->
  <div class="top-banner">Free shipping on orders over Rs.1000 Use code: LINGTONSKIRANA</div>

  <!-- Navbar -->
  <%@ include file="/WEB-INF/page/Header.jsp" %>

  <!-- Main Layout -->
  <div class="main">
    <aside class="sidebar">
      <h2>Categories</h2>
      <ul>
        <li>Instant Food & Drinks</li>
        <li>Fruits and Vegetables</li>
        <li>Milk & Dairy</li>
        <li>Kitchen Accessories</li>
        <li>Extras</li>
      </ul>
    </aside>

    <div class="container">
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
      <div class="product-card">
        <img src="https://media.self.com/photos/5b6b0b0cbb7f036f7f5cbcfa/4:3/w_2560%2Cc_limit/apples.jpg" />
        <div class="product-details">
          <h3>Red Apples</h3>
          <p>Sweet, crunchy, and packed with nutrients. 1 lb pack.</p>
          <div class="price">$2.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>

      <div class="product-card">
        <img src="https://horizon.com/wp-content/uploads/horizon-organic-grassfed-whole-milk-v2-2.png" />
        <div class="product-details">
          <h3>Organic Milk</h3>
          <p>1L full cream milk from local farms. 100% organic.</p>
          <div class="price">$1.49</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>

      <div class="product-card">
        <img src="https://images.squarespace-cdn.com/content/v1/59babd06a8b2b074e84ec171/1526499595917-18JSZY3V8BZK4QRFM4MS/City-Bread-Multigrain-675g.png?format=750w" />
        <div class="product-details">
          <h3>Wheat Bread</h3>
          <p>Soft, fresh, and nutritious. 400g sliced pack.</p>
          <div class="price">$2.49</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>

      <div class="product-card">
        <img src="https://source.unsplash.com/400x300/?vegetables" />
        <div class="product-details">
          <h3>Veggie Combo Pack</h3>
          <p>Assorted seasonal vegetables for a healthy lifestyle.</p>
          <div class="price">$4.99</div>
          <button class="btn">Add to Cart</button>
        </div>
      </div>
    </div>
  </div>

  <!-- Footer -->
  <%@ include file="/WEB-INF/page/Footer.jsp" %>

</body>
</html>
