package com.bepotato.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.model.Dish;
import com.bepotato.model.DishImpl;

/**
 * Servlet implementation class Cart
 */
@WebServlet("/Cart")
public class Cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		// 转发请求到jsp
		String targetURL = "/pages/cart.jsp";
		RequestDispatcher rd;
		DishImpl dishImpl = new DishImpl();
		List<Dish> dishes = new ArrayList<Dish>();
		Cookie[] cookies = request.getCookies();
		int did;
		for (int i = 0; i < cookies.length; i++) {
			if (cookies[i].getValue().equals("1")) {
				did = Integer.valueOf(cookies[i].getName());
				dishes.add(dishImpl.findById(did));
			}
		}
		dishImpl.closeConnection();
		request.setAttribute("dishes", dishes);
		rd = getServletContext().getRequestDispatcher(targetURL);
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
	}

}
