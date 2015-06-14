<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>开始订餐</title>
<style>
#header {
	line-height: 100px;
	height: 100px;
	background: #FF9933;
}

b {
	font-size: 40px;
	margin-left: 40px;
}

.navv {
	font-size: 20px;
	margin-left: 40px;
	list-style: none;
	float: left;
}

a:link {
	color: #000000;
	text-decoration: none;
}

a:visited {
	color: #000000;
	text-decoration: none;
}

a:hover {
	color: #FFFFFF;
	text-decoration: none;
}

a:active {
	color: #000000;
	text-decoration: none;
}

.left {
	width: 250px;
	background-color: #FFC;
	margin: 20px;
	float: left;
	display: inline-block;
}

.right {
	width: 650px;
	margin: 20px;
	background-color: #FFC;
	float: left;
	display: inline-block;
}

.item {
	width: 180px;
	height: 220px;
	background-color: #FF3;
	margin: 10px;
	float: left;
}

.list {
	text-align: center;
}

.checked {
	background-color: #0F0;
}

#nav2 li {
	list-style: none;
	font-size: 20px;
	padding: 20px;
	display: block;
}

#dengzhu {
	font-size: 20px;
	margin-left: 40px;
	list-style: none;
	float: right;
}
</style>
</head>

<body>
	<div id="header">
		<ul id="nav1">
			<li class="navv"><b>BEPOTATO</b></li>
			<li class="navv"><a href="./booking1.html">主页</a></li>
			<li class="navv"><a href="./booking1.html">开始订餐</a></li>
			<li class="navv"><a href="./gwc.html">购物车</a></li>
			<li class="navv"><a href="#">个人中心</a></li>
			<li id="dengzhu"><a href="./login.html">登录/注册</a></li>
		</ul>
	</div>
	<div class="left">

		<ul id="nav2">
			<c:forEach items="${types}" var="type" >
				<li class="list"><a
					href="./DishType?tid=<c:out value="${type.tid }"/>"> <c:out
							value="${type.name }" />
				</a></li>
			</c:forEach>
		</ul>


	</div>

	<div class="right">
		<c:forEach items="${dishes}" var="dish" >
			<div class="item">
				<a href="#"><img src="<c:out value = "${dish.img }" />" alt="" name="Insert_logo"
					width="180" height="110" id="Insert_logo"
					style="background-color: #C6D580; display: block;" /></a>
				<p>
					<span><c:out value="${dish.name }"></c:out></span>
				</p>
				<p>
					<span><c:out value="${dish.price }"></c:out></span>
				</p>
				<div align="center">
					<input id="<c:out value="${dish.did }"/>"  name="buy" value="加入购物车" type="button" />
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>
