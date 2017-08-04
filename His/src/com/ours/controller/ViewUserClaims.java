package com.ours.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ours.beans.ClaimBean;
import com.ours.beans.PolicyBean;
import com.ours.bo.ClaimBO;
import com.ours.bo.PolicyBO;

/**
 * Servlet implementation class ViewUserClaimsController
 */
@WebServlet("/ViewUserClaims")
public class ViewUserClaims extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewUserClaims() {
        super();
       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doPost(request,response);
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		try{
		ClaimBean cb=new ClaimBean();
		HttpSession ses=request.getSession();
		cb.setCustomer_id(ses.getAttribute("ses_customer_id").toString());
		ClaimBO c=new ClaimBO();
		 
		Map<Integer, ClaimBean> claimmap=c.checkClaimStatus(cb);
		if(ses.getAttribute("type").equals("user")){
		RequestDispatcher disp = request.getRequestDispatcher("ViewClaims.jsp");
		request.setAttribute("claim", claimmap);
		disp.forward(request, response);
		}
		else
		{
        	RequestDispatcher disp = request.getRequestDispatcher("viewnomclaim.jsp");
            request.setAttribute("claim", claimmap);
            disp.forward(request, response);
        }
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}

}
