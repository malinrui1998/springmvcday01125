<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="<%=request.getContextPath()%>/page/jquery/jquery-3.4.1.min.js"></script>
<div id="login">
    <div class="icon"></div>
    <div class="login-box">
        <div><c:if test="${msg!=null}">${msg}</c:if></div>
        <form action="<%=request.getContextPath()%>/login.action" method="post">
            <dl>
                <dt>用户名：</dt>
                <dd><input type="text" name="user_name" class="input-text"/>
                    <span id="loginNameSpan"></span></dd>
                <dt>密　码：</dt>
                <dd><input type="password" name="user_password" class="input-text"/>
                    <span id="passwordSpan"></span></dd>
            </dl>

            <div class="buttons">
                <input type="submit" value="登录系统" class="input-button" onclick="validate();"/>
                <input type="reset" value="重　　填" class="input-button"/>
            </div>
            <%--<input type="submit" value="登录">--%>
            <%--<input type="button" name="check" value="check">--%>
            <%--<input type="button" name="json" value="json">--%>
        </form>
    </div>
</div>
<script type="text/javascript">

    $(function () {

        var json = $("input[name=json]");
        json.on("click", function () {

            location.href = "<%=request.getContextPath()%>/searchPage.action"
        })
        var check = $("input[name=check]");
        check.on("click", function () {

            location.href = "<%=request.getContextPath()%>/checkPage.action"
        })

    })
</script>
</body>
</html>
