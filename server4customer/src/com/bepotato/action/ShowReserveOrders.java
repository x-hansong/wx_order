package com.bepotato.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShowReserveOrders extends HttpServlet {
	
	@Override
	public void init() throws ServletException{
		super.init();
	}
	
	@Override
	public void destroy(){
		super.destroy();
	}
	
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
		response.sendRedirect("../showReserveOrders.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{
		this.doGet(request,response);
	}
	
	public ShowReserveOrders(){
		super();
	}

}
