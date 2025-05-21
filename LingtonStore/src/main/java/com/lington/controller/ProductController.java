// ProductController.java
package com.lington.controller;

import com.lington.dao.ProductDao;
import com.lington.dao.CategoryDao;
import com.lington.Model.productmodel;
import com.lington.Model.categorymodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String categoryParam = request.getParameter("category");
            String searchParam = request.getParameter("search");

            ProductDao productDao = new ProductDao();
            List<productmodel> products;

            if (searchParam != null && !searchParam.trim().isEmpty()) {
                // 🔍 Search products by keyword
                products = productDao.searchProducts(searchParam.trim());
                request.setAttribute("searchQuery", searchParam);
            } else if (categoryParam != null && !categoryParam.isEmpty()) {
                // 📂 Filter by category
                int categoryId = Integer.parseInt(categoryParam);
                products = productDao.getProductsByCategory(categoryId);
                request.setAttribute("currentCategoryId", categoryId);
            } else {
                // 📦 Get all products
                products = productDao.getAllProducts();
            }

            request.setAttribute("products", products);

            // Get categories for sidebar
            CategoryDao categoryDao = new CategoryDao();
            List<categorymodel> categories = categoryDao.getAllCategories();
            request.setAttribute("categories", categories);

            // Forward to JSP
            request.getRequestDispatcher("/WEB-INF/page/Product.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
