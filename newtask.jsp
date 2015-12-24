<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<!-- 哈哈哈 我是被迫的 汤zhengli想要他 -->
<html>
<head>
<title>DashBoard</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
<script src="http://libs.baidu.com/jquery/2.1.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<style>
body {
	margin-top: 80px;
	font: 400 15px Lato, sans-serif;
	line-height: 1.8;
	color: #818181;
}

h2 {
	font-size: 50px;
	text-transform: uppercase;
	color: #303030;
	font-weight: 600;
	margin-bottom: 0px;
}

h4 {
	font-size: 20px;
}

.logo-small {
	color: #f4511e;
	font-size: 100px;
}
</style>

</head>

<body>

	<!-- 导航栏 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">IFTTT</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">新建任务</a></li>
					<li><a href="managetasks.jsp">管理任务</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-comment"></span>
							消息</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"> <span
							class="glyphicon glyphicon-user"></span> 我 <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a id="viewInfoBtn"><span
									class="glyphicon glyphicon-edit"> 查看个人资料</span></a></li>
							<li><a href="LoginOutServlet"><span
									class="glyphicon glyphicon-log-out"> 注销</span></a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>


	<!-- Container (Task choose) -->
	<div class="row">
		<div class="col-sm-8">
			<div id="ifchoice" class="container text-center">
				<h2>If</h2>
				<br>
				<div class="row slideanim">
					<div class="col-sm-3"></div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-lg"
							id="ifTimeBtn">
							<span class="glyphicon glyphicon-time logo-small" id="myBtn"></span>
							<h4>Time</h4>
						</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-lg"
							id="ifEmailBtn">
							<span class="glyphicon glyphicon-envelope logo-small"></span>
							<h4>Email</h4>
						</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-lg"
							id="ifWeiboBtn">
							<span class="glyphicon glyphicon-bullhorn logo-small"></span>
							<h4>Weibo</h4>
						</button>
					</div>
					<div class="col-sm-3"></div>
				</div>
				<br>
			</div>

			<div id="thenchoice" class="container text-center">
				<h2>Then</h2>
				<br>
				<div class="row slideanim">
					<div class="col-sm-4"></div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-lg"
							id="thenEmailBtn">
							<span class="glyphicon glyphicon-envelope logo-small"></span>
							<h4>E-mail</h4>
						</button>
					</div>
					<div class="col-sm-2">
						<button type="button" class="btn btn-default btn-lg"
							id="thenWeiboBtn">
							<span class="glyphicon glyphicon-bullhorn logo-small"></span>
							<h4>Weibo</h4>
						</button>
					</div>
					<div class="col-sm-4"></div>
				</div>
				<br>
			</div>
		</div>
		<div class="col-sm-3">
			<div class="panel panel-info">
				<div class="panel-heading">任务信息</div>
				<form id="taskInfoForm" name="taskInfoForm" role="form" action="NewTaskServlet">
					<div class="panel-body">
						<div class="form-group">
							<label for="taskTitle">任务标题：</label> <input type="text"
								class="form-control" id="taskTitle">
						</div>
						<h4>IF THIS</h4>
						<div class="form-group" id="ifTimeDiv" style="display: none">
							<label for="ifTime">在指定时间：</label> <input type="text"
								class="form-control" id="ifTime">
						</div>
						<div class="form-group" id="ifEmailDiv" style="display: none">
							<div class="form-group">
								<label for="ifEmailAddr">当指定邮箱收到邮件：</label> <input type="text"
									class="form-control" id="ifEmailAddr">
							</div>
							<div class="form-group">
								<label for="ifEmailPwd">密码：</label> <input type="password"
									class="form-control" id="ifEmailPwd">
							</div>
						</div>
						<div class="form-group" id="ifWeiboDiv" style="display: none">
							<label for="ifWeiboUsername">微博账号：</label> <input type="text"
								class="form-control" id="ifWeiboUsername">
							<label for="ifWeiboPwd">密码：</label> <input type="password"
								class="form-control" id="ifWeiboPwd">
							<div id="ifWeiboTimeDiv" style="display: none">
								<label for="ifWeiboTime">在指定时间：</label> <input type="text"
									class="form-control" id="ifWeiboTime">
							</div>
							<div id="ifWeiboContentDiv" style="display: none">
								<label for="ifWeiboContent">指定内容：</label><br>
								<textarea rows="3" style="width:100%;" id="ifWeiboContent"> </textarea>
							</div>
						</div>

						<h4>
							<br>THEN THAT
						</h4>
						<div class="form-group" id="thenEmailDiv" style="display: none">
							<div class="form-group">
								<label for="thenEmailAddr">发件人邮箱：</label> <input type="text"
									class="form-control" id="thenEmailAddr">
							</div>
							<div class="form-group">
								<label for="thenEmailPwd">密码：</label> <input type="password"
									class="form-control" id="thenEmailPwd">
							</div>
							<div class="form-group">
								<label for="thenEmailRecAddr">收件人邮箱：</label> <input type="text"
									class="form-control" id="thenEmailRecAddr">
							</div>
							<div class="form-group">
								<label for="thenEmailSubject">主题：</label> <input type="text"
									class="form-control" id="thenEmailSubject">
							</div>
							<div class="form-group">
								<label for="thenEmailContent">内容：</label>
								<textarea class="form-control" rows="3" style="width:100%;"
									id="thenEmailContent"></textarea>
							</div>
						</div>
						<div class="form-group" id="thenWeiboDiv" style="display: none">
							<div class="form-group">
								<label for="thenWeiboUsername">微博账号：</label> <input type="text"
									class="form-control" id="thenWeiboUsername">
							</div>
							<div class="form-group">
								<label for="thenWeiboPwd">微博密码：</label> <input
									type="password" class="form-control" id="thenWeiboPwd">
							</div>
							<div class="form-group">
								<label for="thenWeiboContent">微博内容：</label> <br>
								<textarea rows="3" style="width:100%;" id="thenWeiboContent"> </textarea>
							</div>
						</div>
						<br>
					</div>
					<div class="panel-footer">
						<button type="submit" class="btn btn-default" onclick="taskInfoFormat()">Submit</button>
					</div>
					<input type="hidden" name="tasktitle" id="tasktitle" value="">
					<input type="hidden" name="thismode" id="thismode" value="">
					<input type="hidden" name="thatmode" id="thatmode" value="">
				</form>
			</div>
		</div>
		<div class="col-sm-1"></div>
	</div>

	<!-- 个人信息  Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-cog"></span> 个人信息
					</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" role="form" action="ChangeUserInfoServlet">
						<div class="form-group">
							<label for="usrname" class="col-sm-3 control-label">
								Username&nbsp;&nbsp;<span class="glyphicon glyphicon-user"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="usrname"
									placeholder=<%=request.getSession().getAttribute("username")%> disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="psw" class="col-sm-3 control-label">
								Password&nbsp;&nbsp;<span class="glyphicon glyphicon-eye-open"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="psw" name="newPassword"
									placeholder="Enter new password">
							</div>
						</div>
						<div class="form-group">
							<label for="balance" class="col-sm-3 control-label">
								Balance&nbsp;&nbsp;<span class="glyphicon glyphicon-credit-card"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="balance"
									placeholder="1000" disabled>
							</div>
						</div>
						<div class="form-group">
							<label for="balance" class="col-sm-3 control-label">
								Deposit&nbsp;&nbsp;<span class="glyphicon glyphicon-credit-card"></span>
							</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="deposit" name="deposit"
									value="0">
							</div>
						</div>
						<br>
						<button type="submit"
							class="btn btn-default btn-success btn-lg btn-block">
							<span class="glyphicon glyphicon-save"></span> 保存
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> Close
					</button>
				</div>
			</div>
		</div>
	</div>


	<!-- if TimeModal -->
	<div class="modal fade" id="ifTimeModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">设定时间</h4>
				</div>
				<div class="modal-body">
					<label for="ifTimeModalText"><span
						class="glyphicon glyphicon-time"></span> Time</label> <input type="text"
						class="form-control" id="ifTimeModalText"
						placeholder="2015/12/25 23:23:00">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>Close
					</button>
					<button type="button" class="btn btn-success" data-dismiss="modal"
						id="ifTimeOkBtn">
						<span class="glyphicon glyphicon-ok"></span> Save!
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- if EmailModal -->
	<div class="modal fade" id="ifEmailModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">设置监听邮箱</h4>
				</div>
				<div class="modal-body">
					<label for="ifEmailAddrText"><span
						class="glyphicon glyphicon-envelope"></span> Email Address</label> <input
						type="text" class="form-control" id="ifEmailAddrText"
						placeholder="username@example.com"> <label
						for="ifEmailPwdText"><span
						class="glyphicon glyphicon-eye-close"></span> Password</label> <input
						type="password" class="form-control" id="ifEmailPwdText"
						placeholder="********">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>Close
					</button>
					<button type="button" class="btn btn-success" data-dismiss="modal"
						id="ifEmailOkBtn">
						<span class="glyphicon glyphicon-ok"></span> Save!
					</button>
				</div>
			</div>
		</div>
	</div>

	<!-- if WeiboModal -->
	<div class="modal fade" id="ifWeiboModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title">设置监听微博</h4>
				</div>
				<div class="modal-body">
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a href="#login" data-toggle="tab">在指定时间内更新</a></li>
						<li><a href="#register" data-toggle="tab">更新指定内容</a></li>
					</ul>
					<br> 
					<label for="ifWeiboIdText"><span
						class="glyphicon glyphicon-user"></span>Weibo username</label> <input
						type="text" class="form-control" id="ifWeiboIdText"
						placeholder="username@example.com"> <label
						for="ifWeiboPwdText"><span
						class="glyphicon glyphicon-eye-close"></span>Weibo Password</label> <input
						type="password" class="form-control" id="ifWeiboPwdText"
						placeholder="********">
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="login">
							<div id="WeiboTimeDiv">
								<label for="ifWeiboTimeText"><span
									class="glyphicon glyphicon-time"></span> Time</label> <input
									type="text" class="form-control" id="ifWeiboTimeText"
									placeholder="23:55:00">
							</div>
						</div>
						<div class="tab-pane fade" id="register">
							<div id="WeiboContentDiv">
								<label for="ifweibocontent"><span
									class="glyphicon glyphicon-comment"></span> Content</label> <br>
								<textarea style="width:100%;" rows="3" id="ifweibocontent"> </textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>Close
						</button>
						<button type="button" class="btn btn-success" data-dismiss="modal"
							id="ifWeiboOkBtn">
							<span class="glyphicon glyphicon-ok"></span> Save!
						</button>
					</div>

				</div>
			</div>

		</div>
	</div>

		<!-- then EmailModal -->
		<div class="modal fade" id="thenEmailModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title">设置发送邮箱</h4>
					</div>
					<div class="modal-body">
						<label for="thenEmailSendAddrText"><span
							class="glyphicon glyphicon-envelope"></span>Sender Email Address</label>
						<input type="text" class="form-control" id="thenEmailSendAddrText"
							placeholder="username@example.com"> <label
							for="thenEmailSendPwdText"><span
							class="glyphicon glyphicon-eye-close"></span>Sender Password</label> <input
							type="password" class="form-control" id="thenEmailSendPwdText"
							placeholder="********"> <label
							for="thenEmailReceiveAddrText"><span
							class="glyphicon glyphicon-envelope"></span>Receiver Email
							Address</label> <input type="text" class="form-control"
							id="thenEmailReceiveAddrText" placeholder="username@example.com">
						<label for="thenEmailtitleText"><span
							class="glyphicon glyphicon-book"></span>Subject </label> <input
							type="text" class="form-control" id="thenEmailtitleText"
							placeholder="Title"> <label for="thenEmailContentText"><span
							class="glyphicon glyphicon-comment"></span> Content</label> <br>
						<textarea rows="3" style="width:100%;" id="thenEmailContentText"> </textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>Close
						</button>
						<button type="button" class="btn btn-success" data-dismiss="modal"
							id="thenEmailOkBtn">
							<span class="glyphicon glyphicon-ok"></span> Save!
						</button>
					</div>
				</div>
			</div>
		</div>

		<!-- then WeiboModal -->
		<div class="modal fade" id="thenWeiboModal" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">×</button>
						<h4 class="modal-title">设置发送微博</h4>
					</div>
					<div class="modal-body">
						<label for="thenWeiboSendAddrText"><span
							class="glyphicon glyphicon-user"></span>Weibo Username</label>
						<input type="text" class="form-control" id="thenWeiboSendAddrText"
							placeholder="username@example.com"> <label
							for="thenWeiboSendPwdText"><span
							class="glyphicon glyphicon-eye-close"></span>Weibo Password</label> <input
							type="password" class="form-control" id="thenWeiboSendPwdText"
							placeholder="********"> <label for="thenWeiboContentText"><span
							class="glyphicon glyphicon-comment"></span> Content</label> <br>
						<textarea rows="3" style="width:100%;" id="thenWeiboContentText"> </textarea>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">
							<span class="glyphicon glyphicon-remove"></span>Close
						</button>
						<button type="button" class="btn btn-success" data-dismiss="modal"
							id="thenWeiboOkBtn">
							<span class="glyphicon glyphicon-ok"></span> Save!
						</button>
					</div>
				</div>
			</div>
		</div>

		<div class="panel" style="margin-top: 50px;">
			<p class="text-center">
				Copyright <span class="glyphicon glyphicon-copyright-mark"></span>
				2015 by <strong>GuoGeTang</strong>. All Rights Reserved.
			</p>
		</div>
</body>

<script>
	var ifmode=0;
	var thenmode=0;
	var activeTab="在指定时间内更新";
	
	function showTimeDiv() {
		document.getElementById("WeiboTimeDiv").style.display = "block";
		document.getElementById("WeiboContentDiv").style.display = "none";
	}
	function showContentDiv() {
		document.getElementById("WeiboTimeDiv").style.display = "none";
		document.getElementById("WeiboContentDiv").style.display = "block";
	}

	function taskInfoFormat() {
		if(ifmode==1){
			document.getElementById("thismode").value="1,"+document.getElementById("ifTime").value;
		}
		else if(ifmode==2){
			document.getElementById("thismode").value="2,"+document.getElementById("ifEmailAddr").value+","+document.getElementById("ifEmailPwd").value;
		}
		else if(ifmode==3){
			if(activeTab=="在指定时间内更新"){
				document.getElementById("thismode").value="3,"+
					document.getElementById("ifWeiboUsername").value+","+
					document.getElementById("ifWeiboPwd").value+","+
					document.getElementById("ifWeiboTime").value;
			}
			else if(activeTab=="更新指定内容"){
				document.getElementById("thismode").value="4,"+
					document.getElementById("ifWeiboUsername").value+","+
					document.getElementById("ifWeiboPwd").value+","+
					document.getElementById("ifWeiboContent").value;
			}
		}
		//alert(document.getElementById("thismode").value);
		if(thenmode==1){
			document.getElementById("thatmode").value="1,"+
				document.getElementById("thenEmailAddr").value+","+
				document.getElementById("thenEmailPwd").value+","+
				document.getElementById("thenEmailRecAddr").value+","+
				document.getElementById("thenEmailSubject").value+","+
				document.getElementById("thenEmailContent").value;
		}
		else if(thenmode==2){
			document.getElementById("thatmode").value="2,"+
				document.getElementById("thenWeiboUsername").value+","+
				document.getElementById("thenWeiboPwd").value+","+
				document.getElementById("thenWeiboContent").value;
		}
		//alert(document.getElementById("thatmode").value);
		document.getElementById("tasktitle").value=document.getElementById("taskTitle").value;
		document.getElementById("taskInfoForm").submit();
	}
	
	$(document).ready(function() {
		// 处理选择任务类型按钮事件
		$("#ifTimeBtn").click(function() {
			$("#ifTimeModal").modal();
		});
		$("#ifEmailBtn").click(function() {
			$("#ifEmailModal").modal();
		});
		$("#ifWeiboBtn").click(function() {
			$("#ifWeiboModal").modal();
		});
		$("#thenEmailBtn").click(function() {
			$("#thenEmailModal").modal();
		});
		$("#thenWeiboBtn").click(function() {
			$("#thenWeiboModal").modal();
		});

		//处理导航按钮中“我”事件
		$("#viewInfoBtn").click(function() {
			$("#myModal").modal();
		});

		//处理选择任务详情信息，按下OK按钮之后在表单中显示所选。
		$("#ifTimeOkBtn").click(function() {
			ifmode=1;
			document.getElementById("ifTimeDiv").style.display = "block";
			document.getElementById("ifEmailDiv").style.display = "none";
			document.getElementById("ifWeiboDiv").style.display = "none";
			document.getElementById("ifTime").value = document.getElementById("ifTimeModalText").value;
		});
		$("#ifEmailOkBtn").click(function() {
			ifmode=2;
			document.getElementById("ifTimeDiv").style.display = "none";
			document.getElementById("ifEmailDiv").style.display = "block";
			document.getElementById("ifWeiboDiv").style.display = "none";
			document.getElementById("ifEmailAddr").value=document.getElementById("ifEmailAddrText").value;
			document.getElementById("ifEmailPwd").value = document.getElementById("ifEmailPwdText").value;
		});
		$("#ifWeiboOkBtn").click(function() {
			ifmode=3;
			document.getElementById("ifTimeDiv").style.display = "none";
			document.getElementById("ifEmailDiv").style.display = "none";
			document.getElementById("ifWeiboDiv").style.display = "block";
			document.getElementById("ifWeiboUsername").value=document.getElementById("ifWeiboIdText").value;
			document.getElementById("ifWeiboPwd").value=document.getElementById("ifWeiboPwdText").value;
			if(activeTab=="在指定时间内更新"){
				document.getElementById("ifWeiboTimeDiv").style.display = "block";
				document.getElementById("ifWeiboContentDiv").style.display = "none";
				document.getElementById("ifWeiboTime").value=document.getElementById("ifWeiboTimeText").value;
			}
			else if(activeTab=="更新指定内容"){
				document.getElementById("ifWeiboTimeDiv").style.display = "none";
				document.getElementById("ifWeiboContentDiv").style.display = "block";
				document.getElementById("ifWeiboContent").value=document.getElementById("ifweibocontent").value;
			}
		});
		$("#thenEmailOkBtn").click(function() {
			thenmode=1;
			document.getElementById("thenEmailDiv").style.display = "block";
			document.getElementById("thenWeiboDiv").style.display = "none";
			document.getElementById("thenEmailAddr").value = document.getElementById("thenEmailSendAddrText").value;
			document.getElementById("thenEmailPwd").value = document.getElementById("thenEmailSendPwdText").value;
			document.getElementById("thenEmailRecAddr").value = document.getElementById("thenEmailReceiveAddrText").value;
			document.getElementById("thenEmailSubject").value = document.getElementById("thenEmailtitleText").value;
			document.getElementById("thenEmailContent").value = document.getElementById("thenEmailContentText").value;
		});
		$("#thenWeiboOkBtn").click(function() {
			thenmode=2;
			document.getElementById("thenEmailDiv").style.display = "none";
			document.getElementById("thenWeiboDiv").style.display = "block";
			document.getElementById("thenWeiboUsername").value=document.getElementById("thenWeiboSendAddrText").value;
			document.getElementById("thenWeiboPwd").value=document.getElementById("thenWeiboSendPwdText").value;
			document.getElementById("thenWeiboContent").value=document.getElementById("thenWeiboContentText").value;
		});

		$('[data-toggle="popover"]').popover();
	});
</script>
<script>

   $(function(){
      $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
      // 获取已激活的标签页的名称
      activeTab = $(e.target).text();
      // 获取前一个激活的标签页的名称
      previousTab = $(e.relatedTarget).text(); 
   });
});
</script>

</html>
