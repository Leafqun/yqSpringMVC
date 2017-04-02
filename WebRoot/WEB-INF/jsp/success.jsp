<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功提示</title>
</head>
<body background="${pageContext.request.contextPath}/images/1.jpg">
	操作成功！！！
	<font color="blue"> <b><span id="totalSecond">5</span>秒之后跳到登录页面</b>
	</font>
	<script language="javascript" type="text/javascript"> 
			var second = document.getElementById('totalSecond').textContent; 
 
			if (navigator.appName.indexOf("Explorer") > -1)  { 
    			second = document.getElementById('totalSecond').innerText; 
			} else { 
    			second = document.getElementById('totalSecond').textContent; 
			} 
 
			setInterval("redirect()", 1000); 
			function redirect() { 
				if (second < 0) { 
   					 location.href = '${pageContext.request.contextPath}/login.html'; 
				} else { 
    			if (navigator.appName.indexOf("Explorer") > -1) { 
       				 document.getElementById('totalSecond').innerText = second--; 
   				 } else { 
     			   document.getElementById('totalSecond').textContent = second--; 
 			  	 } 
				} 
			}
		</script>
</body>
</html>