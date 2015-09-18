package com.bepotato.dao;

import java.util.List;

import com.bepotato.model.Dish;

public interface DishDao {
	public Dish findById(int did);
	public Dish findByName(String name);
	public List<Dish> findByType(int tid);
	public boolean addDish(Dish dish);
	public boolean delDish(int did);
	public boolean modDish(Dish dish);
}
