package com.bepotato.test;

import java.util.Date;

import net.sf.json.JSONObject;

import com.bepotato.po.AccessTokenDao;
import com.bepotato.util.WeixinUtil;

import java.util.UUID;
import java.util.Map;
import java.util.HashMap;
import java.util.Formatter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.UnsupportedEncodingException;  

public class test {

	public static void main(String[] args) {
		
		//创建菜单
//		String menu = JSONObject.fromObject(WeixinUtil.initMenu()).toString();
//		int result = WeixinUtil.createMenu(menu);
//		if (result == 0) {
//			System.out.println("创建菜单成功");
//		}else{
//			System.out.println("错误码："+result);
//		}
		
		//获取二维码
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

		
	}

}
