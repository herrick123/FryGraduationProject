<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>安全数据分析</title>
<style type="text/css">
#out_traffic{

   height:300px;
}

#in_traffic{

   height: 300px;
  
}

#check_in{
   height:300px;
}
#security_area{
   height: 300px;
}
#transfer_area{
  height: 300px;
}
.chart_header{
   margin-left: 40%;
   font-size: 16px;
   font-weight: bolder;
}
.video_area{
   padding-left: 35%;
   font-size: 16px;
   font-weight: bolder;
}


.span_right{
    padding-right:20%;
}
</style>
<script type="text/javascript" src="<%=path %>/extends/echarts.js"></script>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">可视化分析</a> <i class="fa fa-angle-right"></i></li>	
			<li><a href="#">安全数据可视化</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">高峰旅客进出流量分析</a></li>
		</ul>
	</div>

   <div class="row">
        <div class="col-md-6">
           <p class="chart_header">出港人数分析</p>
           <div id="out_traffic" >

           </div>
        </div>
        <div class="col-md-6">
           <p class="chart_header">进港人数分析</p>
           <div id="in_traffic" >
           </div>
        </div>
   </div>
    <hr>
    <div class="row">
       <div class="col-md-4">
          <p class="chart_header">值机岛区域人流量</p>
          <div id="check_in">
          
          </div>
       </div>
       <div class="col-md-4">
          <p class="chart_header">安检区域人流量</p>
          <div id="security_area">
          
          </div>
       </div>
       <div class="col-md-4">
          <p class="chart_header">换乘区域人流量</p>
          <div id="transfer_area">
          
          </div>
       </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-4">     
            <div class="row">
                <p class="video_area">航站楼</p>
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-facetime-video"></span><span class="text-info span_right" >视频总数:1234</span>
                    <span class="glyphicon glyphicon-user" ></span><span class="text-danger">总人数:6170</span>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <video src="http://www.w3school.com.cn/i/movie.ogg" controls="controls">
                    
                    </video>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            
             
              <div class="row">
              <p class="video_area">停机场</p>
                 <div class="col-md-12">
                    <span class="glyphicon glyphicon-facetime-video"></span><span class="text-info  span_right">视频总数:234</span>
                    <span class="glyphicon glyphicon-user" ></span><span class="text-danger" >总人数:4170</span>
                </div> 
                
            </div>
            <div class="row">
                <div class="col-md-12">
                    <video src="http://www.w3school.com.cn/i/movie.ogg" controls="controls">
                    
                    </video>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
 
              <div class="row">
                <p class="video_area">机场道路</p>
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-facetime-video"></span><span class="text-info  span_right">视频总数:134</span>
                    <span class="glyphicon glyphicon-user" ></span><span class="text-danger" >总人数:4532</span>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <video src="http://www.w3school.com.cn/i/movie.ogg" controls="controls">
                    
                    </video>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript">
			var myChartOut = echarts.init(document.getElementById('out_traffic'));
			var optionOut = {
			/* 	title: {
					text: '出港人数分析',
					// subtext: '纯属虚构'
				}, */
				tooltip: {
					trigger: 'axis',
					axisPointer: {
						type: 'cross',
						label: {
							backgroundColor: '#283b56'
						}
					}
				},
				legend: {
					data: ['实时出港总人数','已值机未安检','已登机','隔离区']
				},
			/* 	toolbox: {
					show: true,
					feature: {
						dataView: {
							readOnly: false
						},
						restore: {},
						saveAsImage: {}
					}
				}, */
				dataZoom: {
					show: false,
					start: 0,
					end: 100
				},
				xAxis: [{
					type: 'category',
					boundaryGap: true,
					data: (function() {
						var now = new Date();
						var res = [];
						var len = 10;
						while(len--) {
							res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
							now = new Date(now - 2000);
						}
						return res;
					})()
				}],
				yAxis: [{
					type: 'value',
					scale: true,
					name: '总人数',
					max: 1200,
					min: 0,
					boundaryGap: [0.2, 0.2]
				}],
				series: [{
						name: '实时出港总人数',
						type: 'bar',
						xAxisIndex: 0,
						yAxisIndex: 0,
						data: (function() {
							var res = [];
							var len = 10;
							while(len--) {
								res.push(Math.ceil(Math.round(Math.random() * 1000)));
							}
							return res;
						})()
					},

					{
						name: '已值机未安检',
						type: 'line',
						itemStyle: {
							normal: {
								color: '#32CD32'
							}
						},
						smooth:true,
						data: (function() {
							var res = [];
							var len = 0;
							while(len < 10) {
								res.push(Math.ceil((Math.random() * (1000-800+1)+800)));
								len++;
							}
							return res;
						})()
					},
					{
						name: '已登机',
						type: 'line',
						itemStyle: {
							normal: {
								color: '#006400'
							}
						},
						smooth:true,
						data: (function() {
							var res = [];
							var len = 0;
							while(len < 10) {
								res.push(Math.ceil((Math.random() * (600-500+1) + 500)));
								len++;
							}
							return res;
						})()
					},
					{
						name: '隔离区',
						type: 'line',
						itemStyle: {
							normal: {
								color: '#FFFF00'
							}
						},
						smooth:true,
						data: (function() {
							var res = [];
							var len = 0;
							while(len < 10) {
								res.push(Math.ceil((Math.random() * (500 -400 + 1)+400)));
								len++;
							}
							return res;
						})()
					}
				]
			};

			setInterval(function() {
				axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');

				var data0 = optionOut.series[0].data;
				var data1 = optionOut.series[1].data;
				var data2 = optionOut.series[2].data;
				var data3 = optionOut.series[3].data;
				data0.shift();
				data0.push(Math.ceil(Math.random() * (1200-1100+1)+1100));
				data1.shift();
				data1.push((Math.random() * (1000-800+1)+800));
				data2.shift();
				data2.push(Math.ceil((Math.random() * (600-500+1) + 500)));
				data3.shift();
				data3.push(Math.ceil((Math.random() * (500 -400 + 1)+400)));

				optionOut.xAxis[0].data.shift();
				optionOut.xAxis[0].data.push(axisData);
				// option.xAxis[1].data.shift();
				//option.xAxis[1].data.push(app.count++);

				myChartOut.setOption(optionOut);
			}, 2100);
		</script>

<script type="text/javascript">

			var myChartIn = echarts.init(document.getElementById('in_traffic'));
			var optionIn = {
				/* title: {
					text: '进港人数分析',
					// subtext: '纯属虚构'
				}, */
				tooltip: {
					trigger: 'axis',
					axisPointer: {
						type: 'cross',
						label: {
							backgroundColor: '#283b56'
						}
					}
				},
				legend: {
					data: ['实时进港总人数','到港未离开','已离开航站楼','航站楼内滞留'],
					left:'20%',
					
				},
			/* 	toolbox: {
					show: true,
					feature: {
						dataView: {
							readOnly: false
						},
						restore: {},
						saveAsImage: {}
					}
				}, */
				dataZoom: {
					show: false,
					start: 0,
					end: 100
				},
				xAxis: [{
					type: 'category',
					boundaryGap: true,
					data: (function() {
						var now = new Date();
						var res = [];
						var len = 10;
						while(len--) {
							res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
							now = new Date(now - 2000);
						}
						return res;
					})()
				}],
				yAxis: [{
					type: 'value',
					scale: true,
					name: '总人数',
					max: 1200,
					min: 0,
					boundaryGap: [0.2, 0.2]
				}],
				series: [{
						name: '实时进港总人数',
						type: 'bar',
						xAxisIndex: 0,
						yAxisIndex: 0,
						itemStyle: {
							normal: {
								color: '#0000FF'
							}
						},
						data: (function() {
							var res = [];
							var len = 10;
							while(len--) {
								res.push(Math.ceil(Math.round(Math.random() * 1000)));
							}
							return res;
						})()
					},

					{
						name: '到港未离开',
						type: 'line',
						itemStyle: {
							normal: {
								color: '#32CD32'
							}
						},
						smooth:true,
						data: (function() {
							var res = [];
							var len = 0;
							while(len < 10) {
								res.push(Math.ceil((Math.random() * (1000-800+1)+800)));
								len++;
							}
							return res;
						})()
					},
					{
						name: '已离开航站楼',
						type: 'line',
						itemStyle: {
							normal: {
								color: '#006400'
							}
						},
						smooth:true,
						data: (function() {
							var res = [];
							var len = 0;
							while(len < 10) {
								res.push(Math.ceil((Math.random() * (600-500+1) + 500)));
								len++;
							}
							return res;
						})()
					},
					{
						name: '航站楼内滞留',
						type: 'line',
						itemStyle: {
							normal: {
								color: '#FFFF00'
							}
						},
						smooth:true,
						data: (function() {
							var res = [];
							var len = 0;
							while(len < 10) {
								res.push(Math.ceil((Math.random() * (500 -400 + 1)+400)));
								len++;
							}
							return res;
						})()
					}
				]
			};

			setInterval(function() {
				axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');

				var data0 = optionIn.series[0].data;
				var data1 = optionIn.series[1].data;
				var data2 = optionIn.series[2].data;
				var data3 = optionIn.series[3].data;
				data0.shift();
				data0.push(Math.ceil(Math.random() * (1200-1100+1)+1100));
				data1.shift();
				data1.push(Math.ceil((Math.random() * (1000-800+1)+800)));
				data2.shift();
				data2.push(Math.ceil((Math.random() * (600-500+1) + 500)));
				data3.shift();
				data3.push(Math.ceil((Math.random() * (500 -400 + 1)+400)));

				optionIn.xAxis[0].data.shift();
				optionIn.xAxis[0].data.push(axisData);
				// option.xAxis[1].data.shift();
				//option.xAxis[1].data.push(app.count++);

				myChartIn.setOption(optionIn);
			}, 2100);
		</script>

<script type="text/javascript">
var myChartCheckin = echarts.init(document.getElementById('check_in'));
var optionCheckin = {
	/* title: {
		text: '值机岛流量分布'
	}, */
	tooltip: {
		trigger: 'axis',
		axisPointer: {
			type: 'cross',
			label: {
				backgroundColor: '#6a7985'
			}
		}
	},
	legend: {
		data: ['进出口', '通道', '商铺','值机岛总人数']
	},
	/*toolbox: {
		feature: {
			saveAsImage: {}
		}
	},*/
	grid: {
		left: '3%',
		right: '4%',
		bottom: '3%',
		containLabel: true
	},
	xAxis: [{
		type: 'category',
		boundaryGap: false,
		//data: ['10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30']
		data: (function() {
			var now = new Date();
			var res = [];
			var len = 7;
			while(len--) {
				res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
				now = new Date(now - 2000);
			}
			return res;
		})()
	}],
	yAxis: [{
		type: 'value'
	}],
	series: [{
			name: '进出口',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [120, 132, 101, 134, 90, 230, 210]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (200 -100 + 1)+100)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '通道',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [220, 182, 191, 234, 290, 330, 310]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (300 -200 + 1)+200)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '商铺',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [150, 232, 201, 154, 1000, 330, 410]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (600 -500 + 1)+500)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '值机岛总人数',
			type: 'line',
			stack: '总量',
			label: {
				normal: {
					show: true,
					position: 'top'
				}
			},
			areaStyle: {
				normal: {}
			},
			//data: [820, 932, 901, 934, 1290, 1330, 1320]
			
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (1000 -900 + 1)+900)));
					len++;
				}
				return res;
			})()
		}
	]
};

setInterval(function() {
	axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');

	var data0 = optionCheckin.series[0].data;
	var data1 = optionCheckin.series[1].data;
	var data2 = optionCheckin.series[2].data;
	var data3 = optionCheckin.series[3].data;
	data0.shift();
	data0.push(Math.ceil(Math.random() * (200-100+1)+100));
	data1.shift();
	data1.push(Math.ceil((Math.random() * (300-200+1)+200)));
	data2.shift();
	data2.push(Math.ceil((Math.random() * (500-400+1) + 400)));
	data3.shift();
	data3.push(Math.ceil((Math.random() * (1000 -900 + 1)+900)));

	optionCheckin.xAxis[0].data.shift();
	optionCheckin.xAxis[0].data.push(axisData);
	myChartCheckin.setOption(optionCheckin);
}, 2100);
</script>

<script type="text/javascript">
var myChartSecurity = echarts.init(document.getElementById('security_area'));
var optionSecurity = {
	/* title: {
		text: '值机岛流量分布'
	}, */
	tooltip: {
		trigger: 'axis',
		axisPointer: {
			type: 'cross',
			label: {
				backgroundColor: '#6a7985'
			}
		}
	},
	legend: {
		data: ['进出口', '通道', '商铺','安检区总人数']
	},
	/*toolbox: {
		feature: {
			saveAsImage: {}
		}
	},*/
	grid: {
		left: '3%',
		right: '4%',
		bottom: '3%',
		containLabel: true
	},
	xAxis: [{
		type: 'category',
		boundaryGap: false,
		//data: ['10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30']
		data: (function() {
			var now = new Date();
			var res = [];
			var len = 7;
			while(len--) {
				res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
				now = new Date(now - 2000);
			}
			return res;
		})()
	}],
	yAxis: [{
		type: 'value'
	}],
	series: [{
			name: '进出口',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [120, 132, 101, 134, 90, 230, 210]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (200 -100 + 1)+100)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '通道',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [220, 182, 191, 234, 290, 330, 310]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (300 -200 + 1)+200)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '商铺',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [150, 232, 201, 154, 1000, 330, 410]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (600 -500 + 1)+500)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '安检区总人数',
			type: 'line',
			stack: '总量',
			label: {
				normal: {
					show: true,
					position: 'top'
				}
			},
			areaStyle: {
				normal: {}
			},
			//data: [820, 932, 901, 934, 1290, 1330, 1320]
			
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (1000 -900 + 1)+900)));
					len++;
				}
				return res;
			})()
		}
	]
};

setInterval(function() {
	axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');

	var data0 = optionSecurity.series[0].data;
	var data1 = optionSecurity.series[1].data;
	var data2 = optionSecurity.series[2].data;
	var data3 = optionSecurity.series[3].data;
	data0.shift();
	data0.push(Math.ceil(Math.random() * (200-100+1)+100));
	data1.shift();
	data1.push(Math.ceil((Math.random() * (300-200+1)+200)));
	data2.shift();
	data2.push(Math.ceil((Math.random() * (500-400+1) + 400)));
	data3.shift();
	data3.push(Math.ceil((Math.random() * (1000 -900 + 1)+900)));

	optionSecurity.xAxis[0].data.shift();
	optionSecurity.xAxis[0].data.push(axisData);
	myChartSecurity.setOption(optionSecurity);
}, 2100);
</script>

<script type="text/javascript">
var myChartTransfer = echarts.init(document.getElementById('transfer_area'));
var optionTransfer = {
	/* title: {
		text: '值机岛流量分布'
	}, */
	tooltip: {
		trigger: 'axis',
		axisPointer: {
			type: 'cross',
			label: {
				backgroundColor: '#6a7985'
			}
		}
	},
	legend: {
		data: ['进出口', '通道', '商铺','换乘区总人数']
	},
	/*toolbox: {
		feature: {
			saveAsImage: {}
		}
	},*/
	grid: {
		left: '3%',
		right: '4%',
		bottom: '3%',
		containLabel: true
	},
	xAxis: [{
		type: 'category',
		boundaryGap: false,
		//data: ['10:00', '10:05', '10:10', '10:15', '10:20', '10:25', '10:30']
		data: (function() {
			var now = new Date();
			var res = [];
			var len = 7;
			while(len--) {
				res.unshift(now.toLocaleTimeString().replace(/^\D*/, ''));
				now = new Date(now - 2000);
			}
			return res;
		})()
	}],
	yAxis: [{
		type: 'value'
	}],
	series: [{
			name: '进出口',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [120, 132, 101, 134, 90, 230, 210]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (200 -100 + 1)+100)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '通道',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [220, 182, 191, 234, 290, 330, 310]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (300 -200 + 1)+200)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '商铺',
			type: 'line',
			stack: '总量',
			areaStyle: {
				normal: {}
			},
			//data: [150, 232, 201, 154, 1000, 330, 410]
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (600 -500 + 1)+500)));
					len++;
				}
				return res;
			})()
		},
		{
			name: '换乘区总人数',
			type: 'line',
			stack: '总量',
			label: {
				normal: {
					show: true,
					position: 'top'
				}
			},
			areaStyle: {
				normal: {}
			},
			//data: [820, 932, 901, 934, 1290, 1330, 1320]
			
			data: (function() {
				var res = [];
				var len = 0;
				while(len < 7) {
					res.push(Math.ceil((Math.random() * (1000 -900 + 1)+900)));
					len++;
				}
				return res;
			})()
		}
	]
};

setInterval(function() {
	axisData = (new Date()).toLocaleTimeString().replace(/^\D*/, '');

	var data0 = optionTransfer.series[0].data;
	var data1 = optionTransfer.series[1].data;
	var data2 = optionTransfer.series[2].data;
	var data3 = optionTransfer.series[3].data;
	data0.shift();
	data0.push(Math.ceil(Math.random() * (200-100+1)+100));
	data1.shift();
	data1.push(Math.ceil((Math.random() * (300-200+1)+200)));
	data2.shift();
	data2.push(Math.ceil((Math.random() * (500-400+1) + 400)));
	data3.shift();
	data3.push(Math.ceil((Math.random() * (1000 -900 + 1)+900)));

	optionTransfer.xAxis[0].data.shift();
	optionTransfer.xAxis[0].data.push(axisData);
	myChartTransfer.setOption(optionTransfer);
}, 2100);
</script>

</body>
</html>