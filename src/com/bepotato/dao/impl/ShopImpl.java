package com.bepotato.dao.impl;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bepotato.dao.ShopDao;
import com.bepotato.entity.Shop;
import com.bepotato.util.DBUtil;

public class ShopImpl implements ShopDao{
	private QueryRunner runner;
	public ShopImpl() {
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
	}
	

	@Override
	public Shop getShop(int sid) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		String sql = "select * from shops where sid=?";
		ResultSetHandler<Shop> rsHandler = new BeanHandler<Shop>(Shop.class);
		Shop shop  = null;
		try {
			shop = runner.query(connection,sql, rsHandler,sid);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}finally{
			DBUtil.close(connection);
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

}
