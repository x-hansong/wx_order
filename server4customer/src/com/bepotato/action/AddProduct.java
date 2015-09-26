package com.bepotato.action;

import java.awt.ItemSelectable;
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.model.Service;

public class AddProduct extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AddProduct() {
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

		String pname=request.getParameter("pname");
			pname=new String(pname.getBytes("ISO8859-1"),"GBK");
		String ptype=request.getParameter("ptype");
			ptype=new String(ptype.getBytes("ISO8859-1"),"GBK");
		String pinfo=request.getParameter("pinfo");
			pinfo=new String(pinfo.getBytes("ISO8859-1"),"GBK");
		String tid=request.getParameter("tid");
		tid=new String(tid.getBytes("ISO8859-1"), "GBK");
		Service service=new Service();
		int flag=service.addProduct(pname, ptype, pinfo,tid);
		
		if(flag==1){
			System.out.println("�����Ʒ�ɹ���");
			response.sendRedirect("../Success.jsp");
		}else{
			System.out.println("�����Ʒʧ�ܣ�");
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
