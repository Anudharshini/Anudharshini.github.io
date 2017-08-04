package com.ours.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.ours.beans.PolicyBean;
import com.ours.bo.AdminRejectBO;

/**
 * Servlet implementation class AdminRejectController
 */
@WebServlet("/AdminReject")
public class AdminReject extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Login.class);   
    public AdminReject() {
        super();
       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
		AdminRejectBO ab=new AdminRejectBO();
	//	LOGGER.info("Admin has rejected the policy. \n");
		Map<Integer, PolicyBean> usermap = ab.rejectPolicy();
		RequestDispatcher disp = request.getRequestDispatcher("RejectHome.jsp");
		request.setAttribute("rejectpolicy", usermap);
		disp.forward(request, response);
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
