<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>

<html>
<head>
 	<title></title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body>
  <%  
  List list=null;  
	if(session.getAttribute(Data.ORDERS)!=null){  
		  
		list=(List)session.getAttribute(Data.ORDERS);  
		  
		if(list!=null){  
			int l = list.size();  
   %>

   <img src="images/title.gif">&nbsp;&nbsp;查看订单<br><br>
   <%for(int i=0;i<l;i++){
   			Order order=(Order)list.get(i);
   			 %>
   <table border=1>
   	<tr>
   		<td width=150 align="left">订单号</td>
   		<td width=150 align="left"><%=order.getOid() %></td>
   	</tr>
   	<tr>
   		<td>客户数量</td>
   		<td><%=order.getMen()%></td>
   		</tr>
   	<tr>
   		<td>地址</td>
   		<td><%=order.getLocation() %></td>
   		</tr>
   	<tr>
   		<td>价格</td>
   		<td><%=order.getPrice() %></td>
   		</tr>
   	<tr>
   		<td>折扣</td>
   		<td><%=order.getDiscount() %></td>
   		</tr>
   	<tr>
       	<tr>
   		<td>是否付款</td>
   		<td><%if(order.getPay()==1) out.print("已付款"); else out.print("未付款");%></td>
   		</tr>
   	<tr>

   		<td>日期</td>
   			<td><%=order.getTime() %></td>
   			</tr>
   	<tr>
   		<td>备注</tD>
   		<td><%=order.getRemark() %></td>
   		</tr>

        
  	</table> 
  	<br/><hr/><br/>
   <%
	 }
 	%>
   
    <%
	 }
 }
  %>
  </body>
</html>