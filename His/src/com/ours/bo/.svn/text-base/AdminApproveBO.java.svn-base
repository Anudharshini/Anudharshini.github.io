package com.cognizant.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;

import com.cognizant.beans.PolicyBean;
import com.cognizant.controller.Login;
import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;

public class AdminApproveBO implements QueryInterface {
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public Map<Integer, PolicyBean> approvePolicy(){
		
		int count=1;
		Map<Integer, PolicyBean> mymap = new HashMap<Integer,PolicyBean>();
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(approvedPolicy);
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
				p.setStatus(rs.getString(11));
				
				mymap.put(count, p);
				count++;
			}
			DAO.closeConnection();
		} catch (SQLException e) {
			LOGGER.error("SQLException in AdminApproveBo.approvePolicy : "+e);
		}
		return mymap;
	
	
}
}
	

