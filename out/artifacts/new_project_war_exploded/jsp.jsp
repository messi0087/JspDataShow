<%@ page import="connection.Getdate" %>
<%@ page import="connection.Date_accident" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/11/27/027
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    Getdate getdate=new Getdate();
    getdate.getdate();
    List<Date_accident> userList = getdate.getDateList();
    if(userList!=null){
        for(Date_accident user:userList){
            String userinfo = user.getN_easting()+"---"+user.getN_easting()+"---"+user.getLevel();
%>
<li><%=userinfo %></li>
<%
        }
    }
%>
</body>
</html>
