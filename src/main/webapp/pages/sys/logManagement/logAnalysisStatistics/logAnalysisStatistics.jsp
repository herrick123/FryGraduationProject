<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<%@include file="/pages/inc/header.jsp"%>
<title>安全事件统计</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<meta content="" name="description" />
<meta content="" name="author" />
<link href="<%=path %>/css/log/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/log/uniform.default.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/log/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/log/bootstrap-datetimepicker.min.css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/log/style.min.css" />
<link href="<%=path %>/css/log/components.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="<%=path %>/css/log/plugins.css" rel="stylesheet" type="text/css"/>
<link href="<%=path %>/css/log/layout.css" rel="stylesheet" type="text/css"/> 
<link href="<%=path %>/css/log/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="<%=path %>/css/log/custom.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/log/layer.css"/>
</head>
<body class="page-full-width">
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i> 
			<a href="#">青岛机场安全管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">日志管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">日志分析统计</a></li>
	</ul> 
</div>
	<div class="clearfix"></div>
	<div class="page-container">
		<div class="page-content-wrapper">
			<div style="margin-top:10px;">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet blue-hoki box">
							<div class="portlet-title">
								<div class="caption" style="padding: 12px 0px;">
									<i class="fa fa-cogs"></i>日志分析统计--事件类型
								</div>
							</div>
							<div class="portlet-body" style="height:286px;">
								<div class="col-md-12">
								 	<div class="form-group">
										<div class="form-group date form_datetime">
											<label style="width:100%;">
												<span>事件发生时间:</span>
												<input type="text" placeholder="从" id="startTimeFrom" name="startTimeFrom" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${startTimeFrom}'/>" class="form-control dateTimePicker" style="display:inline-block;width:16%;"> 
												<span>-</span> 
												<input type="text" placeholder="至" id="startTimeTo" name="startTimeTo" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${startTimeTo}' />" class="form-control dateTimePicker" style="display:inline-block;width:16%;">
												<button class="btn btn-sm blue-hoki" type="button">查询</button>
											</label>											
										</div>
									</div>									
								</div>
								<div id="container1" style="width: 40%;height:200px;float:left;"></div>
								<div id="table" style="width: 60%;float:left;">								
									<div class="dataTables_wrapper no-footer" id="sample_2_wrapper">										
										<div class="table-scrollable">
											<table style="width: 936px;" aria-describedby="sample_2_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_2">
												<thead>
													<tr role="row">
														<th aria-label="设备名称" style="width: 67.8833px;" colspan="1" rowspan="1" class="sorting_disabled">序号</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">安全事件类型</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">安全事件总数</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">百分比</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">已接警</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">已派警</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">已处警</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">已完成</th>
													</tr>
												</thead>
												<tbody>
													<tr class="odd" role="row">
														<td class="sorting_1">1</td>
														<td>公共安全</td>
														<td>110</td>
														<td>34.70%</td>
														<td>80</td>
														<td>76</td>
														<td>69</td>
														<td>60</td>
													</tr>
													<tr class="even" role="row">
														<td class="sorting_1">2</td>
														<td>消防安全</td>
														<td>94</td>
														<td>29.65%</td>
														<td>88</td>
														<td>80</td>
														<td>79</td>
														<td>69</td>
													</tr>
													<tr class="odd" role="row">
														<td class="sorting_1">3</td>
														<td>空防安全</td>
														<td>35</td>
														<td>11.04%</td>
														<td>33</td>
														<td>28</td>
														<td>25</td>
														<td>21</td>
													</tr>
													<tr class="even" role="row">
														<td class="sorting_1">4</td>
														<td>生产安全</td>
														<td>78</td>
														<td>24.61%</td>
														<td>68</td>
														<td>60</td>
														<td>50</td>
														<td>40</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>				
				<div class="row">
					<div class="col-md-12">
						<div class="portlet blue-hoki box">
							<div class="portlet-title">
								<div class="caption" style="padding: 12px 0px;">
									<i class="fa fa-cogs"></i>日志分析统计--区域
								</div>
							</div>
							<div class="portlet-body" style="height:286px;">
								<div class="col-md-12">
								 	<div class="form-group">
										<div class="form-group date form_datetime">
											<label style="width:100%;">
												<span>事件发生时间:</span>
												<input type="text" placeholder="从" id="startTimeFrom" name="startTimeFrom" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${startTimeFrom}'/>" class="form-control dateTimePicker" style="display:inline-block;width:16%;"> 
												<span>-</span> 
												<input type="text" placeholder="至" id="startTimeTo" name="startTimeTo" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${startTimeTo}' />" class="form-control dateTimePicker" style="display:inline-block;width:16%;">
												<button class="btn btn-sm blue-hoki" type="button">查询</button>
											</label>											
										</div>
									</div>								
								</div>
								<div id="container2" style="width: 40%;height:200px;float:left;"></div>
								<div id="table2" style="width: 60%;float:left;">								
									<div class="dataTables_wrapper no-footer" id="sample_2_wrapper">
										<div class="table-scrollable">
											<table style="width: 936px;" aria-describedby="sample_2_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_2">
												<thead>
													<tr role="row">
														<th aria-label="设备名称" style="width: 67.8833px;" colspan="1" rowspan="1" class="sorting_disabled">序号</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">发生区域</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">安全事件总数</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">百分比</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">已接警</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">已派警</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">已处警</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">已完成</th>
													</tr>
												</thead>
												<tbody>
													<tr class="odd" role="row">
														<td class="sorting_1">1</td>
														<td>航站区</td>
														<td>60</td>
														<td>27.14%</td>
														<td>50</td>
														<td>46</td>
														<td>46</td>
														<td>40</td>
													</tr>
													<tr class="even" role="row">
														<td class="sorting_1">2</td>
														<td>飞行区</td>
														<td>8</td>
														<td>3.61%</td>
														<td>8</td>
														<td>7</td>
														<td>7</td>
														<td>6</td>
													</tr>
													<tr class="odd" role="row">
														<td class="sorting_1">3</td>
														<td>公共区</td>
														<td>95</td>
														<td>42.98%</td>
														<td>90</td>
														<td>66</td>
														<td>50</td>
														<td>48</td>
													</tr>
													<tr class="even" role="row">
														<td class="sorting_1">4</td>
														<td>控制区</td>
														<td>58</td>
														<td>26.24%</td>
														<td>48</td>
														<td>45</td>
														<td>40</td>
														<td>40</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>				
				<div class="row">
					<div class="col-md-12">
						<div class="portlet blue-hoki box">
							<div class="portlet-title">
								<div class="caption" style="padding: 12px 0px;">
									<i class="fa fa-cogs"></i>日志分析统计--事件级别
								</div>
							</div>
							<div class="portlet-body" style="height:286px;">
								<div class="col-md-12">
								 	<div class="form-group">
										<div class="form-group date form_datetime">
											<label style="width:100%;">
												<span>事件发生时间:</span>
												<input type="text" placeholder="从" id="startTimeFrom" name="startTimeFrom" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${startTimeFrom}'/>" class="form-control dateTimePicker" style="display:inline-block;width:16%;"> 
												<span>-</span> 
												<input type="text" placeholder="至" id="startTimeTo" name="startTimeTo" value="<fmt:formatDate pattern='yyyy-MM-dd HH:mm:ss' value='${startTimeTo}' />" class="form-control dateTimePicker" style="display:inline-block;width:16%;">
												<button class="btn btn-sm blue-hoki" type="button">查询</button>
											</label>
										</div>
									</div>
								</div>
								<div id="container3" style="width: 40%;height:200px;float:left;"></div>
								<div id="table" style="width: 60%;float:left;">
								
									<div class="dataTables_wrapper no-footer" id="sample_2_wrapper">
										<div class="table-scrollable">
											<table style="width: 936px;" aria-describedby="sample_2_info" role="grid" class="table table-striped table-bordered table-hover dataTable no-footer" id="sample_2">
												<thead>
													<tr role="row">
														<th aria-label="设备名称" style="width: 67.8833px;" colspan="1" rowspan="1" class="sorting_disabled">序号</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">事件级别</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">安全事件总数</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">百分比</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">已接警</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">已派警</th>
														<th aria-label="型号" style="width: 104.883px;" colspan="1" rowspan="1" class="sorting_disabled">已处警</th>
														<th aria-label="设备类别" style="width: 77.8833px;" colspan="1" rowspan="1" class="sorting_disabled">已完成</th>
													</tr>
												</thead>
												<tbody>
													<tr class="odd" role="row">
														<td class="sorting_1">1</td>
														<td>一级</td>
														<td>30</td>
														<td>27.27%</td>
														<td>29</td>
														<td>26</td>
														<td>14</td>
														<td>10</td>
													</tr>
													<tr class="even" role="row">
														<td class="sorting_1">2</td>
														<td>二级</td>
														<td>34</td>
														<td>30.90%</td>
														<td>33</td>
														<td>29</td>
														<td>29</td>
														<td>22</td>
													</tr>
													<tr class="odd" role="row">
														<td class="sorting_1">3</td>
														<td>三级</td>
														<td>45</td>
														<td>40.90%</td>
														<td>40</td>
														<td>36</td>
														<td>35</td>
														<td>30</td>
													</tr>
													<tr class="even" role="row">
														<td class="sorting_1">4</td>
														<td>四级</td>
														<td>1</td>
														<td>0.90%</td>
														<td>1</td>
														<td>1</td>
														<td>1</td>
														<td>1</td>
													</tr>
												</tbody>
											</table>
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
	<script src="<%=path %>/js/log/jquery-migrate.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/jquery-ui.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/jquery.slimscroll.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/jquery.blockui.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/jquery.cokie.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/jquery.uniform.min.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/bootstrap-switch.min.js" type="text/javascript"></script>	
	<script src="<%=path %>/js/log/iframeResizer.contentWindow.min.js" type="text/javascript"></script>		
	<script type="text/javascript" src="<%=path %>/js/log/select2.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/log/select2_locale_zh-CN.js"></script>
	<script src="<%=path %>/js/log/jstree.min.js"></script>
	<script src="<%=path %>/js/log/jquery.imagezoom.min.js"></script>	
	<script type="text/javascript" src="<%=path %>/js/log/bootstrap-datetimepicker.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/log/bootstrap-datetimepicker.zh-CN.js"></script>

	<!-- END PAGE LEVEL SCRIPTS -->
	<script src="<%=path %>/js/log/metronic.js" type="text/javascript"></script>
	<script src="<%=path %>/js/log/layout.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=path %>/js/log/layer.js"></script>
	<script type="text/javascript" src="<%=path %>/extends/echarts.js"></script>
	<script>
	<!--初始化Echarts-->
    var myChart=echarts.init(document.getElementById("container1"))  ;
    <!--创建Option-->
    var option={
         title :{
             text:'安全事件类型统计表',
             subtext:'正在测试' ,
             x:'center'
         }  ,
        tooltip:{
             trigger:'item'  ,
             formatter:'{a} <br/> {b} :{c} ({d}%)'
        } ,
        legend:{
             orient:'vertical' ,
             left:'left'   ,
             data:['公共安全','消防安全','空防安全','生产安全']
        } ,
		    series : [
		        {
		            name:'安全事件',
		            type:'pie',
		            radius : '55%',
		            center: ['50%', '60%'],
		            data:[
		                {value:110, name:'公共安全'},
		                {value:94, name:'消防安全'},
		                {value:35, name:'空防安全'},
		                {value:78, name:'生产安全'}
		            ],
		    itemStyle:{
                emphasis:{
                    shadowBlur:10 ,
                    shadowOffsetX:0 ,
                    shadowColor:'rgba(0,0,0,0.5)'
                }
            }
        }
    ]
};
<!--配置Echarts的Option-->
 myChart.setOption(option);
   
		
	var myChart=echarts.init(document.getElementById("container2"))  ;
	
	var option2 = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['航站区','飞行区','公共区','控制区'],
				left: 'left',
				padding:20
		    },
		    grid: {
		        left: '3%',
		        right: '25%',
		        bottom: '12%', 
		        containLabel: true
		    },
		    dataZoom: {
		        show: true,
		        start : 70
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['2017-04-01','2017-04-02','2017-04-03','2017-04-04','2017-04-05','2017-04-06',
		                    '2017-04-07','2017-04-08','2017-04-09','2017-04-10','2017-04-11','2017-04-12'],
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value} 件'
		            }
		        }
		    ],
		    series : [
		        {
		            name:'航站区',
		            type:'bar',
		            //barWidth: '60%',
		            data:[60, 55, 23, 32, 47, 39, 31,36,15,28,26,38]
		        },
		        {
		            name:'飞行区',
		            type:'bar',
		           // barWidth: '60%',
		            data:[8, 2, 2, 3, 7, 3, 1,3,0,8,2,3]
		        },
		        {
		            name:'公共区',
		            type:'bar',
		           // barWidth: '60%',
		            data:[95, 25, 62, 53, 47, 33, 71,38,15,58,28,32]
		        },
		        {
		            name:'控制区',
		            type:'bar',
		           // barWidth: '60%',
		            data:[58, 45, 14, 21, 69, 21, 37,21,14,46,14,29]
		        }
		    ]
		};
	myChart.setOption(option2);	
	 
	var myChart=echarts.init(document.getElementById("container3"))  ;
	
		var option3 = {
		    tooltip : {
		        trigger: 'axis',
		        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
		            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
		        }
		    },
		    legend: {
		        data: ['一级','二级','三级','四级'],
				left: 'left',
				padding:20
		    },
		    grid: {
		        left: '3%',
		        right: '25%',
		        bottom: '12%', 
		        containLabel: true
		    },
		    dataZoom: {
		        show: true,
		        start : 70
		    },
		    xAxis : [
		        {
		            type : 'category',
		            data : ['2017-04-01','2017-04-02','2017-04-03','2017-04-04','2017-04-05','2017-04-06',
		                    '2017-04-07','2017-04-08','2017-04-09','2017-04-10','2017-04-11','2017-04-12'],
		            axisTick: {
		                alignWithLabel: true
		            }
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value',
		            axisLabel : {
		                formatter: '{value} 件'
		            }
		        }
		    ],
		    series : [
		        {
		            name:'一级',
		            type:'line',
		            //barWidth: '60%',
		            data:[10, 15, 10, 13, 17, 13, 11,2,15,8,7,3]
		        },
		        {
		            name:'二级',
		            type:'line',
		           // barWidth: '60%',
		            data:[34, 25, 22, 13, 17, 3, 31,13,15,8,22,13]
		        },
		        {
		            name:'三级',
		            type:'line',
		           // barWidth: '60%',
		            data:[45, 25, 42, 33, 17, 33, 14,3,15,8,32,13]
		        },
		        {
		            name:'四级',
		            type:'line',
		           // barWidth: '60%',
		            data:[1, 0, 0, 1, 2, 1, 0,1,2,0,0,1]
		        }
		    ]
		};
		myChart.setOption(option3);
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>