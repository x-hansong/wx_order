package com.bepotato.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.DocumentException;

import com.bepotato.model.User;
import com.bepotato.model.UserImpl;
import com.bepotato.po.AccessToken;
import com.bepotato.po.AccessTokenDao;
import com.bepotato.po.TextMessage;
import com.bepotato.util.CheckUtil;
import com.bepotato.util.MessageUtil;
import com.bepotato.util.UserUtil;
import com.bepotato.util.WeixinUtil;

@WebServlet("/weixin.do")
public class WeixinServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public WeixinServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");

		PrintWriter out = response.getWriter();
		if (CheckUtil.checkSignature(signature, timestamp, nonce)) {
			out.print(echostr);
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		PrintWriter out = response.getWriter();
		try {
			Map<String, String> map = MessageUtil.xmlToMap(request);
			String toUserName = map.get("ToUserName");
			String fromUserName = map.get("FromUserName");// openid
			String msgType = map.get("MsgType");
			String content = map.get("Content");
		    String message = null;
			if (MessageUtil.MESSAGE_TEXT.equals(msgType)) {
				if ("1".equals(content)) {
					
				} else if ("2".equals(content)) {
					
				} else if ("?".equals(content) || "？".equals(content)) {
					message = MessageUtil.initTextMessage(toUserName, fromUserName, MessageUtil.menuText());
				}
			} else if (MessageUtil.MESSAGE_EVENT.equals(msgType)) {
				    String eventType = map.get("Event");
				if (MessageUtil.MESSAGE_SUBSCRIBE.equals(eventType)) {
					//当用户关注公众号的时候就保存用户的信息
					UserImpl userImpl = new UserImpl();
					userImpl.checkUser(fromUserName);
					System.out.println("添加用户信息");
				} else if (MessageUtil.MESSAGE_UNSUBSCRIBE.equals(eventType)) {
					// do nothing
				}
			}

			System.out.println(message);
			out.print(message);
		} catch (DocumentException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}


}
