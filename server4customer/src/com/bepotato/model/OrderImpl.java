package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

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
	
	public List<Order> findOrdersByUid(int uid) {
		String sql = "select * from orders where uid = ? order by oid DESC";
		ResultSetHandler<List<Order>> rsHandler = new BeanListHandler<Order>(Order.class);
		List<Order> orders  = null;
		try {
			orders = runner.query(connection,sql, rsHandler,uid);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		return orders;
	}

	public List<OrderItem> getOrderItem(int oid){
		String sql = "select * from orderitem where oid =?";
		ResultSetHandler<List<OrderItem>> rSetHandler = new BeanListHandler<OrderItem>(OrderItem.class);
		List<OrderItem> items = null;
		try {
			items = runner.query(connection,sql, rSetHandler,oid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return items;
	}

	
	@Override
	public boolean addOrder(Order order) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into orders(oid,sid,uid,time,location,price,state,pay,men,discount,remark) "
				+ "values(?,?,?,?,?,?,?,?,0,1,'0')";

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, order.getOid());
			stmt.setInt(2, order.getSid());
			stmt.setInt(3, order.getUid());
			stmt.setTimestamp(4, order.getTime());
			stmt.setString(5, order.getLocation());
			stmt.setFloat(6, (float)order.getPrice());
			stmt.setInt(7, order.getState());
			stmt.setInt(8, order.getPay());
			stmt.executeUpdate();
			System.out.println("保存order成功");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("保存order失败");
			return false;
		}finally {
			// 释放语句对象
			if (stmt != null) {
				try {
					stmt.close();
					stmt = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
					conn = null;
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}

	@Override
	public boolean delOrder(int oid) {
		// TODO Auto-generated method stub
		String sql="DELETE FROM orders WHERE oid=?";
		try {
			PreparedStatement preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, oid);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean modOrder(Order order) {
		// TODO Auto-generated method stub
		PreparedStatement preparedStatement=null;
		String sql="update orders set state=? where oid=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, order.getSid());
			preparedStatement.setInt(2, order.getOid());
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
