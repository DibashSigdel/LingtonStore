package com.lington.controller;

import com.lington.dao.ProductDao;
import com.lington.Model.productmodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/addproductcontroller")
public class AddProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form parameters
            String name = request.getParameter("name");
            String description = request.getParameter("description");
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stockQuantity");
            String imageUrl = request.getParameter("imageUrl");
            String categoryStr = request.getParameter("categoryId");

            
            // Parse inputs
            double price = Double.parseDouble(priceStr);
            int stock = Integer.parseInt(stockStr);
            int categoryId = Integer.parseInt(categoryStr);

            // Create product model
            productmodel p = new productmodel();
            p.setName(name);
            p.setDescription(description);
            p.setPrice(price);
            p.setStockQuantity(stock);
            p.setImageUrl(imageUrl);
            p.setCategoryId(categoryId);


            new ProductDao().insertProduct(p);

           

            // Redirect to product listing or confirmation
            response.sendRedirect(request.getContextPath() + "/product");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ Product insertion failed.");
        }
    }
}
