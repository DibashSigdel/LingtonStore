package com.lington.controller;

import com.lington.Model.categorymodel;
import com.lington.Model.productmodel;
import com.lington.dao.CategoryDao;
import com.lington.dao.ProductDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/product")
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Load categories for sidebar
            CategoryDao categoryDao = new CategoryDao();
            List<categorymodel> categories = categoryDao.getAllCategories();
            request.setAttribute("categories", categories);

            // Load products based on selected category
            String categoryParam = request.getParameter("category");
            List<productmodel> products;
            ProductDao productDao = new ProductDao();

            if (categoryParam != null && !categoryParam.isEmpty()) {
                int categoryId = Integer.parseInt(categoryParam);
                products = productDao.getProductsByCategory(categoryId);
            } else {
                products = productDao.getProductsByCategory(1); // default category
            }

            request.setAttribute("products", products);

        } catch (Exception e) {
            e.printStackTrace(); // Optionally log
            request.setAttribute("error", "Unable to load products.");
        }

        request.getRequestDispatcher("/WEB-INF/page/Product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
