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
import com.cognizant.bo.ClaimBO;

/**
 * Servlet implementation class ClaimController
 */
@WebServlet("/Claim")
public class Claim extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Claim.class);
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Claim() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		PolicyBean pb=new PolicyBean();
        pb.setPolicy_id(Long.parseLong(request.getParameter("id")));
        
        ClaimBO c=new ClaimBO();
        if(c.calculateBonus(pb))
        {
        	LOGGER.info("Claim approved successfully. \n");
              RequestDispatcher dispatch = request.getRequestDispatcher("check.jsp");
              request.setAttribute("message", "Claim approved");
              dispatch.forward(request, response);
        }
        else
        {
        	LOGGER.info("Claim rejected. \n");
              RequestDispatcher dispatch = request.getRequestDispatcher("check.jsp");
              request.setAttribute("message", "Claim rejected");
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
