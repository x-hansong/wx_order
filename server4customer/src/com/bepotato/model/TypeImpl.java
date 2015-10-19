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

import com.bepotato.dao.TypeDao;
import com.bepotato.util.DBHelper;

public class TypeImpl implements TypeDao{
	private QueryRunner runner;
	private Connection connection;
	private String sql;
	private PreparedStatement preparedStatement;
	public TypeImpl(){
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	
	@Override
	public Type findById(int tid) {
		// TODO Auto-generated method stub
		sql = "select * from types where tid = ?";
		ResultSetHandler<Type> rsHandler = new BeanHandler<Type>(Type.class);
		Type type  = null;
		try {
			type = runner.query(connection,sql, rsHandler,tid);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		return type;
	}

	@Override
	public boolean addType(Type type) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delType(int tid) {
		// TODO Auto-generated method stub
		sql="DELETE FROM `types` WHERE `tid` = ? ";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(1, tid);
			preparedStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean modType(Type type) {
		// TODO Auto-generated method stub
		sql="UPDATE TYPES SET NAME=? WHERE tid=?";
		try {
			preparedStatement=connection.prepareStatement(sql);
			preparedStatement.setInt(2, type.getTid());
			preparedStatement.setString(1, type.getName());
			preparedStatement.executeUpdate();
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

	@Override
	public List<Type> getTypes() {
		// TODO Auto-generated method stub
		String sql = "select * from types";
		ResultSetHandler<List<Type>> rSetHandler = new BeanListHandler<Type>(Type.class);
		List<Type> types = null;
		try {
			types = runner.query(connection,sql, rSetHandler);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return types;
	}
}
