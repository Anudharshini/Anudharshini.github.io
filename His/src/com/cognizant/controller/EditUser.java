package com.cognizant.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.cognizant.beans.UserBean;
import com.cognizant.bo.EditUserBO;



@WebServlet("/EditUser")
public class EditUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public EditUser() {
        super();
        
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request,response);
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		UserBean ub=new UserBean();
		
		String str=request.getParameter("password");
		if(!(str.isEmpty()) && str!=null)
		{
		ub.setPassword(request.getParameter("password"));
		ub.setEmail(request.getParameter("email"));
		ub.setContact_no(Long.parseLong(request.getParameter("contact_no")));
		ub.setUser_name(request.getParameter("user_name"));
		//HttpSession ses = request.getSession();
		//ses.setAttribute("ses_customer_id",new Long( ub.getCustomer_id()).toString());
		ub.setCustomer_id( new Long(request.getParameter("customer_id")));
		EditUserBO rbo=new EditUserBO();
		boolean success=rbo.EditUser(ub);
		if(success){
			RequestDispatcher dispatch=request.getRequestDispatcher("editusersuccess.jsp");
			dispatch.forward(request, response);
		}
		}
		else
		{
			//ub.setPassword((String)request.getAttribute("ses_password"));
			ub.setEmail(request.getParameter("email"));
			ub.setContact_no(Long.parseLong(request.getParameter("contact_no")));
			ub.setUser_name(request.getParameter("user_name"));
			//HttpSession ses = request.getSession();
	        //ses.setAttribute("ses_customer_id",new Long( ub.getCustomer_id()).toString());
			//ub.setCustomer_id((Long) ses.getAttribute("ses_customer_id"));
			ub.setCustomer_id( new Long(request.getParameter("customer_id")));
			EditUserBO rbo=new EditUserBO();
			boolean success=rbo.EditUserpass(ub);
			if(success){
				RequestDispatcher dispatch=request.getRequestDispatcher("editusersuccess.jsp");
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
