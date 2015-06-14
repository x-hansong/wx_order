package com.bepotato.model;

import java.sql.Connection;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bepotato.dao.UserDao;
import com.bepotato.util.DBHelper;

public class UserImpl implements UserDao{
	private QueryRunner runner;
	private Connection connection;
	public UserImpl() {
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	
	@Override
	public User findById(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from users where uid = ?";
		ResultSetHandler<User> rsHandler = new BeanHandler<User>(User.class);
		User user = null;
		try {
			user = runner.query(connection,sql, rsHandler,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		String sql = "insert into users(unionid,nickname,sex,province,city,headimgurl,level,grade,phone,token) "
				+ "values(0,?,0,0,0,0,0,0,0,?)";
		ResultSetHandler<User> rsHandler = new BeanHandler<User>(User.class);
		User user2 = null;
		try {
			user2 = runner.insert(connection,sql, rsHandler,user.getNickname(),user.getToken());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean delUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean modUser(User user) {
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

	@Override
	public User findByName(String name) {
		// TODO Auto-generated method stub
		String sql = "select * from users where nickname = ?";
		ResultSetHandler<User> rsHandler = new BeanHandler<User>(User.class);
		User user = null;
		try {
			user = runner.query(connection,sql, rsHandler,name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
}
