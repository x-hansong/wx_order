package com.bepotato.test;

import net.sf.json.JSONObject;

import com.bepotato.po.AccessTokenDao;
import com.bepotato.util.WeixinUtil;

public class test {

	public static void main(String[] args) {
		AccessTokenDao atDao = new AccessTokenDao();
		atDao.checkToken();
		String token = atDao.getAccessTokenBySQL().getToken();
		String menu = JSONObject.fromObject(WeixinUtil.initMenu()).toString();
		int result = WeixinUtil.createMenu(token, menu);
		if (result == 0) {
			System.out.println("创建菜单成功");
		}else{
			System.out.println("错误码："+result);
		}
	}
}
