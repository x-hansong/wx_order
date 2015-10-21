<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="css/common.css"/>
    <link rel="stylesheet" type="text/css" href="css/main.css"/>
    <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
    <script language="javascript" type="text/javascript" src="js/jquery-1.11.3.js"></script>
	<script type="text/javascript">
		/*
		function addrow(){
		var tb = document.getElementById('website_table');
        var row = tb.insertRow(1);
		var cell=row.insertCell(0);
		cell.innerHTML="<a href='#' target='_blank'>站点2</a>";
		return true;
		}
		*/
		var x;
		function deleteweb(x){
			document.getElementById('webmanage').deleteRow(x);
		}
	</script>
	<%List typeslist=null;
	  List orderslist=null;
	  typeslist=(List)session.getAttribute(Data.TYPES);
	  orderslist=(List)session.getAttribute(Data.ORDERS);
	  if(typeslist!=null){
		  int ntype=typeslist.size();
		  int norder=orderslist.size();
		  Type type=null;
		  Order order=null;
		  %>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="design.jsp">首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="#">管理员</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            <h1>菜单</h1>
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
                <li>
                    <a href="#"><i class="icon-font">&#xe000;</i>店铺信息</a>
                    <ul class="sub-menu">
                        <li><a href="design.jsp">店铺信息</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe001;</i>菜品管理</a>
                    <ul class="sub-menu">
                    	<%for(int i=0;i<ntype;i++){
							type=(Type)typeslist.get(i);%>
                        <li><a href="servlet/SearchProduct?typeid=<%=type.getTid()%>"><%=type.getName()%></a></li>
                        <%}%>
                        <li><a href="servlet/SearchType">编辑类别</a></li>
 
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe005;</i>订座管理</a>
                    <ul class="sub-menu">
                        <li><a href="#">已受理</a></li>
                        <li><a href="#">未受理</a></li>
 
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe008;</i>订单管理</a>
                    <ul class="sub-menu">
                        <li><a href="servlet/ShowAcceptOrders?state=0">待接单</a></li>
                        <li><a href="servlet/ShowAcceptOrders?state=1">未完成</a></li>
                        <li><a href="servlet/ShowAcceptOrders?state=2">已完成</a></li>
 
                    </ul>
                </li>
                <li>
                    <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
                    <ul class="sub-menu">
                       <li><a href="#">系统管理</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="design.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">待接单</span></div>
        </div>
        <div style="width:1000px;height:500px;margin:30px">
        <%for(int i=0;i<norder;i++){
			order=(Order)orderslist.get(i);%>
        	<div style="width:800px;height:200px;">
            	<div id="sisth" style="width:500px;height:40px;">
                <span style="display:inline-block;background:#9FF;width:160px;height:40px;text-align:center;line-height:40px" id="first"><%=i+1%></span>
                <span style="display:none;margin-left:220px;width:50px;height:40px;text-align:center;line-height:40px;cursor:default" id="second">
                <i class="icon-font" >&#xe025;</i>
                </span>
                <span style="display:none;margin-right:0;width:50px;height:40px;text-align:center;line-height:40px;cursor:default" id="third">
                <i class="icon-font" >&#xe024;</i>
                </span>
                </div>
                
                    <div style="position:absolute;float:left;height:40px;line-height:40px;width:80px;text-align:center">
                    <span><%=order.getTime()%></span>
                    </div>
                    <div style="position:absolute;float:left;margin-left:80px;width:0px;height:100px;border:1px solid #000;"></div>
            <div style="position:absolute;float:left;margin-left:120px;margin-top:10px;height:150px;width:500px">
            <ul style="list-style-type:disc">
                <li id="forth">
                	<span style="width:250px;display:inline-block;"><%=order.getLocation()%></span>
                    <span style="width:50px;display:inline-block;">*<%=order.getDiscount()%></span>
                    <span style="cursor:default;display:none;" id="fifth"><i class="icon-font">&#xe024;</i></span>
                </li>    
                <li>
                	<span style="width:250px;display:inline-block;"><%=order.getRemark()%></span>
                    <span style="width:50px;display:inline-block;">*<%=order.getDiscount()%></span>
                    <span style="cursor:default;display:none;"><i class="icon-font">&#xe024;</i></span>
                </li>
                <li>
                	<span style="width:250px;display:inline-block;"><%=order.getPrice()%></span>
                    <span style="width:50px;display:inline-block;">*<%=order.getDiscount()%></span>
                    <span style="cursor:default;display:none;"><i class="icon-font">&#xe024;</i></span>
                </li>
                <li>
                	<span style="width:250px;display:inline-block;"><%=order.getState()%></span>
                    <span style="width:50px;display:inline-block;">*<%=order.getDiscount()%></span>
                    <span style="cursor:default;display:none;"><i class="icon-font">&#xe024;</i></span>
                </li>   
            </ul>
            
            
            </div>	
            </div>
            <%}
	  }
	  else{
		  response.sendRedirect("login.jsp");
	  }%>
        
        </div>
    </div>
    <!--/main-->
</div>

<script type="text/javascript">
$(function(){
	$("#first").bind("click",function(){
		$("#sisth").css("background","#9FF");
		$("#second").css("display","inline-block");
		$("#third").css("display","inline-block");
		$("#fifth").css("display","inline-block");
		$("#fifth").bind("click",function(){
			$("#forth").remove();
			
			});
		$("#second").bind("click",function(){
			$("#sisth").css("background","");
			$("#second").css("display","none");
			$("#third").css("display","none");
			$("#fifth").css("display","none");
			})
		});
	
	
	
	
	});
</script>

</body>
</html>