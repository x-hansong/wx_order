package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

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
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into orderitem(sid,oid,did,num) "
				+ "values(?,?,?,?)";

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, item.getSid());
			stmt.setInt(2, item.getOid());
			stmt.setInt(3, item.getDid());
			stmt.setInt(4, item.getNum());
			stmt.executeUpdate();
			System.out.println("保存orderitem成功");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("保存orderitem失败");
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
