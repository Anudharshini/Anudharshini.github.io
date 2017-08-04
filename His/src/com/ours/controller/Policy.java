package com.ours.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
//import javax.servlet.http.HttpSession;

import com.ours.beans.PolicyBean;
import com.ours.bo.PolicyBO;

@WebServlet("/Policy")
public class Policy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Policy.class);
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	  
	public Policy() {
		super();

	}


	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		
		try{
		PolicyBean pb=new PolicyBean();
		HttpSession ses=request.getSession();
		pb.setCustomer_id(ses.getAttribute("ses_customer_id").toString());
		pb.setInsurance_name(request.getParameter("insurance_name"));
		pb.setPolicy_amount(Long.parseLong(request.getParameter("policy_amount")));
		pb.setPolicy_duration(Integer.parseInt(request.getParameter("policy_duration")));
		pb.setPremium_type(request.getParameter("premium_type"));
		pb.setPolicy_start_date(request.getParameter("policy_date"));
		
		pb.setStatus("Pending");
		PolicyBO pbo = new PolicyBO();
		/*boolean success2 = pbo.registerUser(pb);
		(success2) {
			LOGGER.info("Policy registered successfully. \n");
			RequestDispatcher dispatch = request.getRequestDispatcher("successpolicy.jsp");
			request.setAttribute("policy_no", pb.getPolicy_id());
			request.setAttribute("premium_amount", pb.getPremium_amount());
			request.setAttribute("maturity_date", pb.getMaturity_date());
			dispatch.forward(request, response);*/
		pb= pbo.registerUser(pb);
		String fname=(String)ses.getAttribute("ses_first_name");
		String lname=(String)ses.getAttribute("ses_last_name");
		String name=fname+" "+lname;
		if (pb.getPolicy_id()!=0) {
			request.setAttribute("policy_no", pb.getPolicy_id());
			request.setAttribute("premium_amount", pb.getPremium_amount());
			request.setAttribute("maturity_date", pb.getMaturity_date());
			LOGGER.info("The policy id "+pb.getPolicy_id()+" has been registered for approval \n");
			boolean res=pbo.createPdf(pb,name);
			if(res){
			RequestDispatcher dispatch = request.getRequestDispatcher("/successpolicy.jsp");
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
