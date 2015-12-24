<%@ page language="java" contentType="text/html; charset=utf-8" import="java.sql.*,java.util.*,database.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>管理员界面</title>
	
    <meta name="keywords" content="keyword1,keyword2,keyword3">
    <meta name="description" content="this is my page">
    <meta name="content-type" content="text/html; charset=UTF-8">
    
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
 <!--
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
  -->
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

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
      		<a class="navbar-brand">欢迎IFTTT管理员！</a>
    	</div>
    	<div>
    		<ul class="nav navbar-nav">
        		<li><a href="#" id="messageManage" onclick = "showMessageInfor()">消息管理</a></li>
        		<li><a href="#" id="userManage" onclick="showUserInfor()">会员资料</a></li>
        		<li><a href="#" id="userManage" onclick="showMessagePublish()">发布消息</a></li>
      		</ul>
      		<ul class="nav navbar-nav navbar-right">
        		<li><a href="LoginOutServlet"><span class="glyphicon glyphicon-remove"></span>退出</a></li>
      		</ul>
    	</div>
  	</div>
  </nav>
  
  <!-- 会员信息表 -->
  <div class="container" id="userInformationList" style="display:none">
  	 <table class="table table-hover" id="userinformation">
    	<thead>
      		<tr>
        		<th>用户名</th>
        		<th>余额</th>
        		<th>积分</th>
        		<th>等级</th>
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
      			<th>时间</th>
        		<th>类型</th>
        		<th>接收对象</th>
        		<th>内容</th>
        		<th>操作</th>
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
        			<input type="button" id=<%="修改"+i%> onclick="changeMessage(this)" value="修改">
        			<input type="button" id=<%="删除"+i%> onclick="deleteMessage(this)" value="删除">
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
  	<h1>发布消息</h1>
  	
  	<div class="btn-group">
   		<button type="button" class="btn btn-default" id="selectMessageType">类型</button>
   		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
   			<span class="caret"></span>
   		</button>
   		<ul class="dropdown-menu" role="menu">
      		<li><a href="#" onclick="updateSelectType('selectMessageType',this)">公告</a></li>
      		<li><a href="#" onclick="updateSelectType('selectMessageType',this)">私信</a></li>
   		</ul>
	</div>
	<br />
	
	<div class="btn-group">
   		<button type="button" class="btn btn-default" id="selectMessageObject">接收对象</button>
   		<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
   			<span class="caret"></span>
   		</button>
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
  	<br />
  	<form  id="postmessage" action="#">
  		<input type="hidden" id="newMessageType" name="newMessageType" value="">
  		<input type="hidden" id="newMessageReceiver" name="newMessageReceiver" value="">
  		<textarea rows="15%" cols="60%" id="newMessagecontent"></textarea>
  		<input type="hidden" id="newMessageContent" name="newMessageContent" value="guoyi">
  		<input type="button" value="确定" onclick = "sendMessage()">
  	</form>
  	 
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
 //   }
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
        	<button type="submit" class="btn btm-default" onclick="changeMessageSubmit()">OK</button>
         	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
         
        </div>
      </div>
    </div>
  </div>
   </form>
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
		
		$(ss).modal();
	}
	
	</script>
  
  <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
</html>