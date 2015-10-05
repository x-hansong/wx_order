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
		
		//如果是调用接口页面，直接放行
		if (request.getRequestURI().indexOf("weixin.qq.com") != -1) {
			filterChain.doFilter(servletRequest, servletResponse);
			return;
		}
		//链接中包含有pages
		if (request.getRequestURI().indexOf("pages") != -1) {
			//如果是二维码页面就放行
			if (request.getRequestURI().indexOf("pages/qrCode.jsp") != -1) {
				filterChain.doFilter(servletRequest, servletResponse);
				return;
			}
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
