package com.bepotato.dao;

import com.bepotato.model.User;

public interface UserDao {
	public User findByOpenId(String openid);
	public boolean addUser(User user);
	public boolean delUser(User user);
	public boolean modUser(User user);
	public User findByName(String name);
}
