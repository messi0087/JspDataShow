package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginServlet1 extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        response.setContentType("text/html;charset = utf-8");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");

        if ("admin".equals(username) && "admin".equals(password)) {        /*这里，为了方便假设用户输入的用户名和口令都为 admin 时认为验证成功*/
            out.println("登录成功！欢迎你，" + username);
        } else {
            out.println("对不起！你的用户名或密码不正确。");
        }

        out.println("</body></html>");
    }



}
