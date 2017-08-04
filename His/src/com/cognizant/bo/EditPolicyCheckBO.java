package com.cognizant.bo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;

public class EditPolicyCheckBO implements QueryInterface {

	public static int checkpolicy(String customer_id) {
		
		
		PreparedStatement ps;
		try {
			ps = DAO.getConnection().prepareStatement(checkpolicy);
			ps.setString(1, customer_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			
				return 1;
			}
			DAO.closeConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			return 0;
		}

		return 0;
	}
}
		
		

