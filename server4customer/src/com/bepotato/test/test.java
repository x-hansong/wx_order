package com.bepotato.test;

import java.util.Date;

import net.sf.json.JSONObject;

import com.bepotato.po.AccessTokenDao;
import com.bepotato.util.WeixinUtil;

public class test {

	public static void main(String[] args) {
//		String menu = JSONObject.fromObject(WeixinUtil.initMenu()).toString();
//		int result = WeixinUtil.createMenu(menu);
//		if (result == 0) {
//			System.out.println("创建菜单成功");
//		}else{
//			System.out.println("错误码："+result);
//		}
		
		System.out.println(new Date().getTime());
	}
}
