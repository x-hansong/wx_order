package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bepotato.dao.ShopDao;
import com.bepotato.util.DBHelper;

public class ShopImpl implements ShopDao{
	private QueryRunner runner;
	private Connection connection;
	public ShopImpl() {
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	

	@Override
	public Shop findById(int sid) {
		// TODO Auto-generated method stub
		
		String sql = "select * from shops where sid=?";
		ResultSetHandler<Shop> rsHandler = new BeanHandler<Shop>(Shop.class);
		Shop shop  = null;
		try {
			shop = runner.query(connection,sql, rsHandler,sid);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		return shop;
	}

	@Override
	public boolean addShop(Shop shop) {
		// TODO Auto-generated method stub
		if(shop!=null){
			String sql="UPDATE `wx_db`.`shops` SET `name` = ? ,`phone` = ? ,`location` = ? ,`remark` = ? WHERE `sid` = ?";
			PreparedStatement pStatement=null;
			try{
				pStatement=connection.prepareStatement(sql);
				pStatement.execute("set Names utf8");
				pStatement.setString(1, shop.getName());
				pStatement.setString(2, shop.getPhone());
				pStatement.setString(3, shop.getLocation());
				pStatement.setString(4, shop.getRemark());
				pStatement.setInt(5, shop.getSid());
				pStatement.executeUpdate();
				System.out.println(sql);
			}
			catch(Exception e){
				e.printStackTrace();
			}
			return true;
		}
		else
			return false;
	}

	@Override
	public boolean modifyShop(Shop shop) {
		// TODO Auto-generated method stub
		return false;
	}
	
	public void closeConnection() {
		try {
			DbUtils.close(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}



}
