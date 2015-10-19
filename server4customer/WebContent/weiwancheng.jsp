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
                        <li><a href="servlet/ShowNewOrder">待接单</a></li>
                        <li><a href="servlet/ShowDoingOrder">未完成</a></li>
                        <li><a href="servlet/ShowDoneOrder">已完成</a></li>
 
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
        	<div style="width:800px;" id="theorder<%=i%>">
            	<div id="ordertop<%=i%>" style="width:500px;height:40px;background:#9FF;">
					<span style="display:inline-block;background:#9FF;width:160px;height:40px;text-align:center;line-height:40px" id="first"><%=order.getLocation()%></span>
					<span style="display:inline-block;margin-left:220px;width:50px;height:40px;text-align:center;line-height:40px;cursor:default" id="second">
					<i class="icon-font" onClick="sureorder(<%=i%>)">&#xe025;</i>
					</span>
					<span style="display:inline-block;margin-right:0;width:50px;height:40px;text-align:center;line-height:40px;cursor:default" id="third">
					<i class="icon-font" onClick="deleteorder(<%=i%>)">&#xe024;</i>
					</span>
                    <form id="acceptorderfrom<%=i%>" action="servlet/CompleteOrder" method="post">
                    <input type="hidden" name="orderid" value="<%=order.getOid()%>"></input>
                     <input type="hidden" name="state" value="<%=Data.DOING%>"></input>
                    </form>
                    <form id="deleteorderfrom<%=i%>" action="servlet/DeleteOrder" method="post">
                    <input type="hidden" name="orderid" value="<%=order.getOid()%>"></input>
                     <input type="hidden" name="state" value="<%=Data.DOING%>"></input>
                    </form>
                </div>
                <div style="position:absolute;float:left;height:40px;line-height:40px;width:80px;text-align:center">
                    <span><%=order.getTime()%></span>
                </div>
				<div style="position:absolute;float:left;margin-left:80px;width:0px;height:100px;border:1px solid #000;"></div>
				<div style="position:absolute;float:left;margin-left:120px;margin-top:10px;" id="orderdetail<%=i%>">
					<ul style="list-style-type:disc">
                    
					 <% 
					 /* 通过 order id 获取 item ， 通过 item 获取 num ，通过 item id 获取 dish id ， 进而获取 dish name */
					 int orderid = order.getOid();
					 List itemslist=null;
					 OrderItemImpl orderItemImpl=new OrderItemImpl();
					 itemslist=orderItemImpl.findByOrderId(orderid);
					 OrderItem item =null;
					 Dish dish=null;
					 DishImpl dishImpl = new DishImpl();
					 int nitems = itemslist.size();
					 for (int j=0;j<nitems;j++){
						 item = (OrderItem) itemslist.get(j);
						 int dishid=item.getDid();
						 dish=dishImpl.findById(dishid);
						 /*
						 if (dish == null){
							 System.out.println(j);
						 }
						 else{
						*/
					%>
						  <li id="forth">
							<span style="width:250px;display:inline-block;"><%=dish.getName()%></span>
							<span style="width:50px;display:inline-block;">*<%=item.getNum()%></span>
							<span style="cursor:default;display:inline-block;" id="fifth"><i class="icon-font" onClick="deletedish(<%=i%>,<%=j%>)">&#xe024;</i></span>
						  </li>   
                          <form action="servlet/DeleteDishFromOrder" method="post" id="deletedishform<%=i%><%=j%>">
                          <input type="hidden" value="<%=orderid%>" name="orderid"></input>
                          <input type="hidden" value="<%=item.getIid()%>" name="dishid"></input>
                   		  <input type="hidden" name="state" value="<%=Data.DOING%>"></input>
                          </form>
						<%
						/* } */
						} /* for loop end */
						%>
					  </ul>
                      
				</div>	
			</div>
            <%} /* for loop end */
	  }
	  else{
		  response.sendRedirect("login.jsp");
	  }
	%>
        
        </div>
    </div>
    <!--/main-->
</div>
<script type="text/javascript">
/* 暴力实现自动控制div高度，建议优化为更智能的获取高度 */
<% for (int i=0;i<10;i++){ %>
$(function () {
	var o1=document.getElementById('orderdetail<%=i%>');
	var o2=document.getElementById('ordertop<%=i%>');
	var height=o1.offsetHeight+o2.offsetHeight+50;
	if (height < 180)
	height=180;
     document.getElementById("theorder<%=i%>").style.height=height+"px";
});
<%}%>
/* 暴力提交，可否使用较少的form就能达到同样功能？ */
function sureorder(i){
	$("#acceptorderfrom"+i).submit();
}
function deleteorder(i){
	$("#deleteorderfrom"+i).submit();
}
function deletedish(i,j){
	$("#deletedishform"+i+""+j).submit();
}
</script>

</body>
</html>