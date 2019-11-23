<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>超市账单管理系统-账单管理</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script src="<%=request.getContextPath()%>/page/jquery/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="menu">
    <table>
        <tbody>
        <tr>
            <td>
                <form method="post" action="<%=request.getContextPath()%>/bookList.action">
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
        <em><input value="添加图书" class="input-button" onclick="window.location='billAdd.jsp'" type="button">
        </em>
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
                <td width="100">
                    <div class="STYLE1" align="center">借阅人</div>
                </td>
            </tr>
            <tr>
                <td height="23"><span class="STYLE1">6</span>
                </td>
                <td><span class="STYLE1"><a href="billView.jsp" style="color:red"> 西游记</a>
						</span>
                </td>
                <td><span class="STYLE1"> 吴承恩</span>
                </td>
                <td><span class="STYLE1">中华出版社</span>
                </td>
                <td><span class="STYLE1">否</span>
                </td>
                <td collapse=2><em>
                    <input value="删除" class="input-button" onclick="" type="button">
                </em>
                    <em><input value="修改" class="input-button" onclick="" type="button">
                    </em>
                </td>
                <td><span class="STYLE1">張</span>
                </td>
            </tr>
            <tr>
                <td height="23"><span class="STYLE1">6</span>
                </td>
                <td><span class="STYLE1"><a href="billView.jsp" style="color:red"> 西游记</a></span>
                </td>
                <td><span class="STYLE1"> 吴承恩</span>
                </td>
                <td><span class="STYLE1">中华出版社</span>
                </td>
                <td><span class="STYLE1">否</span>
                </td>
                <td collapse=2><em><input value="删除" class="input-button" onclick="" type="button">
                </em>
                    <em><input value="修改" class="input-button" onclick="" type="button">
                    </em>
                </td>
                <td><span class="STYLE1">張</span>
                </td>
            </tr>
            <tr>
                <td height="23"><span class="STYLE1">6</span>
                </td>
                <td><span class="STYLE1">
                    <a href="billView.jsp" style="color:red"> 西游记</a>
						</span>
                </td>
                <td><span class="STYLE1"> 吴承恩</span>
                </td>
                <td><span class="STYLE1">中华出版社</span>
                </td>
                <td><span class="STYLE1">否</span>
                </td>
                <td collapse=2><em><input value="删除" class="input-button" onclick="" type="button">
                </em>
                    <em><input value="修改" class="input-button" onclick="" type="button">
                    </em>
                </td>
                <td><span class="STYLE1">張</span>
                </td>
            </tr>
            <c:forEach items="${books}" var="item">
                <tr>
                    <input type="hidden" name="bubid" value="{item.bubid}">
                    <td>${item.id}1</td>
                    <td>${item.name}</td>
                    <td>${item.author}</td>
                    <td>${item.publishDate}</td>
                    <td><input type="button" value="借阅"
                               <c:if test="${item.borrowBookUser.id!=null}">disabled </c:if> </td>
                    <td><input type="button" value="还书"
                               <c:if test="${item.borrowBookUser.id==null}">disabled </c:if> </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
<c:forEach items="${books}" var="item">
    <tr>
        <input type="hidden" name="bubid" value="{item.bubid}">
        <td>${item.user_id}</td>
        <td>${item.id}1</td>
        <td>${item.name}</td>
        <td>${item.author}</td>
        <td>${item.publishDate}</td>
        <td><input type="button" value="借阅"
                   <c:if test="${item.borrowBookUser.id!=null}">disabled </c:if> </td>
        <td><input type="button" value="还书"
                   <c:if test="${item.borrowBookUser.id==null}">disabled </c:if> </td>
    </tr>
</c:forEach>


</tbody>
</table>
<script type="text/javascript">
    $(function () {

        var a = $("input[type=button]");
        a.on("click", function () {
            for (var i = 0; i < a.length; i++) {
                var id = $(this)[i].parentNode.parentNode.children[0].innerHTML;
                console.log(id);
                location.href = "<%=request.getContextPath()%>/borrow.action?bookid=" + id;
            }
        })


    })
</script>
<div align="center"> 当前页是第<span>${pageInfo.pageNum}</span>页 &nbsp; 一共<span>${pageInfo.pages}</span>页 &nbsp;
    <c:if test="${pageInfo.isFirstPage==false}">
        <a href="<%=request.getContextPath()%>/userList.action?page=${pageInfo.prePage}"> 上一页</a></c:if>
    <c:if test="${pageInfo.isFirstPage==true}">上一页</c:if>
    <c:if test="${pageInfo.isLastPage==false}">
        <a href="<%=request.getContextPath()%>/userList.action?page=${pageInfo.nextPage}">下一页</a>
    </c:if>
    <c:if test="${pageInfo.isLastPage==true}">下一页</c:if>
</div>
</body>
</html>
