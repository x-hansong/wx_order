<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>点餐</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link type="text/css" rel="stylesheet" href="css/order.css" />
    <link type="text/css" rel="stylesheet" href="css/swiper.3.1.2.min.css" />

  </head>
  <%
  request.setCharacterEncoding("utf-8");
  response.setCharacterEncoding("utf-8");
   %>
  
<body>
<!-- 头部
<div class="body_header">点餐</div>
 -->
<!-- 主体 -->
<div class="main">
<!-- 左侧菜单 -->
	<div class="nav-if">
	<ul id="nav">
  	<li class="current"><a href="#st1">推荐</a><b></b></li>
  	<li><a href="#st2">披萨</a><b>1</b></li>
 	 <li><a href="#st3">意面</a><b>2</b></li>
 	 <li><a href="#st4">扒&amp;饭</a><b>3</b></li>
 	 <li><a href="#st5">汤</a><b>4</b></li>
 	 <li><a href="#st6">小吃</a><b>5</b></li>
 	 <li><a href="#st7">饮品</a><b>6</b></li>
	 </ul>
	 </div>
	 <!-- 右侧菜品内容 -->
	 <div id="container" class="container">
	 	<div class="section" id="st1">
	<div class="title">推荐</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	<div class="section" id="st2">
	<div class="title">披萨</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	<div class="section" id="st3">
	<div class="title">意面</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	<div class="section" id="st4">
	<div class="title">扒&amp;饭</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	<div class="section" id="st5">
	<div class="title">汤</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	<div class="section" id="st6">
	<div class="title">小吃</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	<div class="section" id="st7">
	<div class="title">饮品</div>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	<div class="prt-lt">
    	<div class="lt-lt"><img src="#"></div>
        <div class="lt-ct">
        	<p>菜名</p>
			<p>份量</p>
            <p class="pr">￥<span class="price">60.00</span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="0">
        	<input type="button" class="add" value="+">
        </div>
    </div>
	</div>
	 </div>
</div>
<!-- 统计标签 -->
<div class="amount">
<div class="amount-lt">
        <p>合计:<span id="total" class="total">0.00元</span><span class="nm">(<label class="share">0</label>份)</span></p>
    </div>
    <div class="amount-rt">
    	<a href="<%=request.getContextPath() %>/pages/order_sure.jsp"><p>选好了</p></a>
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
			<dt><img alt="点餐" src="images/order_1.png" /></dt>
			<dd class="diancan-dd">点餐</dd>
		</dl>
	</a></li>
	<li><a href="<%=request.getContextPath() %>/pages/my_order.jsp">
		<dl>
			<dt><img alt="我的订单" src="images/me.png" /></dt>
			<dd class="dingdan-dd">我的订单</dd>
		</dl>
	</a></li>
	</ul>
</div>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="js/swiper.3.1.2.min.js"></script>
<script type="text/javascript" src="js/jquery.nav.js"></script>
<script type="text/javascript">
$(function(){
	$('#nav').onePageNav();
});

</script>
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
var v=0;
var n=0;
<!--计算总额--> 
$(".lt-rt").each(function(){ 
s+=parseInt($(this).find('input[class*=result]').val())*parseFloat($(this).siblings().find('span[class*=price]').text()); 

});

<!--计算菜种-->
var nIn = $("li.current a").attr("href");
$(nIn+" input[type='text']").each(function() {
	if($(this).val()!=0){
		n++;
	}
});

<!--计算总份数-->
$("input[type='text']").each(function(){
	v += parseInt($(this).val());
});
if(n>0){
	$(".current b").html(n).show();		
	}else{
	$(".current b").hide();		
		}	
$(".share").html(v);
$("#total").html(s.toFixed(2)); 
} 
setTotal(); 

}) 
</script> 
<script type="text/javascript" src="js/waypoints.min.js"></script>
<script type="text/javascript" src="js/navbar2.js"></script>
</body>
</html>
