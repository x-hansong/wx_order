<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>购物车</title>
<style>
body {
	background: #EFEFEF;
}

#container {
	margin: auto;
}

#header {
	line-height: 100px;
	height: 100px;
	background: #FF9933;
	margin-bottom: 50px;
}

b {
	font-size: 40px;
	margin-left: 40px;
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

#dengzhu {
	font-size: 20px;
	margin-left: 40px;
	list-style: none;
	float: right;
}

#list {
	margin: auto;
	width: 900px;
	background: #FFFFFF;
	padding: 5px;
}

.item {
	height: 100px;
	border-bottom: 1px solid #CCCCCC;
}

.item li {
	float: left;
	margin-right: 80px;
}
</style>
<script>
	//删除方法，参数obj为你要删除的对象
	function delElement(obj, id) {
		//删除节点用removeChild()方法，可以兼容所有主流浏览器。
		obj.parentNode.removeChild(obj);
		setCookie(id);
	}
	function setCookie(caiID) {
		var strCookie = document.cookie;
		//将多cookie切割为多个名/值对 
		var arrCookie = strCookie.split("; ");
		//遍历cookie数组，处理每个cookie对 
		for (var i = 0; i < arrCookie.length; i++) {
			var arr = arrCookie[i].split("=");
			//找到名称为userId的cookie，并返回它的值 
			if (caiID == arr[0]) {
				arr[1] = 0;
				break;
			}
		}
	}
</script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<script>
	$(
			function() {
				var t = $("#num");
				var s = $("#price");
				$("#add").click(function() {
					t.val(parseInt(t.val()) + 1);
					setTotal();
				})
				$("#min").click(function() {
					if (parseInt(t.val()) == 0)
						t.val(parseInt(t.val()));
					if (parseInt(t.val()) > 0)
						t.val(parseInt(t.val()) - 1);
					setTotal();
				})
				function setTotal() {
					$("#total").html(
							(parseInt(t.val()) * parseInt(s.val())).toFixed(2));
				}
				setTotal();
			})
</script>
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
			<li id="dengzhu"><c:out value="${user.nickname }"></c:out></li>
			</ul>
		</div>
		<div id="list">
		<c:forEach items="${dishes}" var="dish" >
			<div class="item" id="<c:out value="item${dish.did }"></c:out>">
				<ul>
					<li><img src="<c:out value="${dish.img }"></c:out>" width="80px" height="80px" /></li>
					<li><c:out value="${dish.name }"></c:out></li>
					<li><c:out value="${dish.price }"></c:out><input type="hidden" id="price" value="<c:out value="${dish.price }"></c:out>" /></li>
					<li><input value="-" type="button" id="min"
						style="width: 10px" /><input type="text" style="width: 20px"
							value="1" id="num" /><input type="button" value="+"
								id="add" style="width: 10px" /></li>
					<li><label id="total"></label></li>
					<li><input type="button" value="删除"
						onclick="delElement(<c:out value="item${dish.did }"></c:out>, <c:out value="${dish.did }"></c:out>)"
						style="background: #FFFFFF; color: #FF0000; border: 0px;"/></li>
				</ul>
			</div>
			</c:forEach>

			<div>
				<form action="#" method="get">
					<p style="text-align: right">
						联系人: <input type="text" name="fname" />
					</p>
					<p style="text-align: right">
						电话号码: <input type="text" name="lname" />
					</p>
					<p style="text-align: right">
						<input type="submit" value="提交"
							style="height: 30px; width: 100px; color: #FFFFFF; background: #FF9900; border: 0px; font-size: 18px; letter-spacing: 6px;" />
					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
