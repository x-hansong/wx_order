package com.bepotato.util;

import javax.servlet.http.Cookie;

public class HttpUtils {
	public static String getCookieValue(Cookie[] cookies, String name, String defaultValue) {
		Cookie cookie = null;
		if (cookies == null) {
			return defaultValue;
		}
		for (int i = 0; i < cookies.length; i++) {
			cookie = cookies[i];
			if(name.equals(cookie.getName())){
				return cookie.getValue();
			}
		}
		return defaultValue;
	}
}
