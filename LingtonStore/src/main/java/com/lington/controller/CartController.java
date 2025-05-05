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
            }

            session.setAttribute("cart", cart);
            request.getRequestDispatcher("/WEB-INF/page/cart.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.getRequestDispatcher("/WEB-INF/page/error.jsp").forward(request, response);
        }
    }

    private void handleAddToCart(List<Cartitemmodel> cart, productmodel product, int quantity) {
        for (Cartitemmodel item : cart) {
            if (item.getProduct().getId() == product.getId()) {
                int newQty = item.getQuantity() + quantity;
                item.setQuantity(newQty > 0 ? newQty : 1); // Prevent negative quantities
                return;
            }
        }
        cart.add(new Cartitemmodel(product, quantity > 0 ? quantity : 1));
    }

    private void updateCartItem(List<Cartitemmodel> cart, int productId, int newQuantity) {
        for (Cartitemmodel item : cart) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(newQuantity > 0 ? newQuantity : 1);
                break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/page/cart.jsp").forward(request, response);
    }
}