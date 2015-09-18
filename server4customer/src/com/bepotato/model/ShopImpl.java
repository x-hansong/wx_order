package com.bepotato.model;

import java.sql.Connection;
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
