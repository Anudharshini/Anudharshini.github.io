package com.ours.bo;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ours.dao.DAO;
import com.ours.dao.QueryInterface;

public class GetPolicyDetailBO implements QueryInterface {

	public static List<Integer> checkParams(String customer_id) {
		
		List<Integer> lt=new ArrayList<Integer>();
		PreparedStatement ps;
		try {
			ps = DAO.getConnection().prepareStatement(checkPolicy);
			//System.out.println(customer_id);
			ps.setString(1, customer_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			String status=rs.getString(1);
			int policy_id = Integer.parseInt(rs.getString(2));
			//System.out.println(policy_id);
			//System.out.println(status);
			if(status.equalsIgnoreCase("Pending"))
			{
				lt.add(policy_id);
			}}
			return lt;
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}

	public static List<Integer> checkclaimParams(String customer_id) {
		List<Integer> lt=new ArrayList<Integer>();
		PreparedStatement ps;
		//PreparedStatement ps1;
		String status=null;
		int policy_id=0;
		//String status1=null;
		//int policy_id1=0;
		try {
			ps = DAO.getConnection().prepareStatement(checkclaimPolicy);
			//ps1 = DAO.getConnection().prepareStatement(checkclaimed);
			//System.out.println(customer_id);
			ps.setString(1, customer_id);
			//ps1.setString(1, customer_id);
			//ResultSet rs1=ps1.executeQuery();
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			status=rs.getString(1);
			policy_id = Integer.parseInt(rs.getString(2));
			//System.out.println(policy_id);
			//System.out.println(status);
			
			//while(rs1.next())
		//	{
				//status1=rs1.getString(1);
				//policy_id1 = Integer.parseInt(rs1.getString(2));
			//}
			//if(/*policy_id1==policy_id && */!(status1.equalsIgnoreCase("Approved")))
			//{
				//System.out.println("1");
			if(status.equalsIgnoreCase("Approved"))
			{
				//System.out.println("2");
				lt.add(policy_id);
			}
			}
			
			return lt;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
}

	public static List<Integer> checkrenewParams(String customer_id) {
		List<Integer> lt=new ArrayList<Integer>();
		PreparedStatement ps;
	
		String status=null;
		int policy_id=0;
		
		try {
			ps = DAO.getConnection().prepareStatement(checkrenewpolicy);
			
			ps.setString(1, customer_id);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			status=rs.getString(1);
			policy_id = Integer.parseInt(rs.getString(2));
			
			if(status.equalsIgnoreCase("Approved"))
			{
			
				lt.add(policy_id);
			}
			}
			
			return lt;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
}
}
