package com.cognizant.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;


import com.cognizant.bo.GetPolicyDetailBO;

@WebServlet("/GetClaimPolicyDetail")
public class GetClaimPolicyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public GetClaimPolicyDetail() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String customer_id=request.getParameter("customer_id");
		//System.out.println(request.getParameter("customer_id"));
		
		JSONObject jo = new JSONObject();

		JSONArray ja = new JSONArray();
		//System.out.println("hit me");
		List<Integer> suc=GetPolicyDetailBO.checkclaimParams(request.getParameter("customer_id"));
		
			try {

			for (int i = 0; i < suc.size(); i++) {
				jo = new JSONObject();
				jo.put("value", suc.get(i));
				ja.put(jo);
			}
			
		

			jo = new JSONObject();
			jo.put("details", ja);

		} catch (JSONException e) {

			e.printStackTrace();
		}
	
	
		response.getWriter().println(jo);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
