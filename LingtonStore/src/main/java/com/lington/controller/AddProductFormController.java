package com.lington.controller;

import com.lington.dao.CategoryDao;
import com.lington.Model.categorymodel;

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
            List<categorymodel> categories = dao.getAllCategories();
            req.setAttribute("categories", categories);
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("/WEB-INF/page/AddProduct.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

