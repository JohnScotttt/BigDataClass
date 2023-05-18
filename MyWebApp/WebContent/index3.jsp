<%@ page language="java" import="dbtaobao.connDb,java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<String[]> list = connDb.index_3();
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
				<li><a href="./index1.jsp">用户行为转换率</a></li>
				<li><a href="./index2.jsp">一周活跃分布</a></li>
				<li class="current"><a href="#">一天活跃分布</a></li>
            </ul>
        </div>
        <div class="container">
            <div class="title">一天活跃分布</div>
            <div class="show">
                <div id="main" style="width: 800px;height:600px;"></div>
            </div>
        </div>
    </div>
<script>
//基于准备好的dom，初始化echarts实例
var myChart = echarts.init(document.getElementById('main'));
option = {
		  title: {
		    text: '一天活跃分布'
		  },
		  tooltip: {
		    trigger: 'axis'
		  },
		  legend: {
		    data: ['Rainfall', 'Evaporation']
		  },
		  toolbox: {
		    show: true,
		    feature: {
		      dataView: { show: true, readOnly: false },
		      magicType: { show: true, type: ['line', 'bar'] },
		      restore: { show: true },
		      saveAsImage: { show: true }
		    }
		  },
		  calculable: true,
		  xAxis: [
		    {
		      type: 'category',
		      // prettier-ignore
		      data: ['0', '1', '2', '3', '4', '5', '6','7', '8', '9', '10', '11',
						      '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23']
		    }
		  ],
		  yAxis: [
		    {
		      type: 'value'
		    }
		  ],
		  series: [
		    {
		      name: '点击',
		      type: 'bar',
		      data: [<%=list.get(1)[1]%>,<%=list.get(2)[1]%>,
		             <%=list.get(3)[1]%>,<%=list.get(4)[1]%>,
		             <%=list.get(5)[1]%>,<%=list.get(6)[1]%>,
		             <%=list.get(7)[1]%>,<%=list.get(8)[1]%>,
		             <%=list.get(9)[1]%>,<%=list.get(10)[1]%>,
		             <%=list.get(11)[1]%>,<%=list.get(12)[1]%>,
		             <%=list.get(13)[1]%>,<%=list.get(14)[1]%>,
		             <%=list.get(15)[1]%>,<%=list.get(16)[1]%>,
		             <%=list.get(17)[1]%>,<%=list.get(18)[1]%>,
		             <%=list.get(19)[1]%>,<%=list.get(20)[1]%>,
		             <%=list.get(21)[1]%>,<%=list.get(22)[1]%>,
		             <%=list.get(23)[1]%>,<%=list.get(0)[1]%>]
		    },
		    {
		      name: '收藏',
		      type: 'bar',
		      data: [
		             <%=list.get(1)[2]%>,<%=list.get(2)[2]%>,
		             <%=list.get(3)[2]%>,<%=list.get(4)[2]%>,
		             <%=list.get(5)[2]%>,<%=list.get(6)[2]%>,
		             <%=list.get(7)[2]%>,<%=list.get(8)[2]%>,
		             <%=list.get(9)[2]%>,<%=list.get(10)[2]%>,
		             <%=list.get(11)[2]%>,<%=list.get(12)[2]%>,
		             <%=list.get(13)[2]%>,<%=list.get(14)[2]%>,
		             <%=list.get(15)[2]%>,<%=list.get(16)[2]%>,
		             <%=list.get(17)[2]%>,<%=list.get(18)[2]%>,
		             <%=list.get(19)[2]%>,<%=list.get(20)[2]%>,
		             <%=list.get(21)[2]%>,<%=list.get(22)[2]%>,
		             <%=list.get(23)[2]%>,<%=list.get(0)[2]%>]
		      },
		    {
		      name: '购物车',
		      type: 'bar',
		      data: [
		             <%=list.get(1)[3]%>,<%=list.get(2)[3]%>,
		             <%=list.get(3)[3]%>,<%=list.get(4)[3]%>,
		             <%=list.get(5)[3]%>,<%=list.get(6)[3]%>,
		             <%=list.get(7)[3]%>,<%=list.get(8)[3]%>,
		             <%=list.get(9)[3]%>,<%=list.get(10)[3]%>,
		             <%=list.get(11)[3]%>,<%=list.get(12)[3]%>,
		             <%=list.get(13)[3]%>,<%=list.get(14)[3]%>,
		             <%=list.get(15)[3]%>,<%=list.get(16)[3]%>,
		             <%=list.get(17)[3]%>,<%=list.get(18)[3]%>,
		             <%=list.get(19)[3]%>,<%=list.get(20)[3]%>,
		             <%=list.get(21)[3]%>,<%=list.get(22)[3]%>,
		             <%=list.get(23)[3]%>,<%=list.get(0)[3]%>]
		      },
		    {
		      name: '购买',
		      type: 'bar',
		      data: [
		             <%=list.get(1)[4]%>,<%=list.get(2)[4]%>,
		             <%=list.get(3)[4]%>,<%=list.get(4)[4]%>,
		             <%=list.get(5)[4]%>,<%=list.get(6)[4]%>,
		             <%=list.get(7)[4]%>,<%=list.get(8)[4]%>,
		             <%=list.get(9)[4]%>,<%=list.get(10)[4]%>,
		             <%=list.get(11)[4]%>,<%=list.get(12)[4]%>,
		             <%=list.get(13)[4]%>,<%=list.get(14)[4]%>,
		             <%=list.get(15)[4]%>,<%=list.get(16)[4]%>,
		             <%=list.get(17)[4]%>,<%=list.get(18)[4]%>,
		             <%=list.get(19)[4]%>,<%=list.get(20)[4]%>,
		             <%=list.get(21)[4]%>,<%=list.get(22)[4]%>,
		             <%=list.get(23)[4]%>,<%=list.get(0)[4]%>,]
		      }
		  ]
		};
// 使用刚指定的配置项和数据显示图表。
myChart.setOption(option);
</script>
</body>
</html>