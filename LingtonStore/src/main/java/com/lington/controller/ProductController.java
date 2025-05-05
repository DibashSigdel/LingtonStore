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
            List<productmodel> products;

            ProductDao productDao = new ProductDao();
            if (categoryParam != null && !categoryParam.isEmpty()) {
                int categoryId = Integer.parseInt(categoryParam);
                products = productDao.getProductsByCategory(categoryId);
                request.setAttribute("currentCategoryId", categoryId);
            } else {
                products = productDao.getAllProducts();
            }
            request.setAttribute("products", products);

            CategoryDao categoryDao = new CategoryDao();
            List<categorymodel> categories = categoryDao.getAllCategories();
            request.setAttribute("categories", categories);

            request.getRequestDispatcher("/WEB-INF/page/Product.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}