package com.lington.controller;

import com.lington.dao.CategoryDao;
import com.lington.Model.categorymodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoryDao categoryDao;

    @Override
    public void init() throws ServletException {
        try {
            categoryDao = new CategoryDao(); // Your DAO, correctly named
        } catch (Exception e) {
            throw new ServletException("Failed to initialize CategoryDao", e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<categorymodel> categories = categoryDao.getAllCategories(); // Correct model type
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("/WEB-INF/page/Home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
