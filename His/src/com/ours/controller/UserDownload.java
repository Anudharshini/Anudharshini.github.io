package com.ours.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadController
 */
@WebServlet("/UserDownload")
public class UserDownload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserDownload() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		 String filename = request.getParameter("file1")+".pdf"; 
		 //String filename2 = request.getParameter("file2"); 
		 String customer_id=request.getParameter("customer_id");
		 
		/* System.out.println(customer_id);
		 System.out.println(filename);*/
		// System.out.println(filename2);
		  String filepath = "D:\\project\\"+customer_id+"\\"; 
		  response.setContentType("APPLICATION/OCTET-STREAM"); 
		  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 

		  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
		  
		  int i; 
		  while ((i=fileInputStream.read()) != -1) {
		    out.write(i); 
		  } 
		  fileInputStream.close(); 
		  out.close(); 
		  
		 /* response.setHeader("Content-Disposition","attachment; filename=\"" + filename2 + "\""); 
		  java.io.FileInputStream fileInputStream2 = new java.io.FileInputStream(filepath + filename2);
		  
		  int j; 
		  while ((j=fileInputStream2.read()) != -1) {
		    out.write(j); 
		  } 
		  fileInputStream2.close(); 
		  out.close(); */
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
