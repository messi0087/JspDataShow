package Servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import connection.Date_Deal_LightingSituation;


public class LightingSituation_Date extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //处理事故照明情况
        Date_Deal_LightingSituation date_deal_LightingSituation = new Date_Deal_LightingSituation();
        date_deal_LightingSituation.deal_LightingSituation();

        //System.out.println("12");
        ObjectMapper mapper = new ObjectMapper();    //提供java-json相互转换功能的类

        String json = mapper.writeValueAsString(date_deal_LightingSituation.lightingSituation_return());    //将list中的对象转换为Json格式的数组
        // System.out.println(json);
        //将json数据返回给客户端
        response.setContentType("text/html; charset=utf-8");
        response.getWriter().write(json);

    }
}