package com.cognizant.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;

import com.cognizant.beans.ClaimBean;

import com.cognizant.bo.UploadBO;

@WebServlet("/Upload")
public class Upload extends HttpServlet {
    private static final long serialVersionUID = 1L;
    static final Logger LOGGER = Logger.getLogger(Upload.class);
    // location to store file uploaded
    
    private static  String UPLOAD_DIRECTORY ;

    // upload settings
    private static final int MEMORY_THRESHOLD   = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE      = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE   = 1024 * 1024 * 50; // 50MB
    int flag=0,count=0;
    /**
     * Upon receiving file upload submission, parses the request to read
     * upload data and saves the file on disk.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
        }
    protected void doPost(HttpServletRequest request,
 HttpServletResponse response) throws ServletException, IOException {
      
    	try{
    	HttpSession ses=request.getSession();
      UPLOAD_DIRECTORY=(String) ses.getAttribute("ses_customer_id");
        // checks if the request actually contains upload file
        if (!ServletFileUpload.isMultipartContent(request)) {
            // if not, we stop here
            PrintWriter writer = response.getWriter();
            writer.println("Error: Form must have enctype=multipart/form-data.");
            writer.flush();
            return;
        }

        // configures upload settings
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // sets memory threshold - beyond which files are stored in disk
        factory.setSizeThreshold(MEMORY_THRESHOLD);
        // sets temporary location to store files
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        ServletFileUpload upload = new ServletFileUpload(factory);
         
        // sets maximum size of upload file
        upload.setFileSizeMax(MAX_FILE_SIZE);
         
        // sets maximum size of request (include file + form data)
        upload.setSizeMax(MAX_REQUEST_SIZE);

        // constructs the directory path to store upload file
        // this path is relative to application's directory
        
        /*String uploadPath = getServletContext().getRealPath("")
                + File.separator + UPLOAD_DIRECTORY;*/
        String uploadPath = "D:"
        + File.separator + "project" + File.separator + UPLOAD_DIRECTORY;
        //System.out.println(uploadPath);
        
        // creates the directory if it does not exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        ClaimBean cb=new ClaimBean();
        try {
            // parses the request's content to extract file data
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            
            if (formItems != null && formItems.size() > 0) {
                // iterates over form's fields
                
                cb.setCustomer_id(ses.getAttribute("ses_customer_id").toString());
                for (FileItem item : formItems) {
                    // processes only fields that are not form fields
                    if (!item.isFormField()) {
                        String fileName = new File(item.getName()).getName();
                        if(count==0){
                        	cb.setFile1(fileName);
                        	count++;
                        }
                        if(count==1){
                        	cb.setFile2(fileName);
                        }
                        String filePath = uploadPath + File.separator + fileName;
                        File storeFile = new File(filePath);

                        // saves the file on disk
                        item.write(storeFile);
                        request.setAttribute("message",
                            "Upload has been done successfully!");
                        flag=1;
                    }
                    else
                    {
                                
                                String fieldname=item.getFieldName();
                                String fieldvalue = item.getString();
                                 if(fieldname.equals("policy_id"))
                                {
                                                cb.setPolicy_id(Long.parseLong(fieldvalue));
                                }
                                 if(fieldname.equals("claim_type"))
                                {
                                                cb.setClaim_type(fieldvalue);
                                }
                                if(fieldname.equals("claim_amount"))
                                {
                                                cb.setClaim_amount(Double.parseDouble((fieldvalue)));
                                }
                    }
                }
            }
            
        } catch (Exception ex) {
            request.setAttribute("message",
                    "There was an error: " + ex.getMessage());
        }
        // redirects client to message page
        
        UploadBO up=new UploadBO();
        boolean success=up.uploadClaim(cb,flag);
        if(success)
        {
        	LOGGER.info("Claim has been successfully registered. \n");
        	if(ses.getAttribute("type").equals("user")){
        	RequestDispatcher dispatch = request.getRequestDispatcher("message.jsp");
        		request.setAttribute("mess", "Claim has been successfully registered");
        		dispatch.forward(request, response);
        }
        	else{
        		RequestDispatcher dispatch = request.getRequestDispatcher("nomineemessage.jsp");
        		request.setAttribute("mess", "Claim has been successfully registered");
        		dispatch.forward(request, response);
        		}
        }
        else{
        	if(ses.getAttribute("type").equals("user")){
        		LOGGER.error("Claim registration failed. \n");
            	RequestDispatcher dispatch = request.getRequestDispatcher("message.jsp");
            	request.setAttribute("mess", "Claim registration failed");
            	dispatch.forward(request, response);
        	
        }
       
    	else{
    		LOGGER.error("Claim registration failed. \n");
    		RequestDispatcher dispatch = request.getRequestDispatcher("nomineemessage.jsp");
    		request.setAttribute("mess", "Claim registration failed");
    		dispatch.forward(request, response);
        
    }}
}catch(Exception e)
{
	RequestDispatcher disp = request.getRequestDispatcher("mainerror.jsp");
	//request.setAttribute("policy", usermap);
	disp.forward(request, response);
}

}}

