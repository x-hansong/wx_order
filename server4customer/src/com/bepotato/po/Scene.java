package com.bepotato.po;

public class Scene {

	//场景值ID，临时二维码时为32位非0整型，永久二维码时最大值为100000（目前参数只支持1--100000）
	private int scene_id;

	public int getScene_id() {
		return scene_id;
	}

	public void setScene_id(int scene_id) {
		this.scene_id = scene_id;
	}

	
}
