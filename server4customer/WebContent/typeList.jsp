<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript"  language='JavaScript' src='js/utils.js'></script>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
  
  <body>
  <img src="images/title.gif">&nbsp;&nbsp;编辑类别<br><br>
   	<% 
   	List list =null;
   	if(session.getAttribute(Data.TYPES)!=null)
   	{
   		list=(List)session.getAttribute(Data.TYPES);
   		  
		if(list!=null){  
			int l = list.size();  
   %>
   <table border=1>
   	<tr>
   		<th width=150 align="left">序号</th>
   		<th width=150 align="left">类别</th>
   		<th width=150 align="left">删除此类别 </th>
   	</tr>
   <%
   		for(int i=0;i<l;i++){
   			Type types=(Type)list.get(i);

   %>
  	<tr>
  		<td><%=i+1 %></td>
   		<td><%=types.getName() %></td>
   		<td><a href="servlet/DeleteType?typeid=<%=types.getTid()%>" onClick="return confirmDel()">删除</a></td>
  	</tr>
   <%
	 }
 	%>
   </table> 
    <%
	 }
 }
  %>
<br><br><A href="addType.jsp" target=frmright>添加类别</A> 
  </body>

</html>
