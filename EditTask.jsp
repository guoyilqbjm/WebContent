<%@ page language="java" contentType="text/html; charset=utf-8" import="database.*,java.util.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>ManageTasks</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
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

.logo-small {
	color: #f4511e;
	font-size: 75px;
}

.table th,.table td {
	text-align: center;
	height: 38px;
}

.table tr {
	vertical-align: middle;
}

button {
	margin-left:5px;
}

</style>

</head>

<body>


	<% String username=(String)request.getSession().getAttribute("username"); %>
	<!-- 导航栏 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">IFTTT</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="newtask.jsp">新建任务</a></li>
					<li class="active"><a href="#">管理任务</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="checkmessage.jsp"><span class="glyphicon glyphicon-comment"></span>
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
	<br>
	<br>

	
	<!-- 操作任务时候进行提交的表单 -->
	<form id="taskmanage" action="">
		<input type="hidden" id="title" name="title" value="">
	</form>

	


<!-- 修改信息Modal -->
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
			<div class="panel panel-info">
				<div class="panel-heading">任务信息</div>
				<form id="taskInfoForm" name="taskInfoForm" role="form" action="NewTaskServlet">
					<div class="panel-body">
<% 
	if(username != null) {
		String currentTaskTitle=(String)request.getParameter("title");
		String[] taskInfo=GetTaskInfo.get(username,currentTaskTitle);
		System.out.println(taskInfo==null);
				for(int i=0;i<taskInfo.length;++i)
			System.out.println(taskInfo[i]);
%> 

							<div class="form-group">
								<label for="taskTitle">任务标题：</label> <input type="text"
									class="form-control" id="taskTitle" value="<%= taskInfo[0] %>">
							</div>
							<h4>IF THIS</h4>
				<%
					String thisModes[]=taskInfo[2].split(","),
						thatModes[]=taskInfo[3].split(",");
					if(thisModes[0].equals("1")) {
				%>
							<div class="form-group" id="ifTimeDiv">
								<label for="ifTime">在指定时间：</label> <input type="text"
									class="form-control" id="ifTime" value="<%= thisModes[1] %>>">
							</div>
				<%	}
					else if(thisModes[0].equals("2")) {
				%>
							<div class="form-group" id="ifEmailDiv">
								<div class="form-group">
									<label for="ifEmailAddr">当指定邮箱收到邮件：</label> <input type="text"
										class="form-control" id="ifEmailAddr" value="<%= thisModes[1] %>">
								</div>
								<div class="form-group">
									<label for="ifEmailPwd">密码：</label> <input type="password"
										class="form-control" id="ifEmailPwd" value="<%= thisModes[2] %>">
								</div>
							</div>
				<%	}
					else {
				%>
						<div class="form-group" id="ifWeiboDiv">
						<label for="ifWeiboUsername">微博账号：</label> <input type="text"
							class="form-control" id="ifWeiboUsername" value="<%= thisModes[1] %>">
						<label for="ifWeiboPwd">密码：</label> <input type="password"
							class="form-control" id="ifWeiboPwd" value="<%= thisModes[2] %>">
	
										
				<%		if(thisModes[0].equals("3")) {
				%>
								<div id="ifWeiboTimeDiv">					
									<label for="ifWeiboTime">在指定时间：</label> <input type="text"
										class="form-control" id="ifWeiboTime" value="<%= thisModes[3] %>">
								</div>				
				<%		}
						else if(thisModes[0].equals("4")) {
				%>
								<div id="ifWeiboContentDiv">
									<label for="ifWeiboContent">指定内容：</label><br>
									<textarea rows="3" style="width:100%;" id="ifWeiboContent" value="<%= thisModes[4] %>"> </textarea>
								</div>						
				<%		}
				%>
						</div>
				<%	}
				%>

							<h4><br>THEN THAT</h4>
				<%
					if(thatModes[0].equals("1")) {
				%>
							<div class="form-group" id="thenEmailDiv">
								<div class="form-group">
									<label for="thenEmailAddr">发件人邮箱：</label> <input type="text"
										class="form-control" id="thenEmailAddr" value="<%= thatModes[1] %>">
								</div>
								<div class="form-group">
									<label for="thenEmailPwd">密码：</label> <input type="password"
										class="form-control" id="thenEmailPwd" value="<%= thatModes[2] %>">
								</div>
								<div class="form-group">
									<label for="thenEmailRecAddr">收件人邮箱：</label> <input type="text"
										class="form-control" id="thenEmailRecAddr" value="<%= thatModes[3] %>">
								</div>
								<div class="form-group">
									<label for="thenEmailSubject">主题：</label> <input type="text"
										class="form-control" id="thenEmailSubject" value="<%= thatModes[4] %>">
								</div>
								<div class="form-group">
									<label for="thenEmailContent">内容：</label>
									<textarea class="form-control" rows="3" style="width:100%;"
										id="thenEmailContent" value="<%= thatModes[5] %>"></textarea>
								</div>
							</div>
				<%	}
					else if(thatModes[0].equals("2")) {
				%>
							<div class="form-group" id="thenWeiboDiv">
								<div class="form-group">
									<label for="thenWeiboUsername">微博账号：</label> <input type="text"
										class="form-control" id="thenWeiboUsername" value="<%= thatModes[1] %>">
								</div>
								<div class="form-group">
									<label for="thenWeiboPwd">微博密码：</label> <input
										type="password" class="form-control" id="thenWeiboPwd" value="<%= thatModes[2] %>">
								</div>
								<div class="form-group">
									<label for="thenWeiboContent">微博内容：</label> <br>
									<textarea rows="3" style="width:100%;" id="thenWeiboContent" value="<%= thatModes[3] %>"> </textarea>
								</div>
							</div>
				<%	}
				%>
							<br>
					</div>

						<div class="panel-footer">
							<button type="button" class="btn btn-danger" data-dismiss="modal"  onclick="back()">
								<span class="glyphicon glyphicon-remove"></span>Close
							</button>
							<button type="button" class="btn btn-success" data-dismiss="modal"
								id="ifTimeOkBtn">
								<span class="glyphicon glyphicon-ok"></span> Save!
							</button>
						</div>
						<input type="hidden" name="tasktitle" id="tasktitle" value="">
						<input type="hidden" name="thismode" id="thismode" value="">
						<input type="hidden" name="thatmode" id="thatmode" value="">
					</form>
<%
	}
%>					
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
	
	
	
	<div class="panel" style="margin-top:50px;">
		<p class="text-center">
			Copyright <span class="glyphicon glyphicon-copyright-mark"></span> 2015 by <strong>GuoGeTang</strong>. All Rights Reserved. 
		</p>
	</div>	
	
</body>

<script>
function back(){
	window.history.back();
}

	$(document).ready(function() {
		$("#viewInfoBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>
</html>
