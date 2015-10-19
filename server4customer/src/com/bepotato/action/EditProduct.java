package com.bepotato.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.Dish;
import com.bepotato.model.DishImpl;
import com.bepotato.model.Service;

public class EditProduct extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditProduct() {
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

		request.setCharacterEncoding("utf-8");
		String typeid=request.getParameter("typeid");
		String dishid=request.getParameter("dishid");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String picture=request.getParameter("picture");
		
		Service services=new Service();
		Dish dish=new Dish();
		DishImpl dishImpl=new DishImpl();
		
		dish.setDid(Integer.valueOf(dishid));
		dish.setPrice(Double.valueOf(price));
		dish.setName(name);
		dish.setImg(picture);
		
		if(!dishImpl.modDish(dish)){
			System.out.println("modify fail");
		}
		response.sendRedirect("SearchProduct?typeid="+typeid);
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
