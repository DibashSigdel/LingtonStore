package com.lington.controller;

import com.lington.dao.UserDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/deleteusercontroller")
public class DeleteUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("userId"));
            System.out.println("➡️ Received userId for deletion: " + id);

            UserDao dao = new UserDao(); // make sure this doesn't throw
            dao.deleteUser(id);

            response.sendRedirect(request.getContextPath() + "/usermanagement");
        } catch (Exception e) {
            e.printStackTrace();  // ✅ PRINT ACTUAL ERROR
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "❌ User deletion failed: " + e.getMessage());
        }
    }
}
