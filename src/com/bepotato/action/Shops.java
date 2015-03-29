package com.bepotato.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bepotato.dao.impl.ShopImpl;
import com.bepotato.entity.Shop;

/**
 * Servlet implementation class Shops
 */
@WebServlet("/Shops")
public class Shops extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Shops() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.service(request, response);
		ShopImpl shopImpl = new ShopImpl();
		Shop shop = shopImpl.getShop(1);
		String targetURL = "/pages//shop.jsp";
//		HttpSession session = request.getSession();
		request.setAttribute("shop", shop);
		RequestDispatcher rd;
//		request.setAttribute("message", "hello");
		rd = getServletContext().getRequestDispatcher(targetURL);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			IOException {
		// TODO Auto-generated method stub
	}

}
