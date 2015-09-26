<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>

<html>
<head>
 	<title></title>
    <script language="javascript" type='text/javascript' src="js/utils.js">
	</script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body>
  <%  
  List list=null;  
	if(session.getAttribute(Data.PRODUCT)!=null){  
		  
		list=(List)session.getAttribute(Data.PRODUCT);  
		  
		if(list!=null){  
			int l = list.size();
   %>

   <img src="images/title.gif">&nbsp;&nbsp;管理美食<br><br>
   <table border=1>
   	<tr>
   		<th width=150 align="left">美食</th>
   		<th width=150 align="left">名称</th>
   		<th width=150 align="left">价格</th>
   		<th width=150 align="left">销量</th>
   		<th width=150 align="left">删除美食</th>
   	</tr>
   	<%
   		for(int i=0;i<l;i++){
   			Dish dish=(Dish)list.get(i);

   %>
  	<tr>
  		<td><img src="<%=dish.getImg() %>" width="180" height="110"/></td>
   		<td><%=dish.getName() %></td>
   		<td><%=dish.getPrice() %></td>
   		<td><%=dish.getSellcount() %></td>
   		<td><a href="servlet/DeleteProduct?pid=<%=dish.getDid()%>" onClick='return confirmDel()'>删除</a></td>
  	</tr>
   <%
	 }
 	%>
   </table> 
    <%
	 }
 }
  %>
  <br><A href="addProduct.jsp" target=frmright>添加美食</A>
  </body>
</html>