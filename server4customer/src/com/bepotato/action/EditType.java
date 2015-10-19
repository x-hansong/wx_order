package com.bepotato.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.model.Type;
import com.bepotato.model.TypeImpl;
import com.bepotato.test.test;

public class EditType extends HttpServlet{

	public void init() throws ServletException{
		super.init();
	}
	public void destroy(){
		super.destroy();
	}
	public void doGet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
		doPost(req, resp);
	}
	public void doPost(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException{
		String typeid=req.getParameter("typeid");
		String typename=req.getParameter("typename");
		Type type=new Type();
		TypeImpl typeImpl=new TypeImpl();
		type.setName(typename);
		type.setTid(Integer.valueOf(typeid));
		if(!typeImpl.modType(type))
			System.out.println("modify type fail");
		resp.sendRedirect("SearchType");
	}
}
