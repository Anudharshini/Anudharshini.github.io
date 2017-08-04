package com.cognizant.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cognizant.beans.PolicyBean;
import com.cognizant.bo.EditPolicyCheckBO;

@WebServlet("/EditPolicyCheck")
public class EditPolicyCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditPolicyCheck() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		PolicyBean pb=new PolicyBean();
		HttpSession session=request.getSession();
		String customer_id=(String) session.getAttribute("ses_customer_id");
		
		
		int suc=EditPolicyCheckBO.checkpolicy(customer_id);
		if(suc>0)
		{
			RequestDispatcher dispatch = request.getRequestDispatcher("editpolicy.jsp");
			dispatch.forward(request, response);
		}
		else
		{
			RequestDispatcher dispatch = request.getRequestDispatcher("editpolicycheckfailed.jsp");
			dispatch.forward(request, response);	
		}
		
		
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
