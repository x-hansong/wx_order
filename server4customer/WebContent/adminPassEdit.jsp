<%@ page language="java" import="java.util.*,com.bepotato.model.*,com.bepotato.common.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
  
  <body>
    <%
    	if(session.getAttribute(Data.ADMINS2)!=null){
    		Admins admins=new Admins();
    		admins=(Admins)session.getAttribute(Data.ADMINS2);
    	%>	
    		<form action="servlet/EditAdminDo" method="post">
    		请您查看一下要修改的管理员详细的信息，并牢记您的新密码！
    		<br/><br/>
    		要修改的管理员ID为:<%=admins.getAid() %><br/><br>
			管理员名字为：<%=admins.getAname() %><br><br/>
			新密码：<input type="text" name="password" value="请输入要改为的密码"><br><Br/>
			
			<input type="hidden" name="aid" value=<%=admins.getAid()%>>
			<input type="submit" value="确认修改密码">
    		</form>
    		<%
    	}
     %>
  </body>
</html>
