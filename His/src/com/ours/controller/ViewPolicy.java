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

import com.ours.beans.PolicyBean;
import com.ours.bo.PolicyBO;

/**
 * Servlet implementation class ViewPolicyController
 */
@WebServlet("/ViewPolicy")
public class ViewPolicy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPolicy() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {{
    	doPost(request,response);
    }
    }
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		PolicyBean pb=new PolicyBean();
		HttpSession ses=request.getSession();
		pb.setCustomer_id(ses.getAttribute("ses_customer_id").toString());
		PolicyBO p=new PolicyBO();
		Map<Integer, PolicyBean> usermap=p.checkStatus(pb);
		RequestDispatcher disp = request.getRequestDispatcher("View.jsp");
		request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}

}
}
