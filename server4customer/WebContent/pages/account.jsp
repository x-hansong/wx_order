<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>优惠券</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/account.css" />

  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
  
<body>
<!-- 订座头部 
<div class="body_header">
	<input class="goback" type="button" onClick="goback()" />
	<p>优惠券</p>
</div>
-->
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
