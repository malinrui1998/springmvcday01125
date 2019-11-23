<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>超市账单管理系统-用户管理</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="menu">
    <table>
        <tbody>
        <tr>
            <td>
                <form method="post" action="/library/userServlet?flag=delpatch">
                    <input name="method" value="query" class="input-text" type="hidden">
                    用户名：<input name="name" class="input-text" type="text" value="">&nbsp;&nbsp;&nbsp;&nbsp;
                    <input value="查 询" type="submit">
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="main">

    <div class="optitle clearfix">
        <em><input value="添加用户" class="input-button" onclick="window.location='userAdd.jsp'" type="button">
        </em>
        <div class="title">用户管理&gt;&gt;</div>
    </div>
    <div class="content">
        <table class="list">
            <tbody>
            <tr>
                <td width="70" height="29">
                    <div class="STYLE1" align="center">编号</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">用户名</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">用户账号</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">性别</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">年龄</div>
                </td>
                <td width="150">
                    <div class="STYLE1" align="center">电话</div>
                </td>
                <td width="150">
                    <div class="STYLE1" align="center">权限</div>
                </td>
            </tr>
            <tr>
                <td height="23"><span class="STYLE1">1</span>
                </td>
                <td><span class="STYLE1"> 秦守新 </span>
                </td>
                <td><span class="STYLE1">
                        <a href="userView.jsp" style="color:red"> shouxin.qin</a>
						</span>
                </td>
                <td><span class="STYLE1">男 </span>
                </td>
                <td><span class="STYLE1"> 2</span>
                </td>
                <td><span class="STYLE1">111</span>
                </td>
                <td><span class="STYLE1">普通员工</span>
                </td>
            </tr>
            <c:forEach var="usermanagement" items="${userlist}">
            <tr>
                <td><c:out value="${usermanagement.id}"></c:out></td>
                <td><c:out value="${usermanagement.name}"></c:out></td>
                <td><a href="userView.jsp" style="color:red"><c:out value="${usermanagement.username}"></c:out></a></td>
                <td><c:out value="${usermanagement.gender}"></c:out></td>
                <td><c:out value="${usermanagement.phone}"></c:out></td>
                <td><c:out value="${usermanagement.birthDate}"></c:out></td>
                <td><c:out value="${usermanagement.userType}"></c:out></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<
<script >
    $(function () {
        $("input[name=all]").on("click", function () {
            $("input[name=id]").prop("checked", $("input[name=all]").prop("checked"))
        })
        $("input[name=delall]").on("click", function () {
            $("form").submit();
        })
        $("input[name=search]").on("click", function () {
            var name = $("input[name=name]").val();
            var major = $("input[name=major]").val();
            location.href = "/jsp0926/userServlet?flag=search&username=" + name + "&major=" + major;
        })
    })

</script>
</body>
</html>