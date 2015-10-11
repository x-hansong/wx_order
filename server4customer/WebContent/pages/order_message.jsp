<%@page import="com.bepotato.model.OrderItem"%>
<%@page import="com.bepotato.model.Dish"%>
<%@page import="com.bepotato.model.DishImpl"%>
<%@page import="com.bepotato.model.Order"%>
<%@page import="com.bepotato.model.OrderImpl"%>
<%@page import="com.bepotato.model.User"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我的订单</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/order_message.css" />
    <link type="text/css" rel="stylesheet" href="css/order_sure.css" />
  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
  
<body>
<!-- 订座头部 
<div class="body_header">
	<input class="goback" type="button" onClick="goback()" />
	<p>订单详情</p>
</div>
-->
<%
User user = null;
user = (User)session.getAttribute("user");
OrderImpl orderImpl = new OrderImpl();
DishImpl dishImpl = new DishImpl();
List<Order> orders = new ArrayList<Order>();
List<OrderItem> items = new ArrayList<OrderItem>();
orders = orderImpl.findOrdersByUid(user.getUid());

if(orders != null && orders.size()>0){
for(Order o : orders){
String state = null;
if(o.getState() == 1){
state = "处理中";
}else{
state = "已完成";
}
items = orderImpl.getOrderItem(o.getOid());
if(items != null && items.size()>0){

 %>


<table class="main">
	<tr>
		<td class="lt"><%=o.getTime() %></td>
		<td class="rt"><%=state %></td>
	</tr>
	<%
	for(OrderItem i:items){
	Dish dish = dishImpl.findById(i.getDid());
	if(dish != null){
	 %>
	<tr>
		<td class="lt"><%=dish.getName() %></td>
		<td class="rt">
			<table>
				<tr>
					<td class="rt-lt"><%=i.getNum() %></td>
					<td class="rt-rt">￥<%=dish.getPrice()*i.getNum()*dish.getSellcount() %></td>
				</tr>
			</table>
		</td>
	</tr>
	<%
	}
	}
	 %>

	
	<tr class="part-2">
		<td class="lt">优惠券</td>
		<td class="rt">0</td>
	</tr>
	<tr>
		<td class="lt">合计</td>
		<td class="rt">￥<%=o.getPrice() %></td>
	</tr>
</table>
<!-- 分割线 -->
<HR style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#987cb9 SIZE=10>
<%
}
}
}else{
 %>
  <form action="<%=request.getContextPath()%>/pages/order.jsp">
 <div class="submit">
<input type="submit" class="input-2" name="submit" value="什么都没有,回去点餐吧">
</div>
 
 </form>
 
<%
}
 %>


<!-- 底部菜单 -->
<div class="body_footer">
	<ul>
	<li><a href="<%=request.getContextPath() %>/pages/home.jsp">
		<dl>
			<dt><img alt="主页" src="images/home.png" /></dt>
			<dd class="zhuye-dd">主页</dd>
		</dl>
	</a></li>
	<li><a href="<%=request.getContextPath() %>/pages/order.jsp">
		<dl>
			<dt><img alt="点餐" src="images/order.png" /></dt>
			<dd class="diancan-dd">点餐</dd>
		</dl>
	</a></li>
	<li><a href="<%=request.getContextPath() %>/pages/my_order.jsp">
		<dl>
			<dt><img alt="个人中心" src="images/me_1.png" /></dt>
			<dd class="dingdan-dd">个人中心</dd>
		</dl>
	</a></li>
	</ul>
</div>
<script>
function goback()
  {
  window.history.back();
  };
</script>
</body>
</html>
