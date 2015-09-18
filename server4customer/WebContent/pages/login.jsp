<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>BEPOTATO</title>
<style type="text/css">
#header{
		line-height:100px;
		height:100px;
		background:#FF9933;
		margin-bottom:50px;
		}
		li{
		list-style:none;}
		.navv{
		font-size:20px;
		margin-left:40px;
		list-style:none;
		float:left;
	}
	#dengzhu{
		font-size:20px;
		margin-left:40px;
		list-style:none;
		float:right;
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
	b{
		font-size:40px;	
		margin-left:40px;
	}
div#body1 {height:440px;margin:0 0 0 0 ;background-color:hsla(0,15%,95%,1.00);}
div#body2 {position:absolute;width:80%; height:300px;margin:80px 0px 0px 10% ;background-color:hsla(0,0%,100%,1.00);}
div#body3 {position:absolute;width:300px; height:200px;margin:70px 0px 0px 40%;}
h1{margin-left:100px;}
button{$("#btn").css("background-color", "transparent");}
</style>
</head>
<body>
<div id="container">
	<div id="header">
	
	<ul id="nav">
	<li class="navv"><b>BEPOTATO</b></li>
		<li class="navv"><a href="#">主页</a></li>
		<li class="navv"><a href="DishType">开始订餐</a></li>
		<li class="navv"><a href="Cart">购物车</a></li>
		<li class="navv"><a href="#">个人中心</a></li>
	</ul>
	</div>
<div id="body1";> 

<button style="position:absolute;width:10%; height:40px;margin:40px 0px 0px 10%;border:none;background-color:rgba(255,255,255,1.00);">登录</button>




<button style="position:absolute;width:10%; height:40px;margin:40px 0px 0px 20%;background-color:rgba(255,255,255,1.00);"onclick="javascript:window.location.href='./Regist'">注册</button>

<div id="body2";>
<div id="body3";>
<form action="./Login" method="post">
   用户名：<input type="text" name="name"><br>     
   &nbsp;密码&nbsp;：<input type="password" name="pwd"><br>  
   <input type="submit" value="登录"style="position:absolute;width:80px; height:30px;margin:25px 0px 0px 90px;">
</form>


</div>
</div>
</div>
</body>
</html>
