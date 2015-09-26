package com.bepotato.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnection {
	public DBConnection(){
		driver="com.mysql.jdbc.Driver";
		url="jdbc:mysql://localhost:3306/wx_db?useUnicode=true&characterEncoding=utf8";
		dbusername="root";
		dbpassword="";
		this.getConection();
	}
	
	private String driver;
	private String url;
	private String dbusername;
	private String dbpassword;
	private Connection con;
	private Statement sta;
	private ResultSet rs;
	
	/*
	 * 得到Connection对象。
	 */
	public Connection getConection(){
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url,dbusername,dbpassword);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	
	/*
	 * 得到Statement对象
	 */
	public Statement getStatement(){
		try {
			sta=con.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return sta;
	}
}
