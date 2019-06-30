package Servlet;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.Date;
import connection.Product;

import com.fasterxml.jackson.databind.ObjectMapper;

public class TestServlet extends HttpServlet {
    int a[]={40,150,4,10,10,10};
   // Getdate getdate = new Getdate();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> list = new ArrayList<Product>();
            //这里把“类别名称”和“销量”作为两个属性封装在一个Product类里，每个Product类的对象都可以看作是一个类别（X轴坐标值）与销量（Y轴坐标值）的集合

            list.add(new Product("衬衣", Date.Dates.i));
            list.add(new Product("短袖", 150));
            list.add(new Product("大衣", 10));

            ObjectMapper mapper = new ObjectMapper();    //提供java-json相互转换功能的类

            String json = mapper.writeValueAsString(list);    //将list中的对象转换为Json格式的数组

System.out.println(json);

            //将json数据返回给客户端
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().write(json);

        }
    }
