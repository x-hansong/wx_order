package com.bepotato.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.model.User;
import com.bepotato.model.UserImpl;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//转发请求到jsp
		RequestDispatcher rd;
		rd = getServletContext().getRequestDispatcher("/pages/login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name  = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		UserImpl userImpl = new UserImpl();
		User user = userImpl.findByName(name);
		userImpl.closeConnection();
		if(user.getToken().equals(pwd)){
			Cookie uidCookie  = new Cookie("uid", user.getUid()+"");
			response.addCookie(uidCookie);
			RequestDispatcher rd;
			request.setAttribute("user", user);
			rd = getServletContext().getRequestDispatcher("/DishType");
			rd.forward(request, response);
		}
	}

}
