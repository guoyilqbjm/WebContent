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
										<th>收件人</th>
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
											<h3><%=receive%></h3>
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
												if (type.equals("private") && receive.equals(username)) {
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

			<div class="panel">
				<p class="text-center">
					Copyright <span class="glyphicon glyphicon-copyright-mark"></span>
					2015 by <strong>GuoGeTang</strong>. All Rights Reserved.
				</p>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</html>
