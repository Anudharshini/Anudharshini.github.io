package com.ours.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DAO implements Commons{

	public static Connection con=null;
	public static Connection getConnection(){
		try {
			if(con==null || con.isClosed()){
				
				DriverManager.registerDriver(new com.mysql.jdbc.Driver());
				con=DriverManager.getConnection(url,username,password);
							
			}
		} catch (SQLException e) {
			
			System.err.println("SQL Exception in DAO :"+e);
		}
		return con;
	}
	public static void closeConnection(){
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				
			}
		}
	}
}
