package com.bepotato.util;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class DBUtil {
	private static String driver="com.mysql.jdbc.Driver";
	private static String url="jdbc:mysql://localhost:3306/wx_order?useUnicode=true&characterEncoding=utf-8";
	private static String username="root";
	private static String password="";
	/*
	 * 打开数据库连接
	 */
	public static Connection getConnection() {
		try {
			Class.forName(driver);
			return DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	　　* 关闭     PreparedStatement（预处理执行语句） 目的：可以防止SQL注入、在特定的驱动数据库下相对效率要高(不绝对)、不需要频繁编译.因为已经预加载了
	　　* @param pstmt
	　　*/
	public static void close(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	/**
	　　* 关闭连接
	　　* @param conn
	　　*/
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	/**
	 * 关闭数据库结果集的数据表
	 * @param rs
	 */
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}	
}
