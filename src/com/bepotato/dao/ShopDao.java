package com.bepotato.dao;

import com.bepotato.entity.Shop;

public interface ShopDao {
	public Shop getShop(int sid);
	public boolean addShop(Shop shop);
	public boolean modifyShop(Shop shop);
}
