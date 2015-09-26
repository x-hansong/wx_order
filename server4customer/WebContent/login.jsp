<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>管理员登陆</TITLE>
<META http-equiv=Content-Language content=zh-cn>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<META content="MSHTML 6.00.2800.1611" name=GENERATOR>
<link type="text/css" href="css/style.css" rel="stylesheet">
<!--
<LINK href="images/css1.css" type=text/css rel=stylesheet>
<LINK href="images/newhead.css" type=text/css rel=stylesheet>
-->
</HEAD>
<style>
#middle {
	margin: auto;
	width: 338px;
}
a:link {
	color:#000000;
	text-decoration: none;
}
a:visited {
	color:#000000;
	text-decoration: none;
}
a:hover {
	color:#FFFFFF;
	text-decoration: none;
}
a:active {
	color:#000000;
	text-decoration: none;
}


b {
	font-size:40px;
	margin-left:40px;
}
</style>
<BODY  leftMargin=0 topMargin=0 MARGINWIDTH="0"
	MARGINHEIGHT="0">
<FORM name=adminlogin action="servlet/AdminLogin" method=post>
  <DIV class=top_table>
		<DIV class=top_table_leftbg>
			<font style="font-size: 30px; color: #999">Bepotato&nbsp;&nbsp;&nbsp;店铺管理</font>
			<DIV class=menu>
			  <UL></UL>
		  </DIV>
	  </DIV>
	</DIV>
  <div id="middle">
    <table border="0" cellpadding="0" cellspacing="0" height="202" width="338">
      <tbody>
        <tr>
          <td height="40" width="80">&nbsp;</td>
          <td colspan="2"></td>
        </tr>
        <tr>
          <td style="font-size:13px;text-align:right">管理员&nbsp;&nbsp;</td>
          <td colspan="2"><input size="20" style="height:18px" name="username" type="text"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td style="font-size:13px;text-align:right">密&nbsp;码&nbsp;&nbsp;</td>
          <td width="174"><input size="20" style="height:18px" name="password" type="password"></td>
        </tr>
        <tr>
          <td></td>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td colspan="2"><a href=""></a></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td style="font-size:13px;" align="center"><INPUT title=登录后台 type=submit height=48 alt="" width=86 
     value="登&nbsp;&nbsp;&nbsp;陆" name=image></td>
        </tr>
      </tbody>
    </table>
  </div>
</FORM>
</BODY>
</HTML>
