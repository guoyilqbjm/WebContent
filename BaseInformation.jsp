<%@ page language="java" import = "java.util.*,database.*" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>

<style type="text/css">
div { margin:15px 15px;}
table {border-left:1px solid #000;border-top:1px solid #000; text-align:center;}
table tr td { border-right:1px solid #000; border-bottom:1px solid #000;}
</style>

<script type = 'text/javascript'>
	var curRow;	//全局行号
	var curRowId; //选中行的记录信息的ID
	var curColor;
	function selectRow(tr){
		if(curRow){
			curRow.bgColor = curColor;
			curColor = tr.bgColor;
			tr.bgColor = "#FFE9B3";
		}else{
			curColor = tr.bgColor;
			tr.bgColor = "FFE9B3";
		}
		curRow = tr;
		curRowId = tr.id;
		
		document.form2.selectTaskInformation.value=tr.cells[0].innerText+","+tr.cells[1].innerText+","+tr.cells[2].innerText;

	}
	function newTaskSubmit(){
		document.form2.action="taskmanager.jsp";
		document.form2.submit();
	}
	
	function startSubmit(){
		
		if(document.form2.selectTaskInformation.value==""){
			alert("请选择要开始的任务");
		}
		else{
			if(curRow.cells[3].innerText=="运行中！"){
				alert("该任务进行中，无法重新开始！");
			}
			else{
				document.form2.action="StartTaskServlet";
				document.form2.submit();
			}
		}
	}
	
	function deleteSubmit(){
		if(document.form2.selectTaskInformation.value==""){
			alert("请选择要删除的任务");
		}
		else{
			if(curRow.cells[3].innerText=="运行中！"){
				alert("该任务进行中，请先停止该任务！");
			}
			else{
				document.form2.action="DeleteTaskServlet";
				document.form2.submit();
			}
		}
	}
	
	function stopSubmit(){
		if(document.form2.selectTaskInformation.value==""){
			alert("请选择要停止的任务");
		}
		else{
			if(curRow.cells[3].innerText=="未开始！"){
				alert("该任务没有开始，无法停止！");
			}
			else{
				document.form2.action="StopTaskServlet";
				document.form2.submit();
			}
		}
	}
</script>

<body onload = "javascript:selectRow(1)">
<div>
<h>Welcome <%=request.getSession().getAttribute("username")%></h>
<form method="post" action="LoginOutServlet">
	<input type="submit" value="退出" class="btn" style="width: 85px; height: 30px;"/>
</form>
<table width="900" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td>任务名称</td>
    <td>thisMode</td>
    <td>thatMode</td>
    <td>任务状态</td>
    
  </tr>
  <% String username = (String)request.getSession().getAttribute("username");
  	if(username!=""){
  		ArrayList<String> taskList = GetTaskList.get(username);
  		for(int i=0;i<taskList.size();++i){
  			String td[] = taskList.get(i).split(",");
  			
  	%>
  		<tr onclick = "selectRow(this);">
  			<td ><%=td[0]%></td>
  			<td ><%=td[1] %></td>
  			<td ><%=td[2] %></td>
  			<td ><%=td[3] %></td>
  	<%
  		}
  	}
  %>
 
  
</table>
</div>
<div>
</div>

<form name = "form2" method="post" action = "">
	<input type="submit" onclick = "newTaskSubmit()" value="创建任务" class="btn" style="width: 85px; height: 30px;"/>
	<input type="submit" onclick = "deleteSubmit()" value="删除任务" class="btn" style="width: 85px; height: 30px;"/>
	<input type = "hidden" name="selectTaskInformation" value="" id = "selectTaskInformation"/>
	<input type="submit" onclick = "startSubmit()" value="开始任务" class="btn" style="width: 85px; height: 30px;"/>
	<input type="submit" onclick = "stopSubmit()" value="停止任务" class="btn" style="width: 85px; height: 30px;"/>
</form>

</body>

</html>