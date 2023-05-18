<%@ page language="java" import="dbtaobao.connDb,java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
ArrayList<String[]> list = connDb.index();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ECharts 可视化分析淘宝双11</title>
<link href="./css/style.css" type='text/css' rel="stylesheet" />
<script src="./js/echarts.js"></script>
</head>
<body>
	<div class='header'>
		<p>ECharts 可视化分析淘宝双11</p>
	</div>
	<div class="content">
		<div class="nav">
			<ul>
				<li class="current"><a href="#">用户流量及购物情况</a></li>
				<li><a href="./index1.jsp">用户行为转换率</a></li>
				<li><a href="./index2.jsp">一周活跃分布</a></li>
				<li><a href="./index3.jsp">一天活跃分布</a></li>
			</ul>
		</div>
		<div class="container">
			<div class="title">用户流量及购物情况</div>
			<div class="show">
				<div id="main" style="width: 800px;height:400px;"></div>
			</div>
		</div>
	</div>
	<script>
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
option = {
  title: {
    text: '用户流量及购物情况'
  },
  tooltip: {
    trigger: 'axis'
  },
  legend: {
    data: ['PV', 'UV']
  },
  grid: {
    left: '3%',
    right: '4%',
    bottom: '3%',
    containLabel: true
  },
  toolbox: {
    feature: {
      saveAsImage: {}
    }
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['<%=list.get(0)[0]%>',
           '<%=list.get(1)[0]%>',
           '<%=list.get(2)[0]%>',
           '<%=list.get(3)[0]%>',
           '<%=list.get(4)[0]%>',
           '<%=list.get(5)[0]%>',
           '<%=list.get(6)[0]%>',
           '<%=list.get(7)[0]%>',
           '<%=list.get(8)[0]%>']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: 'PV',
      type: 'line',
      stack: 'Total',
      data: [<%=list.get(0)[1]%>,
             <%=list.get(1)[1]%>,
             <%=list.get(2)[1]%>,
             <%=list.get(3)[1]%>,
             <%=list.get(4)[1]%>,
             <%=list.get(5)[1]%>,
             <%=list.get(6)[1]%>,
             <%=list.get(7)[1]%>,
             <%=list.get(8)[1]%>]
    },
    {
      name: 'UV',
      type: 'line',
      stack: 'Total',
      data: [<%=list.get(0)[2]%>,
             <%=list.get(1)[2]%>,
             <%=list.get(2)[2]%>,
             <%=list.get(3)[2]%>,
             <%=list.get(4)[2]%>,
             <%=list.get(5)[2]%>,
             <%=list.get(6)[2]%>,
             <%=list.get(7)[2]%>,
             <%=list.get(8)[2]%>]
    }
  ]
};

myChart.setOption(option);
</script>
</body>
</html>