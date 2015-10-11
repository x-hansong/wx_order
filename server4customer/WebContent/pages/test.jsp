<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'test.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
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
    this.time = config.time==null?6000:config.time;//持续时间  
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
  
  <body>
    This is my JSP page. <br>
    <script type="text/javascript">
toastFunction("成功调用!");
</script>
  </body>
</html>
