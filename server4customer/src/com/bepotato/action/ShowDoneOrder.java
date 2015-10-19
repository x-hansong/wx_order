package com.bepotato.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.Service;

public class ShowDoneOrder extends HttpServlet {
	
	public void init() throws ServletException{
		super.init();
	}
	
	public void destroy(){
		super.destroy();
	}
	
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		String state=request.getParameter("state");
		Service services=new Service();
		List list=null;
		list=services.getDoneOrders();
		if (list==null)
			System.out.println("orders null");
		else 
			System.out.println(list.size());
		request.getSession().setAttribute(Data.ORDERS, list);
		response.sendRedirect("../yiwancheng.jsp");
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request,response);
	}
	
	public ShowDoneOrder(){
		super();
	}

}
