package com.bepotato.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bepotato.common.Data;
import com.bepotato.model.Shop;
import com.bepotato.model.ShopImpl;

/**
 * Servlet implementation class EditShop
 */
public class EditShop extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditShop() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		String phonenumber=request.getParameter("phonenumber");
		String address=request.getParameter("address");
		String remark=request.getParameter("remark");
		String shopname=request.getParameter("shopname");
		Shop shop=new Shop();
		ShopImpl shopImpl=new ShopImpl();
		shop.setLocation(address);
		shop.setName(shopname);
		shop.setPhone(phonenumber);
		shop.setRemark(remark); 
		shop.setSid(1); /* change */
		if(!shopImpl.addShop(shop)){
			System.out.println("update shop unsuccessful");
		}
		/* change */
		shop=shopImpl.findById(1);
		request.getSession().setAttribute(Data.SHOPS, shop);
		response.sendRedirect("../design.jsp");
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

}
