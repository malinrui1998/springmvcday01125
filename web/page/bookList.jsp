<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>超市账单管理系统-账单管理</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/page/jquery/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="menu">
    <form method="post" action="/mlr/bookList.action">
        <table>
            <tbody>
            <tr>
                <td>

                    <input name="method" value="query" class="input-text" type="hidden">
                    书籍名称：<input name="productName" class="input-text" type="text" value="">
                    作者：<input name="proName" class="input-text" type="text" value="">

                    是否借出：<input type="radio" name="payed" value="1">是<input type="radio" name="payed" value="0">否
                    <input value="查 询" type="submit">

                    <em>
                        <a href="/mlr/selectById.action?bookid=${item.bookid}">
                            <input name="select" value="查 询" class="input-button" type="submit"></a>
                    </em>

                </td>
            </tr>
            </tbody>
        </table>
</div>
<div class="main">

    <div class="optitle clearfix">

        <em><a href="page/billAdd.jsp"><input value="添加图书" class="input-button" type="button"></a>
        </em>
        <%--<em><input value="添加图书" class="input-button" onclick="window.location='<%=request.getContextPath()%>/page/billAdd.jsp'" type="button">--%>
        <%--</em>--%>
        <div class="title">图书管理&gt;&gt;</div>
    </div>
    <div class="content">
        <table class="list">
            <tbody>
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

            <c:forEach items="${pageInfo.list}" var="item">
                <tr>
                    <td>${item.bookid}</td>
                    <td><a href="<%=request.getContextPath()%>/getBookByid.action?bookid=${item.bookid}"
                           style="color:red">${item.productName}</a></td>
                    <td>${item.productUnit}</td>
                    <td>${item.proId}</td>
                    <td>${item.payed}</td>
                    <td collapse=2>
                        <em>
                            <a href="/mlr/deleteBook.action?bookid=${item.bookid}"><input
                                    value="删除" class="input-button" type="button"></a>
                        </em>
                        <%--<em>--%>
                            <%--<input value="删除" class="input-button" onclick="" type="button">--%>
                        <%--</em>--%>
                            <%--<em><input value="修改" class="input-button" onclick="" type="button">--%>
                            <%--</em>--%>
                        <em><a href="/mlr/selectById.action?bookid=${item.bookid}"><input
                                value="修改" class="input-button" type="button"></a>
                        </em>
                    </td>
                        <%--<td><input type="button" value="借阅"--%>
                        <%--<c:if test="${item.borrowBookUser.id!=null}">disabled </c:if> </td>--%>
                        <%--<td><input type="button" value="还书"--%>
                        <%--<c:if test="${item.borrowBookUser.id==null}">disabled </c:if> </td>--%>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</tbody>
</table>
<script type="text/javascript">
    $(function () {
        var a = $("input[type=button]");
        a.on("click", function () {
            for (var i = 0; i < a.length; i++) {
                var id = $(this)[i].parentNode.parentNode.children[0].innerHTML;
                console.log(bookid);
                location.href = "<%=request.getContextPath()%>/billView.action?bookid=" + bookid;
            }
        })
    })
</script>

<div align="center"> 当前页是第<span>${pageInfo.pageNum}</span>页 &nbsp; 一共<span>${pageInfo.pages}</span>页 &nbsp;
    <c:if test="${pageInfo.isFirstPage==false}">
        <a href="<%=request.getContextPath()%>/bookList.action?page=${pageInfo.prePage}"> 上一页</a></c:if>
    <c:if test="${pageInfo.isFirstPage==true}">上一页</c:if>
    <c:if test="${pageInfo.isLastPage==false}">
        <a href="<%=request.getContextPath()%>/bookList.action?page=${pageInfo.nextPage}">下一页</a>
    </c:if>
    <c:if test="${pageInfo.isLastPage==true}">下一页</c:if>
</div>
</form>
</body>
</html>
