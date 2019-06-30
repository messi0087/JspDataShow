<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/3/003
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="echarts.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/js/jquery-3.2.1.js"></script>
</head>

<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px; height: 400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var url = '${pageContext.request.contextPath}/GetAllDataServlet';
    $.getJSON(url).done(function(json) {
        // 2.获取数据
        salesVolume = json.salesVolume;//销量
        bussinessVolume = json.bussinessVolume;//营业额
        months = json.months;//月份

        // 3.更新图表myChart的数据
        var option = {
            title : {
                text : 'ECharts 入门示例'
            },
            tooltip : {},
            legend : {
                data : [ '销量' ],
                data : [ '营业额' ]
            },
            xAxis : {
                data : months
            },
            yAxis : {},
            series : [ {
                name : '销量',
                type : 'bar',
                data : salesVolume
            }, {
                name : '营业额',
                type : 'line',
                data : bussinessVolume
            } ],
            toolbox : {
                show : true,
                feature : {
                    mark : {
                        show : true
                    },
                    dataView : {
                        show : true,
                        readOnly : false
                    },
                    magicType : {
                        show : true,
                        type : [ 'line', 'bar' ]
                    },
                    restore : {
                        show : true
                    },
                    saveAsImage : {
                        show : true
                    }
                }
            },
        }
        myChart.setOption(option);
    })
</script>

</body>

</html>

