package com.lington.controller;

import com.lington.Model.Cartitemmodel;
import com.lington.Model.productmodel;
import com.lington.dao.ProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.*;

@WebServlet("/cart")
public class CartController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Object user = session.getAttribute("user");
        if (user == null) {
            session.setAttribute("pendingCartAction", request.getParameter("action"));
            session.setAttribute("pendingProductId", request.getParameter("productId"));
            session.setAttribute("pendingQuantity", request.getParameter("quantity"));
            response.sendRedirect(request.getContextPath() + "/signincontroller");
            return;
        }

        List<Cartitemmodel> cart = (List<Cartitemmodel>) session.getAttribute("cart");
        if (cart == null) {
            cart = new ArrayList<>();
        }

        String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = request.getParameter("quantity") != null ?
                Integer.parseInt(request.getParameter("quantity")) : 1;

        try {
            ProductDao productDao = new ProductDao();
            productmodel product = productDao.getProductById(productId);

            if (product == null) {
                request.getRequestDispatcher("/WEB-INF/page/error.jsp").forward(request, response);
                return;
            }

            switch (action.toLowerCase()) {
                case "add":
                    handleAddToCart(cart, product, quantity);
                    break;
                case "remove":
                    cart.removeIf(item -> item.getProduct().getId() == productId);
                    break;
                case "update":
                    updateCartItem(cart, productId, quantity);
                    break;
                case "inc":
                    updateCartItem(cart, productId, quantity + 1);
                    break;
                case "dec":
                    updateCartItem(cart, productId, quantity - 1);
                    break;
            }

            session.setAttribute("cart", cart);
            request.getRequestDispatcher("/WEB-INF/page/cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/WEB-INF/page/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Object user = session.getAttribute("user");

        // Resume pending cart action after login
        String resume = request.getParameter("resume");
        if ("true".equals(resume) && user != null) {
            String action = (String) session.getAttribute("pendingCartAction");
            String productId = (String) session.getAttribute("pendingProductId");
            String quantity = (String) session.getAttribute("pendingQuantity");

            if (action != null && productId != null) {
                session.removeAttribute("pendingCartAction");
                session.removeAttribute("pendingProductId");
                session.removeAttribute("pendingQuantity");

                request.setAttribute("action", action);
                request.setAttribute("productId", productId);
                request.setAttribute("quantity", quantity);
                doPost(request, response);
                return;
            }
        }

        request.getRequestDispatcher("/WEB-INF/page/cart.jsp").forward(request, response);
    }

    private void handleAddToCart(List<Cartitemmodel> cart, productmodel product, int quantity) {
        for (Cartitemmodel item : cart) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        cart.add(new Cartitemmodel(product, quantity > 0 ? quantity : 1));
    }

    private void updateCartItem(List<Cartitemmodel> cart, int productId, int quantity) {
        for (Cartitemmodel item : cart) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(Math.max(1, quantity));
                break;
            }
        }
    }
}
