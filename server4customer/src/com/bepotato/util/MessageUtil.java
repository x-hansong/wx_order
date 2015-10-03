package com.bepotato.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.bepotato.po.News;
import com.bepotato.po.NewsMessage;
import com.bepotato.po.TextMessage;
import com.thoughtworks.xstream.XStream;



public class MessageUtil {
	
	public static final String MESSAGE_TEXT = "text";
	public static final String MESSAGE_NEWS = "news";
	public static final String MESSAGE_VOICE = "voice";
	public static final String MESSAGE_VIDEO = "video";
	public static final String MESSAGE_IMAGE = "image";
	public static final String MESSAGE_LINK = "link";
	public static final String MESSAGE_LOCATION = "location";
	public static final String MESSAGE_EVENT = "event";
	public static final String MESSAGE_SUBSCRIBE = "subscribe";
	public static final String MESSAGE_UNSUBSCRIBE = "unsubscribe";
	public static final String MESSAGE_VIEW = "VIEW";
	public static final String MESSAGE_CLICK = "CLICK";
	

	/**
	 * xmlתΪmap����
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws DocumentException
	 */
	public static Map<String, String> xmlToMap(HttpServletRequest request) throws IOException, DocumentException{
		Map<String, String> map = new HashMap<String, String>();
		
		SAXReader reader = new SAXReader();
		InputStream ins = request.getInputStream();
		Document doc = reader.read(ins);
		
		Element root = doc.getRootElement();
		
		List<Element> list= root.elements();
		
		for (Element element : list) {
			map.put(element.getName(), element.getText());
		}
		ins.close();
		return map;
	}
	
	/**
	 * ���ı�����ת��Ϊxml
	 * @param textmessage
	 * @return
	 */
	public static String textMessageToXml(TextMessage textmessage){
		XStream xStream = new XStream();
		xStream.alias("xml", textmessage.getClass());
		return xStream.toXML(textmessage);
	}
	
	/**
	 * �ı���Ϣ����װ
	 * @param toUserName
	 * @param fromUserName
	 * @param content
	 * @return
	 */
	public static String initTextMessage(String toUserName, String fromUserName, String content){
		String message = null;
		TextMessage textMessage = new TextMessage();
		textMessage.setFromUserName(toUserName);
		textMessage.setToUserName(fromUserName);
		textMessage.setMsgType(MESSAGE_TEXT);
		textMessage.setCreateTime(new Date().getTime()+"");
		textMessage.setContent(content);
		message = textMessageToXml(textMessage);
		return message;
	}
	
	
	public static String menuText(){
		StringBuffer sb = new StringBuffer();
		sb.append("��ӭ��Ĺ�ע���밴����ʾ���в�����\n\n");
		sb.append("�ظ�1>>�����Ľ���\n");
		sb.append("�ظ�2>>Ф���Ľ���\n");
		sb.append("�ظ�?>>�����˲˵�");
		return sb.toString();
	}
	
	public static String firstMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("������һ���ܺ�����罻ƽ̨����Ҷ����������﷢���Լ�������");
		return sb.toString();
	}
	public static String secondMenu(){
		StringBuffer sb = new StringBuffer();
		sb.append("Ф����һλ˧�磡");
		return sb.toString();
	}
	
	/**
	 * ��ͼ����Ϣ����ת��Ϊxml
	 * @param newsMessage
	 * @return
	 */
	public static String newsMessageToXml(NewsMessage newsMessage){
		XStream xStream = new XStream();
		xStream.alias("xml", newsMessage.getClass());
		xStream.alias("item", new News().getClass());
		return xStream.toXML(newsMessage);
	}
	
	/**
	 * ͼ����Ϣ����װ
	 * @param toUserName
	 * @param fromUserName
	 * @return
	 */
	public static String initNewsMessage(String toUserName, String fromUserName){
		String message = null;
		List<News> newsList = new ArrayList<News>();
		NewsMessage newsMessage = new NewsMessage();
		
		News news1 = new News();
		news1.setTitle("Ф���ļ��");
		news1.setDescription("Ф������һλ��˧�磡");
		news1.setPicUrl("http://kingking.tunnel.mobi/weixinshudong/image/myphoto1.jpg");
		news1.setUrl("www.imooc.com");
		
		newsList.add(news1);
		
		News news2 = new News();
		news2.setTitle("Ф���ļ��");
		news2.setDescription("Ф������һλ��˧�磡");
		news2.setPicUrl("http://kingking.tunnel.mobi/weixinshudong/image/myphoto1.jpg");
		news2.setUrl("www.imooc.com");
		
		newsList.add(news2);
		
		newsMessage.setFromUserName(toUserName);
		newsMessage.setToUserName(fromUserName);
		newsMessage.setArticles(newsList);
		newsMessage.setMsgType(MESSAGE_NEWS);
		newsMessage.setCreateTime(new Date().getTime()+"");
		newsMessage.setArticleCount(newsList.size());
		
		message = newsMessageToXml(newsMessage);
		return message;
	}

}
