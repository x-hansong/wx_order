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
import com.bepotato.util.HttpUtils;

/**
 * Servlet implementation class Index
 */
@WebServlet("/Index")
public class Index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd;
		String targetUrl = null;
		Cookie[] cookies = request.getCookies();
		String uidString = HttpUtils.getCookieValue(cookies, "uid", "");
		if (uidString.length() == 0) {
			targetUrl = "/Login";
		}else{
			int uid = Integer.valueOf(uidString);
			UserImpl userImpl = new UserImpl();
			User user = userImpl.findById(uid);
			userImpl.closeConnection();
			request.setAttribute("user", user);
			targetUrl = "/DishType";
		}
		rd = getServletContext().getRequestDispatcher(targetUrl);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
