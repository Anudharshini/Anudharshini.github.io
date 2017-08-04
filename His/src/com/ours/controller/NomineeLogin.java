package com.ours.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.ours.beans.UserBean;
import com.ours.bo.NomineeLoginBO;

@WebServlet("/NomineeLogin")
public class NomineeLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(NomineeLogin.class);
    public NomineeLogin() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		HttpSession ses = request.getSession();
		LOGGER.info("Session : "+ses.getAttribute("SessionUser"));
		if(ses.getAttribute("SessionUser")!=null){
			response.getWriter().print(1);
		}else{
			throw new Exception();
		}
	}catch(Exception e)
	{
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
		UserBean ub = new UserBean();
		Long customerid=Long.parseLong(request.getParameter("customerid"));
		//String password=request.getParameter("password");
		String nominee_name=request.getParameter("nominee_name");
		ub.setCustomer_id(Long.parseLong(request.getParameter("customerid")));
		ub.setNominee_name(request.getParameter("nominee_name"));
		ub.setPassword(request.getParameter("password"));
		NomineeLoginBO nbo=new NomineeLoginBO();
		boolean result=nbo.LoginNominee(ub);
		/*if(customerid.equals(ub.getCustomer_id()) && nominee_name.equals(ub.getNominee_name()))*/
		if(result)
		{
			
			HttpSession ses = request.getSession();
			ses.setAttribute("ses_customer_id",new Long( ub.getCustomer_id()).toString());
			 ses.setAttribute("ses_nominee_name", ub.getNominee_name());
			 ses.setAttribute("type", "nominee");
			 LOGGER.info("Nominee loggedin. \n");
			 RequestDispatcher dispatch = request.getRequestDispatcher("/nomineehome.jsp");
			 dispatch.forward(request, response);
			 
		
	}
		else
		{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();	
			out.print("<h5 align=\"center\"><div style=\"margin-top:50px; color:red \">Invalid Login Credentials</div></h5><p align=\"center\"><a href=\"nominee.jsp\" class=\"btn btn-danger\">Try Again</a></p>");
			request.getRequestDispatcher("nominee.jsp").include(request, response);
			/*RequestDispatcher dispatch = request.getRequestDispatcher("/index.jsp");
			request.setAttribute("msg", "Invalid Credentials");
			PrintWriter out = response.getWriter();
			
			out.print("Invalid Login Credentials");
			dispatch.forward(request, response);*/
		
		}

}catch(Exception e)
{
	RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);
}

}
}
