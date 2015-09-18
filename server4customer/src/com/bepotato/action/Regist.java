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
 * Servlet implementation class Regist
 */
@WebServlet("/Regist")
public class Regist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Regist() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name  = request.getParameter("rname");
		String pwd = request.getParameter("pwd");
		if (name != null && pwd != null) {
			UserImpl userImpl = new UserImpl();
			User user = new User();
			user.setNickname(name);
			user.setToken(pwd);
			if(userImpl.addUser(user)){
				response.sendRedirect("Login");
			}else{
				response.sendRedirect("Regist");
			}
		}else {
			RequestDispatcher rd;
			rd = getServletContext().getRequestDispatcher("/pages/regist.jsp");
			rd.forward(request, response);
		}
	}

}
