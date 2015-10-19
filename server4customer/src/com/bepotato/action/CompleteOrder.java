package com.bepotato.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.Order;
import com.bepotato.model.OrderImpl;
import com.bepotato.model.OrderItem;
import com.bepotato.model.OrderItemImpl;

public class CompleteOrder extends HttpServlet{
	public void init() throws ServletException{
		super.init();
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		String state = request.getParameter("state");
		String orderid=request.getParameter("orderid");
		Order order=new Order();
		order.setSid(Integer.valueOf(Data.DONE));
		order.setOid(Integer.valueOf(orderid));
		OrderImpl orderImpl=new OrderImpl();
		if(orderImpl.modOrder(order))
			System.out.println("complete order success");
		else 
			System.out.println("complete order fail");
		if(state.equals(Data.NEW))
			response.sendRedirect("ShowNewOrder");
		else if(state.equals(Data.DOING))
			response.sendRedirect("ShowDoingOrder");
		else if(state.equals(Data.DONE))
			response.sendRedirect("ShowDoneOrder");
		else 
			response.sendRedirect("../login.jsp");
	}
	public void destroy(){
		super.destroy();
	}

}
