<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*,java.util.*,database.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>管理员</title>
	
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
  .logo-small {
      color: #f4511e;
      font-size: 100px;
  }
	
.textarea{
    width: 400px; 
    min-height: 20px; 
    max-height: 300px;
    _height: 120px; 
    margin-left: auto; 
    margin-right: auto; 
    padding: 3px; 
    outline: 0; 
    border: 1px solid #a0b3d6; 
    font-size: 12px; 
    line-height: 24px;
    padding: 2px;
    word-wrap: break-word;
    overflow-x: hidden;
    overflow-y: auto;

    border-color: rgba(82, 168, 236, 0.8);
    box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1), 0 0 8px rgba(82, 168, 236, 0.6);
}
  </style>

	<script>
		
		function test(ss){
			alert(ss);
		}
		function showUserInfor(){
		
			document.getElementById("userInformationList").style.display="block";
			document.getElementById("messageList").style.display="none";
			document.getElementById("messagePublish").style.display="none";
		}
		function showMessageInfor(){
			document.getElementById("messageList").style.display="block";
			document.getElementById("userInformationList").style.display="none";
			document.getElementById("messagePublish").style.display="none";
		}
		
		function showMessagePublish(){
			document.getElementById("userInformationList").style.display="none";
			document.getElementById("messageList").style.display="none";
			document.getElementById("messagePublish").style.display="block";
			
			document.getElementById("selectMessageType").innerText="类型";
			document.getElementById("selectMessageObject").innerText="接收对象";
		}
		
		function changeMessage(tr){
			var tab = document.getElementById("messageTable");
			for(var i=1;i<tab.rows.length;++i){
				var temp="修改"+(i-1);
				if(temp==tr.id){
					var row = tab.rows[i];
					document.getElementById("messageTime").innerText=row.cells[0].innerText;
					document.getElementById("presentMessageTime").value=row.cells[0].innerText;
					document.getElementById("messageType").innerText=row.cells[1].innerText;
					document.getElementById("messageObject").innerText=row.cells[2].innerText;
					document.getElementById("messageContent").value=row.cells[3].innerText;
					$("#changeMessageModal").modal();
					break;
				}
			}
		}
		function deleteMessage(tr){
			var tab = document.getElementById("messageTable");
			for(var i=1;i<tab.rows.length;++i){
				var temp="删除"+(i-1);
				if(temp==tr.id){
					var row = tab.rows[i];
					document.getElementById("deleteTime").value=row.cells[0].innerText;
					var preform=document.getElementById("deleteMessageForm");
					preform.submit();
					break;
				}
			}
		}
		
		function updateSelectType(id,select){
			document.getElementById(id).innerText=select.innerText;
			if(id=="selectMessageType" && document.getElementById("selectMessageType").innerText=="公告"){
				document.getElementById("selectMessageObject").innerText="所有人";
			}
			else if(id=="selectMessageType" && document.getElementById("selectMessageType").innerText=="私信"){
				document.getElementById("selectMessageObject").innerText="接收对象";
			}
		}
		
		function updateSelectObject(id,select){
			if(document.getElementById("selectMessageType").innerText=="私信"){
				document.getElementById(id).innerText=select.innerText;
			}
			else if(document.getElementById("selectMessageType").innerText=="类型"){
				alert("请选择消息类型！");
			}
			else
			{
				alert("发布公告时候不可指定接受对象！接收对象为所有人");
				//document.getElementById(id).innerText="接收对象";
			}
		
		}
		
		function sendMessage(){
			if(document.getElementById("selectMessageType").innerText=="类型"){
				alert("请选择消息发送类型！");
				return;
			}
			if(document.getElementById("selectMessageObject").innerText=="接受对象"&&document.getElementById("selectMessageType").innerText=="私信"){
				alert("请选择私信的接收对象");
				return;
			}
			if(document.getElementById("newMessagecontent").value==""){
				alert("请输入消息内容！");
				return;
			}
			document.getElementById("newMessageType").value=document.getElementById("selectMessageType").innerText;
			document.getElementById("newMessageReceiver").value=document.getElementById("selectMessageObject").innerText;
			document.getElementById("newMessageContent").value=document.getElementById("newMessagecontent").value;
			document.getElementById("postmessage").action="SendMessageServlet";
			document.getElementById("postmessage").submit();
		}
	</script>
  </head>
  <body>

  <!-- 导航栏 -->
  <nav class="navbar navbar-default">
  	<div class="container-fluid">
    	<div class="navbar-header">
      		<a class="navbar-brand">IFTTT管理</a>
    	</div>
    	<div>
    		<ul class="nav navbar-nav">
        		<li><a href="#" id="messageManage" onclick = "showMessageInfor()"><span class="glyphicon glyphicon-th-list"></span>&nbsp;&nbsp;消息管理</a></li>
        		<li><a href="#" id="userManage" onclick="showUserInfor()"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;会员资料</a></li>
        		<li><a href="#" id="userManage" onclick="showMessagePublish()"><span class="glyphicon glyphicon-edit"></span>&nbsp;&nbsp;发布消息</a></li>
      		</ul>
      		<ul class="nav navbar-nav navbar-right">
        		<li><a href="LoginOutServlet"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;注销</a></li>
      		</ul>
    	</div>
  	</div>
  </nav>
  
  <!-- 会员信息表 -->
  <div class="container" id="userInformationList" style="display:none">
  	 <table class="table table-hover" id="userinformation">
    	<thead>
      		<tr>
        		<th><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;用户名</th>
        		<th><span class="glyphicon glyphicon-credit-card"></span>&nbsp;&nbsp;余额</th>
        		<th><span class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;积分</th>
        		<th><span class="glyphicon glyphicon-certificate"></span>&nbsp;&nbsp;等级</th>
      		</tr>
    	</thead>
    	<tbody>
    	<%
    	ArrayList<String>allUsers = GetUsers.get();
    	for(int i=0;i<allUsers.size();++i){
    		String info = GetUserInformation.get(allUsers.get(i));
    		String infor[] = info.split(",");
    		assert(infor.length==4);
    		
    	%>
      		<tr onclick="spendInfor(this);" id =<%=infor[0]%>>
        		<td><%=infor[0]%></td>
        		<td><%=infor[1]%></td>
        		<td><%=infor[2]%></td>
        		<td><%=infor[3]%></td>
      		</tr>
      		<% } %>
    	</tbody>
  	</table>
  </div>
  
  
  
  <!-- 消息列表 -->
  <div class="container" id="messageList" style="display:block">
  	 <table id="messageTable" class="table table-hover">
    	<thead>
      		<tr>
      			<th><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;时间</th>
        		<th><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;类型</th>
        		<th><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;接收对象</th>
        		<th><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;内容</th>
        		<th><span class="glyphicon glyphicon-wrench"></span>&nbsp;&nbsp;操作</th>
      		</tr>
    	</thead>
    	<tbody>
    	<% 
    	ArrayList<String> messageList = GetMessageList.get();
    	for(int i=0;i<messageList.size();++i){
    		String info[] = messageList.get(i).split(",");
    	%>
      		<tr>
        		<td><%=info[0]%></td>
        		<td><%=info[1]%></td>
        		<td><%=info[2]%></td>
        		<td><%=info[3]%></td>
        		<td>
        			<button type="button" class="btn btn-primary btn-sm" id=<%="修改"+i%> onclick="changeMessage(this)">
        				<span class="glyphicon glyphicon-edit"></span></button>
        			<button type="button" class="btn btn-danger btn-sm" id=<%="删除"+i%> onclick="deleteMessage(this)">
        				<span class="glyphicon glyphicon-trash"></span></button>
        			<form id="deleteMessageForm" action="DeleteMessageServlet">
        				<input type="hidden" id="deleteTime" name="deleteTime" value="">
        			</form>
        		</td>
      		</tr>
      	<% } %>
    	</tbody>
  	</table>
  </div>
  
  <!-- 发布消息 -->
  <div class="container" id="messagePublish" style="display:none">
  	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-6">
  	<div class="panel panel-info">
  	  <div class="panel-heading">发布消息</div>
  	  <div class="panel-body">
<div class="row">
	<div class="col-sm-6">
  	  	<div class="dropdown">
  	  		<label for="selectMessageType"><span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;消息类型：</label>
    		<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown" id="selectMessageType">类型
    			<span class="caret"></span></button>
    		<ul class="dropdown-menu">
	      		<li><a href="#" onclick="updateSelectType('selectMessageType',this)">公告</a></li>
	      		<li><a href="#" onclick="updateSelectType('selectMessageType',this)">私信</a></li>
    		</ul>
  		</div>
  	</div>
  	<div class="col-sm-6">
		<div class="dropdown">
			<label for="selectMessageObject"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;发送给：</label>
	   		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" id="selectMessageObject">接收对象
	   			<span class="caret"></span></button>
	   		<ul class="dropdown-menu" role="menu">
	   			<% 
	   			for(int i=0;i<allUsers.size();++i){
	   				String info = GetUserInformation.get(allUsers.get(i));
	   	    		String infor[] = info.split(",");
	   			%>
	      		<li><a href="#" onclick="updateSelectObject('selectMessageObject',this)"><%=infor[0]%></a></li>
	      		<%}%>
	   		</ul>
		</div>
	</div>
</div>
		
	  	<br />
	  	<form  id="postmessage" action="#">
	  		<input type="hidden" id="newMessageType" name="newMessageType" value="">
	  		<input type="hidden" id="newMessageReceiver" name="newMessageReceiver" value="">
	  		<label for="newMessagecontent"><span class="glyphicon glyphicon-comment"></span>&nbsp;&nbsp;内容：</label>
	  		<textarea rows="5" style="width:100%;" id="newMessagecontent"></textarea>
	  		<input type="hidden" id="newMessageContent" name="newMessageContent" value="guoyi">
	  	</form>
	  </div>
	  <div class="panel-footer">
	  	<button type="button" class="btn btn-success" onclick = "sendMessage()">
	  		<span class="glyphicon glyphicon-send"></span>&nbsp;&nbsp;发送</button>
	  </div>
  	</div>
  	
 </div>
     <div class="col-sm-3"></div>
  </div>
  </div>
  
   <!-- 消费记录Modal -->
	<% 
	for(int i=0;i<allUsers.size();++i){
		String username=allUsers.get(i).split(",")[0];
		{
%> 
  <div class="modal fade" id=<%="消费"+username%> role="dialog">
  	<div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">消费记录</h4>
        </div>
        <div class="modal-body">
         
  	    	<table class="table table-bordered">
    			<thead>
      				<tr>
        				<th>交易时间</th>
        				<th>交易金额</th>
        				<th>描述信息</th>
      				</tr>
    			</thead>
    			<tbody>

    					<% 
    					if(username!=null){
    						ArrayList<String> result =  GetTransaction.get(username);
    						for(int j=0;j<result.size();++j){
    							String info[] = result.get(j).split(",");
    							%>
    							<tr>
    								<th><%=info[0]%></th>
    								<th><%=info[1]%></th>
    								<th>描述信息</th>
    							</tr>
    				<%
    						}
    					}
    				%>
    			</tbody>
  			</table>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
    </div>


  <%
		}
	}
  %>
  
  <!-- 修改消息 -->
  <form action="ChangeMessageServlet" id="changemessageform">
  <div class="modal fade" id="changeMessageModal" role="dialog">
  	<div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">修改消息内容</h4>
        </div>
        
        <div class="modal-body">
        	
        	<b>时间：</b><a id="messageTime"></a><br />
        	<b>类型：</b><a id="messageType"></a><br />
        	<b>对象：</b><a id="messageObject"></a><br />
        	<b>内容：</b><p/>
        	<textarea rows="10%" cols="100" name="messageContent" id="messageContent" value=""></textarea>
        	
        	<input type="hidden" name="presentMessageTime" id="presentMessageTime" value="6">
        </div>
        <div class="modal-footer">
        	<button type="submit" class="btn btn-success" onclick="changeMessageSubmit()">
        		<span class="glyphicon glyphicon-ok"></span> Save!</button>
         	<button type="button" class="btn btn-danger" data-dismiss="modal">
         		<span class="glyphicon glyphicon-remove"></span>Close</button>
         
        </div>
      </div>
    </div>
  </div>
   </form>
   
   		<div class="panel" style="margin-top: 50px; background: transparent;">
			<p class="text-center">
				Copyright <span class="glyphicon glyphicon-copyright-mark"></span>
				2015 by <strong>GuoGeTang</strong>. All Rights Reserved.
			</p>
		</div>
  </body>
  
  <script>
  	
		$(document).ready(function(){
			
			$("#userManage").click(function(){
				document.getElementById("userInformationList").style.display="block";
				document.getElementById("messageList").style.display="none";
			});
			
			$("#messageManage").click(function(){
				
				document.getElementById("messageList").style.display="block";
				document.getElementById("userInformationList").style.display="none";
			});
		    
		});
		
	function spendInfor(tr){
		var ss="ss";
		ss=document.getElementById(tr.cells[0].innerText);
		ss="#消费"+tr.cells[0].innerText;
		alert(ss);
		$(ss).modal();
	}
	
	</script>
</html>