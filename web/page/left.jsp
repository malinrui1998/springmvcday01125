<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>超市账单管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript">
	function logout() {
		top.location = "login.jsp";
	}
</script>
</head>
<body class="frame-bd">
	<ul class="left-menu">
		<li><a href="/mlr/bookList.action" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_bill.gif" />
		</a>
		</li>
		<!--<li><a href="providerList.html" target="mainFrame"><img
				src="images/btn_suppliers.gif" />
		</a>
		</li>-->
		<li><a href="bill2.jsp" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_jieyue.gif" />
		</a>
		</li>
		
		<li><a href="/mlr/userList.action" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_users.gif" />
		</a>
		</li>	
		<li><a href="updatePwd.jsp" target="mainFrame">
			<img src="<%=request.getContextPath()%>/images/btn_password.gif" />
		</a>
		</li>
		<li><a href="#" onClick="logout();">
			<img src="<%=request.getContextPath()%>/images/btn_exit.gif" />
		</a>
		</li>
	</ul>
</body>
</html>
