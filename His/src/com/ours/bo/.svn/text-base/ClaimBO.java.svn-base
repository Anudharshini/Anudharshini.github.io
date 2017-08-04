package com.cognizant.bo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

//import com.cognizant.beans.ClaimBean;
import com.cognizant.beans.ClaimBean;
import com.cognizant.beans.PolicyBean;
import com.cognizant.controller.Login;
import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;


public class ClaimBO implements QueryInterface {
	static final Logger LOGGER = Logger.getLogger(Login.class);
      /*public double claimAmount(double bonus)
      {
            double claimAmt = 0;
            claimAmt=+bonus;                 
            
            
            return claimAmt;
            
      }*/
      public boolean calculateBonus(PolicyBean pb)
      {
            Connection con=DAO.getConnection();
            int no_of_years,curyear,startyear;
            double bonus = 0,claim_amt = 0,amount=0;
            String claim_type = null;
        try {
              PreparedStatement ps=con.prepareStatement(retrieve);
              ps.setLong(1, pb.getPolicy_id());
              ResultSet rs=ps.executeQuery();
              while(rs.next())
              {
                    pb.setPolicy_start_date(rs.getString(1));
                    pb.setPolicy_amount(rs.getLong(2));
                    pb.setStatus(rs.getString(3));
                    pb.setInsurance_name(rs.getString(4));
              }
              Calendar cal=Calendar.getInstance();
              curyear=cal.get(Calendar.YEAR);
              DateFormat dt=new SimpleDateFormat("yyyy-MM-dd");
              
              Date md = null;
                    try {
                          md = dt.parse(pb.getPolicy_start_date());
                    } catch (ParseException e) {
                          // TODO Auto-generated catch block
                          e.printStackTrace();
                    }
              cal.setTime(md);
              startyear=cal.get(Calendar.YEAR);
              no_of_years=curyear-startyear;
              PreparedStatement ps1=con.prepareStatement(claimtype);
              ps1.setLong(1,pb.getPolicy_id() );
              ResultSet rs1=ps.executeQuery();
              if(rs1.next())
              {
            	  claim_type=rs1.getString(1);
              }
              if(claim_type.equals("Physical Condition"))
              {
            	  amount=pb.getPolicy_amount();
              }
              else
              {
            	  amount=pb.getPolicy_amount()*2;
              }
              bonus=no_of_years*( amount* 0.01);
              claim_amt=amount+bonus;
              DAO.closeConnection();
        }
        catch (SQLException e) {
            LOGGER.error("SQL Exception in ClaimBO.calculateBonus :"+e);
           
            
            
      }
        boolean result=checkClaim(claim_amt,pb);
        return result;
}

      /*private boolean checkClaim(double claim_amt, PolicyBean pb ) {

            double enter_claim = 0;
            String upload_status = null,enter_type=null;
            if(pb.getStatus().equals("Approved"))
            {
                  Connection con=DAO.getConnection();
                  try {
                              PreparedStatement ps=con.prepareStatement(calculateClaim);
                              ps.setLong(1, pb.getPolicy_id());
                              ResultSet rs=ps.executeQuery();
                              if(rs.next())
                              {
                                    enter_claim=rs.getDouble(1);
                                    upload_status=rs.getString(2);
                                    enter_type=rs.getString(3);
                              }
                              if(enter_claim<=claim_amt&&upload_status.equals("yes")&&enter_type.equalsIgnoreCase(pb.getInsurance_name()))
                              {
                            	  	PreparedStatement ps1=con.prepareStatement(approveClaim);
                            	  	ps1.setLong(1, pb.getPolicy_id());
                            	  	ps1.executeUpdate();
                                    return true;
                              }
                              else
                              {
                            	  PreparedStatement ps1=con.prepareStatement(rejectedClaim);
                          	  		ps1.setLong(1, pb.getPolicy_id());
                          	  		ps1.executeUpdate();
                                    return false;
                              }
                        }
                  catch (SQLException e) {
                        System.err.println("SQL Exception in ClaimBO.calculateBonus :"+e);
                        return false;
            }
            }
            else
            {
                  return false;
            }
            
}*/private boolean checkClaim(double claim_amt, PolicyBean pb ) {

    double enter_claim = 0;
    String upload_status = null,enter_type=null;
   // System.out.println("Claim amount"+claim_amt);
    String reason="";
    int flag=1;
    if(pb.getStatus().equals("Approved"))
    {
          Connection con=DAO.getConnection();
          try {
                      PreparedStatement ps=con.prepareStatement(calculateClaim);
                      ps.setLong(1, pb.getPolicy_id());
                      ResultSet rs=ps.executeQuery();
                      if(rs.next())
                      {
                            enter_claim=rs.getDouble(1);
                            upload_status=rs.getString(2);
                            enter_type=rs.getString(3);
                            /*System.out.println("upload status"+upload_status);
                            System.out.println("Ins type"+pb.getInsurance_name());*/
                           /* System.out.println(enter_type);
                            System.out.println(enter_claim);*/
                      }
                      /*if(enter_claim<=claim_amt&&upload_status.equals("yes")&&enter_type.equalsIgnoreCase(pb.getInsurance_name()))
                      {
                        System.out.println("Inside if");
                            PreparedStatement ps1=con.prepareStatement(approveClaim);
                            ps1.setLong(1, pb.getPolicy_id());
                            ps1.executeUpdate();
                            return true;
                      }*/
                      		//System.out.println(pb.getInsurance_name());
                       
                              if(enter_type.equalsIgnoreCase(pb.getInsurance_name()))
                            {
                            
                                  
                                    flag++;
                                    
                            }
                              else{ flag=0;
                                        reason="Insured type mismatch. ";
                              }
                              if(upload_status.equals("yes")){
                                    flag++;
                        }
                        else{ flag=0;
                              reason=reason.concat("Required Document Not uploaded");
                        }
                              if(enter_claim<=claim_amt){
                                    flag++;
                      }
                      else
                      { flag=0;
                        reason=reason.concat("Claimed amt exceeded.");
                      }
                              if(flag==4){
                                    reason="N/A";
                                    PreparedStatement ps1=con.prepareStatement(approveClaim);
                                    ps1.setString(1, reason);
                                    ps1.setLong(2, pb.getPolicy_id());
                                    ps1.executeUpdate();
       
                                    
                                    return true;
                              }
                              else{
                        PreparedStatement ps1=con.prepareStatement(rejectedClaim);
                        ps1.setString(1, reason);
                        ps1.setLong(2, pb.getPolicy_id());
                                  ps1.executeUpdate();
                            return false;
                      }
                             
                }
          catch (SQLException e) {
                LOGGER.error("SQL Exception in ClaimBO.calculateBonus :"+e);
                return false;
    }
    }
    else
    {
          return false;
    }
    
}



	public Map<Integer, ClaimBean> checkClaimStatus(ClaimBean cb) {
		
		int count=1;
		Map<Integer, ClaimBean> mymap = new HashMap<Integer,ClaimBean>();
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(claimcheck);
			ps.setString(1, cb.getCustomer_id());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				ClaimBean c = new ClaimBean();
				c.setPolicy_id(rs.getLong(1));
				c.setClaim_type(rs.getString(2));
				c.setClaim_amount(rs.getDouble(3));
				c.setStatus(rs.getString(4));
				c.setReason(rs.getString(5));	
				mymap.put(count, c);
				count++;
			}
			DAO.closeConnection();
		} catch (SQLException e) {
			LOGGER.error("SQLException in ClaimBo.checkClaimStatus : "+e);
		}
	return mymap;
		
		
	}
}
