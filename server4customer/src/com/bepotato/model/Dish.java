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
	private String img;//格式如“resourse/images/4546.jgp”
	private int sellcount;
	private int tid;
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
	public void setTid(int tid){
		this.tid=tid;
	}
	public int getTid(){
		return tid;
	}
	@Override
	public int hashCode() {
		
		return this.getDid()+this.getName().hashCode();
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Dish other = (Dish) obj;
		if (did != other.did)
			return false;
		return true;
	}

	
}
