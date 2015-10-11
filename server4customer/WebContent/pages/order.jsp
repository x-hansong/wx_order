<%@page import="com.bepotato.model.OrderItem"%>
<%@page import="com.bepotato.model.Dish"%>
<%@page import="com.bepotato.model.DishImpl"%>
<%@page import="com.bepotato.model.TypeImpl"%>
<%@page import="com.bepotato.model.Type"%>
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
  
<body>

    <% 
   String ordersure = request.getParameter("ordersure");
   if(ordersure != null && "2".equals(ordersure)){
   %>
   <script type="text/javascript">
   toastFunction("肚子好饿了<br/>吃点东西嘛");
   </script>
   <%
   }
   %>

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
	 <%
	 //获取cookie中未成功支付的记录
List<OrderItem> itemCookieList = new ArrayList<OrderItem>();
Cookie[] cookies = request.getCookies();
		if(cookies!=null&&cookies.length>0)
        {
            for(Cookie c:cookies)
            {
                if(c.getName().startsWith("dish"))
                {
                if(Integer.parseInt(c.getValue()) > 0){
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
	 TypeImpl typeImpl = new TypeImpl();
	 List<Type> typeList = typeImpl.getTypes();
	 if(typeList !=null){
	 for(int i=0;i<typeList.size();i++){
	 Type type = typeList.get(i);
	  %>
	 
	<div class="section" id="st<%=type.getTid() %>">
	<div class="title"><%=type.getName() %></div>
	
	<%
	DishImpl dishImpl = new DishImpl();
	List<Dish> dishList = dishImpl.findByType(type.getTid());
	if(dishList !=null){
	for(int j=0;j<dishList.size();j++){
	Dish dish = dishList.get(j);
	int CookieNum =0;
	for(OrderItem orderItem : itemCookieList){
	if(dish.getDid() == orderItem.getDid()){
	CookieNum = orderItem.getNum();
	}
	}
	 %>
  	<div class="prt-lt">
    	<div class="lt-lt"><img src="<%=dish.getImg() %>"></div>
        <div class="lt-ct">
        	<p><%=dish.getName() %></p>
			<p>介绍：<%=dish.getRemarkString() %></p>
            <p class="pr">￥<span class="price"><%=dish.getPrice() %></span></p>
        </div>
        <div class="lt-rt">
        	<input type="button" class="minus"  value="-">
        	<input type="text" class="result" value="<%=CookieNum%>">
        	<input type="hidden" class="id" value="<%=dish.getDid()%>">
        	<input type="button" class="add" value="+">
        </div>
    </div>
    <%
    }
    }
     %>
    </div>
    <%
    }
    }
     %>
    <%--测试代码 --%>
    <%
    Cookie test = new Cookie("name","test");
    response.addCookie(test);
     %>
    
	
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
			<dt><img alt="个人中心" src="images/me.png" /></dt>
			<dd class="dingdan-dd">个人中心</dd>
		</dl>
	</a></li>
	</ul>
</div>

<script type="text/javascript">
function doCart(){
var ids = document.querySelectorAll(".id"); 
var nums = document.querySelectorAll(".result"); 
var length = ids.length;
var CartString; 
for(var i=0; i<length; i++){ 
if(nums[i] !=0){
var id=ids[i];
var num = num[i];
CartString +=id+"-"+num+"*";
}
} 
document.cookie="CartString="+CartString;
}
</script>


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
cookieString=cookieString+"; expires="+date.toGMTString()+";path=/"; 
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
var v=0;
var n=0;
//计算总额
$(".lt-rt").each(function(){ 
s+=parseInt($(this).find('input[class*=result]').val())*parseFloat($(this).siblings().find('span[class*=price]').text()); 

});

//计算菜种
var nIn = $("li.current a").attr("href");
$(nIn+" input[type='text']").each(function() {
	if($(this).val()!=0){
		n++;
	}
});

//计算总份数
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
