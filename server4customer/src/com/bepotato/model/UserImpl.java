package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;

import com.bepotato.dao.UserDao;
import com.bepotato.util.DBHelper;
import com.bepotato.util.UserUtil;

public class UserImpl implements UserDao{
	private QueryRunner runner;
	private Connection connection;
	public UserImpl() {
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	
	@Override
	public User findByOpenId(String openid) {
		// TODO Auto-generated method stub
		String sql = "select * from users where openid = ?";
		ResultSetHandler<User> rsHandler = new BeanHandler<User>(User.class);
		User user = null;
		try {
			user = runner.query(connection,sql, rsHandler,openid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public User findByUid(int uid) {
		// TODO Auto-generated method stub
		String sql = "select * from users where uid = ?";
		ResultSetHandler<User> rsHandler = new BeanHandler<User>(User.class);
		User user = null;
		try {
			user = runner.query(connection,sql, rsHandler,uid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean addUser(User user) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into users(openid,nickname,sex,province,city,headimgurl,level,grade,phone) "
				+ "values(?,?,?,?,?,?,0,0,'0')";

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			stmt.setString(1, user.getOpenid());
			stmt.setString(2, user.getNickname());
			stmt.setInt(3, user.getSex());
			stmt.setString(4, user.getProvince());
			stmt.setString(5, user.getCity());
			stmt.setString(6, user.getHeadimgurl());
			stmt.executeUpdate();
			System.out.println("保存用户成功");
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
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

	/**
	 * 判断用户是否已经保存过了
	 * @param openid
	 * @return
	 */
	public boolean isExist(String openid){
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "select * from users where openid = ?";

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			stmt.setString(1, openid);
			rs = stmt.executeQuery();
			if (rs.next()) {
				System.out.println("已经存在");
				return true;
			}else{
				System.out.println("不存在");
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}finally {
			// 释放数据集对象
			if (rs != null) {
				try {
				    rs.close();
					rs = null;
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
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
	
	/**
	 * 检查用户是否已经存在，进行下一步操作
	 * @param openid
	 */
	public void checkUser(String openid){
		if (!isExist(openid)) {
			User user = UserUtil.getUserByOpenId(openid);
			addUser(user);
		}
	}
	/**
	 * 当用户访问商店的时候就进行更新信息操作
	 * 包括nickname，headimgurl
	 * 前提是应经关注了公众号
	 * 
	 */
	public void refreshUser(User userTemp,String openid){
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "update users set nickname=?,headimgurl=? where openid =?";

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			stmt.setString(1, userTemp.getNickname());
			stmt.setString(2, userTemp.getHeadimgurl());
			stmt.setString(3, openid);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
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
		return null;
	}


}
