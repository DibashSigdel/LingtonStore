package com.lington.controller;

import java.io.IOException;

import com.lington.Model.usermodel;
import com.lington.service.signinservice;
//import com.lington.util.CookieUtil;
import com.lington.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/signincontroller" })
public class signincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final signinservice signinservice;

	public signincontroller() {
		this.signinservice = new signinservice();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		usermodel Usermodel = new usermodel(username, password);
		Boolean SigninStatus = signinservice.signinUser(Usermodel);


		
		if (SigninStatus != null && SigninStatus) {
		    // Set username in session
		    SessionUtil.setAttribute(req, "username", username);
		    SessionUtil.setAttribute(req, "role", Usermodel.getRole());
		    
		    // Redirect to home page after successful login
		    if ("admin".equalsIgnoreCase(Usermodel.getRole())) {
	            req.getRequestDispatcher("/WEB-INF/page/Adminpannel.jsp").forward(req, resp);
	        } else {
	            req.getRequestDispatcher("/WEB-INF/page/Home.jsp").forward(req, resp);
	        }
		} else {
		    // Handle login failure (show error message, etc.)
		    handleLoginFailure(req, resp, SigninStatus);
		}

			 
	}

	
	  private void handleLoginFailure(HttpServletRequest req, HttpServletResponse
	resp, Boolean SigninStatus) throws ServletException, IOException { String
	  errorMessage; if (SigninStatus == null) { errorMessage =
	  "Our server is under maintenance. Please try again later!"; } else {
	  errorMessage = "User credential mismatch. Please try again!"; }
	  req.setAttribute("error", errorMessage);
	  req.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(req, resp); }
	 
}