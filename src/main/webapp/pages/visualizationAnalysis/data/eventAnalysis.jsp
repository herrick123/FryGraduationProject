<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全事件智能分析</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>css/tree/devicecomponents.css" />

<style type="text/css">
#event_chart{
  height:300px;
  width:500px;
}
.dlshouwen-grid{
   font-size: 14px;
}
</style>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">安全数据可视化智能分析</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">安全事件智能分析</a></li>
		</ul>
	</div>


	<div class="row">
		<div class="col-md-12">
			<div class="portlet blue-hoki box">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-cogs"></i>安全事件分类统计
					</div>
				</div>
				<div class="portlet-body " style="height: 700px;">
					<!-- 开始搜索部分 -->
					<form class="form-inline">
						<div class="row">
							<div class="col-md-2"></div>
							<div class="col-md-2">
								<select class="form-control">
									<option>选择事件类型</option>
									<option>火灾报警事件</option>
									<option>门禁报警事件</option>
									<option>手动报警事件</option>
									<option>围界报警事件</option>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control">
									<option>选择发生区域</option>
									<option>航站区</option>
									<option>飞行区</option>
									<option>公共区</option>
									<option>控制区</option>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control">
									<option>选择事件级别</option>
									<option>一级</option>
									<option>二级</option>
									<option>三级</option>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control">
									<option>选择事件状态</option>
									<option>已处理</option>
									<option>处理中</option>
									<option>未处理</option>
								</select>
							</div>

						</div>

						<div class="row" style="margin-top: 10px;">
							<div class="col-md-2"></div>
							<div class="col-md-6">
								事件日期从<input id="from_date" class="form-control" />到<input
									id="to_date" class="form-control" />
							</div>
							<div class="col-md-1">
								<button class="sbtn sbtn-blue">查询</button>
							</div>
						</div>
					</form>
					<!-- 结束搜索部分 -->
					<div class="row">
						<div class="col-md-12 column">
							<div class="tabbable" id="tabs-401700">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#panel-event-list"
										data-toggle="tab">安全事件信息列表</a></li>
									<li><a href="#panel-event-chart" data-toggle="tab">安全事件统计信息图</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-event-list">
									    <div>
									        <div id="event_list" 
											style="margin-top: 5px;"></div>
										    <div id="task_bar" class="dlshouwen-grid-toolbar-container"></div>
									    </div>
										
									</div>
									<div class="tab-pane " id="panel-event-chart">
										<div class="row">
										    <div class="col-md-3">
										    </div>
										    <div  class="col-md-5">
										        <div id="event_chart">
										        </div>
										    </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


				</div>
			</div>
		</div>
	</div>


	<!-- 列表 -->
	<script type="text/javascript">
	var datas = [ {
		"serialId" : 1,
		"eventName" : "发现危险物",
		"reportTime" : "2017-8-2 10:10:10",
		"eventLocation":"T1航站楼1号候机大厅发现危险物",
		"eventType":"旅客相关",
		"eventLevel":"三级",
		"eventState" : "已处理",
	}, {
		"serialId" : 2,
		"eventName" : "门禁失灵",
		"reportTime" : "2017-8-2 16:18:15",
		"eventLocation":"T1航站楼2号入口",
		"eventType":"设备相关",
		"eventLevel":"二级",
		"eventState" : "已处理",
	}, 
	
	{
		"serialId" : 3,
		"eventName" : "达到大厅发生小型火灾",
		"reportTime" : "2017-8-2 16:20:55",
		"eventLocation":"T1航站楼到达大厅",
		"eventType":"消防相关",
		"eventLevel":"三级",
		"eventState" : "处理中",
	},];

	var gridColumns = [
			{
				id : 'serialId',
				title : '序号',
				type : 'number',
				columnClass : 'text-center'
			},
			
			{
				id : 'eventName',
				title : '事件名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'reportTime',
				title : '上报时间',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'eventLocation',
				title : '发生地点',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'eventType',
				title : '时间类型',
				width:100,
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'eventLevel',
				title : '事件等级',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id:"eventState",
				title:"事件状态",
				width:160,
				type:'string',
				columnClass:'text-center'
			},
			
			];
	var gridOption = {
		lang : 'zh-cn',
		ajaxLoad : false,
		exportFileName : '告警接入任务列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'event_list',
		toolbarContainer : 'task_bar',
		tools : '',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50 ]
	};
	var grid = $.fn.dlshouwen.grid.init(gridOption);
	$(function() {
		grid.load();
	});
	
	
</script>

<!-- 事件统计信息 -->
<script type="text/javascript">
			var eventChart = echarts.init(document.getElementById("event_chart"));
			var eventOption = {
				tooltip: {
					trigger: 'axis',
					axisPointer: { // 坐标轴指示器，坐标轴触发有效
						type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend: {
					data: ['事件总数', '火灾', '门禁', '手动', '围界']
				},
				grid: {
					left: '3%',
					right: '4%',
					bottom: '3%',
					containLabel: true
				},
				xAxis: [{
					type: 'category',
					data: ['周一', '周二', '周三', '周四', '周五', '周六', '周日']
				}],
				yAxis: [{
					type: 'value'
				}],
				series: [
					{
						name: '事件总数',
						type: 'bar',
						data: [862, 1018, 964, 1026, 1679, 1600, 1570],
						/* markLine: {
							lineStyle: {
								normal: {
									type: 'dashed'
								}
							},
							data: [
								[{
									type: 'min'
								}, {
									type: 'max'
								}]
							]
						} */
					},
					{
						name: '火灾',
						type: 'bar',
						barWidth: 10,
						stack: '事件总数',
						data: [620, 732, 701, 734, 1090, 1130, 1120]
					},
					{
						name: '门禁',
						type: 'bar',
						stack: '事件总数',
						data: [120, 132, 101, 134, 290, 230, 220]
					},
					{
						name: '手动',
						type: 'bar',
						stack: '事件总数',
						data: [60, 72, 71, 74, 190, 130, 110]
					},
					{
						name: '围界',
						type: 'bar',
						stack: '事件总数',
						data: [62, 82, 91, 84, 109, 110, 120]
					},
					{
						type: 'line',
						symbolSize: 5,
						symbol: 'triangle',
						smooth:'true',
						itemStyle: {
							normal: {
								color: '#CB6C1F',
								barBorderRadius: 0,
								label: {
									show: true,
									position: 'top',
									formatter: function(p) {
										return p.value > 0 ? (p.value) : '';
									}
								}
							}
						},
						data: [862, 1018, 964, 1026, 1679, 1600, 1570]
					}
				]
			};

			eventChart.setOption(eventOption);
</script>
</body>
</html>