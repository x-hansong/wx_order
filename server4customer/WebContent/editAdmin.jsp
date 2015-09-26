<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>

<html>
  <head>
 <script type="text/javascript"  language='JavaScript' src='js/utils.js'></script>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  
  <body>
  <%  
  List list=null;  
	if(session.getAttribute(Data.ADMINS)!=null){  
		  
		list=(List)session.getAttribute(Data.ADMINS);  
		  
		if(list!=null){  
			int l = list.size();  
   %>

   <img src="images/title.gif">&nbsp;&nbsp;管理管理员
   <font color="red" size="2">（请谨慎操作！）</font><br><br>
   <table border=1>
   	<tr>
   		<th width=150 align="left">序号</th>
   		<th width=150 align="left">管理员</th>
   		<th width=150 align="left">修改密码</th>
   		<th width=150 align="left">删除此管理员</th>
   	</tr>
   	<%
   		for(int i=0;i<l;i++){
   			Admins admins=(Admins)list.get(i);

   %>
  	<tr>
  		<td><%=i+1 %></td>
   		<td><%=admins.getAname() %></td>
   		<td><a href="servlet/EditAdminPass?id=<%=admins.getAid() %>">修改</a></td>
   		<td><a href="servlet/DeleteAdmin?id=<%=admins.getAid()%>" onClick="return confirmDel()">删除</a></td>
  	</tr>
   <%
	 }
 	%>
   </table> 
    <%
	 }
 }
  %>
  </body>
</html>