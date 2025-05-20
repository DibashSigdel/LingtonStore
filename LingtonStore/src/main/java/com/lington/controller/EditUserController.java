package com.lington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;

import com.lington.Model.usermodel;
import com.lington.service.signupservice;

@WebServlet("/editusercontroller")
public class EditUserController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdStr = request.getParameter("userId");
        int id = (userIdStr == null || userIdStr.isEmpty()) ? 0 : Integer.parseInt(userIdStr);

        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String username = request.getParameter("Username");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("Gender");
        String email = request.getParameter("Email");
        String phone = request.getParameter("Phone");
        String password = request.getParameter("Password");
        String role = request.getParameter("role");

        usermodel user = new usermodel(id, firstName, lastName, username, LocalDate.parse(dob), gender, email, phone, password, role);

        signupservice service = new signupservice();
        boolean success = (id == 0) ? service.addUser(user) : service.updateUser(user);

        if (success) {
            response.sendRedirect("usermanagement");
        } else {
            response.getWriter().write("Failed to process user data.");
        }
    }
}
