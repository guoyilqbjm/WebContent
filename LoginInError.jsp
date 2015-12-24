<%@ page language="java" contentType="text/html; charset=utf-8" import="error.*"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>登陆失败！</title>
</head>
<script>
	function locations(){
		window.location = <%='"'+ErrorInformation.getBasePage()+'"'%>;
	}
</script>
<body>
	<p><%=ErrorInformation.get() %></p>
	<b style=color:blue><span id=jump>5</span> 秒钟后页面将自动返回原来页面...</b>
	<input type="button" value="立即返回" onclick="locations()">
</body>
</html>
 <script>

    function countDown(secs){
    	jump.innerText=secs;
    	if(--secs>0)
        	setTimeout("countDown("+secs+" )",1000);
    	else
    		window.location = <%='"'+ErrorInformation.getBasePage()+'"'%>;
     	}
     countDown(5);
 </script>