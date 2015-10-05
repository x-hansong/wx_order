<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订座</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="css/order-seat.css" rel="stylesheet" type="text/css">	
	<link href="css/mobiscroll.css" rel="stylesheet" type="text/css">
	<link href="css/mobiscroll_002.css" rel="stylesheet" type="text/css">
	<link href="css/mobiscroll_003.css" rel="stylesheet" type="text/css">
    
	<script src="js/jquery.1.7.2.min.js"></script>
    <script src="js/mobiscroll_002.js" type="text/javascript"></script>
	<script src="js/mobiscroll_004.js" type="text/javascript"></script>
	<script src="js/mobiscroll.js" type="text/javascript"></script>
	<script src="js/mobiscroll_003.js" type="text/javascript"></script>
	<script src="js/mobiscroll_005.js" type="text/javascript"></script>
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
   String bookingseat = request.getParameter("bookingseat");
   if(bookingseat != null && "0".equals(bookingseat)){
   %>
   <script type="text/javascript">
   toastFunction("订座失败<br/>请重试");
   </script>
   <%
   }
   %>
   
<!-- 订座头部 
<div class="body_header">
	<input class="goback" type="button" onClick="goback()" />
	<p>订座</p>
</div>
-->
<form action="<%=request.getContextPath() %>/BookingServlet" method="get" >
<!-- 时间选择 -->
<div class="content">
<div class="dingzuo">订座</div>
		<div class="demos">
		<table>
		<tr>
			<td><label for="time">就餐时间：</label></td>
			<td><input value="2015-9-20 00:00" class="input-1" readonly="readonly" name="time" id="appDateTime" type="text"></td>
			</tr>
			</table>
		</div>
</div>
<!-- 人数选择 -->
<div class="content">
<div class="number">
<table>
<tr>
<td><label for="number">人数：</label></td>
<td><select name="number" num="1">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select></td>
			</tr>
			</table>
</div>
</div>
<!-- 订金 -->
<div class="content">
<div class="order-money">
	<p style="display:block; float:left">订金：&nbsp;30元</p>
	<p class="prompt">订金将从消费金额中减除</p>
</div>
</div>
<!-- 姓名 -->
<div class="content content-1">
<div class="lianxi">联系</div>
<table>
<tr>
<td><label for="user-name">姓名：</label></td>
<td><input type="text" class="input-1" name="user-name"></td>
</tr>
</table>
</div>
</div>
<div class="content">
<table>
<tr>
<td><label for="telephone">手机号码：</label></td>
<td><input type="text" class="input-1" name="telephone"></td>
</tr>
</table>
</div>
<div class="content">
<label for="beizhu">备注：</label></br>
<textarea rows="5" cols="25" name="beizhu"></textarea>
</div>
<div class="submit">
<input type="submit" class="input-2" name="submit" value="确认订座">
</div>
</form>
<script>
function goback()
  {
  window.history.back();
  };
</script>
<script type="text/javascript">
        $(function () {
			var currYear = (new Date()).getFullYear();	
			var opt={};
			opt.datetime = {preset : 'datetime'};
			opt.default = {
				theme: 'android-ics light', //皮肤样式
		        display: 'modal', //显示方式 
		        mode: 'scroller', //日期选择模式
				dateFormat: 'yyyy-mm-dd',
				lang: 'zh',
				showNow: true,
				nowText: "今天",
		        startYear: currYear - 10, //开始年份
		        endYear: currYear + 10 //结束年份
			};
		  	var optDateTime = $.extend(opt['datetime'], opt['default']);
		    $("#appDateTime").mobiscroll(optDateTime).datetime(optDateTime);
        });
    </script>

</body>
</html>
