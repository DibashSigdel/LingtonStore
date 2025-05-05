package com.lington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.lington.dao.ProductDao;

/**
 * Servlet implementation class DeleteProductController
 */
@WebServlet("/deleteproductcontroller")
public class DeleteProductController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("productId"));
            new ProductDao().deleteProduct(id);
            response.sendRedirect(request.getContextPath() + "/AddProductForm");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ Product deletion failed.");
        }
    }
}

