package com.ours.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.ours.beans.AdminBean;
import com.ours.beans.UserBean;
import com.ours.controller.Login;
import com.ours.dao.DAO;
import com.ours.dao.QueryInterface;

public class LoginBO implements QueryInterface {
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public UserBean loginUser(UserBean ub) {
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(userLogin);
			ps.setLong(1, ub.getCustomer_id());
			ps.setString(2, ub.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ub.setFirst_name(rs.getString("first_name"));
				ub.setLast_name(rs.getString("last_name"));
				ub.setPassword(rs.getString("password"));
				ub.setCustomer_id(rs.getLong("customer_id"));
				ub.setEmail(rs.getString("email"));
                ub.setContact_no(rs.getLong("contact_no"));
                ub.setUser_name(rs.getString("user_name"));
                ub.setInsured_type(rs.getString("insured_type"));
				
			}
			DAO.closeConnection();
		} catch (SQLException e) {
			LOGGER.error("SQL Exception in LoginBO.loginUser :" + e);
		}
		return ub;

	}

	public boolean loginAdmin(AdminBean ab) {
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement(adminLogin);
			ps.setString(1, ab.getAdmin_name());
			ps.setString(2, ab.getPassword());
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return true;
			}
			DAO.closeConnection();
		} catch (SQLException e) {
			LOGGER.error("SQL Exception in LoginBO.loginAdmin :" + e);
		}
		return false;
	}
}
