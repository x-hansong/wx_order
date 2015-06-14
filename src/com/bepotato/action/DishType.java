package com.bepotato.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.model.Dish;
import com.bepotato.model.DishImpl;
import com.bepotato.model.Type;
import com.bepotato.model.TypeImpl;

/**
 * Servlet implementation class DishType
 */
@WebServlet("/DishType")
public class DishType extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DishType() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String tidString = request.getParameter("tid");
		int tid = 1;
		if(tidString != null){
			tid = Integer.valueOf(tidString);
		}
		DishImpl dishImpl = new DishImpl();
		List<Dish> dishes = dishImpl.findByType(tid);
		TypeImpl typeImpl = new TypeImpl();
		List<Type> types = typeImpl.getTypes(); 
		String targetURL = "/pages/booking.jsp";
		//存储数据到request里面
		request.setAttribute("dishes", dishes);
		request.setAttribute("types", types);
		//转发请求到jsp
		RequestDispatcher rd;
		rd = getServletContext().getRequestDispatcher(targetURL);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
