package com.bepotato.po;

public class Ticket {

	public static final String QR_SCENE="QR_SCENE";
	public static final String QR_LIMIT_SCENE="QR_LIMIT_SCENE";
	public static final String QR_LIMIT_STR_SCENE="QR_LIMIT_STR_SCENE";
	//二维码类型，QR_SCENE为临时,QR_LIMIT_SCENE为永久,QR_LIMIT_STR_SCENE为永久的字符串参数值
	private String action_name;
	//二维码详细信息
	private Scene action_info;
	//该二维码有效时间，以秒为单位。 最大不超过604800（即7天）。
	private int expire_seconds;
	public int getExpire_seconds() {
		return expire_seconds;
	}
	public void setExpire_seconds(int expire_seconds) {
		this.expire_seconds = expire_seconds;
	}
	public String getAction_name() {
		return action_name;
	}
	public void setAction_name(String action_name) {
		this.action_name = action_name;
	}
	public Scene getAction_info() {
		return action_info;
	}
	public void setAction_info(Scene action_info) {
		this.action_info = action_info;
	}
}
