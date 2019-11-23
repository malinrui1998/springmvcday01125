<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书管理</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/page/jquery/jquery-3.4.1.min.js"></script>

</head>
<body>
<div class="menu">
    <table>
        <tbody>
        <tr>
            <td>
                <form method="post" action="<%=request.getContextPath()%>/bill2.action">
                    <input name="method" value="query" class="input-text" type="hidden">
                    书籍名称：<input name="productName" class="input-text" type="text" value="">
                    作者：<input name="proName" class="input-text" type="text" value="">
                    是否借出：<input type="radio" name="payed" value="1">是<input type="radio" name="payed" value="0">否
                    <input value="查 询" type="submit">
                </form>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="main">
    <div class="optitle clearfix">
        <div class="title">借阅管理&gt;&gt;</div>
    </div>
    <div class="content">
        <table class="list">
            <thead>
            <tr>
                <td width="70" height="29">
                    <div class="STYLE1" align="center">图书编号</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">书籍名称</div>
                </td>
                <td width="80">
                    <div class="STYLE1" align="center">作者</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">出版社</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">是否借出</div>
                </td>
                <td width="100">
                    <div class="STYLE1" align="center">图书管理</div>
                </td>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${pageInfo.list}">
                <tr>
                    <td>${item.bookid}</td>
                    <td><a href="/billView.jsp" style="color:red">${item.productName}</a></td>
                    <td>${item.productUnit}</td>
                    <td>${item.proId}</td>
                    <td>${item.payed}</td>
                    <td>
                        <em>
                            <form action="<%=request.getContextPath()%>/borrow.action" method="post">
                                <input type="hidden" name="bookid" value="${item.bookid}">
                                <input value="借阅" type="submit"
                                />
                                <%--<c:if test="${item.press=='1'}" > class="input-button-disabled"></c:if>--%>
                                <%--<c:if test="${item.press=='0'}" > class="input-button" ></c:if>--%>
                            </form>
                        </em>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>