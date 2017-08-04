package com.cognizant.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
//import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.cognizant.beans.PolicyBean;
import com.cognizant.controller.Login;
import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;

public class ApproveBO implements QueryInterface {
	
	static final Logger LOGGER = Logger.getLogger(Login.class);
public boolean approvePolicy(PolicyBean p)
{
	Connection con=DAO.getConnection();
    try {
          PreparedStatement ps=con.prepareStatement(approve);
          ps.setLong(1, p.getPolicy_id());
          int suc=ps.executeUpdate();
          if(suc>0)
        	  return true;
		DAO.closeConnection();
    }
    catch (SQLException e) {
        LOGGER.error("SQL Exception in ApproveBO.approvePolicy :"+e);
        return false;
  }
	return false;
}
}
