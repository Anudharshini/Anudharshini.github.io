package com.cognizant.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.cognizant.beans.UserBean;
import com.cognizant.controller.Login;
import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;

public class NomineeLoginBO implements QueryInterface{
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public boolean LoginNominee(UserBean ub) {
		
		Connection con = DAO.getConnection();
		try {
			
			PreparedStatement ps = con.prepareStatement(nomineeLogin);
			ps.setLong(1, ub.getCustomer_id());
			ps.setString(2, ub.getPassword());
			ps.setString(3, ub.getNominee_name());
			
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				/*ub.setPassword(rs.getString("password"));
				ub.setCustomer_id(rs.getLong("customer_id"));
                ub.setNominee_name(rs.getString("nominee_name"));*/
				return true;
			}
			DAO.closeConnection();
		} catch (SQLException e) {
			LOGGER.error("SQL Exception in NomineeLoginBO.loginNominee :" + e);
			return false;
		}
		/*return ub;*/
		return false;
		 
		
	}

	
	
	
}
