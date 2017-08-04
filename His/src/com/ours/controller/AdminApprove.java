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
import com.ours.bo.AdminApproveBO;


/**
 * Servlet implementation class AdminApproveController
 */
@WebServlet("/AdminApprove")
public class AdminApprove extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Login.class);  
    public AdminApprove() {
        super();
       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		AdminApproveBO ab=new AdminApproveBO();
		//LOGGER.info("Admin approved the policy successfully. \n");
		Map<Integer, PolicyBean> usermap = ab.approvePolicy();
		RequestDispatcher disp = request.getRequestDispatcher("ApproveHome.jsp");
		request.setAttribute("approvepolicy", usermap);
		disp.forward(request, response);
		
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}
}
