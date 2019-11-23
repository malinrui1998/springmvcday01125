<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统登录 - 图书管理</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script type="text/javascript">

  // function validate(){
	// 	window.location.href="frame.jsp"
	// }
  </script>
</head>
<body class="blue-style">
<div id="login">
	<div class="icon"></div>
	<div class="login-box">
		<form  action="/library/userServlet?flag=login"  name="actionForm" id="actionForm"  method="post" >
			<dl>
				<dt>用户名：</dt>
				<dd><input type="text" name="username" class="input-text" />
					<span id="loginNameSpan"></span></dd>
				<dt>密　码：</dt>
				<dd><input type="password" name="password" class="input-text" />
					<span id="passwordSpan"></span></dd>
			</dl>
			<div class="buttons">
				<input type="submit"   value="登录系统" class="input-button" onclick="validate();" />
				<input type="reset"  value="重　　填" class="input-button" />
			</div>
		</form>
	</div>
</div>
</body>
</html>
