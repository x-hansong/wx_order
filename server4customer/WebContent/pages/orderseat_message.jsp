<%@page import="com.bepotato.model.Advance"%>
<%@page import="com.bepotato.model.AdvanceImpl"%>
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
    
    <title>我的订座</title>
    
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
User user =null;
user = (User)session.getAttribute("user");
AdvanceImpl advanceImpl =new AdvanceImpl();
List<Advance> advances = new ArrayList<Advance>();
advances = advanceImpl.findAdvanceByUid(user.getUid());
if(advances != null && advances.size()>0){
for(Advance ad:advances){
if(ad !=null){

 %>

<table class="main">
	<tr>
		<td class="lt">下单时间</td>
		<td class="rt"><%=ad.getTime() %></td>
	</tr>
	<tr>
		<td class="lt">预定时间</td>
		<td class="rt"><%=ad.getBooktime() %></td>
	</tr>
	<tr>
		<td class="lt">人数</td>
		<td class="rt"><%=ad.getMen() %></td>
	</tr>
	<tr>
		<td class="lt">联系人</td>
		<td class="rt"><%=ad.getName() %></td>
	</tr>
	<tr>
		<td class="lt">联系电话</td>
		<td class="rt"><%=ad.getPhone() %></td>
	</tr>
	<tr>
		<td class="lt">桌号</td>
		<td class="rt"><%=ad.getLocation() %></td>
	</tr>
	<tr>
		<td class="lt">备注</td>
		<td class="rt"><%=ad.getRemark() %></td>
	</tr>
</table>
<!-- 分割线 -->
<HR style="FILTER: progid:DXImageTransform.Microsoft.Shadow(color:#987cb9,direction:145,strength:15)" width="100%" color=#987cb9 SIZE=10>
<%
}
}
}else{
 %>
   <form action="<%=request.getContextPath()%>/pages/home.jsp">
 <div class="submit">
<input type="submit" class="input-2" name="submit" value="什么都没有,回去再约吧">
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
