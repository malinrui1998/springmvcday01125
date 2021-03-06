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
                <form method="post" action="<%=request.getContextPath()%>/mlr/userlist">
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
        <em><input value="添加用户" class="input-button" onclick="window.location='<%=request.getContextPath()%>/page/userAdd.jsp'" type="button">
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
            <c:forEach items="${pageInfo.list}" var="item">
                <tr>
                    <td>${item.user_id}</td>
                    <td>${item.user_name}</td>
                    <td>${item.user_age}</td>
                    <td>${item.user_major}</td>
                    <td><img src="/pic/${item.headpath}" width="100" height="100"></td>
                    <td><a href="#">编辑</a></td>
                    <td><a href="#">外派</a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
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

<script src="<%=request.getContextPath()%>/page/jquery/jquery-3.4.1.min.js"></script>

<div align="center"> 当前页是第<span>${pageInfo.pageNum}</span>页 &nbsp; 一共<span>${pageInfo.pages}</span>页 &nbsp;
    <c:if test="${pageInfo.isFirstPage==false}">
        <a href="<%=request.getContextPath()%>/userList.action?page=${pageInfo.prePage}"> 上一页</a></c:if>
    <c:if test="${pageInfo.isFirstPage==true}">上一页</c:if>
    <c:if test="${pageInfo.isLastPage==false}">
        <a href="<%=request.getContextPath()%>/userList.action?page=${pageInfo.nextPage}">下一页</a>
    </c:if>
    <c:if test="${pageInfo.isLastPage==true}">下一页</c:if>
</div>
<script type="text/javascript">
    $(function () {

        var a = $("a");
        a.on("click", function () {
            for (var i = 0; i < a.length; i++) {
                var id = $(this)[i].parentNode.parentNode.children[0].innerHTML;
                console.log(id);
                location.href = "<%=request.getContextPath()%>/getUserByid.action?id=" + id;
            }
        })
    })
</script>
</body>
</html>
