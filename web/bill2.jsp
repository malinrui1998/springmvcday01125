<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>图书管理</title>
    <link type="text/css" rel="stylesheet" href="css/style.css">

</head>
<body>
<div class="menu">
    <table>
        <tbody>
        <tr>
            <td>
                <form method="post" action="bill.do">
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
                <td><span class="STYLE1">否
						</span>
                </td>
                <td>
                    <em>
                        <input value="借阅" class="input-button" onclick="" type="button">
                    </em>
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
                <td><span class="STYLE1">是
						</span>
                </td>
                <td>
                    <em><input value="借阅" class="input-button-disabled" onclick="" type="button" disabled="false">
                    </em>
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
                <td><span class="STYLE1">
							否
						</span>
                </td>
                <td>
                    <em><input value="借阅" class="input-button" onclick="" type="button">
                    </em>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>