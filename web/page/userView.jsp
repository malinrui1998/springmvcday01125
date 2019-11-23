<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link type="text/css" rel="stylesheet" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div class="main">
    <div class="optitle clearfix">
        <div class="title">用户管理&gt;&gt;</div>
    </div>
    <div class="content">
        <table class="box">
            <tbody>
            <tr>
                <td class="field">用户编号：</td>
                <td>1<input type="hidden" id="userId" value="<c:out value="${usermanagement.id}"></c:out>"></td>
            </tr>
            <tr>
                <td class="field">用户名：</td>
            </tr>
            <tr>
                <td class="field">用户账号：</td>
            </tr>
            <tr>
                <td class="field">用户性别：</td>
            </tr>
            <tr>
                <td class="field">出生日期：</td>
            </tr>
            <tr>
                <td class="field">用户年龄：</td>
            </tr>
            <tr>
                <td class="field">用户电话：</td>
            </tr>
            <tr>
                <td class="field">用户地址：</td>
            </tr>
                <c:forEach var="usermanagement" items="${userlist}">
            <tr>
                <td><c:out value="${usermanagement.id}"></c:out></td>
                <td><c:out value="${usermanagement.name}"></c:out></td>
                <td><c:out value="${usermanagement.username}"></c:out></td>
                <td><c:out value="${usermanagement.gender}"></c:out></td>
                <td><c:out value="${usermanagement.phone}"></c:out></td>
                <td><c:out value="${usermanagement.birthDate}"></c:out></td>
                <td><c:out value="${usermanagement.userType}"></c:out></td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="buttons">
        <input type="button" id="update" value="修改" class="input-button">
        <input type="button" id="del" value="删除" class="input-button">
        <input type="button" id="repassword" value="重置密码" class="input-button">
        <input type="button" id="backButton" onclick="history.back(-1)" value="返回" class="input-button">
    </div>
</div>
<script type="text/javascript" src="../js/user/view.js"></script>


</body>
</html>