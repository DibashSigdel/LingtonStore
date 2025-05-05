package com.lington.controller;

import com.lington.dao.CategoryDao;
import com.lington.dao.ProductDao;
import com.lington.Model.categorymodel;
import com.lington.Model.productmodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/AddProductForm")
public class AddProductFormController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            CategoryDao dao = new CategoryDao();
            ProductDao pdao = new ProductDao();

            List<categorymodel> categories = dao.getAllCategories();
            List<productmodel> products;

            String catParam = req.getParameter("category");
            if (catParam != null && !catParam.isEmpty()) {
                int catId = Integer.parseInt(catParam);
                products = pdao.getProductsByCategory(catId);
                req.setAttribute("currentCategoryId", catId);
            } else {
                products = pdao.getAllProducts();
            }

            req.setAttribute("categories", categories);
            req.setAttribute("products", products);

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("/WEB-INF/page/AddProduct.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

