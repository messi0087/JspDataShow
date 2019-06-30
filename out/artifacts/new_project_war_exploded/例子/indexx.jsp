<%--
  Created by IntelliJ IDEA.
  User: MrDonkey
  Date: 2018/8/23
  Time: 22:16
  To change this template use File | Settings | File Templates.
--%>
<span style="font-size:12px;"><span style="font-size:14px;"><%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%><%@ page
        import="connection.Date_accident" %>
<%@ page contentType="text/html;charset=utf-8"%>
<html>
<head>
<style type="text/css">
table {
    border: 2px #CCCCCC solid;
    width: 360px;
}

td,th {
    height: 30px;
    border: #CCCCCC 1px solid;
}
</style>
</head>
<body>
    <%
        String passwrod = "";
        String user = "root";
        String url = "jdbc:mysql://localhost:3308/test1? & serverTimezone=Hongkong & useUnicode=true & characterEncoding=utf-8&&useSSL=false";
        //联结字符串
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection connection = DriverManager.getConnection(url,user,passwrod);
        Statement statement = connection.createStatement();
        String sql = "select * from origin";
        ResultSet rs = statement.executeQuery(sql);
    %>
    <br>
    <br>
    <table align="center">
        <tr>
            <th>
                <%
                    out.print("Easting");
                %>
            </th>
            <th>
                <%
                    out.print("Westing");
                %>
            </th>
            <th>
                <%
                    out.print("level");
                %>
            </th>
        </tr>

        <%
            while (rs.next()) {
        %>
        <tr>
            <td>
                <%
                    out.print(rs.getString(1));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(2));
                %>
            </td>
            <td>
                <%
                    out.print(rs.getString(13));
                %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
    <div align="center">
        <br> <br> <br>
        <%
            out.print("数据查询成功，恭喜你");
        %>
    </div>
    <%
        rs.close();
        statement.close();
        connection.close();
    %>
</body>
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span></span>

