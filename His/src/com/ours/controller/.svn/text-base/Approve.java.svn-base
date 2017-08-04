package com.cognizant.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.cognizant.beans.PolicyBean;
import com.cognizant.bo.ApproveBO;

/**
 * Servlet implementation class ApproveController
 */
@WebServlet("/Approve")
public class Approve extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Approve.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Approve() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
		ApproveBO ap=new ApproveBO();
		PolicyBean po=new PolicyBean();
		po.setPolicy_id(Long.parseLong(request.getParameter("id")));
		
		ap.approvePolicy(po);
		
		RequestDispatcher disp = request.getRequestDispatcher("Approve.jsp");
		request.setAttribute("policy_id", po.getPolicy_id());
		LOGGER.info("Admin approved the policy "+po.getPolicy_id()+" successfully. \n");
		disp.forward(request, response);
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
