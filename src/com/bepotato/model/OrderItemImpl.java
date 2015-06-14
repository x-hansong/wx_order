package com.bepotato.model;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;

import com.bepotato.dao.OrderItemDao;
import com.bepotato.util.DBHelper;

public class OrderItemImpl implements OrderItemDao{
	private QueryRunner runner;
	private Connection connection;
	public OrderItemImpl(){
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	@Override
	public OrderItem findById(int oid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addOrderItem(OrderItem item) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delOrderItem(OrderItem item) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modOrderItem(OrderItem item) {
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
