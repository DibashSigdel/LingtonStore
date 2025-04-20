package com.lington.controller;

import java.io.IOException;
import java.time.LocalDate;

import com.lington.Model.usermodel;
import com.lington.service.signupservice;
import com.lington.util.PasswordUtil;
import com.lington.util.ValidationUtil;
import com.lington.util.ImageUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(urlPatterns = { "/signup" })
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
                 maxFileSize = 1024 * 1024 * 10,
                 maxRequestSize = 1024 * 1024 * 50)
public class signupcontroller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final ImageUtil imageUtil = new ImageUtil();
    private final signupservice signupService = new signupservice();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        try {
            String validationError = validateSignupForm(req);
            if (validationError != null) {
                handleError(req, resp, validationError);
                return;
            }

            usermodel user = extractUserModel(req);
            Boolean isRegistered = signupService.addUser(user);

            if (isRegistered == null) {
                handleError(req, resp, "Server maintenance in progress. Try again later!");
            } else if (isRegistered) {
                try {
                    if (uploadImage(req)) {
                        handleSuccess(req, resp, "Account created successfully!", "/WEB-INF/pages/Login.jsp");
                    } else {
                        handleError(req, resp, "Account created but image upload failed.");
                    }
                } catch (Exception e) {
                    handleError(req, resp, "Account created but image upload failed. Update later.");
                }
            } else {
                handleError(req, resp, "Registration failed. Username/email may exist.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            handleError(req, resp, "An unexpected error occurred. Please try again!");
        }
    }

    private String validateSignupForm(HttpServletRequest req) throws IOException, ServletException {
       
        String username = req.getParameter("username");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String gender = req.getParameter("gender");
        String dobStr = req.getParameter("dob");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phoneNumber = req.getParameter("phoneNumber");

        // Validation checks in specified order
        if (ValidationUtil.isNullOrEmpty(username)) return "Username is required.";
        if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) {
            return "Username must start with a letter (a-z) and contain only letters and numbers.";
        }

        if (ValidationUtil.isNullOrEmpty(firstName)) return "First name is required.";
        if (ValidationUtil.isNullOrEmpty(lastName)) return "Last name is required.";

        if (ValidationUtil.isNullOrEmpty(gender)) return "Gender is required.";
        if (!ValidationUtil.isValidGender(gender)) return "Invalid gender selection.";

        if (ValidationUtil.isNullOrEmpty(dobStr)) return "Date of birth is required.";
        try {
            LocalDate dob = LocalDate.parse(dobStr);
            if (!ValidationUtil.isAgeAtLeast16(dob)) {
                return "You must be at least 16 years old to register.";
            }
        } catch (Exception e) {
            return "Invalid date format. Use YYYY-MM-DD.";
        }

        if (ValidationUtil.isNullOrEmpty(email)) return "Email is required.";
        if (!ValidationUtil.isValidEmail(email)) return "Invalid email format.";

        if (ValidationUtil.isNullOrEmpty(password)) return "Password is required.";
        if (!ValidationUtil.isValidPassword(password)) {
            return "Password must be 8+ chars with 1 uppercase, 1 number, and 1 symbol.";
        }

        if (ValidationUtil.isNullOrEmpty(phoneNumber)) return "Phone number is required.";
        if (!ValidationUtil.isValidPhoneNumber(phoneNumber)) {
            return "Phone must be 10 digits starting with 98.";
        }

        Part image = req.getPart("image");
        if (!ValidationUtil.isValidImageExtension(image)) {
            return "Invalid image format. Only JPG, JPEG, PNG, GIF allowed.";
        }

        return null;
    }

    private usermodel extractUserModel(HttpServletRequest req) throws Exception {
        return new usermodel(
            req.getParameter("username"),
            req.getParameter("firstName"),
            req.getParameter("lastName"),
            req.getParameter("gender"),
            LocalDate.parse(req.getParameter("dob")).toString(),
            req.getParameter("email"),
            PasswordUtil.encrypt(req.getParameter("username"), req.getParameter("password")),
            req.getParameter("phoneNumber"),
            imageUtil.getImageNameFromPart(req.getPart("image"))
        );
    }

    private boolean uploadImage(HttpServletRequest req) throws IOException, ServletException {
        Part image = req.getPart("image");
        return imageUtil.uploadImage(image, req.getServletContext().getRealPath("/"), "user");
    }

    private void handleSuccess(HttpServletRequest req, HttpServletResponse resp,
                             String message, String redirectPage)
            throws ServletException, IOException {
        req.setAttribute("success", message);
        req.getRequestDispatcher(redirectPage).forward(req, resp);
    }

    private void handleError(HttpServletRequest req, HttpServletResponse resp, String message)
            throws ServletException, IOException {
        req.setAttribute("error", message);
        // Preserve form data in specified order
        req.setAttribute("username", req.getParameter("username"));
        req.setAttribute("firstName", req.getParameter("firstName"));
        req.setAttribute("lastName", req.getParameter("lastName"));
        req.setAttribute("gender", req.getParameter("gender"));
        req.setAttribute("dob", req.getParameter("dob"));
        req.setAttribute("email", req.getParameter("email"));
        req.setAttribute("phoneNumber", req.getParameter("phoneNumber"));
        req.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(req, resp);
    }
}