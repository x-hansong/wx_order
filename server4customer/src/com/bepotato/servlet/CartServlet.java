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
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
            	if(c.getName().equals("name")){//这段为测试代码，貌似没有这个就读取不了cookie，很奇怪
            		System.out.println(c.getName()+":"+c.getValue());
            	}
                if(c.getName().startsWith("dish"))
                {
                	if(Integer.parseInt(c.getValue()) > 0){
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
	
		
		if (totalPrice >0) {//判断订单是否为空
			boolean flag1 = false;
			boolean flag2 = false;
			
			order.setPrice(totalPrice);
			flag1 = orderImpl.addOrder(order);
			
			for (OrderItem item:itemList) {//先添加order再添加orderitem；因为order的主键为item的外键
				flag2 = orderItemImpl.addOrderItem(item);
				if(!flag2){
					break;
				}
			}
			
			if (flag1 && flag2) {//下单成功后，把购物车清空
				if(cookies!=null&&cookies.length>0)
		        {
		            for(Cookie c:cookies)
		            {
		                if(c.getName().startsWith("dish"))
		                {
		                	Cookie cookie =new Cookie(c.getName(),"0");
		                	cookie.setPath("/");
		                	cookie.setMaxAge(-1000);
		                	response.addCookie(cookie);
		                }
		            }
		            System.out.println("成功清空购物车");
		        }
				//test
//				Cookie[] testcookies = request.getCookies();
//				if(testcookies!=null&&testcookies.length>0)
//		        {
//		            for(Cookie c:cookies)
//		            {
//		                System.out.println(c.getName()+":"+c.getValue()+":"+c.getMaxAge());
//		            }
//		            System.out.println("成功清空购物车");
//		        }
				System.out.println("成功下单");
				request.getRequestDispatcher("/pages/home.jsp?ordersure=1").forward(request, response);
			}else{
				System.out.println("下单失败");
				request.getRequestDispatcher("/pages/order_sure.jsp?ordersure=0").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("/pages/order.jsp?ordersure=2").forward(request, response);
		}
	
		
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
