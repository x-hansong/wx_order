package com.bepotato.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bepotato.model.Advance;
import com.bepotato.model.AdvanceImpl;
import com.bepotato.model.User;
import com.bepotato.util.WeixinUtil;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		int sid = 1;
		int uid = user.getUid();
		Timestamp time = new Timestamp(new Date().getTime());
	    String timeString=request.getParameter("time")+":00";
	    System.out.println(timeString);
	    Timestamp booktime = new Timestamp(System.currentTimeMillis());
	    booktime = Timestamp.valueOf(timeString);
	    int men = Integer.parseInt(request.getParameter("number"));
	    System.out.println(men);
	    String name = request.getParameter("user-name");
	    System.out.println(name);
	    String phone = request.getParameter("telephone");
	    System.out.println(phone);
	    String remark = request.getParameter("beizhu");
	    System.out.println(remark);
	    
	    Advance advance = new Advance();
	    advance.setSid(sid);
	    advance.setUid(uid);
	    advance.setTime(time);
	    advance.setBooktime(booktime);
	    advance.setMen(men);
	    advance.setName(name);
	    advance.setPhone(phone);
	    advance.setRemark(remark);
	    
	    AdvanceImpl advanceImpl = new AdvanceImpl();
	    boolean flag = advanceImpl.addAdvance(advance);
	    if (flag) {
			System.out.println("成功订座");
			request.getRequestDispatcher("/pages/home.jsp?bookingseat=1").forward(request, response);
			//response.sendRedirect(request.getContextPath()+"/pages/home.jsp");
		}else{
			System.out.println("订座失败");
			request.getRequestDispatcher("../pages/order_seat.jsp?bookingseat=0").forward(request, response);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	}

}
