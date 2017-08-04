package com.cognizant.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.cognizant.beans.UserBean;
import com.cognizant.bo.RegistrationBO;


/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Register.class);
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		UserBean ub=new UserBean();
		ub.setFirst_name(request.getParameter("first_name"));
		ub.setLast_name(request.getParameter("last_name"));
		ub.setUser_name(request.getParameter("user_name"));
		ub.setPassword(request.getParameter("password"));
		ub.setAddress(request.getParameter("address"));
		ub.setCity(request.getParameter("city"));
		ub.setState(request.getParameter("state"));
		ub.setCountry(request.getParameter("country"));
		ub.setPincode(Long.parseLong(request.getParameter("pincode")));
		ub.setEmail(request.getParameter("email"));
		ub.setGender(request.getParameter("gender"));
		ub.setContact_no(Long.parseLong(request.getParameter("contact_no")));
		ub.setDate_of_birth(request.getParameter("date_of_birth"));
		ub.setAge(Integer.parseInt(request.getParameter("age")));
		
		String str=request.getParameter("insured_type");
		if(str.equalsIgnoreCase("Dependent"))
		{
		ub.setInsured_type(request.getParameter("insured_type"));
		ub.setNominee_name(request.getParameter("nominee_name"));
		ub.setNominee_address(request.getParameter("nominee_address"));
		ub.setNominee_contact_no( request.getParameter("nominee_contact"));
		RegistrationBO rbo=new RegistrationBO();
		boolean success=rbo.registerUser(ub);
		if(success){
			LOGGER.info("Registration Successful.\n");
			RequestDispatcher dispatch=request.getRequestDispatcher("/success.jsp");
			request.setAttribute("msg", ub);
			
			dispatch.forward(request, response);
		}
		else
		{
			LOGGER.info("Registration Failed \n");
			RequestDispatcher dispatch=request.getRequestDispatcher("/error.jsp");
			request.setAttribute("msg", "Customer Registration Failed");
			
			dispatch.forward(request, response);
		}
	}
	
	else
	{
		
		ub.setInsured_type(request.getParameter("insured_type"));
		ub.setNominee_name(request.getParameter("nominee_name"));
		ub.setNominee_address(request.getParameter("nominee_address"));
		ub.setNominee_contact_no(request.getParameter("nominee_contact"));
		RegistrationBO rbo=new RegistrationBO();
		boolean success=rbo.registerUser(ub);
		if(success){
			LOGGER.info("Registration Successful.\n");
			RequestDispatcher dispatch=request.getRequestDispatcher("/success.jsp");
			request.setAttribute("msg", ub);
			dispatch.forward(request, response);
		}
		else
		{
			LOGGER.info("Registration Failed \n");
			RequestDispatcher dispatch=request.getRequestDispatcher("/error.jsp");
			request.setAttribute("msg", "Customer Registration Failed");
			dispatch.forward(request, response);
		}
	}

}catch(Exception e)
{
	RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);
}

}
}
