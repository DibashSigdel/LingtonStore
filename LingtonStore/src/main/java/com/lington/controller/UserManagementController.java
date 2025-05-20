package com.lington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.lington.Model.usermodel;
import com.lington.service.signupservice;

@WebServlet("/usermanagement")
public class UserManagementController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        signupservice service = new signupservice();
        List<usermodel> userList = service.getAllUsers();
        request.setAttribute("users", userList);
        request.getRequestDispatcher("/WEB-INF/page/UserManagement.jsp").forward(request, response);
    }
}
