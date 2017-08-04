package com.cognizant.controller;

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

//import org.apache.catalina.connector.Response;

import com.cognizant.beans.AdminBean;
import com.cognizant.beans.UserBean;
import com.cognizant.bo.LoginBO;


/**
 * Servlet implementation class LoginController
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Login.class);
    
    public Login() {
       
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
	}catch(Exception e){
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}
    }
    	
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try
		{
			String role=request.getParameter("username");
		
		//System.out.println(role);
		
			if(role.equals("Admins_001")){
			AdminBean ab=new AdminBean();
			ab.setAdmin_name(request.getParameter("username"));
			ab.setPassword(request.getParameter("password"));
			LoginBO lbo = new LoginBO();
			boolean adminCheck = lbo.loginAdmin(ab);
			if(adminCheck){
				LOGGER.info("Admin loggedin successfully. \n");
				HttpSession ses = request.getSession();
				ses.setAttribute("ses_admin_name", ab.getAdmin_name());
				ses.setAttribute("type", "Admins_001");
				RequestDispatcher dispatch = request.getRequestDispatcher("/Admin");
				dispatch.forward(request, response);
			}
			else
			{
				/*request.setAttribute("msg", "Invalid Credentials");*/
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();					
				out.print("<h5 align=\"center\"><div style=\"margin-top:50px; color:red \">Invalid Login Credentials</div></h5><p align=\"center\"><a href=\"index.jsp#login\" class=\"btn btn-danger\">Try Again</a></p>");
				request.getRequestDispatcher("/index.jsp").include(request, response);
				}
		}
		else{
			
		UserBean ub = new UserBean();
		ub.setCustomer_id(Long.parseLong(request.getParameter("username")));
		ub.setPassword(request.getParameter("password"));
		LoginBO lbo = new LoginBO();
		ub = lbo.loginUser(ub);
		
		HttpSession ses1=request.getSession();
		ses1.setAttribute("ses_insured_type", request.getParameter("insured_type"));
		
		if(ub.getCustomer_id()>0 && ub.getFirst_name()!=null){
			HttpSession ses = request.getSession();
			ses.setAttribute("ses_customer_id",new Long( ub.getCustomer_id()).toString());
			ses.setAttribute("ses_email_id", ub.getEmail());
            ses.setAttribute("ses_contact_no", ub.getContact_no());
            ses.setAttribute("ses_user_name", ub.getUser_name());
            ses.setAttribute("ses_first_name", ub.getFirst_name());
            ses.setAttribute("ses_last_name", ub.getLast_name());
            //System.out.println(ses.getAttribute("ses_first_name"));
            
            ses.setAttribute("ses_password", ub.getPassword());
            ses.setAttribute("insured_type", ub.getInsured_type());
           // System.out.println(ses.getAttribute("insured_type"));
            ses.setAttribute("type", "user");
            LOGGER.info("User "+ses.getAttribute("ses_customer_id")+" loggedin successfully. \n");
			RequestDispatcher dispatch = request.getRequestDispatcher("/userhome.jsp");
			//System.out.println(ub.getFirst_name());
			request.setAttribute("msg", ub.getFirst_name());
		
			dispatch.forward(request, response);
		}else{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();	
			out.print("<h5 align=\"center\"><div style=\"margin-top:50px; color:red \">Invalid Login Credentials</div></h5><p align=\"center\"><a href=\"index.jsp#login\" class=\"btn btn-danger\">Try Again</a></p>");
			request.getRequestDispatcher("index.jsp").include(request, response);
			/*RequestDispatcher dispatch = request.getRequestDispatcher("/index.jsp");
			request.setAttribute("msg", "Invalid Credentials");
			PrintWriter out = response.getWriter();
			
			out.print("Invalid Login Credentials");
			dispatch.forward(request, response);*/
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


