<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<HTML xmlns="">
<HEAD>
<TITLE>OnlineShop在线商城 - 后台管理</TITLE>
<META http-equiv=Content-Type content="text/html; charset=utf-8">
<LINK href="css/style.css" type=text/css rel=stylesheet>
<STYLE>
.main_left {
	TABLE-LAYOUT: auto;
}

.main_left_top {
	BACKGROUND: url(images/left_menu_bg.gif);
	PADDING-TOP: 5px
}

.main_left_title {
	PADDING-LEFT: 15px;
	FONT-WEIGHT: bold;
	FONT-SIZE: 14px;
	COLOR: #fff;
	TEXT-ALIGN: left
}

.left_iframe {
	BACKGROUND: none transparent scroll repeat 0% 0%;
	VISIBILITY: inherit;
	WIDTH: 180px;
	HEIGHT: 92%
}

.main_iframe {
	Z-INDEX: 1;
	VISIBILITY: inherit;
	WIDTH: 100%;
	HEIGHT: 92%
}

TABLE {
	FONT-SIZE: 12px;
	FONT-FAMILY: tahoma, 宋体, fantasy
}

TD {
	FONT-SIZE: 12px;
	FONT-FAMILY: tahoma, 宋体, fantasy
}

#header {
	line-height: 100px;
	height: 100px;
	background: #FF9933;
	margin-bottom: 50px;
}

li {
	list-style: none;
}

.navv {
	font-size: 20px;
	margin-left: 40px;
	list-style: none;
	float: left;
}

b {
	font-size: 40px;
	margin-left: 40px;
	font-family: 宋体
}
</STYLE>

<SCRIPT language=javaScript src="images/admin.js" type=text/javascript></SCRIPT>

<SCRIPT language=javascript src="images\Admin(1).js"></SCRIPT>

<SCRIPT>
var status = 1;
var Menus = new DvMenuCls;
document.onclick=Menus.Clear;
function switchSysBar(){
     if (1 == window.status){
		  window.status = 0;
          switchPoint.innerHTML = '<img src="images/left.gif">';
          document.all("frmTitle").style.display="none"
     }
     else{
		  window.status = 1;
          switchPoint.innerHTML = '<img src="images/right.gif">';
          document.all("frmTitle").style.display=""
     }
}
</SCRIPT>

<META content="MSHTML 6.00.2900.5726" name=GENERATOR>
</HEAD>
<BODY style="MARGIN: 0px">
	<!--导航部分-->
	<DIV class=top_table>
		<DIV class=top_table_leftbg>
			<font style="font-size: 30px; color: #999">Bepotato&nbsp;&nbsp;&nbsp;店铺管理</font>
			<DIV class=menu>
			  <UL></UL>
		  </DIV>
	  </DIV>
	</DIV>
	<DIV style="HEIGHT: 24px; background-color: #DDD;"></DIV>
	<!--导航部分结束-->
<TABLE style="BACKGROUND: #fff;width:85%;margin:auto" height="92%" cellSpacing=0
		cellPadding=0 width="100%" border=0>
		<TBODY>
			<TR>
				<TD class=main_left id=frmTitle vAlign=top align=middle
					name="fmTitle"><IFRAME class=left_iframe id=frmleft
						name=frmleft src="left.jsp" frameBorder=0 allowTransparency></IFRAME>

				</TD>
				<TD style="WIDTH: 10px" bgColor=#ddd>
					<TABLE height="100%" cellSpacing=0 cellPadding=0 border=0>
						<TBODY>
							<TR>
								<TD style="HEIGHT: 100%" onclick=switchSysBar()><SPAN
									class=navPoint id=switchPoint title=关闭/打开左栏>
									<IMG src="images/right.gif"></SPAN></TD>
							</TR>
						</TBODY>
					</TABLE>
				</TD>
				<TD vAlign=top width="100%" bgColor=#fff><IFRAME
						class=main_iframe id=frmright name=frmright
						src="syscome.jsp" frameBorder=0 scrolling=yes></IFRAME></TD>
			</TR>
		</TBODY>
	</TABLE>
	<SCRIPT language=JavaScript>
<!--
document.getElementById("dvbbsannounce").innerHTML = document.getElementById("dvbbsannounce_true").innerHTML;
//
-->
</SCRIPT>
</BODY>
</HTML>
