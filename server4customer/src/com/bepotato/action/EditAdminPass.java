package com.bepotato.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.Admins;
import com.bepotato.model.Service;

public class EditAdminPass extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditAdminPass() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	@Override
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
	@Override
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
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String aid=request.getParameter("id");
		System.out.println(aid);
		
		Service service= new Service();
		String aname=service.getAdminName(aid);
		
		System.out.println(aname);
		
		Admins admins=new Admins();
		admins.setAid(aid);
		admins.setAname(aname);
		
		request.getSession().setAttribute(Data.ADMINS2, admins);
		response.sendRedirect("../adminPassEdit.jsp");
		
		
		
//		request.getSession().setAttribute(Data.ADMINS2, admins);
//		response.sendRedirect("../adminPassEdit.jsp");
		
//		Service service = new Service();
//		int flag=service.editAdminPass(admins);
//		
//		if(flag==1){
//			System.out.println("����Ա�����޸ĳɹ��ˣ�");
//			response.sendRedirect("../Success.jsp");
//		}else{
//			System.out.println("����Ա�����޸�ʧ���ˣ�");
//			response.sendRedirect("../False.jsp");
//		}
//		
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	@Override
	public void init() throws ServletException {
		// Put your code here
	}

}
