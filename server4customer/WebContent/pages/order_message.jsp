<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单详情</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/order_message.css" />

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
<table class="main">
	<tr>
		<td class="lt">2015-01-22&nbsp;14:25</td>
		<td class="rt">订单完成</td>
	</tr>
	<tr>
		<td class="lt">汉堡</td>
		<td class="rt">
			<table>
				<tr>
					<td class="rt-lt">1</td>
					<td class="rt-rt">￥10</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="lt">汉堡</td>
		<td class="rt">
			<table>
				<tr>
					<td class="rt-lt">1</td>
					<td class="rt-rt">￥10</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td class="lt">汉堡</td>
		<td class="rt">
			<table>
				<tr>
					<td class="rt-lt">1</td>
					<td class="rt-rt">￥10</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr class="part-2">
		<td class="lt">优惠券</td>
		<td class="rt">-￥5</td>
	</tr>
	<tr>
		<td class="lt">合计</td>
		<td class="rt">￥25</td>
	</tr>
</table>
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
			<dt><img alt="我的订单" src="images/me_1.png" /></dt>
			<dd class="dingdan-dd">我的订单</dd>
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
