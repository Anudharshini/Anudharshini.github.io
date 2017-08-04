package com.cognizant.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Random;

import org.apache.log4j.Logger;

import com.cognizant.beans.UserBean;
import com.cognizant.controller.Login;
import com.cognizant.dao.DAO;
import com.cognizant.dao.QueryInterface;

public class RegistrationBO implements QueryInterface{
	static final Logger LOGGER = Logger.getLogger(Login.class);
	StringBuffer id=new StringBuffer();
	public long generateCustomerId()
	{
		
		Calendar cal=Calendar.getInstance();
		id.append(cal.get(Calendar.YEAR)).toString();
		int mon=((cal.get(Calendar.MONTH))+1);
		if(mon<10)
			{
			id.append("0").append(mon);
			}
		else
			{
			id.append(mon);
			}
		Random r=new Random();
		int random=r.nextInt(10000);
		if(random>=1000){
			String s=String.valueOf(random);
			id.append(s);
		} 
		else
		{
			generateCustomerId();
		}
		String s=id.toString();
	//	System.out.println(s);
		return Long.parseLong(s);
		
	}
	
	public boolean registerUser(UserBean ub)
	{
		ub.setCustomer_id(generateCustomerId());
		//System.out.println(ub.getCustomer_id());
		Connection con=DAO.getConnection();
		try {
			PreparedStatement ps=con.prepareStatement(userRegister);
			ps.setString(1,ub.getFirst_name());
			ps.setString(2, ub.getLast_name());
			ps.setString(3, ub.getUser_name());
			ps.setString(4, ub.getPassword());
			ps.setString(5, ub.getAddress());
			ps.setString(6, ub.getCity());
			ps.setString(7, ub.getState());
			ps.setString(8, ub.getCountry());
			ps.setLong(9, ub.getPincode());
			ps.setString(10, ub.getEmail());
			ps.setString(11, ub.getGender());
			ps.setLong(12, ub.getContact_no());
			ps.setString(13, ub.getDate_of_birth());
			ps.setInt(14, ub.getAge());
			ps.setString(15, ub.getInsured_type());
			ps.setLong(16, ub.getCustomer_id());
			ps.setString(17, ub.getNominee_name());
			ps.setString(18, ub.getNominee_contact_no());
			ps.setString(19, ub.getNominee_address());
			int suc=ps.executeUpdate();
			
			DAO.closeConnection();
			if(suc>0){
				return true;
			}else{
				return false;
			}
			
		} catch (SQLException e) {
			LOGGER.error("SQL Exception in RegistrationBO.registerUser :"+e);
			return false;
		}
		
		
	}
}
