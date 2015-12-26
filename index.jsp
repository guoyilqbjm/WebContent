<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<style>
body {

	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}
</style>
<body>




<br><br><br>
	<div class="row">
		<div class="col-sm-4"></div>
		<div class="col-sm-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<header class="text-center">
						<div class="square"></div>
						<h1>IFTTT Online</h1>
					</header>
				</div>
				<div class="panel-body">
					<br>
					<ul class="nav nav-tabs nav-justified">
					   <li class="active"><a href="#login" data-toggle="tab">登陆</a></li>
					   <li><a href="#register" data-toggle="tab">注册</a></li>
					</ul><br>
					<div id="myTabContent" class="tab-content">
					   <div class="tab-pane fade in active" id="login">
					   		<form role="form" action="LoginInServlet">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-user"></span>
										</div>
										<input name="username" type="text" class="form-control"
											placeholder="用户名">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-eye-open"></span></span>
										</div>
										<input name="password" type="password" class="form-control" placeholder="密码">
									</div>
								</div>
								<br>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-primary btn-lg btn-block">登录</button>
								</div>
							</form>
					   </div>
					   <div class="tab-pane fade" id="register">
					   		<form role="form" action="RegisterServlet">
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-user"></span>
										</div>
										<input name="usernamesignup" type="text" class="form-control"
											placeholder="用户名">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group">
										<div class="input-group-addon">
											<span class="glyphicon glyphicon-eye-open"></span></span>
										</div>
										<input name="passwordsignup" type="password" class="form-control" placeholder="密码">
									</div>
								</div>
								<br>
								<div class="form-group text-center">
									<button type="submit" class="btn btn-primary btn-lg btn-block">成为新用户</button>
								</div>
							</form>
					   </div>
					</div>

				</div>
			</div>
			<div class="panel">
				<p class="text-center">
					Copyright <span class="glyphicon glyphicon-copyright-mark"></span> 2015 by <strong>GuoGeTang</strong>. All Rights Reserved. 
				</p>
			</div>
		</div>
		<div class="col-sm-4"></div>
	</div>
</html>
    