<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="shop" class="com.bepotato.model.Shop" scope="request" />
<%
	String msg = (String) request.getAttribute("message");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>比逗点餐系统</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
<script src="./js/jquery-1.11.2.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<style>
.bord {
	height: 10px;
	background-color: #f0f0f0;
}

row.col-md-6 img {
	position: absolute;
	right: 100px;
	top: 50%;
}
</style>
</head>

<body>
	<div class="container">
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active"
					style="background: url(0.jpg); background-position: cover;">
					<img src="./images/0.jpg" alt="First slide">
				</div>
				<div class="item"
					style="background: url(1.jpg); background-size: cover;">
					<img src="./images/1.jpg" alt="Second slide">
				</div>
				<div class="item"
					style="background: url(2.jpg); background-size: cover;">
					<img src="./images/2.jpg" alt="Third slide">
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" role="button"
				data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel" role="button"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div class="bord"></div>
		<div class="row">
			<a class="col-md-6" style="background-color: #f8f8f8;"> <href="#">
				<img src="./images/20.jpg">
				<h4>订座</h4></a> <a class="col-md-6" style="background-color: #f8f8f8;">
				<href="#">
				<img src="./images/11.jpg">
				<h4>呼叫服务员</h4>
			</a>
		</div>
		<div class="bord"></div>
		<div class="row">
			<div class="col-md-12" style="background-color: #f8f8f8;">
				<a href="#"><h4>
						联系电话
						<jsp:getProperty name="shop" property="phone" /></h4></a>
			</div>
		</div>
		<div class="bord"></div>
		<div class="row">
			<div class="col-md-12" style="background-color: #f8f8f8;">
				<a href="#"><h4>地址指引
				<jsp:getProperty name="shop" property="location" /></h4></a>
			</div>
		</div>
		<div class="bord"></div>
		<ul class="nav nav-tabs nav-justified">
			<li><a href="#"><h4>首页</h4></a></li>
			<li><a href="#"><h4>点菜</h4></a></li>
			<li><a href="#"><h4>我的订单</h4></a></li>
		</ul>
	</div>
</body>
</html>