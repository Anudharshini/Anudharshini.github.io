package com.cognizant.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.cognizant.controller.Login;

/**
 * Servlet Filter implementation class CheckLogin
 */
@WebFilter("/CheckLogin")
public class CheckLogin implements Filter {
	static final Logger LOGGER = Logger.getLogger(Login.class);
	/**
	 * Default constructor.
	 */
	public CheckLogin() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		HttpSession ses = request.getSession();
		int flag = 0;
		try {
			if (ses != null) {
				String type = ses.getAttribute("type").toString();
				if (type.equals("Admins_001")) {
					flag = 1;
				} else if (type.equals("user")) {
					flag = 2;
				} else

				if (type.equals("nominee")) {
					flag = 3;
				} else
					flag = 0;
			}

			else {
				LOGGER.info("Session : " + ses.getAttribute("type"));
			}

		} catch (Exception e) {
			flag = 0;
		}
		request.setAttribute("status", flag);
		chain.doFilter(request, response);
	}

}
