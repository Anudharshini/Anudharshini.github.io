package com.cognizant.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.cognizant.beans.ClaimBean;
import com.cognizant.controller.Login;

import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;

public class UploadBO implements QueryInterface{
	static final Logger LOGGER = Logger.getLogger(Login.class);
      public boolean uploadClaim(ClaimBean cb,int flag) {
            Connection con=DAO.getConnection();
            try {
                  PreparedStatement ps=con.prepareStatement(uploadClaim);
                  ps.setString(1, cb.getCustomer_id());
                  ps.setLong(2, cb.getPolicy_id());
                  ps.setString(3,cb.getClaim_type());
                  ps.setDouble(4,cb.getClaim_amount());
                  if(flag==1)
                  {
                        ps.setString(5,"yes");
                  }
                  else
                  {
                        ps.setString(5, "no");
                  }
                  ps.setString(6, "Pending");
                  ps.setString(7,cb.getFile1());
                  ps.setString(8,cb.getFile2());
                  int success1=ps.executeUpdate();
            DAO.closeConnection();
            if(success1>0)
                  {
                        return true;
                  }
            else
            {
                  return false;
            }
            }
            catch (SQLException e) {
           LOGGER.error("SQL Exception in UploadBO.uploadClaim :"+e);
            return false;
      }
                  
}
}
