package com.bepotato.dao;

import com.bepotato.model.Shop;

public interface ShopDao {
	public Shop findById(int sid);
	public boolean addShop(Shop shop);
	public boolean modifyShop(Shop shop);
}
