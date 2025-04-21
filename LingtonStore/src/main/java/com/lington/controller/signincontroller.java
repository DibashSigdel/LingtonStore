package com.lington.controller;

import java.io.IOException;

import com.lington.Model.usermodel;
import com.lington.service.signinservice;
import com.lington.util.CookieUtil;
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
		Boolean SigninStatus = signinservice.loginUser(Usermodel);


		
		  if (SigninStatus != null && SigninStatus) { SessionUtil.setAttribute(req,
		  "username", username);
		  
		  if (username.equals("admin")) { CookieUtil.addCookie(resp, "role", "admin", 5
		  * 30); } else { CookieUtil.addCookie(resp, "role", "student", 5 * 30); }
		 

			
			resp.sendRedirect(req.getContextPath() + "/Home.jsp");
			
			  } else { handleLoginFailure(req, resp, SigninStatus); }
			 
	}

	
	  private void handleLoginFailure(HttpServletRequest req, HttpServletResponse
	resp, Boolean SigninStatus) throws ServletException, IOException { String
	  errorMessage; if (SigninStatus == null) { errorMessage =
	  "Our server is under maintenance. Please try again later!"; } else {
	  errorMessage = "User credential mismatch. Please try again!"; }
	  req.setAttribute("error", errorMessage);
	  req.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(req, resp); }
	 
}