<%@ page language="java" import="java.util.*,com.bepotato.common.*,com.bepotato.model.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<HEAD><TITLE>左栏帮助</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8"><LINK 
href="css/style_left.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2900.5726" name=GENERATOR></HEAD>
<%List list=null;
list=(List)session.getAttribute(Data.TYPES);
if(list!=null){
	int l=list.size();
%>
<body>

<TABLE height="100%" cellSpacing=0 cellPadding=0 width="100%" border=0>
  <TBODY>
  <TR>
    <TD style="PADDING-TOP: 10px" vAlign=top>
      <TABLE class=alpha>
        <TBODY>
        <TR>
          <TD class=menu id=menubar vAlign=top>
           <%int i;
           for(i=0;i<l;i++){
        	   Type types=(Type)list.get(i);
           %>
             <LI><A href="servlet/EditProductById?typeid=<%=types.getTid() %>" 
            target=frmright><%=types.getName() %></A> </LI>
            <%} }%>
            <LI><A href="servlet/EditType" 
            target=frmright>编辑类别</A> </LI>
            
            <LI><A href="servlet/EditProduct" 
            target=frmright>管理商品</A> </LI>
            
            <LI><A href="servlet/ShowReserveOrders" 
            target=frmright>待接单</A> </LI>
            <LI><A href="servlet/ShowAcceptOrders?state=1" 
            target=frmright>未完成</A> </LI>
            <LI><A href="servlet/ShowAcceptOrders?state=2" 
            target=frmright>已完成</A> </LI>
            <LI><A href="servlet/ShowAcceptOrders?state=3" 
            target=frmright>查看订单</A> </LI>
            
            <LI><A href="addAdmin.jsp" 
            target=frmright>添加管理员</A> </LI>
            
            <LI><A href="servlet/EditAdmin" 
            target=frmright>管理管理员</A> </LI>
       </TD></TR></TBODY></TABLE></TD></TR>
</TBODY></TABLE>
</body>
</html>