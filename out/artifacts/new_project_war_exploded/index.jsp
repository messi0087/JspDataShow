<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>主页</title>
    <link rel="stylesheet" type="text/css" href="dist/index.css">
    <script type="text/javascript" src="dist/geotools.js"></script>
    <script type="text/javascript" src="dist/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="dist/echarts.min.js"></script>
    <script type="text/javascript" src="dist/echarts-liquidfill.min.js"></script>
    <script type="text/javascript" src="dist/Clock.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=V1XXAkraHvBwBgBgUKFsfN7CNw3jWgOX"></script>

    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
    <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>

    <script type="text/javascript">
        $(document).ready(function(){
            $(".slider").click(function(){
                $(".slide").slideToggle("slow");
            });
        });
    </script>
</head>
<body>

<div id="main">
    <div id="map"></div><!-- 地图div -->
    <!-- 设置地图 -->
    <script type="text/javascript">
        function MapDeal() {
            //var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
            var values = []; //建立一个销量数组（实际用来盛放Y坐标值）
            var lats =[];
            var longs =[];

            $.ajax({
            type: "post",
            async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
            cache: false,//缓存清空
            url: "MapDate", //请求发送到TestServlet
            data: {},
            dataType: "json", //返回数据形式为json

            //7.请求成功后接收数据name+num两组数据
            success: function (mapdate) {
                //vehicleType为服务器返回的json对象
                var EN = new GT_OSGB();
                wgs84 = EN.getWGS84();
                if (mapdate) {
                    for (var i = 0; i < mapdate.length; i++) {
                      //  vehicleType_date[i] =vehicleType[i]; //迭代取出销量并填入销量数组
                        wgs84 = gotoLatLong(mapdate[i].easting , mapdate[i].northing);
                            // mapdate[i].easing = wgs84.latitude;
                            // mapdate[i].northing = wgs84.longitude;
                       // names.push(mapdate[i].name); //迭代取出类别数据并填入类别数组
                        values.push(mapdate[i].severity); //迭代取出类别数据并填入类别数组
                        lats.push(wgs84.latitude);
                        longs.push(wgs84.longitude);
                    }


                    var dom = document.getElementById("map");
                    var myChart = echarts.init(dom);
                    var app = {};
                    option = null;

                    var data = [//设置数据，如{name: '海门', value: 9},
                        {name: '1', value: values[0]},
                        {name: '2', value: values[1]},
                        {name: '3', value: values[2]},
                        {name: '4', value: values[3]},
                        {name: '5', value: values[4]},
                        {name: '6', value: values[5]},
                        {name: '7', value: values[6]},
                        {name: '8', value: values[7]},
                        {name: '9', value: values[8]},
                        {name: '10', value: values[9]},
                        {name: '11', value: values[10]},
                        {name: '12', value: values[11]},
                        {name: '13', value: values[12]},
                        {name: '14', value: values[13]},
                        {name: '15', value: values[14]},
                        {name: '16', value: values[15]},
                        {name: '17', value: values[16]},
                        {name: '18', value: values[17]},
                        {name: '19', value: values[18]},
                        {name: '20', value: values[19]},
                        {name: '21', value: values[20]},
                        {name: '22', value: values[21]},
                        {name: '23', value: values[22]},
                        {name: '24', value: values[23]},
                        {name: '25', value: values[24]},
                        {name: '26', value: values[25]},
                        {name: '27', value: values[26]},
                        {name: '28', value: values[27]},
                        {name: '29', value: values[28]},
                        {name: '30', value: values[29]},
                        {name: '31', value: values[30]},
                        {name: '32', value: values[31]},
                        {name: '33', value: values[32]},
                        {name: '34', value: values[33]},
                        {name: '35', value: values[34]},
                        {name: '36', value: values[35]},
                        {name: '37', value: values[36]},
                        {name: '38', value: values[37]},
                        {name: '39', value: values[38]},
                        {name: '40', value: values[39]},
                        {name: '41', value: values[40]},
                        {name: '42', value: values[41]},
                        {name: '43', value: values[42]},
                        {name: '44', value: values[43]},
                        {name: '45', value: values[44]},
                        {name: '46', value: values[45]},
                        {name: '47', value: values[46]},
                        {name: '48', value: values[47]},
                        {name: '49', value: values[48]},
                        {name: '50', value: values[49]},
                        {name: '51', value: values[50]},
                        {name: '52', value: values[51]},
                        {name: '53', value: values[52]},
                        {name: '54', value: values[53]},
                        {name: '55', value: values[54]},
                        {name: '56', value: values[55]},
                        {name: '57', value: values[56]},
                        {name: '58', value: values[57]},
                        {name: '59', value: values[58]},
                        {name: '60', value: values[59]},
                        {name: '61', value: values[60]},
                        {name: '62', value: values[61]},
                        {name: '63', value: values[62]},
                        {name: '64', value: values[63]},
                        {name: '65', value: values[64]},
                        {name: '66', value: values[65]},
                        {name: '67', value: values[66]},
                        {name: '68', value: values[67]},
                        {name: '69', value: values[68]},
                        {name: '70', value: values[69]},
                        {name: '71', value: values[70]},
                        {name: '72', value: values[71]},
                        {name: '73', value: values[72]},
                        {name: '74', value: values[73]},
                        {name: '75', value: values[74]},
                        {name: '76', value: values[75]},
                        {name: '77', value: values[76]},
                        {name: '78', value: values[77]},
                        {name: '79', value: values[78]},
                        {name: '80', value: values[79]},
                        {name: '81', value: values[80]},
                        {name: '82', value: values[81]},
                        {name: '83', value: values[82]},
                        {name: '84', value: values[83]},
                        {name: '85', value: values[84]},
                        {name: '86', value: values[85]},
                        {name: '87', value: values[86]},
                        {name: '88', value: values[87]},
                        {name: '89', value: values[88]},
                        {name: '90', value: values[89]},
                        {name: '91', value: values[90]},
                        {name: '92', value: values[91]},
                        {name: '93', value: values[92]},
                        {name: '94', value: values[93]},
                        {name: '95', value: values[94]},
                        {name: '96', value: values[95]},
                        {name: '97', value: values[96]},
                        {name: '98', value: values[97]},
                        {name: '99', value: values[98]},
                        {name: '100', value: values[99]},
                    ];
                    var geoCoordMap = {//设置位置 如 '海门':[121.15,31.89],
                        '1': [longs[0], lats[0]],
                        '2': [longs[1], lats[1]],
                        '3': [longs[2], lats[2]],
                        '4': [longs[3], lats[3]],
                        '5': [longs[4], lats[4]],
                        '6': [longs[5], lats[5]],
                        '7': [longs[6], lats[6]],
                        '8': [longs[7], lats[7]],
                        '9': [longs[8], lats[8]],
                        '10': [longs[9], lats[9]],
                        '11': [longs[10], lats[10]],
                        '12': [longs[11], lats[11]],
                        '13': [longs[12], lats[12]],
                        '14': [longs[13], lats[13]],
                        '15': [longs[14], lats[14]],
                        '16': [longs[15], lats[15]],
                        '17': [longs[16], lats[16]],
                        '18': [longs[17], lats[17]],
                        '19': [longs[18], lats[18]],
                        '20': [longs[19], lats[19]],
                        '21': [longs[20], lats[20]],
                        '22': [longs[21], lats[21]],
                        '23': [longs[22], lats[22]],
                        '24': [longs[23], lats[23]],
                        '25': [longs[24], lats[24]],
                        '26': [longs[25], lats[25]],
                        '27': [longs[26], lats[26]],
                        '28': [longs[27], lats[27]],
                        '29': [longs[28], lats[28]],
                        '30': [longs[29], lats[29]],
                        '31': [longs[30], lats[30]],
                        '32': [longs[31], lats[31]],
                        '33': [longs[32], lats[32]],
                        '34': [longs[33], lats[33]],
                        '35': [longs[34], lats[34]],
                        '36': [longs[35], lats[35]],
                        '37': [longs[36], lats[36]],
                        '38': [longs[37], lats[37]],
                        '39': [longs[38], lats[38]],
                        '40': [longs[39], lats[39]],
                        '41': [longs[40], lats[40]],
                        '42': [longs[41], lats[41]],
                        '43': [longs[42], lats[42]],
                        '44': [longs[43], lats[43]],
                        '45': [longs[44], lats[44]],
                        '46': [longs[45], lats[45]],
                        '47': [longs[46], lats[46]],
                        '48': [longs[47], lats[47]],
                        '49': [longs[48], lats[48]],
                        '50': [longs[49], lats[49]],
                        '51': [longs[50], lats[50]],
                        '52': [longs[51], lats[51]],
                        '53': [longs[52], lats[52]],
                        '54': [longs[53], lats[53]],
                        '55': [longs[54], lats[54]],
                        '56': [longs[55], lats[55]],
                        '57': [longs[56], lats[56]],
                        '58': [longs[57], lats[57]],
                        '59': [longs[58], lats[58]],
                        '60': [longs[59], lats[59]],
                        '61': [longs[60], lats[60]],
                        '62': [longs[61], lats[61]],
                        '63': [longs[62], lats[62]],
                        '64': [longs[63], lats[63]],
                        '65': [longs[64], lats[64]],
                        '66': [longs[65], lats[65]],
                        '67': [longs[66], lats[66]],
                        '68': [longs[67], lats[67]],
                        '69': [longs[68], lats[68]],
                        '70': [longs[69], lats[69]],
                        '71': [longs[70], lats[70]],
                        '72': [longs[71], lats[71]],
                        '73': [longs[72], lats[72]],
                        '74': [longs[73], lats[73]],
                        '75': [longs[74], lats[74]],
                        '76': [longs[75], lats[75]],
                        '77': [longs[76], lats[76]],
                        '78': [longs[77], lats[77]],
                        '79': [longs[78], lats[78]],
                        '80': [longs[79], lats[79]],
                        '81': [longs[80], lats[80]],
                        '82': [longs[81], lats[81]],
                        '83': [longs[82], lats[82]],
                        '84': [longs[83], lats[83]],
                        '85': [longs[84], lats[84]],
                        '86': [longs[85], lats[85]],
                        '87': [longs[86], lats[86]],
                        '88': [longs[87], lats[87]],
                        '89': [longs[88], lats[88]],
                        '90': [longs[89], lats[89]],
                        '91': [longs[90], lats[90]],
                        '92': [longs[91], lats[91]],
                        '93': [longs[92], lats[92]],
                        '94': [longs[93], lats[93]],
                        '95': [longs[94], lats[94]],
                        '96': [longs[95], lats[95]],
                        '97': [longs[96], lats[96]],
                        '98': [longs[97], lats[97]],
                        '99': [longs[98], lats[98]],
                        '100': [longs[99], lats[99]],
                    };

                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var geoCoord = geoCoordMap[data[i].name];
                            if (geoCoord) {
                                res.push({
                                    name: data[i].name,
                                    value: geoCoord.concat(data[i].value)
                                });
                            }
                        }
                        return res;
                    };













                    function renderItem(params, api) {
                        var coords = [//设定特殊区域，如 [116.7,39.53],
                            [116.7, 39.53],
                            [103.73, 36.03],
                            [112.91, 27.87],
                            [120.65, 28.01],
                            [119.57, 39.95]
                        ];
                        var points = [];
                        for (var i = 0; i < coords.length; i++) {
                            points.push(api.coord(coords[i]));
                        }
                        var color = api.visual('color');

                        return {
                            type: 'polygon',
                            shape: {
                                points: echarts.graphic.clipPointsByRect(points, {
                                    x: params.coordSys.x,
                                    y: params.coordSys.y,
                                    width: params.coordSys.width,
                                    height: params.coordSys.height
                                })
                            },
                            style: api.style({
                                fill: color,
                                stroke: echarts.color.lift(color)
                            })
                        };
                    }

                    option = {
                        title: {
                            text: '交通事故严重性预报平台',
                            subtext: '',
                            sublink: 'index.html',
                            left: 'center',
                            top: '10px',
                            textStyle: {
                                color: '#fff',
                                fontSize: '50'
                            },
                            subtextStyle: {
                                fontSize: '20'
                            }
                        },
                        tooltip: {
                            trigger: 'item'
                        },
                        bmap: {
                            center: [-1.53, 53.8],
                            zoom: 12,
                            roam: true,
                            scaleLimit:
                                {
                                    "min": "6",
                                    "max": "7"
                                },
                            mapStyle: {
                                styleJson: [
                                    {
                                        "featureType": "water",
                                        "elementType": "geometry",
                                        "stylers": {
                                            "color": "#0099CC"//背景底色
                                        }
                                    },
                                    {
                                        "featureType": "land",
                                        "elementType": "all",
                                        "stylers": {
                                            "color": "#333366"//地图陆地颜色#003366
                                        }
                                    },
                                    {
                                        "featureType": "boundary",
                                        "elementType": "geometry",
                                        "stylers": {
                                            "color": "#CCCCCC"//中国边界
                                        }
                                    },
                                    {
                                        "featureType": "railway",
                                        "elementType": "all",
                                        "stylers": {
                                            "color": "#333333"//铁路
                                        }
                                    },
                                    {
                                        "featureType": "highway",
                                        "elementType": "geometry",
                                        "stylers": {
                                            "color": "#99CCFF55"//公路
                                        }
                                    },
                                    {
                                        "featureType": "highway",
                                        "elementType": "geometry.fill",
                                        "stylers": {
                                            "color": "#666699",//缩略边界
                                            "lightness": 1
                                        }
                                    },
                                    {
                                        "featureType": "highway",
                                        "elementType": "labels",
                                        "stylers": {
                                            "color": "#FFFFCC"//高速标识
                                        }
                                    },
                                    {
                                        "featureType": "arterial",
                                        "elementType": "geometry",
                                        "stylers": {
                                            "color": "#80ecec55"//片区划分外
                                        }
                                    },
                                    {
                                        "featureType": "arterial",
                                        "elementType": "geometry.fill",
                                        "stylers": {
                                            "color": "#80ecec",//片区划分内
                                            "visibility": "off"
                                        }
                                    },
                                    {
                                        "featureType": "poi",
                                        "elementType": "all",
                                        "stylers": {
                                            "visibility": "off"
                                        }
                                    },
                                    {
                                        "featureType": "green",
                                        "elementType": "all",
                                        "stylers": {
                                            "color": "#056197",
                                            "visibility": "off"
                                        }
                                    },
                                    {
                                        "featureType": "subway",
                                        "elementType": "all",
                                        "stylers": {
                                            "color": "#999966"//中国地铁
                                        }
                                    },
                                    {
                                        "featureType": "manmade",
                                        "elementType": "all",
                                        "stylers": {
                                            "visibility": "off"
                                        }
                                    },
                                    {
                                        "featureType": "local",
                                        "elementType": "all",
                                        "stylers": {
                                            "visibility": "off"
                                        }
                                    },
                                    {
                                        "featureType": "arterial",
                                        "elementType": "labels",
                                        "stylers": {
                                            "visibility": "off"
                                        }
                                    },
                                    {
                                        "featureType": "boundary",
                                        "elementType": "geometry.fill",
                                        "stylers": {
                                            "color": "#CCCCCC"//国界线
                                        }
                                    },
                                    {
                                        "featureType": "building",
                                        "elementType": "all",
                                        "stylers": {
                                            "color": "#336699"//建筑物
                                        }
                                    },
                                    {
                                        "featureType": "label",//地名
                                        "elementType": "all",
                                        "stylers": {
                                            "visibility": "on"
                                        }
                                    }
                                ]
                            }
                        },
                        series: [
                            {
                                name: '事故',
                                type: 'effectScatter',
                                coordinateSystem: 'bmap',
                                data: convertData(data),
                                symbolSize: function (val) {
                                    return val[2] / 7;
                                },
                                showEffectOn: 'emphasis',
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                hoverAnimation: true,
                                label: {
                                    normal: {
                                        formatter: '{c}',
                                        position: 'right',
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        color: '#f4e925'//地图次重点
                                    }
                                }
                            },
                            {
                                name: '最新事件',
                                type: 'effectScatter',
                                coordinateSystem: 'bmap',
                                data: convertData(data).slice(0, 20),
                                symbolSize: function (val) {
                                    return val[2] / 7;
                                },
                                showEffectOn: 'emphasis',
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                hoverAnimation: true,
                                label: {
                                    normal: {
                                        formatter: '{c}',
                                        position: 'right',
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        color: 'red',
                                        shadowBlur: 10,
                                        shadowColor: '#333'//发光颜色
                                    }
                                },
                                zlevel: 1
                            },
                            // {
                            // 	name: '事故',
                            // 	type: 'effectScatter',
                            // 	coordinateSystem: 'bmap',
                            //     data: convertData(data),
                            // 	symbolSize: function (val) {
                            // 		return val[2] / 10;
                            // 	},
                            // 	showEffectOn: 'emphasis',
                            // 	rippleEffect: {
                            // 		brushType: 'stroke'
                            // 	},
                            // 	hoverAnimation: true,
                            // 	label: {
                            // 		normal: {
                            // 			formatter: '{b}',
                            // 			position: 'right',
                            // 			show: false
                            // 		}
                            // 	},
                            // 	itemStyle: {
                            // 		normal: {
                            // 			color: '#f4e925',
                            // 			shadowBlur: 10,
                            // 			shadowColor: '#333'
                            // 		}
                            // 	},
                            // 	zlevel: 1
                            // },

                            // {//划区域
                            // 	type: 'custom',
                            // 	coordinateSystem: 'bmap',
                            // 	renderItem: renderItem,
                            // 	itemStyle: {
                            // 		normal: {
                            // 			opacity: 0.5
                            // 		}
                            // 	},
                            // 	animation: false,
                            // 	silent: true,
                            // 	data: [0],
                            // 	z: -10
                            // }
                        ],
                        zlevel: 0
                    };
                    if (option && typeof option === "object") {
                        myChart.setOption(option, true);
                    }

                }

            },
            error: function (errorMsg) {
                //请求失败时执行该函数
                //alert("图表请求数据失败!");
            }
        })


        }
    </script>

    <div class="dv" id="dvL" style="background-color: rgba(100,100,100,0.5);box-shadow: -20px 0px 50px rgba(0, 0, 0, 0.8);">

        <!-- 玫瑰图 -->
        <div id="dv4" class="dvg" style="width:50%; height:30%;float: left;z-index: 2;"></div>
        <script type="text/javascript">


            function RoseFigure1() {
                //玫瑰图运行函数
                var lightingSituation_date = new Array(); //建立一个销量数组（实际用来盛放Y坐标值）


                $.ajax({
                    type: "post",
                    cache: false,//缓存清空
                    async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                    url: "LightingSituation_Date", //请求发送到TestServlet
                    data: {},
                    dataType: "json", //返回数据形式为json

                    //7.请求成功后接收数据name+num两组数据
                    success: function (lightingSituation) {
                        //vehicleType为服务器返回的json对象
                        if (lightingSituation) {
                            for (var i = 0; i < lightingSituation.length; i++) {
                                lightingSituation_date[i] = lightingSituation[i]; //迭代取出销量并填入销量数组
                            }

                            var container = echarts.init(document.getElementById('dv4'));
                            option = {
                                title: {
                                    text: '照明情况',
                                    left: 'center',
                                    top: '5%',
                                    textStyle: {
                                        color: 'white'
                                    }
                                },
                                color: ['#FFCC99', '#FFFFCC', '#99CCCC', '#CCFFCC'],//修改图表颜色
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{c}<br/>({d}%)"
                                },
                                legend: {
                                    show: false,
                                    x: 'center',
                                    y: 'bottom',
                                    data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
                                },
                                toolbox: {
                                    show: true,
                                    orient: 'verctial',
                                    right: '0',
                                    top: 'center',
                                    right: '3%',
                                    iconStyle: {
                                        borderColor: '#ffffffff'
                                    },
                                    feature: {
                                        mark: {show: true},
                                        magicType: {
                                            show: true,
                                            type: ['pie', 'funnel']
                                        },
                                        restore: {show: true},
                                        saveAsImage: {show: true}
                                    }
                                },
                                calculable: true,
                                series: [
                                    {
                                        name: '照明情况',
                                        type: 'pie',
                                        radius: ['20%', '60%'],
                                        center: ['50%', '60%'],
                                        roseType: 'radius',
                                        label: {
                                            normal: {
                                                show: true
                                            },
                                            emphasis: {
                                                show: true
                                            }
                                        },
                                        labelLine: {
                                            normal: {
                                                show: true,
                                                smooth: 0.1,
                                                length: 0,
                                                length2: 5
                                            },
                                            emphasis: {
                                                show: true,
                                                smooth: 0.1,
                                                length: 0,
                                                length2: 5
                                            }
                                        },
                                        data: [
                                            {value: lightingSituation_date[0], name: '白天:街灯亮着'},
                                            {value: lightingSituation_date[1], name: '黑暗:没有街道照明'},
                                            {value: lightingSituation_date[2], name: '黑暗:有街灯且街灯亮着'},
                                            {value: lightingSituation_date[3], name: '黑暗:有街灯，却没有亮着'}
                                        ],
                                        animationType: 'scale',
                                        animationEasing: 'elasticOut',
                                        animationDelay: function (idx) {
                                            return Math.random() * 200;
                                        }
                                    }
                                ]
                            };
                            container.setOption(option);

                        }

                    },
                    error: function (errorMsg) {
                        //请求失败时执行该函数
                       // alert("图表请求数据失败!");
                    }
                })
            }


        </script>

        <!-- 玫瑰图2 -->
        <div id="dv7" class="dvg" style="width:50%; height:30%;float: left;z-index: 2;"></div>
        <script type="text/javascript">

            function RoseFigure2() {
                var roadCondition_date = new Array(); //建立一个销量数组（实际用来盛放Y坐标值）

                $.ajax({
                    type: "post",
                    cache: false,//缓存清空
                    async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                    url: "RoadCondition_Date", //请求发送到TestServlet
                    data: {},
                    dataType: "json", //返回数据形式为json

                    //7.请求成功后接收数据name+num两组数据
                    success: function (roadCondition) {
                        //vehicleType为服务器返回的json对象
                        if (roadCondition) {
                            for (var i = 0; i < roadCondition.length; i++) {
                                roadCondition_date[i] = roadCondition[i]; //迭代取出销量并填入销量数组
                            }
                            var container = echarts.init(document.getElementById('dv7'));
                            option = {
                                title: {
                                    text: '路面情况',
                                    left: 'center',
                                    top: '5%',
                                    textStyle: {
                                        color: 'white'
                                    }
                                },
                                color: ['#CCFFCC', '#CCCCFF', '#FFCCCC', '#FFCC99', '#CCFFFF'],//修改图表颜色
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{c}<br/>({d}%)"
                                },
                                legend: {
                                    show: false,
                                    x: 'center',
                                    y: 'bottom',
                                    data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
                                },
                                toolbox: {
                                    show: true,
                                    orient: 'verctial',
                                    right: '0',
                                    top: 'center',
                                    right: '3%',
                                    iconStyle: {
                                        borderColor: '#ffffffff'
                                    },
                                    feature: {
                                        mark: {show: true},
                                        magicType: {
                                            show: true,
                                            type: ['pie', 'funnel']
                                        },
                                        restore: {show: true},
                                        saveAsImage: {show: true}
                                    }
                                },
                                calculable: true,
                                series: [
                                    {
                                        name: '路面情况',
                                        type: 'pie',
                                        radius: ['20%', '60%'],
                                        center: ['50%', '60%'],
                                        roseType: 'area',
                                        label: {
                                            normal: {
                                                show: true

                                            },
                                            emphasis: {
                                                show: true
                                            }
                                        },
                                        labelLine: {
                                            normal: {
                                                show: true,
                                                smooth: 0.1,
                                                length: 0,
                                                length2: 5
                                            },
                                            emphasis: {
                                                show: true,
                                                smooth: 0.1,
                                                length: 0,
                                                length2: 5
                                            }
                                        },
                                        data: [
                                            {value: roadCondition_date[0], name: '干燥'},
                                            {value: roadCondition_date[1], name: '湿滑'},
                                            {value: roadCondition_date[2], name: '积雪'},
                                            {value: roadCondition_date[3], name: '结冰'},
                                            {value: roadCondition_date[4], name: '积水'}
                                        ],
                                        animationType: 'scale',
                                        animationEasing: 'elasticOut',
                                        animationDelay: function (idx) {
                                            return Math.random() * 200;
                                        }
                                    }
                                ]
                            };
                            container.setOption(option);

                        }

                    },
                    error: function (errorMsg) {
                        //请求失败时执行该函数
                       // alert("图表请求数据失败!");
                    }
                })

            }
        </script>

        <!--近4日...-->
        <div id="dv1" class="dvg" style="width:100%; height:34%;float: left;z-index: 2;"></div>
        <script>


            function FourDays() {

                var container = echarts.init(document.getElementById('dv1'));
                var app = {};
                option = null;
                var posList = [
                    'left', 'right', 'top', 'bottom',
                    'inside',
                    'insideTop', 'insideLeft', 'insideRight', 'insideBottom',
                    'insideTopLeft', 'insideTopRight', 'insideBottomLeft', 'insideBottomRight'
                ];
                app.configParameters = {
                    rotate: {
                        min: -90,
                        max: 90
                    },
                    align: {
                        options: {
                            left: 'left',
                            center: 'center',
                            right: 'right'
                        }
                    },
                    verticalAlign: {
                        options: {
                            top: 'top',
                            middle: 'middle',
                            bottom: 'bottom'
                        }
                    },
                    position: {
                        options: echarts.util.reduce(posList, function (map, pos) {
                            map[pos] = pos;
                            return map;
                        }, {})
                    },
                    distance: {
                        min: 0,
                        max: 100
                    }
                };
                app.config = {
                    rotate: 90,
                    align: 'left',
                    verticalAlign: 'middle',
                    position: 'insideBottom',
                    distance: 15,
                    onChange: function () {
                        var labelOption = {
                            normal: {
                                rotate: app.config.rotate,
                                align: app.config.align,
                                verticalAlign: app.config.verticalAlign,
                                position: app.config.position,
                                distance: app.config.distance
                            }
                        };
                        myChart.setOption({
                            series: [{
                                label: labelOption
                            }, {
                                label: labelOption
                            }, {
                                label: labelOption
                            }, {
                                label: labelOption
                            }]
                        });
                    }
                };
                var labelOption = {
                    normal: {
                        show: true,
                        position: app.config.position,
                        distance: app.config.distance,
                        align: app.config.align,
                        verticalAlign: app.config.verticalAlign,
                        rotate: app.config.rotate,
                        formatter: '{a}',
                        fontSize: 16,
                        rich: {
                            name: {
                                textBorderColor: '#fff'
                            }
                        }
                    }
                };
                option = {
                    dataset: {
                        source: [
                            ['date', '轻微', '一般', '严重'],
                            ['第一天', 75.5, 20.3, 4.2],
                            ['第二天', 83.1, 10.4, 6.5],
                            ['第三天', 55.4, 30.2, 14.4],
                            ['第四天', 74.1, 20.7, 5.2]
                        ]
                    },
                    title: {
                        text: '近4日事故数量趋势',
                        left: 'center',
                        top: '3%',
                        textStyle: {
                            color: '#ffffffff'
                        }
                    },

                    color: ['#FF6666', '#FF9966', '#FFCCCC', '#e5323e'],//修改图表颜色
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'shadow'
                        }
                    },
                    legend: {
                        data: ['04/12', '05/12', '06/12', '07/12']
                    },
                    toolbox: {
                        show: true,
                        orient: 'vertical',
                        right: '3%',
                        top: 'center',
                        iconStyle: {
                            borderColor: '#ffffffff'
                        },
                        feature: {
                            mark: {show: true},
                            dataView: {show: false, readOnly: false},
                            magicType: {show: true, type: ['line', 'bar', 'stack', 'tiled']},
                            restore: {show: true},
                            saveAsImage: {show: true}
                        }
                    },
                    calculable: true,
                    //坐标项
                    xAxis: [
                        {
                            type: 'category',
                            // axisTick: {show: false},
                            // data: ['04/12', '05/12', '06/12', '07/12'],
                            axisLine: {
                                lineStyle: {
                                    color: '#ffffffff'
                                }
                            }
                        }
                    ],
                    yAxis: [
                        {
                            type: 'value',
                            axisLine: {
                                lineStyle: {
                                    color: '#ffffffff'
                                }
                            }
                        }
                    ],
                    //数据项
                    series: [
                        {
                            // name: '轻微',
                            type: 'bar',
                            label: labelOption,
                            // data: [220, 182, 191, 234]
                        },
                        {
                            // name: '一般',
                            type: 'bar',
                            label: labelOption,
                            // data: [150, 232, 201, 154]
                        },
                        {
                            // name: '严重',
                            type: 'bar',
                            label: labelOption,
                            // data: [98, 77, 101, 99]
                        }
                    ],
                    itemStyle: {
                        normal: {
                            shadowBlur: 200,
                            shadowColor: '#000000ff'
                        }
                    }
                };
                container.setOption(option);

            }

        </script>

        <!-- 事故类别... -->
        <div id="dv5" class="dvg" style="width:100%; height:35%;float: left;z-index: 2;"></div>
        <script>
            function SeverityType() {

                var severity_date = new Array(); //建立一个销量数组（实际用来盛放Y坐标值）

                $.ajax({
                    type: "post",
                    cache: false,//缓存清空
                    async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                    url: "Severity_Date", //请求发送到TestServlet
                    data: {},
                    dataType: "json", //返回数据形式为json

                    //7.请求成功后接收数据name+num两组数据
                    success: function (severity) {
                        //vehicleType为服务器返回的json对象
                        if (severity) {
                            for (var i = 0; i < severity.length; i++) {
                                severity_date[i] = severity[i]; //迭代取出销量并填入销量数组
                            }
                            var container = echarts.init(document.getElementById('dv5'));
                            option = {
                                title: {
                                    text: '事故严重程度权重',
                                    left: 'center',
                                    top: '5%',
                                    textStyle: {
                                        color: 'white'
                                    }
                                },
                                color: ['#CC99CC', '#FF9966', '#99CC99',],//修改图表颜色
                                tooltip: {
                                    trigger: 'item',
                                    formatter: "{a} <br/>{c} ({d}%)"
                                },
                                legend: {
                                    show: false,
                                    x: 'center',
                                    y: 'bottom',
                                    data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
                                },
                                toolbox: {
                                    show: true,
                                    orient: 'verctial',
                                    right: '0',
                                    top: 'center',
                                    right: '3%',
                                    iconStyle: {
                                        borderColor: '#ffffffff'
                                    },
                                    feature: {
                                        mark: {show: true},
                                        magicType: {
                                            show: true,
                                            type: ['pie', 'funnel']
                                        },
                                        restore: {show: true},
                                        saveAsImage: {show: true}
                                    }
                                },
                                calculable: true,
                                series: [
                                    {
                                        name: '事故严重程度权重',
                                        type: 'pie',
                                        radius: ['30%', '60%'],
                                        center: ['50%', '60%'],
                                        roseType: 'area',
                                        label: {
                                            normal: {
                                                show: true

                                            },
                                            emphasis: {
                                                show: true
                                            }
                                        },
                                        labelLine: {
                                            normal: {
                                                show: true,
                                                smooth: 0.1,
                                                length: 0,
                                                length2: 5
                                            },
                                            emphasis: {
                                                show: true,
                                                smooth: 0.1,
                                                length: 0,
                                                length2: 5
                                            }
                                        },
                                        data: [
                                            {value: severity_date[0], name: 'Sligth'},
                                            {value: severity_date[1], name: 'Serious'},
                                            {value: severity_date[2], name: 'Fatal'}
                                        ],
                                        animationType: 'scale',
                                        animationEasing: 'elasticOut',
                                        animationDelay: function (idx) {
                                            return Math.random() * 200;
                                        }
                                    }
                                ]
                            };
                            container.setOption(option);

                        }

                    },
                    error: function (errorMsg) {
                        //请求失败时执行该函数
                       // alert("图表请求数据失败!");
                    }
                })
            }

        </script>

    </div>
    <div class="dv" id="dvR" style="background-color: rgba(100,100,100,0.5);right:0; box-shadow: 20px 0px 50px rgba(0, 0, 0, 0.8);">

        <!-- 事故时间... -->
        <div id="dv6" class="dvg" style="width:100%; height:30%;float: left;z-index: 2;"></div>
        <script>

            function AccidentTime() {
                var accidentTime_date = new Array(); //建立一个销量数组（实际用来盛放Y坐标值）


                $.ajax({
                    type: "post",
                    cache: false,//缓存清空
                    async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                    url: "AccidentTime_Date", //请求发送到TestServlet
                    data: {},
                    dataType: "json", //返回数据形式为json

                    //7.请求成功后接收数据name+num两组数据
                    success: function (accidentTime) {
                        //vehicleType为服务器返回的json对象
                        if (accidentTime) {
                            for (var i = 0; i < accidentTime.length; i++) {
                                accidentTime_date[i] = accidentTime[i]; //迭代取出销量并填入销量数组
                            }

                            var container = echarts.init(document.getElementById('dv6'));
                            var option = {
                                //backgroundColor: '#404a59',
                                title: {
                                    text: '事故时间统计',
                                    left: 'center',
                                    top: '5%',
                                    textStyle: {
                                        color: '#ffffffff'
                                    },
                                    fontSize: '100%'
                                },
                                toolbox: {
                                    show: true,
                                    orient: 'verctial',
                                    right: '0',
                                    top: 'center',
                                    left: '3%',
                                    iconStyle: {
                                        borderColor: '#ffffffff'
                                    },
                                    feature: {
                                        mark: {show: true},
                                        magicType: {
                                            show: true,
                                            type: ['pie', 'funnel']
                                        },
                                        restore: {show: true},
                                        saveAsImage: {show: true}
                                    }
                                },
                                //数据项
                                series: [
                                    {
                                        type: 'liquidFill',
                                        data: [{
                                            name: '白天',
                                            value: accidentTime_date[0]
                                        }, 0.5, 0.4, 0.3],
                                        radius: '70%',
                                        center: ['30%', '60%'],
                                        label: {
                                            formatter: '{b}\n百分比：{c}%',
                                            fontSize: '80%'
                                        }
                                    },
                                    {
                                        type: 'liquidFill',
                                        data: [{
                                            name: '晚上',
                                            value: accidentTime_date[1]
                                        }, 0.5, 0.4, 0.3],
                                        radius: '70%',
                                        center: ['70%', '60%'],
                                        label: {
                                            formatter: '{b}\n百分比：{c}%',
                                            fontSize: '80%'
                                        }
                                    }
                                ]
                            };
                            container.setOption(option);
                        }

                    },
                    error: function (errorMsg) {
                        //请求失败时执行该函数
                       // alert("图表请求数据失败!");
                    }
                })
            }

        </script>

        <!-- 事故天气... -->
        <div id="dv3" class="dvg" style="width:50%; height:45%;float: left;z-index: 2;"></div>
        <script>
            //获取数据

            function Weather() {
                var weather_date = new Array(); //建立一个销量数组（实际用来盛放Y坐标值）


                $.ajax({
                    type: "post",
                    cache: false,//缓存清空
                    async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                    url: "Weather_date", //请求发送到TestServlet
                    data: {},
                    dataType: "json", //返回数据形式为json

                    //7.请求成功后接收数据name+num两组数据
                    success: function (date_weather) {
                        //date_weather为服务器返回的json对象

                        for (var i = 0; i < date_weather.length; i++) {
                            weather_date[i] = date_weather[i]; //迭代取出类别数据并填入类别数组
                        }

                        var container = echarts.init(document.getElementById("dv3"));
                        option = {
                            dataset: {
                                source: [
                                    ['type', '数量'],
                                    ['晴天无强风', weather_date[0]],
                                    ['雨天无强风', weather_date[1]],
                                    ['雪天无强风', weather_date[2]],
                                    ['晴天有强风', weather_date[3]],
                                    ['雨天有强风', weather_date[4]],
                                    ['雪天有强风', weather_date[5]],
                                    ['雾天', weather_date[6]],
                                    ['其他情况', weather_date[7]]
                                ]
                            },
                            title: {
                                text: '事故天气类型统计',
                                left: 'center',
                                top: 'top',
                                textStyle: {
                                    color: '#ffffffff'
                                }
                            },
                            color: ['#ffff99'],//修改图表颜色
                            tooltip: {
                                trigger: 'axis',
                                axisPointer: {
                                    type: 'shadow'
                                }
                            },
                            legend: {
                                show: false,
                                data: ['事故数量']
                            },
                            grid: {
                                left: '3%',
                                right: '4%',
                                bottom: '3%',
                                containLabel: true
                            },
                            xAxis: {
                                show: false,
                                type: 'value',
                                boundaryGap: [0, 0.01]
                            },
                            yAxis: {
                                type: 'category',
                                // data: ['天气情况1','天气情况2','天气情况3','天气情况4','天气情况5','天气情况6','天气情况7','天气情况8'],
                                axisLine: {
                                    lineStyle: {
                                        color: '#ffffffff'
                                    }
                                }
                            },
                            series: [
                                {
                                    // name: '事故数量',
                                    type: 'bar',
                                    // data: [18203, 23489, 29034, 104970, 131744, 63020,65841,91657]
                                }
                            ],
                            toolbox: {
                                show: true,
                                orient: 'horizontal',
                                right: '0',
                                top: 'bottom',
                                left: 'center',
                                iconStyle: {
                                    borderColor: '#ffffffff'
                                },
                                feature: {
                                    mark: {show: true},
                                    dataView: {show: false, readOnly: false},
                                    magicType: {show: true, type: ['line', 'bar']},
                                    restore: {show: true},
                                    saveAsImage: {show: true}
                                }
                            },
                        };
                        container.setOption(option);
                        //window.alert(weather);
                    },
                    error: function (errorMsg) {
                        //请求失败时执行该函数
                      //  alert("图表请求数据失败!");
                        //myChart.hideLoading();
                    }
                })
            }
        </script>

        <!-- 车辆类型 -->
        <div id="dv2" class="dvg" style="width:50%; height:45%;float: left; z-index: 2;"></div>
        <script>


         function VehicleType() {

             var vehicleType_date = new Array(); //建立一个销量数组（实际用来盛放Y坐标值）


             $.ajax({
                 type: "post",
                 cache: false,//缓存清空
                 async: true, //异步请求（同步请求将会锁住浏览器，其他操作须等请求完成才可执行）
                 url: "VehicleType_Date", //请求发送到TestServlet
                 data: {},
                 dataType: "json", //返回数据形式为json

                 //7.请求成功后接收数据name+num两组数据
                 success: function (vehicleType) {
                     //vehicleType为服务器返回的json对象
                     if (vehicleType) {
                         for (var i = 0; i < vehicleType.length; i++) {
                             vehicleType_date[i] = vehicleType[i]; //迭代取出销量并填入销量数组
                         }
                     }


                     var container = echarts.init(document.getElementById('dv2'));
                     option = {
                         dataset: {
                             source: [
                                 ['type', '数量'],
                                 ['自行车', vehicleType_date[0]],
                                 ['摩托车且排量低于50cc', vehicleType_date[1]],
                                 ['摩托车且排量高于50cc低于125cc', vehicleType_date[2]],
                                 ['摩托车且排量高于125cc低于500cc', vehicleType_date[3]],
                                 ['摩托车且排量高于500cc', vehicleType_date[4]],
                                 ['的士/私人出租汽车', vehicleType_date[5]],
                                 ['汽车', vehicleType_date[6]],
                                 ['小巴', vehicleType_date[7]],
                                 ['公共汽车或长途汽车（17个或多个乘客座位）', vehicleType_date[8]],
                                 ['骑马', vehicleType_date[9]],
                                 ['农业车辆包括挖掘机等', vehicleType_date[10]],
                                 ['电车/轻铁', vehicleType_date[11]],
                                 ['3.5公吨及以下货车', vehicleType_date[12]],
                                 ['3.5公吨以上7.5公吨以下货车', vehicleType_date[13]],
                                 ['7.5公吨及以上货车', vehicleType_date[14]],
                                 ['电动车', vehicleType_date[15]],
                                 ['其他车辆', vehicleType_date[16]],
                                 ['不知道排量的摩托车', vehicleType_date[17]],
                             ]
                         },
                         title: {
                             text: '事故车辆类型统计',
                             left: 'center',
                             top: 'top',
                             textStyle: {
                                 color: '#ffffffff'
                             }
                         },
                         angleAxis: {
                             show: false,
                             type: 'category',
                             // data: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17'],
                             z: 10,
                             axisLine: {
                                 lineStyle: {
                                     color: '#ffffffff'
                                 }
                             }
                         },
                         radiusAxis: {
                             axisLine: {
                                 lineStyle: {
                                     color: '#ffffff00'
                                 }
                                 ,
                             }
                         },
                         polar: {},
                         series: [{
                             type: 'bar',
                             // data: [545, 245, 374, 412, 365, 545, 192, 387, 515, 656, 435, 224, 253, 224, 524, 685, 454],
                             coordinateSystem: 'polar',
                             name: '事故车辆类型',
                             stack: 'a'
                         }],
                         color: ['#FF9999'],//修改图表颜色
                         tooltip: {
                             show: true,
                         },
                         toolbox: {
                             show: true,
                             orient: 'horizontal',
                             right: '0',
                             top: 'bottom',
                             left: 'center',
                             iconStyle: {
                                 borderColor: '#ffffffff'
                             },
                             feature: {
                                 mark: {show: true},
                                 dataView: {show: false, readOnly: false},
                                 magicType: {show: true, type: ['line', 'bar']},
                                 restore: {show: true},
                                 saveAsImage: {show: true}
                             }
                         },
                     };
                     container.setOption(option);

                 },
                 error: function (errorMsg) {
                     //请求失败时执行该函数
                    alert("图表请求数据失败!");
                 }
             })
         }

        </script>

        <!-- 时钟 -->
        <div id="Clock" class="dvg" style="width:100%; height:25%; overflow: hidden;float: left;z-index: 2;"></div>
    </div>
    <!-- <div class="slide"></div>
    <div class="slider"></div> -->
    <div>
        <form id="search">
            <input id="searchInput" type="text" placeholder="   请输入您要搜索的内容...">
            <button id="searchBut" type="submit">Search</button>
        </form>
    </div>
</div>
</body>
</html>
<script>
    function gotoLatLong(e,n) {
        var EN = new GT_OSGB();
        EN.setGridCoordinates(e, n);
        wgs84 = EN.getWGS84();
        return wgs84;
    }</script>
<script>
    window.onload = function()
    {
        FourDays();
        sum();
        myFunction();
        MapDeal();
    }
    function myFunction() {
        setInterval(sum, 5050);//1000ms为1s与后台错开大概50ms的时间
    }
    function sum() {
        RoseFigure1();
        RoseFigure2();
        SeverityType();
        AccidentTime();
        Weather();
        VehicleType();
        setTimeout(MapDeal, 1000);
        //MapDeal();
    }
</script>