package com.bepotato.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.OrderItem;
import com.bepotato.model.OrderItemImpl;

public class DeleteDishFromOrder extends HttpServlet{
	public void init() throws ServletException{
		super.init();
	}
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
		String state = request.getParameter("state");
		String orderid=request.getParameter("orderid");
		String dishid=request.getParameter("dishid");
		OrderItem orderItem=new OrderItem();
		orderItem.setOid(Integer.valueOf(orderid));
		orderItem.setDid(Integer.valueOf(dishid));
		OrderItemImpl orderItemImpl=new OrderItemImpl();
		if(orderItemImpl.delOrderItem(orderItem))
			System.out.println("delete orderitem success");
		else 
			System.out.println("delete orderitem fail");
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
