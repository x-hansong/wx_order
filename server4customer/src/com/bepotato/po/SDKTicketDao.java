package com.bepotato.po;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;

import com.bepotato.util.DBHelper;
import com.bepotato.util.SDKTicketUtil;
import com.bepotato.util.WeixinUtil;

public class SDKTicketDao {

	//从数据库中读取token
		public SDKTicket getSDKTicketBySQL(){
			SDKTicket ticket =new SDKTicket();
			
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			String s = "select max(tid) from sdkticket";
			String sql = "select * from sdkticket where tid = ?";
			int max =1;
			
			try {
				conn = DBHelper.getConnection();
				stmt = conn.prepareStatement(s);
				rs = stmt.executeQuery();
				while (rs.next()) {
					max = rs.getInt("max(tid)");
				}
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, max);
				rs = stmt.executeQuery();
				while (rs.next()) {
					ticket.setTicket(rs.getString("ticket"));
					ticket.setExpiresIn(rs.getInt("expiresIn"));
					ticket.setCreateTime(rs.getTimestamp("createTime"));
				}
				return ticket;
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
		public void updateSDKTicketBySQL(SDKTicket ticket){
			Connection conn = null;
			PreparedStatement stmt = null;
			String sql = "insert into sdkticket (ticket,expiresIn,createTime) values (?,?,?)";
			
			try {
				conn = DBHelper.getConnection();
				stmt = conn.prepareStatement(sql);
				stmt.execute("set Names utf8");
				stmt.setString(1, ticket.getTicket());
				stmt.setInt(2, ticket.getExpiresIn());
				stmt.setTimestamp(3, ticket.getCreateTime());
				
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
		public boolean isTicketOut(){
			SDKTicket oldTicket = getSDKTicketBySQL();
			Timestamp t = oldTicket.getCreateTime();
			int expiresIn = oldTicket.getExpiresIn();//单位为秒，而gettime（）返回的是毫秒
			if (((new Date().getTime())-t.getTime()) >= expiresIn*1000) {
				return true;
			}else{
				return false;
			}
		}
		
		public void checkTicket() {
			if (isTicketOut()) {
				SDKTicket ticket = SDKTicketUtil.getSDKTicket();
				updateSDKTicketBySQL(ticket);
			}
		}
}
