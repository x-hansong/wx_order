<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
  
  <body>
  <img src="images/title.gif">&nbsp;&nbsp;添加商品<br><br>
   <form action="servlet/AddProduct" method="post" enctype="multipart/form-data">
    美食名称：<input type="text" name="pname"/><br/><br/>
    价格：<input type="text" name="ptype"/><br/><br/>
    
    <%List list=(List)session.getAttribute(Data.PRODUCT);
	if(list!=null){
		Dish dish=(Dish)list.get(1);%>
    <input type="hidden" name="tid" value="<%=dish.getTid()%>"/><br/>
    
    <%}%>

    图片：<input type="file" name="pinfo" value="abcde"/><br/>
    <input type="submit" value="afaf"/>
   </form>
  </body>
</html>
