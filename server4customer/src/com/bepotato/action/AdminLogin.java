package com.bepotato.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.Service;
import com.bepotato.model.Shop;
import com.bepotato.model.ShopImpl;

public class AdminLogin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminLogin() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username=request.getParameter("username");
		String password=request.getParameter("password");
		
		
		Service service = new Service();
		boolean b=service.login(username, password);
		
		if(b){
			// û�е�¼�����ᱣ�������ͣ���Ҫ���µ�¼
			List list = new ArrayList();
			list=service.getAllType();
			ShopImpl shopImpl=new ShopImpl();
			/* change */
			Shop shop=shopImpl.findById(1);
			request.getSession().setAttribute(Data.TYPES, list);
			request.getSession().setAttribute(Data.SHOPS, shop);
			response.sendRedirect("../design.jsp");
		}else{
			response.sendRedirect("../login.jsp");
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
