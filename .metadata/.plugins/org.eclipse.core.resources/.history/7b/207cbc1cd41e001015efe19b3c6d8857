package com.lington.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.lington.Model.usermodel;
import com.lington.service.signupservice;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signupcontroller
 * Author: Adrian Poudyal
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/signupcontroller"})
public class signupcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signupcontroller() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        boolean isValid = true;
        StringBuilder errorMessage = new StringBuilder();

        // Retrieve form data
        String firstName = request.getParameter("FirstName");
        String lastName = request.getParameter("LastName");
        String username = request.getParameter("Username");
        String dobParam = request.getParameter("dob");
        String gender = request.getParameter("Gender");
        String email = request.getParameter("Email");
        String phoneNumber = request.getParameter("Phone");
        String password = request.getParameter("Password");

        LocalDate dob = null;

        // First Name validation
        if (firstName == null || firstName.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("First Name is required.<br>");
        } else if (firstName.matches("^[0-9].*")) {
            isValid = false;
            errorMessage.append("First Name should not start with a number.<br>");
        }

        // Last Name validation
        if (lastName == null || lastName.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("Last Name is required.<br>");
        } else if (lastName.matches("^[0-9].*")) {
            isValid = false;
            errorMessage.append("Last Name should not start with a number.<br>");
        }

        // Username validation
        if (username == null || username.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("Username is required.<br>");
        } else if (!username.matches("^[A-Za-z0-9].*")) {
            isValid = false;
            errorMessage.append("Username should not start with a special character.<br>");
        }

        // Date of Birth validation
        if (dobParam == null || dobParam.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("Date of Birth is required.<br>");
        } else {
            try {
                dob = LocalDate.parse(dobParam);
            } catch (Exception e) {
                isValid = false;
                errorMessage.append("Invalid Date format. Use YYYY-MM-DD.<br>");
            }
        }

        // Gender validation
        if (gender == null || gender.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("Gender is required.<br>");
        }

        // Email validation
        if (email == null || email.trim().isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            isValid = false;
            errorMessage.append("Valid Email is required.<br>");
        }

        // Phone number validation
        if (phoneNumber == null || phoneNumber.trim().isEmpty() || !phoneNumber.matches("^[0-9]{10}$")) {
            isValid = false;
            errorMessage.append("Valid Phone Number is required (10 digits).<br>");
        }

        // Password validation
        if (password == null || password.trim().isEmpty()) {
            isValid = false;
            errorMessage.append("Password is required.<br>");
        }

        // If all fields are valid
        if (isValid) {
            usermodel userobject = new usermodel(firstName, lastName, username, dob, gender, email, phoneNumber, password);
            signupservice signupobject = new signupservice();
            signupobject.addUser(userobject);

            request.setAttribute("message", "Registration successful! Please login.");
            request.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(request, response);
        } else {
            response.setContentType("text/html");
            response.getWriter().write("<h2>Validation Errors:</h2>" + errorMessage.toString());
        }
    }
}