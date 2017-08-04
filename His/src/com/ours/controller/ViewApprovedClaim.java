package com.ours.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ours.beans.ClaimBean;
import com.ours.bo.AdminBO;

/**
 * Servlet implementation class ViewApprovedClaimController
 */
@WebServlet("/ViewApprovedClaim")
public class ViewApprovedClaim extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewApprovedClaim() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		AdminBO ab=new AdminBO();
        Map<Integer, ClaimBean> claimmap = ab.viewApprovedClaim();
        
        RequestDispatcher disp = request.getRequestDispatcher("ApprovedClaimHome.jsp");
        request.setAttribute("approveclaim", claimmap);
        disp.forward(request, response);
	
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
