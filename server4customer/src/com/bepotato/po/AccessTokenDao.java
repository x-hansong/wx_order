package com.bepotato.po;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.bepotato.util.DBHelper;
import com.bepotato.util.WeixinUtil;


public class AccessTokenDao {
	//从数据库中读取token
	public AccessToken getAccessTokenBySQL(){
		AccessToken accessToken = new AccessToken();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String s = "select max(aid) from accesstoken";
		String sql = "select * from accesstoken where aid = ?";
		int max =1;
		
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(s);
			rs = stmt.executeQuery();
			while (rs.next()) {
				max = rs.getInt("max(aid)");
			}
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, max);
			rs = stmt.executeQuery();
			while (rs.next()) {
				accessToken.setToken(rs.getString("token"));
				accessToken.setExpiresIn(rs.getInt("expiresIn"));
				accessToken.setCreateTime(rs.getTimestamp("createTime"));
			}
			return accessToken;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
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
		}
	}
	//更新token操作
	public void updateAccessTokenBySQL(AccessToken accessToken){
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into accesstoken (token,expiresIn,createTime) values (?,?,?)";
		
		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			stmt.setString(1, accessToken.getToken());
			stmt.setInt(2, accessToken.getExpiresIn());
			stmt.setTimestamp(3, accessToken.getCreateTime());
			
			stmt.executeUpdate();
			System.out.println("保存成功");
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
		}
	}
	//判断token是否过时
	public boolean isTokenOut(){
		AccessToken oldToken = getAccessTokenBySQL();
		Timestamp t = oldToken.getCreateTime();
		int expiresIn = oldToken.getExpiresIn();//单位为秒，而gettime（）返回的是毫秒
		if (((new Date().getTime())-t.getTime()) >= expiresIn*1000) {
			return true;
		}else{
			return false;
		}
	}
	
	public void checkToken() {
		if (isTokenOut()) {
			AccessToken accessToken = WeixinUtil.getAccessToken();
			updateAccessTokenBySQL(accessToken);
		}
	}

}
