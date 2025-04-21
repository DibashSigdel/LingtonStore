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
 * Servlet implementation class signupController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/signupcontroller"})
public class signupcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
     * @see HttpServlet#HttpServlet()
     */
	public signupcontroller() {
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
		 
		 
		 	signupservice signupobject=new signupservice();
		 	
	        // Retrieve form data (matching HTML input field names)
	        String firstName = request.getParameter("FirstName");  // Updated to match HTML field name
	        String lastName = request.getParameter("LastName");    // Updated to match HTML field name
	        String username = request.getParameter("Username");
	        LocalDate dob =LocalDate.parse(request.getParameter("dob"));         // Changed to "birthday" as per HTML form field
	        String gender = request.getParameter("Gender");
	        String email = request.getParameter("Email");          // Updated to match HTML field name
	        String phoneNumber = request.getParameter("Phone");    // Updated to match HTML field name
	        String password = request.getParameter("Password");
	      //  String retypePassword = request.getParameter("retypePassword");  // Updated to match HTML field name
	        
	        usermodel userobject=new usermodel(firstName,lastName,username,dob,gender,email,phoneNumber,password);
	        
	        signupobject.addUser(userobject);

	 }
}