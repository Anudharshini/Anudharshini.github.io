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
import com.ours.bo.RejectBO;

/**
 * Servlet implementation class RejectController
 */
@WebServlet("/Reject")
public class Reject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Reject.class);
    public Reject() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		RejectBO ap=new RejectBO();
		PolicyBean po=new PolicyBean();
		po.setPolicy_id(Long.parseLong(request.getParameter("id")));
		
		ap.rejectPolicy(po);
		
		RequestDispatcher disp = request.getRequestDispatcher("Reject.jsp");
		request.setAttribute("policy_id", po.getPolicy_id());
		LOGGER.info("Admin has rejected the policy "+po.getPolicy_id()+". \n");
		disp.forward(request, response);
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
