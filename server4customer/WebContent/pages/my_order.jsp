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
    
    <title>个人中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/my_order.css" />

  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
  <%
  User user = (User)session.getAttribute("user");
   %>
<body>
<!-- 订座头部 
<div class="body_header">
	<input class="goback" type="button" onClick="goback()" />
	<p>我的订单</p>
</div>
-->
<!-- 第一部分信息 -->
<div class="part-1">
<!-- 微信信息 -->
	<div class="my-message">
		<div class="lt-lt">
			<img alt="微信头像" src="<%=user.getHeadimgurl()%>">	
		</div>
		<div class="lt-rt">
			<p class="my-name">微信昵称/电话号码</p>
		</div>
		<div class="rt">
			<a href="<%=request.getContextPath() %>/pages/user_message.jsp"><img src="images/u84.png"></a>
		</div>
	</div>
</div>
<!-- 第二部分信息 -->
<div class="part-2">
<!-- 已点订单 -->
	<div class="ordered">
		<div class="lt">
			<p>我的订单</p>
		</div>
		<div class="rt">
			<a href="<%=request.getContextPath() %>/pages/order_message.jsp"><img src="images/u84.png"></a>	
		</div>
	</div>
</div>
<div class="part-2">
<!-- 已订订座 -->
	<div class="ordered">
		<div class="lt">
			<p>我的订座</p>
		</div>
		<div class="rt">
			<a href="<%=request.getContextPath() %>/pages/orderseat_message.jsp"><img src="images/u84.png"></a>	
		</div>
	</div>
</div>
<div class="part-2">
<!-- 股东卡信息 -->
	<div class="card">
		<div class="lt">
			<p>股东卡&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;XXXXXXX</p>
		</div>
	</div>
</div>
<div class="part-2">
<!-- 优惠券信息 -->
	<div class="account">
		<div class="lt">
			<p>优惠券</p>
		</div>
		<div class="rt">
			<a href="<%=request.getContextPath() %>/pages/account.jsp"><img src="images/u84.png"></a>
				</div>
	</div>
</div>
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
