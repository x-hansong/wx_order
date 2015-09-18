package com.bepotato.dao;

import java.util.List;

import com.bepotato.model.Type;

public interface TypeDao {
	public Type findById(int tid);
	public List<Type> getTypes();
	public boolean addType(Type type);
	public boolean delType(int tid);
	public boolean modType(Type type);
}
