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
<!-- 提示 -->
<div class="tips">请点击右上角扫描桌台号</div>
<form action="#">
<!-- 已选菜品 -->
<div class="dishes">
<div class="lt">梅干菜扣肉盖饭</div>
<div class="rt">
	<input type="button" class="minus"  value="-">
	<input type="text" class="result" value="0">
	<input type="button" class="add" value="+">	
	<p class="pr">￥<span class="price">60</span></p>
</div>
</div>
<div class="dishes">
<div class="lt">红烧狮子头盖饭</div>
<div class="rt">
	<input type="button" class="minus"  value="-">
	<input type="text" class="result" value="0">
	<input type="button" class="add" value="+">	
	<p class="pr">￥<span class="price">60</span></p>
</div>
</div>
<div class="dishes">
<div class="lt">红烧肉盖饭</div>
<div class="rt">
	<input type="button" class="minus"  value="-">
	<input type="text" class="result" value="0">
	<input type="button" class="add" value="+">	
	<p class="pr">￥<span class="price">60</span></p>
</div>
</div>
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
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script> 
$(function(){ 

$(".add").click(function(){
var t=$(this).parent().find('input[class*=result]'); 
t.val(parseInt(t.val())+1);
setTotal(); 
})
 
$(".minus").click(function(){ 
var t=$(this).parent().find('input[class*=result]'); 
t.val(parseInt(t.val())-1);
if(parseInt(t.val())<0){ 
t.val(0); 
} 
setTotal(); 


})
 
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
