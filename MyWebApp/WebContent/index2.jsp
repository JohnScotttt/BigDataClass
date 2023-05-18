<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<String[]> list = connDb.index_2();
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECharts 可视化分析淘宝双11</title>
<link href="./css/style.css" type='text/css' rel="stylesheet"/>
<script src="./js/echarts.js"></script>
</head>
<body>
	<div class='header'>
        <p>ECharts 可视化分析淘宝双11</p>
    </div>
    <div class="content">
        <div class="nav">
            <ul>
                <li><a href="./index.jsp">用户流量及购物情况</a></li>
                <li><a href="./index1.jsp">男女买家交易对比</a></li>
                <li class="current"><a href="#">一周活跃分布</a></li>
                <li><a href="./index3.jsp">一天活跃分布</a></li>
            </ul>
        </div>
        <div class="container">
            <div class="title">一周活跃分布</div>
            <div class="show">
                <div id="main" style="width: 800px;height:400px;"></div>
            </div>
        </div>
    </div>
<script>
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
// 指定图表的配置项和数据
option = {
title: {
 text: '一周活跃分布'
},
  tooltip: {
    trigger: 'axis',
    axisPointer: {
      // Use axis to trigger tooltip
      type: 'shadow' // 'shadow' as default; can also be 'line' or 'shadow'
    }
  },
  legend: {},
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  xAxis: {
    type: 'value'
  },
  yAxis: {
    type: 'category',
    data: ['Sun','Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
  },
  series: [
    {
      name: '点击',
      type: 'bar',
      stack: 'total',
      label: {
        show: true
      },
      emphasis: {
        focus: 'series'
      },
      data: [<%=list.get(0)[1]%>,
             <%=list.get(1)[1]%>,
             <%=list.get(2)[1]%>,
             <%=list.get(3)[1]%>,
             <%=list.get(4)[1]%>,
             <%=list.get(5)[1]%>,
             <%=list.get(6)[1]%>]
    },
    {
      name: '收藏',
      type: 'bar',
      stack: 'total',
      label: {
        show: true
      },
      emphasis: {
        focus: 'series'
      },
      data: [<%=list.get(0)[2]%>,
             <%=list.get(1)[2]%>,
             <%=list.get(2)[2]%>,
             <%=list.get(3)[2]%>,
             <%=list.get(4)[2]%>,
             <%=list.get(5)[2]%>,
             <%=list.get(6)[2]%>]
    },
    {
      name: '购物车',
      type: 'bar',
      stack: 'total',
      label: {
        show: true
      },
      emphasis: {
        focus: 'series'
      },
      data: [<%=list.get(0)[3]%>,
             <%=list.get(1)[3]%>,
             <%=list.get(2)[3]%>,
             <%=list.get(3)[3]%>,
             <%=list.get(4)[3]%>,
             <%=list.get(5)[3]%>,
             <%=list.get(6)[3]%>]
    },
    {
      name: '购买',
      type: 'bar',
      stack: 'total',
      label: {
        show: true
      },
      emphasis: {
        focus: 'series'
      },
      data: [<%=list.get(0)[4]%>,
             <%=list.get(1)[4]%>,
             <%=list.get(2)[4]%>,
             <%=list.get(3)[4]%>,
             <%=list.get(4)[4]%>,
             <%=list.get(5)[4]%>,
             <%=list.get(6)[4]%>]
    }
  ]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
</script>
</body>
</html>