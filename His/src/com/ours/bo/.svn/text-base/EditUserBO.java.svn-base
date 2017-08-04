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

public class EditUserBO implements QueryInterface{
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public boolean EditUser(UserBean ub) {
		Connection con=DAO.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(EditUser);
			ps.setString(1, ub.getPassword());
			ps.setString(2, ub.getEmail());
			ps.setLong(3, ub.getContact_no());
			ps.setString(4, ub.getUser_name());
			ps.setString(5, String.valueOf(ub.getCustomer_id()));
			int suc=ps.executeUpdate();
			DAO.closeConnection();
			if(suc>0){
				return true;
			}else{
				return false;
			}
			
		}catch (SQLException e) {
			LOGGER.error("SQL Exception in EditUserBO.EditUser :"+e);
			return false;
		}

}
	
	public boolean EditUserpass(UserBean ub) {
		Connection con=DAO.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(EditUserpass);
			ps.setString(1, ub.getEmail());
			ps.setLong(2, ub.getContact_no());
			ps.setString(3, ub.getUser_name());
			ps.setString(4, String.valueOf(ub.getCustomer_id()));
			int suc=ps.executeUpdate();
			DAO.closeConnection();
			if(suc>0){
				return true;
			}else{
				return false;
			}
			
		}catch (SQLException e) {
			LOGGER.error("SQL Exception in EditUserBO.EditUserpass :"+e);
			return false;
		}

}

	public String GetPassword(String username) {
		String password=null;
		PreparedStatement ps;
		try {
			ps = DAO.getConnection().prepareStatement(getpass);
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			rs.next();
			
			password = rs.getString(1);
			//System.out.println(password);
			//if(status.equalsIgnoreCase("Pending"))
				
			
			return password;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
}
