<%@page import="com.bepotato.model.UserImpl"%>
<%@page import="com.bepotato.model.User"%>
<%@page import="com.bepotato.util.UserUtil"%>
<%@page import="net.sf.json.JSONObject"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>比逗@大学城</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/home.css" />
    <link rel="stylesheet" href="css/swiper.3.1.2.min.css" />
    
    <script src="js/jquery.1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css">
     #toastMessage{
        position: absolute;
        border-radius: 15px;
        cursor:pointer;
     }
   </style>
   
        <script type="text/javascript">
/** 
 * 模仿android里面的Toast效果，主要是用于在不打断程序正常执行的情况下显示提示数据 
 * @param config 
 * @return 
 */  
var Toast = function(config){  
    this.context = config.context==null?$('body'):config.context;//上下文  
    this.message = config.message;//显示内容  
    this.time = config.time==null?10000:config.time;//持续时间  
    this.left = config.left;//距容器左边的距离  
    this.top = config.top;//距容器上方的距离  
    this.init();  
}  
var msgEntity;  
Toast.prototype = {  
    //初始化显示的位置内容等  
    init : function(){  
        $("#toastMessage").remove();  
        //设置消息体  
        var msgDIV = new Array();  
        msgDIV.push('<div id="toastMessage">');  
        msgDIV.push('<span>'+this.message+'</span>');  
        msgDIV.push('</div>');  
        msgEntity = $(msgDIV.join('')).appendTo(this.context);  
        //设置消息样式  
        var toastMessageWidth = $('#toastMessage').innerWidth();
        var toastMessageHeight = $('#toastMessage').innerHeight();
        var windowWidth = $(window).width();
        var windowHeight = $(window).height();
        var newWidth = (windowWidth - toastMessageWidth - 80) / 2 + "px";
        var newHeight = (windowHeight - toastMessageHeight - 80) / 2 + "px";
        msgEntity.css({'left':newWidth,'z-index':'999999','top':newHeight,'background-color':'black','color':'white',
            'padding':'30px','font-size':'18px','border':'3px solid #f8c26d'});  
    },  
    //显示动画  
    show :function(){  
        msgEntity.fadeIn(this.time/2);  
        msgEntity.fadeOut(this.time/2);  
    }        
}
function toastFunction(messageString){
    new Toast({context:$('body'),message:messageString}).show();
    }
</script>


  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
   
   <%
   String code = request.getParameter("code");
   //判断是否第一次进入
   if(code != null){
   JSONObject jsonObject = UserUtil.getAuthJsonObj(code);
   if(jsonObject !=null){
   String openid = jsonObject.getString("openid");
   //int subscribe = UserUtil.getSubscribeCode(OpenId);
   //if(subscribe == 1){
   User userTemp = UserUtil.getUserByOpenId(openid);
   //更新用户的信息，前提是用户已经关注了公众号
   UserImpl userImpl = new UserImpl();
   userImpl.refreshUser(userTemp, openid);
   User user = userImpl.findByOpenId(openid);
   session.setAttribute("user", user);
   //}else{
   //}
   }
   }
    %>

  
<body>

    <% 
   String bookingseat = request.getParameter("bookingseat");
   if(bookingseat != null && "1".equals(bookingseat)){
   %>
   <script type="text/javascript">
   toastFunction("成功订座<br/>可在个人中心查看");
   </script>
   <%
   }
   %>
   
    <% 
   String ordersure = request.getParameter("ordersure");
   if(ordersure != null && "1".equals(ordersure)){
   %>
   <script type="text/javascript">
   toastFunction("成功下单<br/>可在个人中心查看");
   </script>
   <%
   }
   %>
   

<!-- 优惠活动信息 -->
<div class="discount">
	<div class="gonggao">公告</div>
 <div class="swiper-container swiper-container-1">
        <div class="swiper-wrapper">
            <div class="swiper-slide">全场八八折</div>
            <div class="swiper-slide">凭学生证赠饮</div>
            <div class="swiper-slide">全场八八折</div>
            <div class="swiper-slide">凭学生证赠饮</div>
            <div class="swiper-slide">全场八八折</div>
        </div>
  </div>
</div>
<!-- 推荐菜品 -->
<div class="recommend">
<div class="tuijian">推荐</div>
<div class="swiper-container swiper-container-2">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img alt="菜品1" src="images/banner01.jpg" /></div>
            <div class="swiper-slide"><img alt="菜品2"  src="images/banner02.jpg" /></div>
            <div class="swiper-slide"><img alt="菜品3" src="images/banner03.jpg" /></div>
            <div class="swiper-slide"><img alt="菜品4" src="images/banner04.jpg" /></div>
        </div>
		 <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
</div>
</div>
<!-- 订座与呼叫服务员 -->
<div class="message message-1">
<a href="<%=request.getContextPath() %>/pages/order_seat.jsp">
	<div class="order-seat" align="center"><div class="juzhong"><img alt="订座" src="images/bookSeats.png" align="middle" />订座</div></div>
</a>
<script type="text/javascript">
var call = "已经通知<br/>请稍等";
</script>
<div class="call-one" align="center" onclick="toastFunction(call)"><img  alt="服务员" src="images/callWaiter.png" align="middle" />
  服务员</div>

</div>
<!-- 联系电话 -->
<div class="message">
	<div class="dianpu">店铺</div>
	<div class="telephone"><p>联系电话:&nbsp;&nbsp;020-12345678</p></div>
</div>
<!-- 地址指引 -->
<div class="message-2">
	<div class="address"><p>地址:&nbsp;&nbsp;大学城北岗村233号</p><a href="#"><img  alt="地址指引" src="images/location.png" /></a></div>
</div>
<!-- 底部菜单 -->
<div class="body_footer">
	<ul>
	<li><a href="<%=request.getContextPath() %>/pages/home.jsp">
		<dl>
			<dt><img alt="主页" src="images/home_1.png" /></dt>
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
			<dt><img alt="个人中心" src="images/me.png" /></dt>
			<dd class="dingdan-dd">个人中心</dd>
		</dl>
	</a></li>
	</ul>
</div>
<script type="text/javascript" src="js/swiper.3.1.2.min.js"></script>
<script>
var swiper1 = new Swiper('.swiper-container-1', {
        paginationClickable: true,
        autoplay: 2500,
		direction:'vertical',
        autoplayDisableOnInteraction: false
    });
var swiper2 = new Swiper('.swiper-container-2', {
        pagination: '.swiper-pagination',
        paginationClickable: true,
        centeredSlides: true,
        autoplay: 2500,
        autoplayDisableOnInteraction: false
    })
</script>

</body>
</html>
