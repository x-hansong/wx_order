package com.bepotato.model;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bepotato.dao.OrderDao;
import com.bepotato.util.DBHelper;

public class OrderImpl implements OrderDao{
	private QueryRunner runner;
	private Connection connection;
	public OrderImpl(){
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	@Override
	public Order findById(int oid) {
		// TODO Auto-generated method stub
		String sql = "select * from orders where oid = ?";
		ResultSetHandler<Order> rsHandler = new BeanHandler<Order>(Order.class);
		Order order  = null;
		try {
			order = runner.query(connection,sql, rsHandler,oid);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public boolean addOrder(Order order) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delOrder(int oid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modOrder(Order order) {
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
