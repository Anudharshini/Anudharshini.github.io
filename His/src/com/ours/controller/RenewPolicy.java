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
import com.ours.bo.PolicyBO;

/**
 * Servlet implementation class RenewPolicyController
 */
@WebServlet("/RenewPolicy")
public class RenewPolicy extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(RenewPolicy.class);
    public RenewPolicy() {
        super();
       
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		PolicyBean pb=new PolicyBean();
		pb.setPolicy_id(Long.parseLong(request.getParameter("policy_id")));
		PolicyBO p=new PolicyBO();
		boolean res=p.renewPolicy(pb);
		if(res){
			LOGGER.info("Policy Renewed Successfully. \n");
			RequestDispatcher disp = request.getRequestDispatcher("renewedPolicy.jsp");
			request.setAttribute("msg", "Policy Renewed Successfully");
			disp.forward(request, response);	
		}else{
			LOGGER.info("Policy cannot be renewed");
		RequestDispatcher disp = request.getRequestDispatcher("renewedPolicy.jsp");
		request.setAttribute("msg","Policy cannot be renewed");
		disp.forward(request, response);
	}}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
