package com.bepotato.model;

import java.sql.Timestamp;

//这是一个订座的信息类
public class Advance {

	private int aid;
	private int sid;
	private int uid;
	private Timestamp time;
	private Timestamp booktime;
	private int men;//人数
	private String name;
	private String phone;
	private String remark;//备注
	private String location; //台号
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public Timestamp getTime() {
		return time;
	}
	public void setTime(Timestamp time) {
		this.time = time;
	}
	public Timestamp getBooktime() {
		return booktime;
	}
	public void setBooktime(Timestamp booktime) {
		this.booktime = booktime;
	}
	public int getMen() {
		return men;
	}
	public void setMen(int men) {
		this.men = men;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
}
