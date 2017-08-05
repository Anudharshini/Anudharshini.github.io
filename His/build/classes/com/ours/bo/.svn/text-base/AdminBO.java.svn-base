package com.cognizant.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.cognizant.beans.ClaimBean;
import com.cognizant.beans.PolicyBean;
import com.cognizant.controller.Login;
import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;
import org.apache.log4j.Logger;



public class AdminBO implements QueryInterface {
	static final Logger LOGGER = Logger.getLogger(Login.class);
	
	public Map<Integer, PolicyBean> checkPolicy(){
		
			int count=1;
			Map<Integer, PolicyBean> mymap = new HashMap<Integer,PolicyBean>();
			Connection con = DAO.getConnection();
			try {
				PreparedStatement ps = con.prepareStatement(policyCheck);
				ResultSet rs = ps.executeQuery();
				while(rs.next()){
					PolicyBean p = new PolicyBean();
					p.setPolicy_id(rs.getLong(1));
					p.setInsurance_name(rs.getString(2));
					p.setPolicy_duration(rs.getInt(3));
					p.setPremium_type(rs.getString(4));
					p.setPolicy_start_date(rs.getString(5));
					p.setDiscount(rs.getDouble(6));
					p.setPremium_amount(rs.getDouble(7));
					p.setMaturity_date(rs.getString(8));
					p.setPolicy_amount(rs.getLong(9));
					p.setCustomer_id(rs.getString(10));
					
					
					mymap.put(count, p);
					count++;
				}
				DAO.closeConnection();
			} catch (SQLException e) {
				LOGGER.error("SQLException in AdminBo.checkPolicy : "+e);
			}
			return mymap;
		
		
	}
	public Map<Integer, ClaimBean> viewClaim() {
        int count=1;
        Map<Integer, ClaimBean> cmap = new HashMap<Integer,ClaimBean>();
        Connection con = DAO.getConnection();
        try {
              PreparedStatement ps = con.prepareStatement(viewClaim);
              ResultSet rs = ps.executeQuery();
              while(rs.next()){
                    ClaimBean c = new ClaimBean();
                    c.setCustomer_id(rs.getString(1));
                    c.setPolicy_id(rs.getLong(2));
                    c.setClaim_type(rs.getString(3));
                    c.setClaim_amount(rs.getLong(4));
                    c.setUpload(rs.getString(5));
                    c.setStatus(rs.getString(6));
                    c.setFile1(rs.getString(7));
                    c.setFile2(rs.getString(8));
                    cmap.put(count, c);
                    count++;
              }
        
  }
        catch (SQLException e) {
        	LOGGER.error("SQLException in AdminBo.viewClaim : "+e);
        }
        return cmap;
}
	public Map<Integer, ClaimBean> viewApprovedClaim() {
		int count=1;
        Map<Integer, ClaimBean> cmap = new HashMap<Integer,ClaimBean>();
        
        Connection con = DAO.getConnection();
        try {
              PreparedStatement ps = con.prepareStatement(viewApprovedClaim);
              ResultSet rs = ps.executeQuery();
              while(rs.next()){
                    ClaimBean c = new ClaimBean();
                    c.setCustomer_id(rs.getString(1));
                    c.setPolicy_id(rs.getLong(2));
                    c.setClaim_type(rs.getString(3));
                    c.setClaim_amount(rs.getLong(4));
                    c.setStatus(rs.getString(6));
                   
                    cmap.put(count, c);
                    count++;
              }
       
  }
        catch (SQLException e) {
        	LOGGER.error("SQLException in AdminBo.viewApprovedClaim : "+e);
        }
        return cmap;
	}
	public Map<Integer, ClaimBean> viewRejectedClaim() {
		int count=1;
        Map<Integer, ClaimBean> cmap = new HashMap<Integer,ClaimBean>();
        Connection con = DAO.getConnection();
        try {
              PreparedStatement ps = con.prepareStatement(viewRejectedClaim);
              ResultSet rs = ps.executeQuery();
              while(rs.next()){
                    ClaimBean c = new ClaimBean();
                    c.setCustomer_id(rs.getString(1));
                    c.setPolicy_id(rs.getLong(2));
                    c.setClaim_type(rs.getString(3));
                    c.setClaim_amount(rs.getLong(4));
                    c.setStatus(rs.getString(6));
                   
                    cmap.put(count, c);
                    count++;
              }
        
  }
        catch (SQLException e) {
        	LOGGER.error("SQLException in AdminBo.viewRejectedClaim : "+e);
        }
        return cmap;
	}

}
