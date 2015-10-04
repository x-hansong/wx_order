package com.bepotato.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bepotato.util.DBConnection;

public class Service {
	private DBConnection dbconnection;
	private Statement sta;
	private ResultSet rs;
	private String sql,sql1;
	private int flag,flag1,flag2,flag3,flag4,flag5,flag6,flag7;
	private List list;
	private String aname;
	
	
	/**
	 * ��ӹ���Ա
	 */
	public int addAdmin(Admins admins){
		dbconnection = new DBConnection();
		sta=dbconnection.getStatement();
		sql="insert into admin(aname,password)values('"+admins.getAname()+"','"+admins.getPassword()+"')";
		
		try {
			flag1=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag1;
	}
	
	/**
	 * ɾ�����Ա
	 */
	public int deleteAdmin(String aid){
		dbconnection= new DBConnection();
		sta=dbconnection.getStatement();
		sql1="delete from admin where aid='"+aid+"'";
		System.out.println(sql1);
		try {
			flag3=sta.executeUpdate(sql1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(flag3);
		return flag3;
	}
	
	/**
	 * ��ѯ���еĹ���Ա��
	 */
	public List getAllAdmin(){
		list= new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from admin";
		
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Admins admins = new Admins();
//System.out.println(rs.getString("aname"));
				admins.setAid(rs.getString("aid"));
				admins.setAname(rs.getString("aname"));
				admins.setPassword(rs.getString("password"));
				list.add(admins);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}
	
	/**]
	 * ͨ�����Ա��id��ù���Ա������
	 * @param aid
	 * @return
	 */
	public String getAdminName(String aid){
		System.out.println(aid);
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		String sql="select aname from admin where aid='"+aid+"'";
		
		System.out.println(sql);
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				aname=rs.getString("aname");
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return aname;
	}
	
	/**
	 * ȷ���޸Ĺ���Ա���� 
	 */
	public int editAdminPass(String aid,String password){
		System.out.println(aid);
		dbconnection= new DBConnection();
		sta=dbconnection.getStatement();
		
		sql="update admin set password='"+password+"' where aid='"+aid+"'";
		
		System.out.println(sql);
		try {
			flag2=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("flag2="+flag2);
		
		return flag2;
	}
	
	/**
	 * �����Ʒ���
	 */
	public int addType(String typename){
		
	dbconnection=new DBConnection();
	sta=dbconnection.getStatement();
	sql="insert into types(sid,name) values('1','"+typename+"')";
	System.out.println(sql);
		try {
			flag4=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag4;
	}
	
	/**
	 * �г�������Ʒ�����
	 */
	public List getAllType(){
		List list=new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from types";
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Type types =new Type();
				types.setTid(Integer.valueOf(rs.getString("tid")));
				types.setName(rs.getString("name"));
				list.add(types);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	/**
	 * ɾ����Ʒ���
	 * @param aid
	 * @return
	 */
	public int deleteType(String typeid){
		dbconnection= new DBConnection();
		sta=dbconnection.getStatement();
		sql="delete from types where tid='"+typeid+"'";
		System.out.println(sql);
		try {
			flag5=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(flag5);
		return flag5;
	}
	
	/**
	 * �����Ʒ
	 */
	public int addProduct(String pname,String ptype,String pinfo,String tid){
		
	dbconnection=new DBConnection();
	sta=dbconnection.getStatement();
	sql="insert into dishes(sid,name,price,img,tid) values('1','"+pname+"','"+ptype+"','"+pinfo+"','"+tid+"')";
	System.out.println(sql);
		try {
			flag6=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag6;
	}
	
	/**
	 * �г����е���Ʒ
	 * @return
	 */
	public List getAllProduct(){
		list= new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from dishes";
		
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Dish dish = new Dish();

				dish.setDid(Integer.valueOf(rs.getString("did")));
				dish.setImg(rs.getString("img"));
				dish.setName(rs.getString("name"));
				dish.setPrice(Double.valueOf(rs.getString("price")));
				dish.setRemarkString(rs.getString("remark"));
				dish.setSellcount(Integer.valueOf(rs.getString("sellcount")));
				dish.setSid(Integer.valueOf(rs.getString("sid")));
				list.add(dish);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return list;
	}
	
	/**
	 * �г�ĳһ���͵���Ʒ
	 * @param typeid
	 * @return
	 */
	public List getProducetById(String typeid){
		list=new ArrayList();
		sql="select * from dishes where tid='"+typeid+"'";
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		
		System.out.println(sql);
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Dish dish=new Dish();
				dish.setDid(Integer.valueOf(rs.getString("did")));
				dish.setImg(rs.getString("img"));
				dish.setName(rs.getString("name"));
				dish.setPrice(Double.valueOf(rs.getString("price")));
				dish.setRemarkString(rs.getString("remark"));
				dish.setSellcount(Integer.valueOf(rs.getString("sellcount")));
				dish.setSid(Integer.valueOf(rs.getString("sid")));
				dish.setTid(Integer.valueOf(rs.getString("tid")));
				list.add(dish);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * ɾ����Ʒ��ӦID����Ʒ
	 * @param aid
	 * @return
	 */
	public int deleteProduct(String pid){
		dbconnection= new DBConnection();
		sta=dbconnection.getStatement();
		sql="delete from dishes where did='"+pid+"'";
		System.out.println(sql);
		try {
			flag7=sta.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//System.out.println(flag7);
		return flag7;
	}
	
	/**
	 * �г����� �Ķ���
	 * @return
	 */
	public List getAllOrders(){
		List list=new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from orders";
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				System.out.println(sql);
				Order order=new Order();
				order.setDiscount(Double.valueOf(rs.getString("discount")));
				order.setLocation(rs.getString("location"));
				order.setMen(Integer.valueOf(rs.getString("men")));
				order.setPay(Integer.valueOf(rs.getString("pay")));
				order.setRemark(rs.getString("remark"));
				order.setTime(rs.getTimestamp("time"));
				order.setOid(Integer.valueOf(rs.getString("oid")));
				order.setPrice(Double.valueOf(rs.getString("price")));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List getNewOrders(){
		list=new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from orders where state=0";
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Order order=new Order();
				order.setDiscount(Double.valueOf(rs.getString("discount")));
				order.setLocation(rs.getString("location"));
				order.setMen(Integer.valueOf(rs.getString("men")));
				order.setPay(Integer.valueOf(rs.getString("pay")));
				order.setRemark(rs.getString("remark"));
				order.setTime(rs.getTimestamp("time"));
				order.setOid(Integer.valueOf(rs.getString("oid")));
				order.setPrice(Double.valueOf(rs.getString("price")));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public List getDoingOrders(){
		list=new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from orders where state=1";
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Order order=new Order();
				order.setDiscount(Double.valueOf(rs.getString("discount")));
				order.setLocation(rs.getString("location"));
				order.setMen(Integer.valueOf(rs.getString("men")));
				order.setPay(Integer.valueOf(rs.getString("pay")));
				order.setRemark(rs.getString("remark"));
				order.setTime(rs.getTimestamp("time"));
				order.setOid(Integer.valueOf(rs.getString("oid")));
				order.setPrice(Double.valueOf(rs.getString("price")));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public List getDoneOrders(){
		list=new ArrayList();
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from orders where state=2";
		try {
			rs=sta.executeQuery(sql);
			while(rs.next()){
				Order order=new Order();
				order.setDiscount(Double.valueOf(rs.getString("discount")));
				order.setLocation(rs.getString("location"));
				order.setMen(Integer.valueOf(rs.getString("men")));
				order.setPay(Integer.valueOf(rs.getString("pay")));
				order.setRemark(rs.getString("remark"));
				order.setTime(rs.getTimestamp("time"));
				order.setOid(Integer.valueOf(rs.getString("oid")));
				order.setPrice(Double.valueOf(rs.getString("price")));
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	
	/**
	 * 
	 */
	public boolean login(String username,String password){
		boolean b=false;
		dbconnection=new DBConnection();
		sta=dbconnection.getStatement();
		sql="select * from admin";
		try {
			rs=sta.executeQuery(sql);
			tag:
			while(rs.next()){
				String aname=rs.getString("aname");
				String apass=rs.getString("password");
				
				if(aname.equals(username)&&apass.equals(password)){
					System.out.println("����ɹ�yes��");
					b=true;
					break tag;
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return b;
	}
}
