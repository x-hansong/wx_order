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
	  int current_number=0;
	  typeslist=(List)session.getAttribute(Data.TYPES);
	  if(typeslist!=null){
		  int ntype=typeslist.size();
		  Type type=null;
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
            <div class="crumb-list"><i class="icon-font"></i><a href="design.jsp">首页</a><span class="crumb-step">&gt;</span><span class="crumb-name">编辑类别</span></div>
        </div>
        <div>
        <table style="width:500px;margin:30px 58px;font-size:22px">
        <tbody>
        <tr >
        <td colspan="4"><i class="icon-font">&#xe026;</i>&nbsp;&nbsp;添加类别</td>
        </tr>
        <tr>
        <td colspan="4"><hr></td>
        </tr>
        
 
        
        <%for(current_number=0;current_number<ntype;current_number++){
							type=(Type)typeslist.get(current_number);%>
        <form id="updatatype<%=current_number%>" method="post">
		<tr>
        <td style="width:50px;"><%=current_number+1%></td>
        <input type="hidden" name="typename" id="typename<%=current_number%>"><td style="width:200px;" id="foodstylename<%=current_number%>"><%=type.getName()%></td></input>
        <td style="width:50px;" ><i class="icon-font" onClick="edit(<%=current_number%>)">&#xe002;</i></td>
        <td style="width:50px;" ><i class="icon-font" onClick="del(<%=current_number%>)">&#xe019;</i></td>
        </tr>
		<input type="hidden" name="typeid" value="<%=type.getTid()%>"></input>
		</form>
        <%} /* for loop end */
	  } /* if end */
	  else{
		  response.sendRedirect("login.jsp");
	  }%>
        <form id="test" method="post" action="servlet/AddType">
        <tr id="addfoodstyle"> 
        <td style="width:50px;"><%=current_number+1%></td>
        <td style="width:200px;" >
        <input type="text" name="typename"/>
        
        </td>
        <td id="addfoodstyle1" style="width:50px;" colspan="2"><i class="icon-font" onClick="$('#test').submit()">&#xe026;</i></td>
        </tr>
        </form>
        </tbody>
        
        </table>
        
        
        
        
        </div>
    </div>
    <!--/main-->
</div>

<script type="text/javascript">
/*
$(function() {  
	$("#changefoodstyle").bind("click",function() { 
		var td = $("#foodstylename"); 
		var txt = td.text(); 
		var input = $("<input type='text'value='" + txt + "'/>"); 
		td.html(input); 
		input.bind("click",function() { return false; });  
			input.trigger("focus"); 
			input.blur(function() { 
			var newtxt = $(this).val(); 
			if (newtxt != txt) { 
			td.html(newtxt); 
			} 
			else 
			{ 
			td.html(newtxt); 
			} 
		}); 
	}); 
}); 
$(function() {  
	$("#deletefoodstyle").bind("click",function() { 
		$("#deletefoodstyle").bind("click",function(){
			$("#foodstyle1").remove();
			});
	}); 
}); 
*/
function edit(current_number) {   
		var td = $("#foodstylename"+current_number); 
		var txt = td.text(); 
		var input =  $("<input type='text' value='" + txt + "'/>"); 
		td.html(input); 
		input.trigger("focus"); 
		input.blur(function(){
			var form=$("#updatatype"+current_number);
			var newtext = $(this).val();
			$("#typename"+current_number).attr("value",newtext);
			form.attr("action","servlet/EditType");
			form.submit()
			}); 
}
function del(current_number){
	$("#updatatype"+current_number).attr("action","servlet/DelType");
	$("#updatatype"+current_number).submit();
}
$(function(){
	$("#addfoodstyle1").bind("click",function(){
		var td = $("#addfoodstyle2"); 
		var txt = td.val(); 
		if(txt == ""){
			return;
		}
		else{
		  	var $html = $("<tr id='foodstyle5'>" 
			+"<td style='width:50px;'>3</td>"
			+"<td style='width:200px;'>" + txt + " </td>"
			+"<td style='width:50px;'><i class='icon-font'>&#xe002;</i></td>"
			+"<td style='width:50px;'><i class='icon-font'>&#xe019;</i></td>"
			+"</tr>");
			
			$("#foodstyle2").after($html);
		}
		td.val("");
		});
	
	});

</script>

</body>
</html>