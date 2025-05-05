package com.lington.controller;

import com.lington.util.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/logoutcontroller")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        // Invalidate session using utility class
        SessionUtil.invalidateSession(req);
        
        // Redirect to login
        resp.sendRedirect(req.getContextPath() + "/signincontroller");
    }
}
