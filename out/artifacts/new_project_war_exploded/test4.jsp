<%@ page import="connection.Date" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/4/004
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>ECharts</title>

    <!-- 引入 echarts.js -->
    <script type="text/javascript" src="echarts2.js"></script>
    <!-- 引入jquery.js -->
    <script type="text/javascript" src="jquery-3.3.1.js"></script>
</head>
<body>

<%
    //设置每秒刷新一次
   // response.setIntHeader("Refresh", 10);
%>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 600px;height:400px;"></div>

<script>
    //function myFunction() {
     ///   setInterval(Function(), 1000);
   //}
    window.onload = function()
    {
        Function1()
        myFunction()
    }
    myFunction();
   function myFunction() {
       setInterval(Function1, 3000);
   }
</script>




<script>

    function Function1(){
        Function();
      //  alert("Hello");
    }
</script>
<script type="text/javascript">
    var bool ;
  //  setTimeout("myFunction()",1000 );
    function Function() {
            var myChart = echarts.init(document.getElementById('main'));

            //3.初始化，默认显示标题，图例和xy空坐标轴
            myChart.setOption({

                title: {
                    text: 'ajax动态获取数据'
                },
                tooltip: {},

                legend: {

                    data: ['销售量']
                },
                xAxis: {
                    data: []
                },
                yAxis: {},
                series: [{
                    name: '销售量',
                    type: 'bar',
                    data: []
                }]
            });

            //4.设置加载动画(非必须)
            myChart.showLoading(); //数据加载完之前先显示一段简单的loading动画

            //5.定义数据存放数组(动态变)
            var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
            var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）

            //6.ajax发起数据请求
            $.ajax({
                type: "post",
                cache: false,//缓存
                async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                url: "TestServlet", //请求发送到TestServlet
                data: {},
                dataType: "json", //返回数据形式为json

                //7.请求成功后接收数据name+num两组数据
                success: function (result) {
                    //result为服务器返回的json对象
                    if (result) {
                        //8.取出数据存入数组
                        for (var i = 0; i < result.length; i++) {
                            names.push(result[i].name); //迭代取出类别数据并填入类别数组
                        }
                        for (var i = 0; i < result.length; i++) {
                            nums.push(result[i].num); //迭代取出销量并填入销量数组
                        }

                        myChart.hideLoading(); //隐藏加载动画

                        //9.覆盖操作-根据数据加载数据图表
                        myChart.setOption({
                            xAxis: {
                                data: names
                            },
                            series: [{
                                // 根据名字对应到相应的数据
                                name: '销量',
                                data: nums
                            }]
                        });

                    }

                },
                error: function (errorMsg) {
                    //请求失败时执行该函数
                    alert("图表请求数据失败!");
                    myChart.hideLoading();
                }
            })
           // setInterval(myFunction(), 3000);
       // alert("Hello");
    }
    //setTimeout(myFunction(),1000*1);
   // myFunction();
</script>

</body>
</html>



</body>
</html>
