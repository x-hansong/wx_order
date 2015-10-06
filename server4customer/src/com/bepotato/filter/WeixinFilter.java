package com.bepotato.filter;

import java.io.IOException;

import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName="WeixinFilter",value={"/*"},dispatcherTypes={DispatcherType.REQUEST,DispatcherType.ASYNC},asyncSupported=true)
public class WeixinFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
			FilterChain filterChain) throws IOException, ServletException {
		
		HttpServletRequest request =(HttpServletRequest)servletRequest;
		HttpServletResponse response  =(HttpServletResponse)servletResponse;
		
		HttpSession session = request.getSession();
		String online = null;
		online = (String)session.getAttribute("alreadyOn");
		
		//用于判断home.jsp
		String code =null;
		code = request.getParameter("code");
		
		StringBuffer sb = new StringBuffer();
		//不用过滤的路径
		String noFilterPaths = null;
		//如果是调用接口页面，直接放行
		sb.append("qq.com;");
		//如果是二维码页面就放行
		sb.append("pages/qrCode.jsp;");
		
		noFilterPaths = sb.toString();

	    if (noFilterPaths != null) {
			String [] strArray =  noFilterPaths.split(";");	
			for (int i = 0; i < strArray.length; i++) {
				if (strArray[i] == null || "".equals(strArray[i])) continue;
				
				if (request.getRequestURI().indexOf(strArray[i]) != -1) {
					filterChain.doFilter(servletRequest, servletResponse);
					return;
				}
			}
		} 
	    //链接中包含有pages
		if (request.getRequestURI().indexOf("pages") != -1) {
			if("1".equals(online) || code!=null){
				filterChain.doFilter(servletRequest, servletResponse);
				return;
			}else{
				request.getRequestDispatcher("/pages/qrCode.jsp").forward(request, response);
			}
		}else{
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
