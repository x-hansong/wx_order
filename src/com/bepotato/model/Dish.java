package com.bepotato.model;

import java.io.Serializable;

public class Dish implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int did;
	private int sid;
	private String name;
	private double price;
	private String remarkString;
	private String img;
	private int sellcount;
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getRemarkString() {
		return remarkString;
	}
	public void setRemarkString(String remarkString) {
		this.remarkString = remarkString;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getSellcount() {
		return sellcount;
	}
	public void setSellcount(int sellcount) {
		this.sellcount = sellcount;
	}
	

}
