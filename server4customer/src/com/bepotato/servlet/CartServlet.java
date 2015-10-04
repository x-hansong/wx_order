package com.bepotato.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bepotato.model.Dish;
import com.bepotato.model.DishImpl;
import com.bepotato.model.Order;
import com.bepotato.model.OrderImpl;
import com.bepotato.model.OrderItem;
import com.bepotato.model.OrderItemImpl;
import com.bepotato.model.User;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		System.out.println("userName:"+user.getNickname());
		int pay = Integer.parseInt(request.getParameter("pay"));
		String location  = request.getParameter("zhuohao");
		System.out.println("pay:"+pay+";location:"+location);
		Order order = new Order();
		order.setUid(user.getUid());
		order.setPay(pay);
		order.setLocation(location);
		order.setSid(1);
		order.setOid((int)(new Date().getTime()));
		order.setTime(new Timestamp(new Date().getTime()));
		order.setState(1);
		double totalPrice =0.0;
		
		OrderItemImpl orderItemImpl = new OrderItemImpl();
		DishImpl dishImpl = new DishImpl();
		OrderImpl orderImpl = new OrderImpl();
		
		List<OrderItem> itemList = new ArrayList<OrderItem>();
		Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0)
        {
            for(Cookie c:cookies)
            {
                if(c.getName().startsWith("dish"))
                {
                	if(Integer.parseInt(c.getValue()) != 0){
                		String idString = c.getName().substring(4);
                    	int id = Integer.parseInt(idString);
                    	OrderItem item = new OrderItem();
                    	item.setDid(id);
                    	item.setNum(Integer.parseInt(c.getValue()));
                    	item.setSid(order.getSid());
                    	item.setOid(order.getOid());
                    	itemList.add(item);
                    	
                    	System.out.println(item.getDid()+":"+item.getNum());
                    	
                    	Dish dish = dishImpl.findById(item.getDid());
                    	totalPrice += dish.getPrice()*dish.getSellcount()*item.getNum();
                	}
                }
            }
        }
		order.setPrice(totalPrice);
		orderImpl.addOrder(order);
		
		for (OrderItem item:itemList) {
			orderItemImpl.addOrderItem(item);
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
