<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
  
  <body>
  <img src="images/title.gif">&nbsp;&nbsp;添加商品类别<br/><br/>
    
    <form action="servlet/AddType" method="post">
    	新类别名：<input type="text" name="typename"/><br/><br/>
    	<input type="submit" value="添加此类别"/>
    </form>
  </body>
</html>
