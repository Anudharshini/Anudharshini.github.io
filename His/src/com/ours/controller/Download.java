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
@WebServlet("/Download")
public class Download extends HttpServlet {
                private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Download() {
        super();
        // TODO Auto-generated constructor stub
    }

                protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                                response.setContentType("text/html");
                                PrintWriter out = response.getWriter();
                                String filename = request.getParameter("file1"); 
                                 /*String filename2 = request.getParameter("file2"); */
                                 String customer_id=request.getParameter("customer_id");
                                /*System.out.println(customer_id);
                                System.out.println(filename);*/
                                /*System.out.println(filename2);*/
                                  String filepath = "D:\\project\\"+customer_id+"\\"; 
                                  response.setContentType("APPLICATION/OCTET-STREAM"); 
                                  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\""); 

                                  java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);
                                  
                                  int i; 
                                  while ((i=fileInputStream.read()) != -1) {
                                    out.write(i); 
                                  } 
                                  
                }

                protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                                // TODO Auto-generated method stub
                }

}
