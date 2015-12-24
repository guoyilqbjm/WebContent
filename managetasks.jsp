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
	<br>
	<br>

	<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<div class="panel panel-default">
				<table id="tasktable" class="table table-hover">
					<thead>
						<tr>
							<th>标题</th>
							<th>IF</th>
							<th>THEN</th>
							<th>操作</th>
							<th>状态</th>
						</tr>
					</thead>
					<tbody>
					<%
					if(username!=null){
						ArrayList<String>allTasks = GetTaskList.get(username);
						for(int i=0;i<allTasks.size();++i){
							String pretask=allTasks.get(i);
							String preinfo[] = pretask.split(";");
							assert(preinfo.length==4);
							String title=preinfo[0],thismode=preinfo[1],thatmode=preinfo[2],status=preinfo[3];
							String thisModes[]=thismode.split(","),thatModes[] = thatmode.split(",");
							/*
							to-do:通过上面所述可以获取到所有任务的所有信息，表格的动态生成
							glyphicon glyphicon-time logo-small 时间小图标
							glyphicon glyphicon-envelope logo-small 邮件小游标
							*/
					%>
						<tr>
							<td>
								<h3><%=title%></h3></td>
							<td><span 
								title="详细信息" data-container="body" data-html="true"
								data-toggle="popover" data-placement="right" data-trigger="hover"
								<%//设置类的标签
								if(thisModes[0].equals("1")){//thismode为定时 %>
									class="glyphicon glyphicon-time logo-small"
									data-content=<%='"'+"时间："+ thisModes[1]+'"'%>
								<% }
								else if(thisModes[0].equals("2")){//thismode为检测邮箱 %>
									class="glyphicon glyphicon-enevlope logo-small"
									data-content=<%='"'+"被检测邮箱："+ thisModes[1]+'"'%>
								<%}
								else if(thisModes[0].equals("3")) {//thismode为检测指定微博是否在指定时间内发布微博 %>
									class="glyphicon glyphicon-bullhorn logo-small"
									data-content=<%='"'+"被监听微博账号："+thisModes[1]+"<br>指定时间："+thisModes[3]+'"' %>
								<%} 
								 else{//thismode为检测指定微博是否发送指定微博内容的状态%>
								 	class="glyphicon glyphicon-bullhorn logo-small"
								 	data-content=<%='"'+"被监听微博账号："+thisModes[1]+"<br>指定内容："+thisModes[3]+'"' %>
								<%}%>
								>
							</span></td>
							<td><span
								title="详细信息" data-container="body" data-html="true"
								data-toggle="popover" data-placement="right" data-trigger="hover"
							<%if(thatModes[0].equals("1")){ %>
								class="glyphicon glyphicon-envelope logo-small"
								data-content=<%='"'+ "发件人："+thatModes[1]+"<br>收件人："+thatModes[3]
												+"<br>主题："+thatModes[4]+"<br>内容："+thatModes[5]+'"'%>
							<%}
							else{%>
								class="glyphicon glyphicon-bullhorn logo-small"
								data-content=<%='"'+"微博账号："+thatModes[1]+"<br>微博内容："+thatModes[3]+'"' %>
							<%} %>
								>
							</span></td>
							<td><br>
								<button type="button" class="btn btn-primary" id=<%="操作"+i %> name="play" onclick="taskFunction(this)">
									<span class="glyphicon glyphicon-play"></span>
								</button>
								<button type="button" class="btn btn-primary" id=<%="操作"+i %> name="pause" onclick="taskFunction(this)">	
									<span class="glyphicon glyphicon-pause"></span>
								</button>
								<button type="button" class="btn btn-primary" id=<%="操作"+i %> name="edit" onclick="taskFunction(this)">
									<span class="glyphicon glyphicon-edit"></span>
								</button>
								<button type="button" class="btn btn-danger" id=<%="操作"+i %> name="delete" onclick="taskFunction(this)">
									<span class="glyphicon glyphicon-trash"></span>
								</button></td>
							<td><h3><%=status %></h3>
						</tr>
						
						<%
						}
					}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
	
	<!-- 操作任务时候进行提交的表单 -->
	<form id="taskmanage" action="">
		<input type="hidden" id="title" name="title" value="">
	</form>
	
	<div class="panel" style="margin-top:50px;">
		<p class="text-center">
			Copyright <span class="glyphicon glyphicon-copyright-mark"></span> 2015 by <strong>GuoGeTang</strong>. All Rights Reserved. 
		</p>
	</div>
</body>

<script>

	function taskFunction(td){
		var tasktable=document.getElementById("tasktable");
		for(var i=1;i<tasktable.rows.length;++i){
			var temp="操作"+(i-1);
			if(temp==td.id){
				var prerow=tasktable.rows[i];
				document.getElementById("title").value=prerow.cells[0].innerText;
				if(td.name=="play"){
					if(prerow.cells[4].innerText=="running"){
						alert("当前任务正在运行中，无法开始！");
						return;
					}
					document.getElementById("taskmanage").action="StartTaskServlet";
					document.getElementById("taskmanage").submit();
				}
				else if(td.name=="pause"){
					if(prerow.cells[4].innerText=="stopped"){
						alert("当前任务已经停止，无法暂停！");
						return;
					}
					document.getElementById("taskmanage").action="StopTaskServlet";
					document.getElementById("taskmanage").submit();
				}
				else if(td.name=="edit"){
					if(prerow.cells[4].innerText=="running"){
						alert("请先停止当前任务！");
						return;
					}
					document.getElementById("taskmanage").action="";
					alert("修改任务功能还没有实现");
				}
				else{
					if(prerow.cells[4].innerText=="running"){
						alert("请先停止当前任务！");
						return;
					}
					document.getElementById("taskmanage").action="DeleteTaskServlet";
					document.getElementById("taskmanage").submit();
				}
				break;
			}
		}
	}
	$(document).ready(function() {

		$("#ifTimeBtn").click(function() {
			$("#ifTimeModal").modal();
		});

		$('[data-toggle="popover"]').popover();
	});

	$(function() {
		$('.popover-toggle').popover('toggle');
	});
</script>
</html>
