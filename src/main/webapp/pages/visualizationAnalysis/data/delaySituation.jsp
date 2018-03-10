<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<html>
<head>
<title>长时延误安全态势监控分析</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/tree/devicecomponents.css" />

<style type="text/css">
.p_title{
   padding-left: 37%;
   font-size: 16px;
}
</style>
</head>
<body>
		<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">可视化分析</a> <i class="fa fa-angle-right"></i></li>	
			<li><a href="#">安全数据可视化</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">长时延误监控分析</a></li>
		</ul>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="portlet blue-hoki box">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-cogs"></i>延迟安全态势分析
					</div>
				</div>
				<div class="portlet-body" style="height: 320px;">
					<div id="safety_index"
						style="width: 35%; height: 300px; float: left;"></div>
					<div id="index_with_time"
						style="width: 64%; height: 300px; float: right;"></div>
				</div>
			</div>
		</div>
	</div>


	<div class="row">
		<div class="col-md-12">
			<div class="portlet blue-hoki box">
				<div class="portlet-title">
					<div class="caption">
						<i class="fa fa-cogs"></i>安全态势预警及响应
					</div>
				</div>
				<div class="portlet-body" style="height: 320px;">
				    <p class="p_title">人员极度密集或者人员异常流动区域</p>
					<div class="col-md-3">
						<p><span class="text-danger" >区域:</span><span class="text-info" >T1航站楼1号候机大厅</span></p>
						<div>
							<img class="img-responsive" src="<%=path %>/img/visualizationAnalysis/dataAnalysis/high-traffic-area-1.png" />
						</div>
					</div>
					<div class="col-md-3">
						<p><span class="text-danger" >区域:</span><span class="text-info" >T2航站楼2号候机大厅</span></p>
						<div>
							<img class="img-responsive" src="<%=path %>/img/visualizationAnalysis/dataAnalysis/high-traffic-area-2.png" />
						</div>
					</div>
					<div class="col-md-3">
						<p><span class="text-danger" >区域:</span><span class="text-info" >T2航站楼3号候机大厅</span></p>
						<div>
							<img class="img-responsive" src="<%=path %>/img/visualizationAnalysis/dataAnalysis/high-traffic-area-3.png" />
						</div>
					</div>
					<div class="col-md-3">
						<p><span class="text-danger" >区域:</span><span class="text-info" >T2航站楼1号候机大厅</span></p>
						<div>
							<img class="img-responsive" src="<%=path %>/img/visualizationAnalysis/dataAnalysis/high-traffic-area-4.png" />
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var safetyChart = echarts.init(document.getElementById('safety_index'));
		var safetyOption = {
			/*title: {
				text: '雷达图'
			},*/
			tooltip : {},
			legend : {
				top : 10,
				left : 10,
				itemWidth : 12,
				itemHeight : 12,
				data : [ '理想态势', '实际态势' ],
				textStyle : {
					color : '#fff'
				}
			},
			radar : {
				radius : '60%',
				splitNumber : 8,
				axisLine : {
					lineStyle : {
						color : '#fff',
						opacity : 0.2
					}
				},
				splitLine : {
					lineStyle : {
						color : '#fff',
						opacity : 0.2
					}
				},
				splitArea : {
					areaStyle : {
						color : 'rgba(127,95,132,0.3)',
						opacity : 1,
						shadowBlur : 45,
						shadowColor : 'rgba(0,0,0,0.5)',
						shadowOffsetX : 0,
						shadowOffsetY : 15,
					}
				},
				indicator : [ {
					name : '延迟区人流密度(%)',
					max : 100
				}, {
					name : '延误时间(分钟)',
					max : 120
				}, {
					name : '延迟区人员计数(人)',
					max : 3000
				}, {
					name : '服务指标(%)',
					max : 100
				}, {
					name : '延迟区人流走向(%)',
					max : 100
				}, {
					name : '人员聚集(%)',
					max : 100
				} ]
			},
			series : [ {
				name : '理想VS实际态势',
				type : 'radar',
				symbolSize : 0,
				areaStyle : {
					normal : {
						shadowBlur : 13,
						shadowColor : 'rgba(0,0,0,0.2)',
						shadowOffsetX : 0,
						shadowOffsetY : 10,
						opacity : 0.5
					}
				},
				data : [ {
					value : [ 40, 30, 800, 90, 60, 60 ],
					name : '理想态势',
				}, {
					value : [ 60, 50, 1000, 85, 67, 55 ],
					name : '实际态势',
				} ]
			} ],
			color : [ '#006400', '#8B0000' ],
			backgroundColor : {
				type : 'radial',
				x : 0.4,
				y : 0.4,
				r : 0.35,
				colorStops : [ {
					offset : 0,
					color : '#895355' // 0% 处的颜色
				}, {
					offset : .4,
					color : '#593640' // 100% 处的颜色
				}, {
					offset : 1,
					color : '#39273d' // 100% 处的颜色
				} ],
				globalCoord : false
			// 缺省为 false
			}
		};
		safetyChart.setOption(safetyOption);
	</script>


	<script type="text/javascript">
		var trendChart = echarts.init(document
				.getElementById("index_with_time"));
		var trendOption = {
			backgroundColor : '#091323',
			color : [ '#4caf50' ],
			tooltip : {
				trigger : 'axis'
			},
			legend : {
				x : 'left',
				padding : [ 10, 20, 0, 20 ],
				data : [ {
					name : '安全指数',
					icon : 'circle'
				} ],
				selected : {
					'安全指数' : true,
				},
				textStyle : {
					color : '#dededf'
				}
			},
			grid : {
				left : '0',
				right : '3%',
				bottom : '3%',
				top : '13%',
				containLabel : true
			},
			xAxis : {
				name : '延误时间(分钟)',
				//nameLocation : 'middle',
				type : 'category',
				boundaryGap : false,
				axisTick : {
					show : false
				},
				axisLabel : {
					textStyle : {
						color : '#dededf'
					},
				},
				splitLine : { //网格线
					show : true,
					lineStyle : {
						color : [ '#23303f' ],
						type : 'solid'
					}
				},
				data : [ '5', '10', '15', '20', '25', '30', '35' ]
			},
			yAxis : {
				min : 0,
				max : 100,
				interval : 20,
				axisTick : {
					show : false
				},
				axisLine : {
					show : false,
				//    onZero:false
				},
				axisLabel : {
					textStyle : {
						color : '#dededf'
					}
				},
				splitLine : { //网格线
					show : true,
					lineStyle : {
						color : [ '#23303f' ],
						type : 'solid'
					}
				}
			},
			series : [ {
				name : '安全指数',
				type : 'line',
				smooth : true,
				symbolSize : 12,
				data : [ '70', '75', '58', '72', '70', '72', '74' ],
				label : {
					normal : {
						show : false,
						position : 'top'
					}
				}
			} ]
		};

		trendChart.setOption(trendOption);
	</script>
</body>
</html>