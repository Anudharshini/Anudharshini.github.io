package com.ours.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ours.beans.PolicyBean;
import com.ours.bo.EditPolicyBO;


/**
 * Servlet implementation class EditPolicyController
 */
@WebServlet("/EditPolicy")
public class EditPolicy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//static final Logger LOGGER = Logger.getLogger(EditPolicyController.class);   
  
    public EditPolicy() {
        super();
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		try{
		PolicyBean pb=new PolicyBean();
		
		int suc=EditPolicyBO.checkParams(request.getParameter("policy_id"),request.getParameter("cust_id"));
		//System.out.println(suc);
		if(suc>0)
		{
			
			pb.setInsurance_name(request.getParameter("insurance_name"));
			pb.setPolicy_amount(Long.parseLong(request.getParameter("policy_amount")));
			pb.setPolicy_duration(Integer.parseInt(request.getParameter("policy_duration")));
			pb.setPremium_type(request.getParameter("premium_type"));
			EditPolicyBO pbo = new EditPolicyBO();
		boolean success2 = pbo.EditPolicyDetails(pb);
		//System.out.println(success2);
		if (success2) {
			
			RequestDispatcher dispatch = request.getRequestDispatcher("editpolicycompleted.jsp");
			dispatch.forward(request, response);
			
			
		}
		else
		{
			RequestDispatcher dispatch = request.getRequestDispatcher("editpolicyrejected.jsp");
			dispatch.forward(request, response);
		}
	}else
	{
		RequestDispatcher dispatch = request.getRequestDispatcher("editpolicyrejected.jsp");
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
