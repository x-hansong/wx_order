package com.bepotato.dao;

import com.bepotato.model.Order;

public interface OrderDao {
	public Order findById(int oid);
	public boolean addOrder(Order order);
	public boolean delOrder(int oid);
	public boolean modOrder(Order order);
}
