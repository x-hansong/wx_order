package com.bepotato.util;

import java.util.UUID;
import java.util.Formatter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.UnsupportedEncodingException;  

import com.bepotato.po.SDKConfig;
import com.bepotato.po.SDKTicketDao;

public class SDKConfigUtil {
	
	// 注意 URL 一定要动态获取，不能 hardcode
	public static SDKConfig getSDKConfig(String url) {
		String jsapi_ticket =null;
		SDKTicketDao sdkTicketDao = new SDKTicketDao();
		sdkTicketDao.checkTicket();
		jsapi_ticket = sdkTicketDao.getSDKTicketBySQL().getTicket();
		
		SDKConfig config = new SDKConfig();
        String nonce_str = create_nonce_str();
        String timestamp = create_timestamp();
        String string1;
        String signature = "";

        //注意这里参数名必须全部小写，且必须有序
        string1 = "jsapi_ticket=" + jsapi_ticket +
                  "&noncestr=" + nonce_str +
                  "&timestamp=" + timestamp +
                  "&url=" + url;
        System.out.println(string1);

        try
        {
            MessageDigest crypt = MessageDigest.getInstance("SHA-1");
            crypt.reset();
            crypt.update(string1.getBytes("UTF-8"));
            signature = byteToHex(crypt.digest());
        }
        catch (NoSuchAlgorithmException e)
        {
            e.printStackTrace();
        }
        catch (UnsupportedEncodingException e)
        {
            e.printStackTrace();
        }

        config.setUrl(url);
        config.setJsapi_ticket(jsapi_ticket);
        config.setNonceStr(nonce_str);
        config.setSignature(signature);
        config.setTimestamp(timestamp);
        

        return config;
    }

    private static String byteToHex(final byte[] hash) {
        Formatter formatter = new Formatter();
        for (byte b : hash)
        {
            formatter.format("%02x", b);
        }
        String result = formatter.toString();
        formatter.close();
        return result;
    }

    private static String create_nonce_str() {
        return UUID.randomUUID().toString();
    }

    private static String create_timestamp() {
        return Long.toString(System.currentTimeMillis() / 1000);
    }

}
