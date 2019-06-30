<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/4/004
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>登录页面</title>

</head>

<body>
<form action = "LoginServlet" method = "post">    <%--将表单的 action 属性值设置为 login.do,它是一个要执行的动作的相对路径 --%>
    <table>
        <tr><td>用户名：</td>
            <td><input type = "text" name = "username" /></td>
        </tr>
        <tr><td>密&nbsp;&nbsp;&nbsp;码：</td>
            <td><input type = "password" name = "password" /></td>
        </tr>
        <tr><td><input type = "submit" value = "登录" /></td>
            <td><input type = "reset" value = "取消" /></td>
        </tr>
    </table>
</form>
</body>
</html>
