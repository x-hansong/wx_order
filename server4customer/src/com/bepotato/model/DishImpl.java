package com.bepotato.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;


import com.bepotato.dao.DishDao;
import com.bepotato.util.DBHelper;

public class DishImpl implements DishDao{
	private QueryRunner runner;
	private Connection connection;
	private String sql=null;
	private PreparedStatement pStatement=null;
	public DishImpl(){
		// TODO Auto-generated constructor stub
		runner = new QueryRunner();
		connection = DBHelper.getConnection();
	}
	@Override
	public Dish findById(int did) {
		// TODO Auto-generated method stub
		sql = "select name from dishes where did = ?";
		/*
		ResultSetHandler<Dish> rsHandler = new BeanHandler<Dish>(Dish.class);
		Dish dish  = null;
		try {
			dish = runner.query(connection,sql, rsHandler,did);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		*/
		ResultSet rSet=null;
		Dish dish=null;
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, did);
			rSet=pStatement.executeQuery();
			dish = new Dish();
			while(rSet.next()){
				dish.setDid(did);
				dish.setName(rSet.getString(1));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dish;
	}

	@Override
	public boolean addDish(Dish dish) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delDish(int did) {
		// TODO Auto-generated method stub
		sql="DELETE FROM `dishes` WHERE `did` = ?";
		try {
			pStatement=connection.prepareStatement(sql);
			pStatement.setInt(1, did);
			pStatement.executeUpdate();
			return true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean modDish(Dish dish) {
		// TODO Auto-generated method stub
		if(dish!=null){
			sql="UPDATE `dishes` SET `name` = ? ,`price` = ? ,`img` = ? WHERE `did` = ?";
			try {
				pStatement=connection.prepareStatement(sql);
				pStatement.setString(1,dish.getName());
				pStatement.setDouble(2, dish.getPrice());
				pStatement.setString(3, dish.getImg());
				pStatement.setInt(4, Integer.valueOf(dish.getDid()));
				pStatement.executeUpdate();
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
	public List<Dish> findByType(int tid) {
		// TODO Auto-generated method stub
		sql = "select * from dishes where tid = ?";
		ResultSetHandler<List<Dish>> rSetHandler = new BeanListHandler<Dish>(Dish.class);
		List<Dish> dishs = null;
		try {
			dishs = runner.query(connection,sql, rSetHandler,tid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dishs;
	}
	@Override
	public Dish findByName(String name) {
		// TODO Auto-generated method stub
		sql = "select * from dishes where name = ?";
		ResultSetHandler<Dish> rsHandler = new BeanHandler<Dish>(Dish.class);
		Dish dish  = null;
		try {
			dish = runner.query(connection,sql, rsHandler,name);
		} catch (Exception e) {
			// TODO: handle exception	
			e.printStackTrace();
		}
		return dish;
	}
}
