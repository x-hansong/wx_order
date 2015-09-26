package com.bepotato.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.model.Admins;
import com.bepotato.model.Service;

public class AddAdmin extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddAdmin() {
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
		//得到管理表单中提交的管理员名字，和密码。
		String aname=request.getParameter("aname");
		String password=request.getParameter("password");

		Admins admins=new Admins();
		admins.setAname(aname);
		admins.setPassword(password);
		
		Service services = new Service();
		int flag=services.addAdmin(admins);
		
		if(flag==1){
			System.out.println("后台添加管理员成功了！");
			response.sendRedirect("../Success.jsp");
		}else{
			System.out.println("后天添加管理员失败了！");
			response.sendRedirect("../False.jsp");
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
