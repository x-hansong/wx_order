<%@page import="com.bepotato.model.Dish"%>
<%@page import="com.bepotato.model.DishImpl"%>
<%@page import="com.bepotato.model.OrderItem"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单确认</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/order_sure.css" />

  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
  
<body>
<!-- 头部 
<div class="body_header">
	<input class="goback" type="button" onClick="goback()" />
	<p>订单确认</P>
</div>
-->

<%
List<OrderItem> itemCookieList = new ArrayList<OrderItem>();
Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0)
        {
            for(Cookie c:cookies)
            {
                if(c.getName().startsWith("dish"))
                {
                	if(Integer.parseInt(c.getValue()) != 0){
                	String idString = c.getName().substring(4);
                	int id = Integer.parseInt(idString);
                	OrderItem item = new OrderItem();
                	item.setDid(id);
                	item.setNum(Integer.parseInt(c.getValue()));
                	itemCookieList.add(item);
                	}
                }
            }
        }
 %>
<%
if(itemCookieList.size() >0)
{
 %>

<!-- 提示 -->
<div class="tips">请点击右上角扫描桌台号</div>
<form action="<%=request.getContextPath()%>/CartServlet">
<!-- 已选菜品 -->

<%
for(OrderItem item : itemCookieList){
DishImpl dishImpl = new DishImpl();
Dish dish = dishImpl.findById(item.getDid());
 %>
<div class="dishes">
<div class="lt"><%=dish.getName() %></div>
<div class="rt">
	<input type="button" class="minus"  value="-">
	<input type="text" class="result" value="<%=item.getNum()%>">
	<input type="hidden" class="id" value="<%=dish.getDid()%>">
	<input type="button" class="add" value="+">	
	<p class="pr">￥<span class="price"><%=dish.getPrice() %></span></p>
</div>
</div>
<%
}
 %>

<!-- 支付方式 -->
<div class="pay pay-top">
	<label class="label-pay" for="pay-1">微信支付</label>
	<input type="radio" class="radio-pay" id="pay-1" name="pay" value="1" checked="checked">
	</div>
<div class="pay">
	<label class="label-pay" for="pay-2">现金支付</label>
	<input type="radio" class="radio-pay" id="pay-2" name="pay" value="2">
</div>
<!-- 优惠券 -->
<div class="dishes dishes-2"><div class="account">优惠券</div></div>
<!-- 押金返还 -->
<div class="dishes"><div class="give-back">押金返还</div></div>
<!-- 手动输入桌台号 -->
<div class="dishes dishes-2">
<input type="text" name="zhuohao" class="zhuohao" placeholder="输入桌台号（00~99)">
 </div>
 <!-- 总计 -->
<div class="amount">
<div class="amount-lt">
        <p>￥<span id="total" class="total">0.00</span></p>
    </div>
    <div class="amount-rt">
		<p>请点击右上角扫描桌台号</p>
    </div>
</div>
<!-- 提交按钮 -->
<div class="submit">
<input type="submit" class="input-2" name="submit" value="提交订单">
</div>
</form>

<%
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
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script> 
$(function(){ 

$(".add").click(function(){
var t=$(this).parent().find('input[class*=result]'); 
var id=$(this).parent().find('input[class*=id]');
var name ="dish"+id.val();
t.val(parseInt(t.val())+1);
addCookie(name,t.val(),0.5);
setTotal(); 
})
 
$(".minus").click(function(){ 
var t=$(this).parent().find('input[class*=result]');
var id=$(this).parent().find('input[class*=id]');
var name ="dish"+id.val(); 
t.val(parseInt(t.val())-1);
addCookie(name,t.val(),0.5);
if(parseInt(t.val())<=0){ 
t.val(0); 
deleteCookie(name);
} 
setTotal(); 


})

//该函数返回名称为name的cookie值，如果不存在则返回空
function getCookie(name){ 
var strCookie=document.cookie; 
var arrCookie=strCookie.split("; "); 
for(var i=0;i<arrCookie.length;i++){ 
var arr=arrCookie[i].split("="); 
if(arr[0]==name)return arr[1]; 
} 
return ""; 
}

//该函数接收3个参数：cookie名称，cookie值，以及在多少小时后过期。
//这里约定expiresHours为0时不设定过期时间，即当浏览器关闭时cookie自动消失。
function addCookie(name,value,expiresHours){ 
var cookieString=name+"="+value; 
//判断是否设置过期时间 
if(expiresHours>0){ 
var date=new Date(); 
date.setTime(date.getTime+expiresHours*3600*1000); 
cookieString=cookieString+"; expires="+date.toGMTString(); 
} 
document.cookie=cookieString; 
}

//该函数可以删除指定名称的cookie
function deleteCookie(name){ 
var date=new Date(); 
date.setTime(date.getTime()-10000); 
document.cookie=name+"=v; expires="+date.toGMTString(); 
}



function setTotal(){ 
var s=0;
<!--计算总额--> 
$(".dishes .rt").each(function(){ 
s+=parseInt($(this).find('input[class*=result]').val())*parseFloat($(this).find('span[class*=price]').text()); 

});
$("#total").html(s.toFixed(2)); 
} 
setTotal(); 

}) 
</script>
<script>
function goback()
  {
  window.history.back();
  };
</script>
</body>
</html>
