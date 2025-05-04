package com.lington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Handles requests to load the Home page.
 */
@WebServlet("/product") // Clean, user-friendly URL
public class ProductController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProductController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward request to the protected JSP
        request.getRequestDispatcher("/WEB-INF/page/Product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response); // Optional: handle POST same as GET
    }
}
