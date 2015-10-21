<!doctype html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CSS3动态背景登录框代码</title>

<link rel="stylesheet" type="text/css" href="css/styles.css">

</head>
<body>


<div class="wrapper">

	<div class="container" id="divmsg">
		<h1>Welcome to 后台</h1>
		<form class="form" action="servlet/AdminLogin" method="post">
			<input type="text" placeholder="用户名" id="username" name="username">
			<input type="password" placeholder="密码" id="userpass" name="password">
			<input type="submit" id="login-button" value="店铺登录"></input>
		</form>
	</div>
	
	<ul class="bg-bubbles">
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>
	
</div>

<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">

$('#login-button').click(function(event){
if($('#username').val()=="") alert('失败');
else{
	event.preventDefault();
	$('form').fadeOut(500);
	$('.wrapper').addClass('form-success');
	setTimeout("self.location='design.html'",2000);}
	$("form").submit();
});
</script>

</body>
</html>