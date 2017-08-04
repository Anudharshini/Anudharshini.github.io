package com.ours.bo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.log4j.Logger;

import com.ours.beans.PolicyBean;
import com.ours.controller.Login;
import com.ours.dao.DAO;
import com.ours.dao.QueryInterface;


public class EditPolicyBO implements QueryInterface {
	static final Logger LOGGER = Logger.getLogger(Login.class);
	public double generateDiscount(PolicyBean pb) {

		double discount;
		int premium_no = 0;
		double weightage_percentage = 0.00;
		String Discount_weightage = null;
		if (pb.getPremium_type().equals("Yearly")) {
			premium_no = 1;
		}
		if (pb.getPremium_type().equals("Half-yearly")) {
			premium_no = 2;
		}
		if (pb.getPremium_type().equals("Q")) {
			premium_no = 0;
		}
		switch (pb.getPolicy_duration()) {
		case 10:
		case 15:
			Discount_weightage = "W1";
			break;
		case 20:
			Discount_weightage = "W2";
			break;
		case 25:
			Discount_weightage = "W3";
			break;
		}
		if ((pb.getPremium_type().equals("Half-yearly"))
				&& (Discount_weightage.equals("W1"))) {
			weightage_percentage = 0.01;
		}
		if ((pb.getPremium_type().equals("Yearly"))
				&& (Discount_weightage.equals("W1"))) {
			weightage_percentage = 0.02;
		}
		if ((pb.getPremium_type().equals("Half-yearly"))
				&& (Discount_weightage.equals("W2"))) {
			weightage_percentage = 0.02;
		}
		if ((pb.getPremium_type().equals("Yearly"))
				&& (Discount_weightage.equals("W2"))) {
			weightage_percentage = 0.04;
		}
		if ((pb.getPremium_type().equals("Half-yearly"))
				&& (Discount_weightage.equals("W3"))) {
			weightage_percentage = 0.03;
		}
		if ((pb.getPremium_type().equals("Yearly"))
				&& (Discount_weightage.equals("W3"))) {
			weightage_percentage = 0.05;
		}
		discount = ((pb.getPolicy_amount() / pb.getPolicy_duration()) / premium_no)* weightage_percentage;
		return discount;

	}

	public double generatePremiumAmount(PolicyBean pb) {
		double Premium_amount = 0.00;
		Premium_amount = pb.getPolicy_amount() - pb.getDiscount();
		return Premium_amount;

	}

	public boolean EditPolicyDetails(PolicyBean pb) {

		pb.setDiscount(generateDiscount(pb));
		pb.setPremium_amount(generatePremiumAmount(pb));
		Connection con = DAO.getConnection();
		try {
			PreparedStatement ps1 = con.prepareStatement(EditPolicy);
			ps1.setString(1, pb.getInsurance_name());
			ps1.setLong(2, pb.getPolicy_amount());
			ps1.setInt(3, pb.getPolicy_duration());
			ps1.setDouble(4, pb.getDiscount());
			ps1.setDouble(5, pb.getPremium_amount());
			int success1 = ps1.executeUpdate();
			DAO.closeConnection();
			if (success1 > 0) {
				return true;
			} else {
				return false;
			}
			
		} catch (SQLException e) {
			LOGGER.error("SQL Exception in EditPolicyBO.EditPolicyDetails :"
							+ e);
			return false;
		}
	}

	public static int checkParams(String policy_id, String customer_id) {
		PreparedStatement ps;
		try {
			ps = DAO.getConnection().prepareStatement(checKParams);
			ps.setString(1, policy_id);
			ps.setString(2, customer_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
			String status = rs.getString(1);
			//System.out.println(status);
			if(status.equalsIgnoreCase("Pending"))
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