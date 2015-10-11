package com.bepotato.util;

import net.sf.json.JSONObject;

import com.bepotato.model.User;
import com.bepotato.po.AccessTokenDao;

public class UserUtil {
	
	private static String USER_INFO_URL ="https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID";
	private static String GET_OPENID_URL ="https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code";
	
	public static User getUserByOpenId(String OpenId){
		User user = new User();
		AccessTokenDao atDao = new AccessTokenDao();
		atDao.checkToken();
		String access_token = atDao.getAccessTokenBySQL().getToken();
		String url = USER_INFO_URL.replace("ACCESS_TOKEN",access_token).replace("OPENID", OpenId);
		JSONObject jsonObject = WeixinUtil.doGetStr(url);
		if (jsonObject != null) {
			user.setOpenid(jsonObject.getString("openid"));
			user.setNickname(jsonObject.getString("nickname"));
			user.setHeadimgurl(jsonObject.getString("headimgurl"));
			user.setSex(jsonObject.getInt("sex"));
			user.setCity(jsonObject.getString("city"));
			user.setProvince(jsonObject.getString("province"));
		}
		return user;
	}
	/**
	 * 这是用来判断用户是否已经关注了公众号
	 * subscribe 1代表关注，0代表未关注
	 * @param OpenId
	 * @return subscribe
	 */
	public static int getSubscribeCode(String OpenId){
		int subscribe = 0;
		AccessTokenDao atDao = new AccessTokenDao();
		atDao.checkToken();
		String access_token = atDao.getAccessTokenBySQL().getToken();
		String url = USER_INFO_URL.replace("ACCESS_TOKEN",access_token).replace("OPENID", OpenId);
		JSONObject jsonObject = WeixinUtil.doGetStr(url);
		if (jsonObject != null) {
			subscribe = jsonObject.getInt("subscribe");
		}
		return subscribe;
	}
	/**
	 * �����Ȩ���json��ݰ�
	 * @param code ��Ȩ��΢�ź�̨���ص�code
	 * @return
	 */
	public static JSONObject getAuthJsonObj(String code){
		JSONObject jsonObject = null;
		String url1 = GET_OPENID_URL.replace("APPID", WeixinUtil.APPID).replace("SECRET", WeixinUtil.APPSECRET).replace("CODE", code);
	    jsonObject = WeixinUtil.doGetStr(url1);
	    return jsonObject;
	}

}
