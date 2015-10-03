package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bepotato.dao.AdvanceDao;
import com.bepotato.util.DBHelper;

public class AdvanceImpl implements AdvanceDao{

	@Override
	public boolean addAdvance(Advance advance) {
		Connection conn = null;
		PreparedStatement stmt = null;
		String sql = "insert into advances(sid,uid,time,booktime,men,name,phone,remark,location) "
				+ "values(?,?,?,?,?,?,?,?,'0')";

		try {
			conn = DBHelper.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.execute("set Names utf8");
			stmt.setInt(1, advance.getSid());
			stmt.setInt(2, advance.getUid());
			stmt.setTimestamp(3, advance.getTime());
			stmt.setTimestamp(4, advance.getBooktime());
			stmt.setInt(5, advance.getMen());
			stmt.setString(6, advance.getName());
			stmt.setString(7, advance.getPhone());
			stmt.setString(8, advance.getRemark());
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

}
