<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <script src="<%=request.getContextPath()%>/page/jquery/jquery-3.4.1.min.js"></script>
</head>
<body>
<div class="main">
    <div class="optitle clearfix">
        <div class="title">图书管理&gt;&gt;</div>
    </div>
    <form id="form1" name="form1" method="post" action="/updateBook.action?id=${book.bookid}">
        <input type="hidden" name="method" value="update">
        <input type="hidden" name="billId" id="billId" value="6">
        <div class="content">
            <table class="box">
                <tbody>
                <tr>
                    <td class="field">书籍名称：</td>
                    <td><input type="text" name="productName" class="text" id="productName" value="西游记"> <font
                            color="red">*</font><font color="red" id="productName_span"></font></td>
                </tr>
                <tr>
                    <td class="field">作者：</td>
                    <td><input type="text" name="productUnit" class="text" id="productUnit" value=""> <font color="red">*</font><font
                            color="red" id="productUnit_span"></font></td>
                </tr>

                <tr>
                    <td class="field">出版社：</td>
                    <td>
                        <select name="proId" id="proId">

                            <option selected="" value="5">中华出版社</option>

                            <option value="7">清华出版社</option>

                            <option value="6">成光出版社</option>

                        </select>
                        <font color="red">*</font><font color="red" id="proId_span"></font>
                    </td>
                </tr>
                <tr>
                    <td class="field">是否借出：</td>
                    <td><input type="radio" name="payed" value="1">是<input type="radio" name="payed" checked="checked"
                                                                           value="0">否
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class="buttons">
            <input type="button" name="update" id="update" value="保存" class="input-button">
            <input type="button" name="button" id="button" onclick="history.back(-1)" value="返回" class="input-button">
        </div>

    </form>
</div>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bill/update.js"></script>

</body>
</html>