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
		
//		JSONObject tjsonObj = WeixinUtil.getTicketJsonObj(2015,604800);
//		String ticketString = tjsonObj.getString("ticket");
//		int expire_seconds = tjsonObj.getInt("expire_seconds");
//		String url = tjsonObj.getString("url");
//		System.out.println("ticketString:"+ticketString);
//		System.out.println("expire_seconds:"+expire_seconds);
//		System.out.println("url:"+url);
//		
//		String qrcodeUrl = WeixinUtil.getQrcodeUrl(tjsonObj);
//		System.out.println("qrcodeUrl:"+qrcodeUrl);

		String url = WeixinUtil.CreateURL(WeixinUtil.MY_URL+"/pages/home.jsp");
		System.out.println(url);
		
	}
}
