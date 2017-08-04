package com.ours.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.ours.beans.PolicyBean;
import com.ours.controller.Login;
import com.ours.dao.DAO;
import com.ours.dao.QueryInterface;

public class RejectBO implements QueryInterface{
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public boolean rejectPolicy(PolicyBean p)
	{
		Connection con=DAO.getConnection();
	    try {
	          PreparedStatement ps=con.prepareStatement(reject);
	          ps.setLong(1, p.getPolicy_id());
	          int suc=ps.executeUpdate();
	          if(suc>0)
	        	  return true;
			DAO.closeConnection();
	    }
	    catch (SQLException e) {
	        LOGGER.error("SQL Exception in RejectBO.rejectPolicy :"+e);
	        return false;
	  }
		return false;
	}
}
