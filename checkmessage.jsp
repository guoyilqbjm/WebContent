<%@ page language="java" contentType="text/html; charset=utf-8"
	import="database.*,java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Check Message</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=utf-8">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link href="http://fonts.googleapis.com/css?family=Montserrat"
	rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" type="text/css">
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


	<%
		String username = (String) request.getSession().getAttribute("username");
	%>
	<!-- 导航栏 -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">IFTTT</a>
			</div>
			<div>
				<ul class="nav navbar-nav">
					<li><a href="newtask.jsp">新建任务</a></li>
					<li class="active"><a href="managetasks.jsp">管理任务</a></li>
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
	<br>
	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="panel panel-info">
				<div class="panel-heading">
					<header class="text-center">
						<div class="square"></div>
						<h1>Message Check</h1>
					</header>
				</div>
				<div class="panel-body">
					<br>
					<ul class="nav nav-tabs nav-justified">
						<li class="active"><a href="#publicdiv" data-toggle="tab">Public</a></li>
						<li><a href="#privatediv" data-toggle="tab">Private</a></li>
					</ul>
					<br>
					<div id="myTabContent" class="tab-content">
						<div class="tab-pane fade in active" id="publicdiv">
							<table id="publicmessagetable" class="table table-hover">
								<thead>
									<tr>
										<th>时间</th>
										<th>内容</th>
									</tr>
								</thead>
								<tbody>
									<%
										if (username != null) {
											ArrayList<String> allmessage = GetMessageList.get();
											for (int i = 0; i < allmessage.size(); ++i) {
												String premessage = allmessage.get(i);
												String preinfor[] = premessage.split(",");
												assert (preinfor.length == 4);
												String time = preinfor[0];
												String type = preinfor[1];
												String receive = preinfor[2];
												String content = preinfor[3];
												if (type.equals("public")) {
									%>
									<tr>
										<td>
											<h3><%=time%></h3>
										</td>
										<td>
											<h3><%=content%></h3>
										</td>
									</tr>
									<%
										}
											}
										}
									%>

								</tbody>
							</table>
						</div>
						<div class="tab-pane fade" id="privatediv">

							<table id="privatemessagetable" class="table table-hover">
								<thead>
									<tr>
										<th>时间</th>
										<th>收件人</th>
										<th>内容</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<%
										if (username != null) {
											ArrayList<String> allmessage = GetMessageList.get();
											int k=-1;
											for (int i = 0; i < allmessage.size(); ++i) {
												String premessage = allmessage.get(i);
												String preinfor[] = premessage.split(",");
												assert (preinfor.length == 4);
												String time = preinfor[0];
												String type = preinfor[1];
												String receive = preinfor[2];
												String content = preinfor[3];
												if (type.equals("private") && receive.equals(username)) {
													++k;
									%>
									<tr>
										<td>
											<h3><%=time%></h3>
										</td>
										<td>
											<h3><%=receive%></h3>
										</td>
										<td>
											<h3><%=content%></h3>
										</td>
										<td><br>
											<button type="button" class="btn btn-primary"
												id=<%="操作" + k%> name="delete" onclick="taskFunction(this)">
												<span class="glyphicon glyphicon-trash"></span>
											</button></td>
									</tr>
									<%
										}
											}
										}
									%>
								</tbody>
							</table>
						</div>

					</div>
				</div>

				<form id="checkmessage" action="">
					<input type="hidden" id="deleteTime" name="deleteTime" value="">
				</form>

				<div class="panel">
					<p class="text-center">
						Copyright <span class="glyphicon glyphicon-copyright-mark"></span>
						2015 by <strong>GuoGeTang</strong>. All Rights Reserved.
					</p>
				</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
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
							<%
							String username1=(String)session.getAttribute("username");
							if(username1!=null && !username.equals("admin")){
								String info=GetUserInformation.get(username1);
								String infos[]=info.split(",");
							%>
								<input type="text" class="form-control" id="balance"
									placeholder=<%=infos[1] %> disabled>
							<%} %>
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
	
</body>
<script>
	function taskFunction(td) {
		var messagetable=document.getElementById("privatemessagetable");
		for (var i = 1; i < messagetable.rows.length; ++i) {
			var temp = "操作" + (i - 1);
			if (temp == td.id) {
				alert(temp);
				document.getElementById("deleteTime").value=messagetable.rows[i].cells[0].innerText;
				document.getElementById("checkmessage").action = "DeletePrivateMessageServlet";
				document.getElementById("checkmessage").submit();
			}
		}
	}
	$(document).ready(function() {
		$("#viewInfoBtn").click(function() {
			$("#myModal").modal();
		});

		$('[data-toggle="popover"]').popover();
	});
</script>

</html>
