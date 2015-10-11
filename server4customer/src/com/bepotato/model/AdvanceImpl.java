package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.bepotato.dao.AdvanceDao;
import com.bepotato.util.DBHelper;

public class AdvanceImpl implements AdvanceDao{
	
	private QueryRunner runner;
	private Connection connection;
	public AdvanceImpl(){
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}

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
	
	public List<Advance> findAdvanceByUid(int uid) {
		String sql = "select * from advances where uid = ? order by aid DESC";
		ResultSetHandler<List<Advance>> rsHandler = new BeanListHandler<Advance>(Advance.class);
		List<Advance> Advances  = null;
		try {
			Advances = runner.query(connection,sql, rsHandler,uid);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		return Advances;
	}

}
