package com.lington.controller;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class signupController
 * @author Adrian Poudyal
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/signupform"})
public class signupform extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
     * @see HttpServlet#HttpServlet()
     */
	public signupform() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        request.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(request, response);
    }
	/**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Retrieve form data (matching HTML input field names)
	        String firstName = request.getParameter("FirstName");  // Updated to match HTML field name
	        String lastName = request.getParameter("LastName");    // Updated to match HTML field name
	        String username = request.getParameter("Username");
	        String dob = request.getParameter("Birthday");         // Changed to "birthday" as per HTML form field
	        String gender = request.getParameter("Gender");
	        String email = request.getParameter("Email");          // Updated to match HTML field name
	        String phoneNumber = request.getParameter("Phone");    // Updated to match HTML field name
	        String password = request.getParameter("Password");
	      //  String retypePassword = request.getParameter("retypePassword");  // Updated to match HTML field name

	        // Perform validation
	        boolean isValid = true;
	        StringBuilder errorMessage = new StringBuilder();

	        if (firstName == null || firstName.trim().isEmpty()) {
	            isValid = false;
	            errorMessage.append("First Name is required.<br>");
	        }

	        if (lastName == null || lastName.trim().isEmpty()) {
	            isValid = false;
	            errorMessage.append("Last Name is required.<br>");
	        }

	        if (username == null || username.trim().isEmpty()) {
	            isValid = false;
	            errorMessage.append("Username is required.<br>");
	        }

	        if (dob == null || dob.trim().isEmpty()) {
	            isValid = false;
	            errorMessage.append("Date of Birth is required.<br>");
	        }

	        if (gender == null || gender.trim().isEmpty()) {
	            isValid = false;
	            errorMessage.append("Gender is required.<br>");
	        }

	        if (email == null || email.trim().isEmpty() || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
	            isValid = false;
	            errorMessage.append("Valid Email is required.<br>");
	        }

	        if (phoneNumber == null || phoneNumber.trim().isEmpty() || !phoneNumber.matches("^[0-9]{10}$")) {
	            isValid = false;
	            errorMessage.append("Valid Phone Number is required.<br>");
	        }

	        if (password == null || password.trim().isEmpty()) {
	            isValid = false;
	            errorMessage.append("Password is required.<br>");
	        }

	        // Check if all fields are valid
	        if (isValid) {
	            // If valid, you can proceed with further processing (e.g., saving to database)
	            response.getWriter().write("Registration ful!");
	            request.getRequestDispatcher("/WEB-INF/page/Login.jsp").forward(request, response);
	            
	        } else {
	            // If not valid, send error message back to the user
	            response.setContentType("text/html");
	            response.getWriter().write("<h2>Validation Errors:</h2>" + errorMessage.toString());
	        }
	    }
}