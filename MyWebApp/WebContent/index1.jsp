<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<String[]> list = connDb.index_1();
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
                <li class="current"><a href="#">用户行为转换率</a></li>
                <li><a href="./index2.jsp">一周活跃分布</a></li>
                <li><a href="./index3.jsp">一天活跃分布</a></li>
            </ul>
        </div>
        <div class="container">
            <div class="title">用户行为转换率</div>
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
    text: '用户行为转化漏斗'
  },
  tooltip: {
    trigger: 'item',
    formatter: '{a} <br/>{b} : {d}%'
  },
  toolbox: {
    feature: {
      dataView: { readOnly: false },
      restore: {},
      saveAsImage: {}
    }
  },
  legend: {
    data: ['点击', '收藏 OR 加购物车', '购买']
  },
  series: [
    {
      name: '转化率',
      type: 'funnel',
      left: '10%',
      top: 60,
      bottom: 60,
      width: '80%',
      min: 0,
      max: 90000000,
      minSize: '0%',
      maxSize: '100%',
      sort: 'descending',
      gap: 2,
      label: {
        show: true,
        position: 'inside'
      },
      labelLine: {
        length: 10,
        lineStyle: {
          width: 1,
          type: 'solid'
        }
      },
      itemStyle: {
        borderColor: '#fff',
        borderWidth: 1
      },
      emphasis: {
        label: {
          fontSize: 20
        }
      },
      data: [
        { value: <%=list.get(0)[0]%>, name: '点击' },
        { value: <%=list.get(0)[1]%>, name: '收藏 OR 加购物车' },
        { value: <%=list.get(0)[2]%>, name: '购买' }
      ]
    }
  ]
};

// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
</script>
</body>
</html>