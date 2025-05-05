package com.lington.controller;

import com.lington.dao.ProductDao;
import com.lington.Model.productmodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addproductcontroller")
public class AddProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idStr = request.getParameter("productId");
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stockQuantity");
            String imageUrl = request.getParameter("imageUrl");
            String categoryStr = request.getParameter("categoryId");

            double price = Double.parseDouble(priceStr);
            int stock = Integer.parseInt(stockStr);
            int categoryId = Integer.parseInt(categoryStr);

            productmodel p = new productmodel();
            p.setName(name);
            p.setDescription(description);
            p.setPrice(price);
            p.setStockQuantity(stock);
            p.setImageUrl(imageUrl);
            p.setCategoryId(categoryId);

            ProductDao dao = new ProductDao();

            if (idStr != null && !idStr.isEmpty()) {
                int id = Integer.parseInt(idStr);
                p.setId(id);
                dao.updateProduct(p);
            } else {
                dao.insertProduct(p);
            }

            response.sendRedirect(request.getContextPath() + "/AddProductForm");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ Failed to save product.");
        }
    }
}
