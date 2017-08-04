package com.ours.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.apache.log4j.Logger;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.ours.beans.PolicyBean;
import com.ours.beans.UserBean;
import com.ours.controller.Login;
import com.ours.dao.DAO;
import com.ours.dao.QueryInterface;

public class PolicyBO implements QueryInterface {
	
	static final Logger LOGGER = Logger.getLogger(Login.class);
      //PolicyBean pb=new PolicyBean();
      UserBean ub=new UserBean();
      long random1=0;
      int premium_no=0;
      public long generatePolicyId()
      {
            Random r=new Random();
            int random=r.nextInt(10000);
            
            if(random>=1000){
                  random1=random;
            } 
            else
            	{
            	generatePolicyId();
            	}
            return random1;
            
      }
      public double generateDiscount(PolicyBean pb)
      {
            
            double discount;
            
            double weightage_percentage=0.00;
            String Discount_weightage=null;
            if(pb.getPremium_type().equals("Yearly"))
            {
                  premium_no=1;
            }
            if(pb.getPremium_type().equals("Half-yearly"))
            {
                  premium_no=2;
            }
            if(pb.getPremium_type().equals("Q"))
            {
                  premium_no=0;
            }
            switch(pb.getPolicy_duration())
            {
            case 10:
            case 15:Discount_weightage="W1";
                        break;
            case 20:Discount_weightage="W2";
                        break;
            case 25:Discount_weightage="W3";
                        break;
            }
            if((pb.getPremium_type().equals("Half-yearly"))&&(Discount_weightage.equals("W1")))
            {
                  weightage_percentage=0.01;
            }
            if((pb.getPremium_type().equals("Yearly"))&&(Discount_weightage.equals("W1")))
            {
                  weightage_percentage=0.02;
            }
            if((pb.getPremium_type().equals("Half-yearly"))&&(Discount_weightage.equals("W2")))
            {
                  weightage_percentage=0.02;
            }
            if((pb.getPremium_type().equals("Yearly"))&&(Discount_weightage.equals("W2")))
            {
                  weightage_percentage=0.04;
            }
            if((pb.getPremium_type().equals("Half-yearly"))&&(Discount_weightage.equals("W3")))
            {
                  weightage_percentage=0.03;
            }
            if((pb.getPremium_type().equals("Yearly"))&&(Discount_weightage.equals("W3")))
            {
                  weightage_percentage=0.05;
            }
            discount=((pb.getPolicy_amount()/pb.getPolicy_duration())/premium_no)*weightage_percentage;
            //System.out.println(discount);
            return discount;
            
      }
      public double generatePremiumAmount(PolicyBean pb)
      {
            double Premium_amount=0.00;
            Premium_amount=(pb.getPolicy_amount()-pb.getDiscount())/(pb.getPolicy_duration()*premium_no);
            DecimalFormat d=new DecimalFormat("#.00");
            String premium=d.format(Premium_amount);
            Premium_amount=Double.parseDouble(premium);
            //System.out.println(Premium_amount);
            return Premium_amount;
            
      }
      public String generateMaturityDate(PolicyBean pb)
      {
            DateFormat dt=new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal=Calendar.getInstance();
            Date md = null;
                  try {
                        md = dt.parse(pb.getPolicy_start_date());
                  } catch (ParseException e) {
                        // TODO Auto-generated catch block
                        e.printStackTrace();
                  }
            cal.setTime(md);
            cal.add(Calendar.YEAR, pb.getPolicy_duration());
            String Maturity_date=dt.format(cal.getTime());
            //System.out.println(Maturity_date);
            return Maturity_date;
            
      }

      public PolicyBean registerUser(PolicyBean pb)
      {
    	 // System.out.println("BO "+pb.getCustomer_id());
            pb.setPolicy_id(generatePolicyId());
            pb.setDiscount(generateDiscount(pb));
            pb.setPremium_amount(generatePremiumAmount(pb));
            pb.setMaturity_date(generateMaturityDate(pb));
            Connection con=DAO.getConnection();
            try {
                  PreparedStatement ps=con.prepareStatement(PolicyRegister);
                  ps.setLong(1, pb.getPolicy_id());
                  ps.setString(2,pb.getInsurance_name());
                  ps.setInt(3,pb.getPolicy_duration());
                  ps.setString(4,pb.getPremium_type());
                  ps.setString(5,pb.getPolicy_start_date());
                  ps.setDouble(6,pb.getDiscount());
                  ps.setDouble(7,pb.getPremium_amount());
                  ps.setString(8,pb.getMaturity_date());
                  ps.setLong(9,pb.getPolicy_amount());
                  ps.setString(10,pb.getCustomer_id());
                  ps.setString(11, pb.getStatus());
                 // System.out.println(ps);
                  int success1=ps.executeUpdate();
                  DAO.closeConnection();
                  if(success1>0)
                  {
                  return pb;
                  }
            else
            {
                  return null;
            }

            
      }catch (SQLException e) {
            LOGGER.error("SQL Exception in PolicyBO.registerUser :"+e);
            return null;
      }
      

}
      public Map<Integer, PolicyBean> checkStatus(PolicyBean p)
      {
    	  int count=1;
			Map<Integer, PolicyBean> mymap = new HashMap<Integer,PolicyBean>();
			Connection con = DAO.getConnection();
			try {
				PreparedStatement ps = con.prepareStatement(check);
				ps.setString(1, p.getCustomer_id());
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					PolicyBean pb = new PolicyBean();
					pb.setPolicy_id(rs.getLong(1));
					pb.setInsurance_name(rs.getString(2));
					pb.setPolicy_duration(rs.getInt(3));
					pb.setPremium_type(rs.getString(4));
					pb.setPolicy_start_date(rs.getString(5));
					pb.setDiscount(rs.getDouble(6));
					pb.setPremium_amount(rs.getDouble(7));
					pb.setMaturity_date(rs.getString(8));
					pb.setPolicy_amount(rs.getLong(9));
					pb.setStatus(rs.getString(10));
					
					
					mymap.put(count, pb);
					count++;
				}
				DAO.closeConnection();
			} catch (SQLException e) {
				LOGGER.error("SQLException in AdminBo.checkPolicy : "+e);
			}
		return mymap;
    	  
      }
      
      public boolean renewPolicy(PolicyBean p){
          Connection con = DAO.getConnection();
          
                    try {
                          PreparedStatement ps = con.prepareStatement(renewCheck);
                          ps.setLong(1, p.getPolicy_id());
                          ResultSet rs = ps.executeQuery();
                          while(rs.next()){
                                if(rs.getString(1).equals("Approved")){
                                      SimpleDateFormat dt=new SimpleDateFormat("yyyy-MM-dd");
                                      Calendar cal=Calendar.getInstance();
                                      try {
                                            long current=cal.getTimeInMillis();
                                            Date md=dt.parse(rs.getString(2));
                                            cal.setTime(md);
                                          
                                            long mat=cal.getTimeInMillis();
                                            long dif=(mat-current)/(1000*60*60*24);
                                            if(dif<15){
                                                  p.setPolicy_duration(rs.getInt(3));
                                                  p.setPolicy_start_date(dt.format(cal.getTime()).toString());
                                                 
                                                  PreparedStatement ps2 = con.prepareStatement(renewedPolicy);
                                                  ps2.setString(1,p.getPolicy_start_date());
                                                  ps2.setString(2, generateMaturityDate(p));     
                                                  ps2.setLong(3, p.getPolicy_id());
                                                  ps2.executeUpdate();
                                                  return true;
                                            }
                                            else{
                                                  return false;
                                            }
                                      } catch (ParseException e) {
                                            
                                            e.printStackTrace();
                                            return false;
                                      }
                                            
                                      
                                }else{
                                      return false;
                                }
                                
                          }
                    } catch (SQLException e) {
                          LOGGER.error("SQLException in PolicyBo.renewPolicy : "+e);
                    }
              return false;
          
        }
      public boolean createPdf(PolicyBean pb, String name) {
          try {
                String uploadPath="D:\\project\\"+pb.getCustomer_id()+"\\";
                File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            //System.out.println(pb.getPolicy_id());
            OutputStream file = new FileOutputStream(new File(uploadPath+pb.getPolicy_id()+".pdf"));
              Document document = new Document();
              PdfWriter.getInstance(document, file);
              Long policy=pb.getPolicy_id();
              String policyamount=pb.getCustomer_id();
              String maturity=pb.getMaturity_date();
              String policyno=policy.toString();
            
              
            Font font1 = new Font(Font.FontFamily.HELVETICA, 15  , Font.BOLD);
            
          String path=System.getProperty("user.dir");
        // System.out.println(path);     
                //Inserting Image in PDF
         
          Image image1 = Image.getInstance("http://pc186416:8084/HealthInsuranceSystem/img/Cognizant_logo1.png");
              image1.scaleAbsolute(90f, 50f);
                      Paragraph title = new Paragraph("POLICY REPORT",font1); 
                      title.setAlignment(Element.ALIGN_CENTER);
                Paragraph terms = new Paragraph("TERMS AND TERMINATION OF POLICY COVERAGE",font1); 
                terms.setAlignment(Element.ALIGN_CENTER);
              
                Double premium_amt=pb.getPremium_amount();      
                Long policy_ID=pb.getPolicy_id();   
                Long policy_amt=pb.getPolicy_amount();
                Integer policy_duration=pb.getPolicy_duration();
                
                 PdfPTable table = new PdfPTable(2); 
                
                table.getDefaultCell().setBorder(Rectangle.NO_BORDER);
                table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
                table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
                 
                 
                PdfPCell cell1 = new PdfPCell(new Paragraph("Policy number"));
                PdfPCell cell2 = new PdfPCell(new Paragraph(policy_ID.toString()));
                PdfPCell cell3 = new PdfPCell(new Paragraph("Policy holder"));
                PdfPCell cell4 = new PdfPCell(new Paragraph(name));
                PdfPCell cell5 = new PdfPCell(new Paragraph("Insurance type"));
                PdfPCell cell6 = new PdfPCell(new Paragraph(pb.getInsurance_name()));
                PdfPCell cell7 = new PdfPCell(new Paragraph("Policy start date"));
                PdfPCell cell8 = new PdfPCell(new Paragraph(pb.getPolicy_start_date()));
                PdfPCell cell9 = new PdfPCell(new Paragraph("Policy amount"));
                PdfPCell cell10 = new PdfPCell(new Paragraph(policy_amt.toString()));
                PdfPCell cell11 = new PdfPCell(new Paragraph("Policy duration"));
                PdfPCell cell12 = new PdfPCell(new Paragraph(policy_duration.toString()));
                PdfPCell cell13 = new PdfPCell(new Paragraph("Premium type"));
                PdfPCell cell14 = new PdfPCell(new Paragraph(pb.getPremium_type()));
                PdfPCell cell15 = new PdfPCell(new Paragraph("Premium amount"));
                PdfPCell cell16 = new PdfPCell(new Paragraph(premium_amt.toString()));
                PdfPCell cell17 = new PdfPCell(new Paragraph("Policy maturity date"));
                PdfPCell cell18 = new PdfPCell(new Paragraph(pb.getMaturity_date()));
                table.addCell(cell1);
                table.addCell(cell2);
                table.addCell(cell3);
                table.addCell(cell4);
                table.addCell(cell5);
                table.addCell(cell6);
                table.addCell(cell7);
                table.addCell(cell8);
                table.addCell(cell9);
                table.addCell(cell10);
                table.addCell(cell11);
                table.addCell(cell12);
                table.addCell(cell13);
                table.addCell(cell14);
                table.addCell(cell15);
                table.addCell(cell16);
                table.addCell(cell17);
                table.addCell(cell18);
         

                   document.open();//PDF document opened........                         

                            /*document.add(image);*/
                      document.add(image1);
                            document.add(Chunk.NEWLINE);   //Something like in HTML :-)
                            
                  document.add(title);
                  document.add(Chunk.NEWLINE);
                  document.add(table);
                  document.add(Chunk.NEWLINE);
                  document.add(Chunk.NEWLINE);
                  document.add(Chunk.NEWLINE);
                  document.add(new Paragraph(terms));
                  document.add(Chunk.NEWLINE);
                  document.add(new Paragraph("The term of your policy coverage is from "+pb.getPolicy_start_date()+" to "+pb.getMaturity_date()+ "."));
                  document.add(new Paragraph("Coverage will terminate on the earliest of the following events: (a) failure to pay premium within the grace period; (b) you are eligible to be covered unless coverage is suspended pursuant to the terms of this policy"));
                  document.add(Chunk.NEWLINE);
                  document.add(Chunk.NEWLINE);
                 
                  document.add(Chunk.NEWLINE);
                  document.add(new Paragraph("For Further Details Contact Us Through"));
                  document.add(Chunk.NEWLINE);
                  document.add(new Paragraph("Email : customerservice@teamthree.com")); 
                  document.add(new Paragraph("Phone : +91-124-4584333"));
                  document.add(new Paragraph("Fax   : +91-124-4584111"));
                  document.add(new Paragraph("Support Toll Free : 1800-102-0333"));
                  document.add(Chunk.NEWLINE);
                  document.add(Chunk.NEWLINE);
                  document.add(new Paragraph("**This is an auto-generated report.Please download for future reference.**"));
                  document.add(Chunk.NEWLINE);
                  document.add(Chunk.NEWLINE);
                 
                  document.add(Chunk.NEWLINE);
                  document.add(new Paragraph("Copyright © Team3 Project 2016. All Rights Reserved"));
                   document.close();

                             file.close();

       //   System.out.println("Pdf created successfully..");
          return true;

      } catch (Exception e) {
          e.printStackTrace();
      }
          return false;
    }
  }

