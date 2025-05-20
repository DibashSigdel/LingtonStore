package com.lington.controller;

import com.lington.dao.ProductDao;
import com.lington.Model.productmodel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/productDetail")
public class ProductDetailController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String idParam = request.getParameter("id");
            if (idParam == null || idParam.trim().isEmpty()) {
                response.sendRedirect("product");
                return;
            }

            int productId = Integer.parseInt(idParam);

            ProductDao productDao = new ProductDao();
            productmodel product = productDao.getProductById(productId);

            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/WEB-INF/page/ProductDetail.jsp").forward(request, response);
            } else {
                response.sendRedirect("product");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
