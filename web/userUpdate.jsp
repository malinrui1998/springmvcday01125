<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="main">
    <div class="optitle clearfix">
        <div class="title">用户管理&gt;&gt;</div>

    </div>
    <form id="form1" name="form1" method="post" action="action="${pageContext.servletContext.contextPath}/userServlet?flag=update">
        <input type="hidden" name="method" value="update">
        <div class="content">
            <font color="red"></font>
            <table class="box">
                <tbody>
                <c:forEach var="usermanagement" items="${userlist}">
                <tr>
                    <td class="field">用户编号：</td>
                    <td><input type="hidden" name="userId" value="<c:out value="${usermanagement.id}"></c:out>"> 1</td>
                </tr>
                <tr>
                    <td class="field">用户名：</td>
                    <td><input type="text" name="name" class="text" id="name" value="<c:out value="${usermanagement.name}"></c:out>"> <font
                            color="red">*</font><font color="red" id="name_span"></font></td>
                </tr>
                <tr>
                    <td class="field">用户性别：</td>
                    <td><select name="gender" id="gender">
                        <option value="<c:out value="${usermanagement.gender}"></c:out>" checked="">男</option>
                        <option value="<c:out value="${usermanagement.gender}"></c:out>">女</option>
                    </select></td>
                </tr>
                <tr>
                    <td class="field">出生日期：</td>
                    <td><input type="text" name="birthDate" class="text" id="birthDate" value="<c:out value="${usermanagement.birthDate}"></c:out>"> <font
                            color="red">*</font><font color="red" id="birthDate_span"></font></td>
                </tr>
                <tr>
                    <td class="field">用户电话：</td>
                    <td><input type="text" name="phone" class="text" id="phone" value="<c:out value="${usermanagement.phone}"></c:out>"> <font
                            color="red">*</font><font color="red" id="phone_span"></font></td>
                </tr>
                <tr>
                    <td class="field">用户地址：</td>
                    <td><input name="address" id="address" class="text" value="<c:out value="${usermanagement.address}"></c:out>"></td>
                </tr>
                <tr>
                    <td class="field">用户权限：</td>
                    <td><input type="radio" name="userType" value="<c:out value="${usermanagement.userType}"></c:out>">管理员
                        <input type="radio" name="userType" value="<c:out value="${usermanagement.userType}"></c:out>" checked="true">普通用户
                        <input type="radio" name="userType" value="<c:out value="${usermanagement.userType}"></c:out>">经理
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <input type="button" name="update" id="update" value="修改" class="input-button">
            <input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
        </div>

    </form>
</div>
<script type="text/javascript" src="js/user/update.js"></script>


</body>
</html>