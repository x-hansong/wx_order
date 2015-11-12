package com.bepotato.util;

import java.sql.Timestamp;
import java.util.Date;

import net.sf.json.JSONObject;

import com.bepotato.po.AccessTokenDao;
import com.bepotato.po.SDKTicket;

public class SDKTicketUtil {
	public static String SDK_TICKET_URL="https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";

	public static SDKTicket getSDKTicket(){
		SDKTicket ticket = new SDKTicket();
		AccessTokenDao atDao = new AccessTokenDao();
		atDao.checkToken();
		String token = atDao.getAccessTokenBySQL().getToken();
		String url = SDK_TICKET_URL.replace("ACCESS_TOKEN", token);
		JSONObject jsonObject = WeixinUtil.doGetStr(url);
		if (jsonObject != null) {
			String errcode = jsonObject.getString("errcode");
			if ("0".equals(errcode)) {
				ticket.setTicket(jsonObject.getString("ticket"));
				ticket.setExpiresIn(jsonObject.getInt("expires_in"));
				ticket.setCreateTime(new Timestamp(new Date().getTime()));
				System.out.println("成功获得最新SDKTicket");
				return ticket;
			}
		}
		return null;
	}
}
