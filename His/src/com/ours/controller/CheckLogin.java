package com.ours.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

@WebServlet("/CheckLogin")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public CheckLogin() {
		super();

	}

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		
		
		
		HttpSession ses = request.getSession();
        int status=(Integer) request.getAttribute("status");
		try{
		if (ses != null) {
			response.getWriter().print(status);
			}
		
		else{
			response.getWriter().print(0);
		}
		

		
		/*catch(Exception e){
			response.getWriter().print(0);
		}*/
	}catch(Exception e){
		RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
		//request.setAttribute("policy", usermap);
		disp.forward(request, response);
	}
}
}

