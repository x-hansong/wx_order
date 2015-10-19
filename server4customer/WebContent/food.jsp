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
	</script>
	<%List typeslist=null;
	  List disheslist=null;  
	  String currentTypeId=(String)session.getAttribute(Data.CURRENT_TYPE);
	  typeslist=(List)session.getAttribute(Data.TYPES);
	  disheslist=(List)session.getAttribute(Data.DISHES);
	  if((typeslist!=null)&&(disheslist!=null)){
		  int ntype=typeslist.size();
		  int ndish=disheslist.size();
		  Type type=null;Dish dish=null;
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
            <div class="crumb-list"><i class="icon-font"></i><a href="design.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">主食</span></div>
        </div>                   
        <div style="width:95%;margin:30px 58px;">
            <div style="width:217px; float:left"> 
               <div id="addDishButton" style="width:140px;height:200px;margin-bottom:10px;border:2px dotted #33FFFF;">
                   <i class="icon-font" style="display:block;text-align:center;font-size:36px;color:#33FFFF;margin-top:82px;">&#xe026;</i>
                </div>
            </div>
            <div id="shade" class="all-div-1" style="position:fixed"></div>
            <div id="addfood-2" class="all-div-2" style="position:fixed">
                <form  id="formfile" action="servlet/AddProduct" method="post">
                <div style="height:195px">
                <!--
                <i class="icon-font" style="display:block;text-align:center;font-size:36px;color:#33FFFF;padding-top:82px;">&#xe026;</i>
                
                -->
                <input style="display:block;height:195px;width:300px;background-color:transparent;" type="file" id="file_input"  name="picture"/>
                
                
                </div>
                <div><input type="hidden" name="tid" value="<%=currentTypeId%>"></input></div>
                <div style="height:150px;background:#3399ff">
                <table style="height:130px;margin-left:auto;margin-right:auto;padding-top:30px;color:#FFF;text-align:center">
            <tr >
            <td>菜名：</td>
            <td>
            
            <input style="display:block;border-bottom:#FFF 1px solid;
                   border-left-width:0px;
                   border-right-width:0px;
                   border-top-width:0px;
                   background-color:transparent; "
                   name="name" type="text"/>
            </td>
            </tr>
            
            <tr >
            <td>价格：</td>
            <td>
            
            <input style="display:block;border-bottom:#FFF 1px solid;
                   border-left-width:0px;
                   border-right-width:0px;
                   border-top-width:0px;
                   background-color:transparent;"
                   name="price" type="text"/>
            </td>
            </tr>
            </table>
                </div>
                <div>
                <input style="height:62px;width:145px;border:none;background-color:transparent" type="button" id="cancelAdd" value="取消">
                <input style="height:62px;width:145px;border:none;background-color:transparent;float:right" type="button" id="sureAdd" value="确定">
                </div>
                </form>
                <!-- divfomr end -->
            </div>
            <%for(int i=0;i<ndish;i++){
		         dish=(Dish)disheslist.get(i);%>  
            <div style="width:217px; float:left">
                <div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   <img src="niupai.jpg" alt="至尊黑椒牛排" style="width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center"><%=dish.getName()%></div>
                <div style="text-align:center">￥<%=dish.getPrice()%></div>
                <div style="height:16px;">
                <div class="editDishButton"><i class="icon-font" style="display:block;float:left;text-align:center;width:70px;" onClick="ShowEditWindow(<%=i%>)">&#xe002;</i></div>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;" onClick="ShowDelWindow(<%=i%>)">&#xe019;</i>
                </div>
                <hr>
                </div>
           </div> 
           <div id="shade<%=i%>" class="all-div-1" style="position:fixed"></div>
            <div id="editfood-<%=i%>" class="all-div-2" style="position:fixed">
                <form  id="formfile<%=i%>" action="servlet/EditProduct" method="post">
                <div style="height:195px">
                <!--
                <i class="icon-font" style="display:block;text-align:center;font-size:36px;color:#33FFFF;padding-top:82px;">&#xe026;</i>
                
                -->
                <input style="display:block;height:195px;width:300px;background-color:transparent;" type="file" id="file_input"  name="picture"/>
                
                
                </div>
                <div><input type="hidden" name="typeid" value="<%=currentTypeId%>"></input></div>
				<div><input type="hidden" name="dishid" value="<%=dish.getDid()%>"></input></div>
          
                <div style="height:150px;background:#3399ff">
                <table style="height:130px;margin-left:auto;margin-right:auto;padding-top:30px;color:#FFF;text-align:center">
                    <tr >
                    <td>菜名：</td>
                    <td>
                    
                    <input style="display:block;border-bottom:#FFF 1px solid;
                           border-left-width:0px;
                           border-right-width:0px;
                           border-top-width:0px;
                           background-color:transparent; "
                           name="name" type="text"/>
                    </td>
                    </tr>
                    
                    <tr >
                    <td>价格：</td>
                    <td>
                    
                    <input style="display:block;border-bottom:#FFF 1px solid;
                           border-left-width:0px;
                           border-right-width:0px;
                           border-top-width:0px;
                           background-color:transparent;"
                           name="price" type="text"/>
                    </td>
                    </tr>
                  </table>
                </div>
                <div>
                <input style="height:62px;width:145px;border:none;background-color:transparent" type="button" class="cancelAdd" value="取消" onClick="CancelEdit(<%=i%>)">
                <input style="height:62px;width:145px;border:none;background-color:transparent;float:right" type="button" class="sureAdd" value="确定" onClick="SureEdit(<%=i%>)">
                </div>
                </form>
                <!-- divfomr end -->
            </div>
			<div id="delfood-<%=i%>" class="all-div-2" style="position:fixed">
                <form  id="formdel<%=i%>" action="servlet/DeleteProduct" method="post">
                <div style="height:195px">
                <!--
                <i class="icon-font" style="display:block;text-align:center;font-size:36px;color:#33FFFF;padding-top:82px;">&#xe026;</i>
                
                -->
               <img src="niupai.jpg" style="display:block;height:195px;width:300px;background-color:transparent;"/>
                </div>
                <div><input type="hidden" name="typeid" value="<%=currentTypeId%>"></input></div>
				<div><input type="hidden" name="dishid" value="<%=dish.getDid()%>"></input></div>
          
                <div style="height:150px;background:#3399ff">
                <table style="height:130px;margin-left:auto;margin-right:auto;padding-top:30px;color:#FFF;text-align:center">
                    <tr >
                    <td>菜名：</td>
                    <td>
                    <%=dish.getName()%>
                    </td>
                    </tr>
                    
                    <tr >
                    <td>价格：</td>
                    <td>
                    <%=dish.getPrice()%>
                    </td>
                    </tr>
                  </table>
                </div>
                <div>
                <input style="height:62px;width:145px;border:none;background-color:transparent" type="button" class="cancelAdd" value="取消" onClick="CancelDel(<%=i%>)">
                <input style="height:62px;width:145px;border:none;background-color:transparent;float:right" type="button" class="sureAdd" value="确定" onClick="SureDel(<%=i%>)">
                </div>
                </form>
                <!-- divfomr end -->
            </div>
           <%} /* for loop end */
	  } /* if end */
	  else{
		  response.sendRedirect("login.jsp");
	  }%>
        </div>  
      
        <!--
        <table style="width:95%;margin:30px 58px;">           
        <tr>
        <td>
        		<div id="divtest" style="width:140px;height:200px;margin-bottom:10px;border:2px dotted #33FFFF">
                <i class="icon-font" style="display:block;text-align:center;font-size:36px;color:#33FFFF;margin-top:82px;">&#xe026;</i>
                
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   <img src="niupai.jpg" alt="至尊黑椒牛排" style="width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i id="test1" class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        </tr>
        
        
        <tr>
        <td>
        		<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        <td>
        	<div style="width:140px;height:200px;margin-bottom:10px;">
                   <div style="margin:6px;width:128px;height:128px;border-radius:64px;background:#FCC">
                   </div>
                <div style="text-align:center">至尊牛排</div>
                <div style="text-align:center">￥30</div>
                <div style="height:16px;">
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe002;</i>
                <i class="icon-font" style="display:block;float:left;text-align:center;width:70px;">&#xe019;</i>
                </div>
                <hr>
                </div>
        </td>
        </tr>
        </table>
        -->
    </div>
    <!--/main-->
</div>

<script type="text/javascript">
            $(function () {
                $("#addDishButton").bind("click", function () {
                    $("#shade").show();$("#addfood-2").show();
                    $("#cancelAdd").bind("click",function(){
						$("#shade").hide();
						$("#addfood-2").hide();
                    });
					$("#sureAdd").bind("click",function(){
						$("#formfile").submit();
                    });
                });
				/*
				$(".editDishButton").bind("click", function () {
                    $("#shade").show();$("#editfood-2").show();
                    $(".cancelAdd").bind("click",function(){
						$("#shade").hide();
						$("#editfood-2").hide();
                    });
					$(".sureAdd").bind("click",function(){
						$("#formfile").submit();
                    });
                });
				*/
            });
			function ShowEditWindow(number)
			{
                    $("#shade"+number).show();$("#editfood-"+number).show();
			}
			function ShowDelWindow(number)
			{
                    $("#shade"+number).show();$("#delfood-"+number).show();
			}
			function CancelEdit(number){
				$("#shade"+number).hide();
				$("#editfood-"+number).hide();
			}
			function SureEdit(number){
				$("#formfile"+number).submit();
			}
			function CancelDel(number){
				$("#shade"+number).hide();
				$("#delfood-"+number).hide();
			}
			function SureDel(number){
				$("#formdel"+number).submit();
			}
</script>

</body>
</html>