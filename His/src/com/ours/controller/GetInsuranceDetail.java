package com.ours.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Servlet implementation class GetInsuranceDetail
 */
@WebServlet("/GetInsuranceDetail")
public class GetInsuranceDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInsuranceDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String iname = request.getParameter("iname");
		// String policy=request.getParameter("policy_amount");
		JSONObject jo = new JSONObject();

		JSONArray ja = new JSONArray();

		if (iname.equalsIgnoreCase("physical condition")) {
			int arr[] = { 300000, 500000 };
			int arr1[]={15,20};
			try {

				for (int i = 0; i < arr.length; i++) {
					jo.put("value" + i, arr[i]);
				}
				
				for(int j=0;j<arr1.length;j++)
				{
					jo.put("valuex" + j, arr1[j]);
				}
				
				
				ja.put(jo);

				jo = new JSONObject();
				jo.put("details", ja);

			} catch (JSONException e) {

				e.printStackTrace();
			}
		}
		if (iname.equalsIgnoreCase("accident related")) {
			int arr[] = { 300000, 500000 };
			int arr1[]={15,20};
			try {

				for (int i = 0; i < arr.length; i++) {
					jo.put("value" + i, arr[i]);

				}
				for(int j=0;j<arr1.length;j++)
				{
					jo.put("valuex" + j, arr1[j]);
				}

				ja.put(jo);

				jo = new JSONObject();
				jo.put("details", ja);

			} catch (JSONException e) {

				e.printStackTrace();
			}
		}
		if (iname.equalsIgnoreCase("occupational related")) {
			int arr[] = { 200000, 400000 };
			int arr1[]={15,20};
			try {

				for (int i = 0; i < arr.length; i++) {
					jo.put("value" + i, arr[i]);

				}
				
				for(int j=0;j<arr1.length;j++)
				{
					jo.put("valuex" + j, arr1[j]);
				}
				ja.put(jo);

				jo = new JSONObject();
				jo.put("details", ja);

			} catch (JSONException e) {

				e.printStackTrace();
			}
		}
		if (iname.equalsIgnoreCase("Environment related")) {
			int arr[] = { 200000, 400000 };
			int arr1[]={10,20};
			try {

				for (int i = 0; i < arr.length; i++) {
					jo.put("value" + i, arr[i]);

				}
				
				for(int j=0;j<arr1.length;j++)
				{
					jo.put("valuex" + j, arr1[j]);
				}
				ja.put(jo);

				jo = new JSONObject();
				jo.put("details", ja);

			} catch (JSONException e) {

				e.printStackTrace();
			}
		}
		if (iname.equalsIgnoreCase("Life style related")) {
			int arr[] = { 300000, 500000 };
			int arr1[]={15,25};
			try {

				for (int i = 0; i < arr.length; i++) {
					jo.put("value" + i, arr[i]);

				}
				
				for(int j=0;j<arr1.length;j++)
				{
					jo.put("valuex" + j, arr1[j]);
				}
				
				ja.put(jo);

				jo = new JSONObject();
				jo.put("details", ja);

			} catch (JSONException e) {

				e.printStackTrace();
			}
		}
		if (iname.equalsIgnoreCase("Travel related")) {
			int arr[] = { 300000, 500000 };
			int arr1[]={15,25};
			try {

				for (int i = 0; i < arr.length; i++) {
					jo.put("value" + i, arr[i]);

				}
				
				for(int j=0;j<arr1.length;j++)
				{
					jo.put("valuex" + j, arr1[j]);
				}
				
				ja.put(jo);

				jo = new JSONObject();
				jo.put("details", ja);

			} catch (JSONException e) {

				e.printStackTrace();
			}
		}

		response.getWriter().println(jo);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
