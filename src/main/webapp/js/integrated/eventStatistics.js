var optionEventType = {
    title : {
        text: '',
        subtext: '',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        orient : 'vertical',
        x : 'left',
        data:['公共安全','消防安全','空防安全','生产安全']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true, 
                type: ['pie', 'funnel'],
                option: {
                    funnel: {
                        x: '25%',
                        width: '50%',
                        funnelAlign: 'left',
                        max: 1548
                    }
                }
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'数据来源',
            type:'pie',
            radius : '55%',
            center: ['50%', '60%'],
            data:[
                {value:335, name:'公共安全'},
                {value:310, name:'消防安全'},
                {value:234, name:'空防安全'},
                {value:135, name:'生产安全'}
            ]
        }
    ]
};
var chartEventType = echarts.init(document.getElementById('eventType'));
chartEventType.setOption(optionEventType);
var optionEventArea = {
	    title : {
	        text: '',
	        subtext: ''
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['航站区','飞行区','公共区','控制区']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: false},
	            magicType : {show: true, type: ['line', 'bar']},
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            data : ['2017-9-1','2017-9-2','2017-9-3','2017-9-4','2017-9-5','2017-9-6','2017-9-7']
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
	            data:[2, 4, 7, 23, 25, 76, 135],
//	            markPoint : {
//	                data : [
//	                    {type : 'max', name: '最大值'},
//	                    {type : 'min', name: '最小值'}
//	                ]
//	            },
//	            markLine : {
//	                data : [
//	                    {type : 'average', name: '平均值'}
//	                ]
//	            }
	        },
	        {
	            name:'飞行区',
	            type:'bar',
	            data:[6, 9, 9, 26, 28, 70, 175],
//	            markPoint : {
//	                data : [
//	                    {name : '年最高', value : 175, xAxis: 7, yAxis: 183, symbolSize:18},
//	                    {name : '年最低', value : 6, xAxis: 1, yAxis: 3}
//	                ]
//	            },
//	            markLine : {
//	                data : [
//	                    {type : 'average', name : '平均值'}
//	                ]
//	            }
	        },
	        {
	            name:'公共区',
	            type:'bar',
	            data:[2, 4, 7, 23, 25, 76, 135],
//	            markPoint : {
//	                data : [
//	                    {name : '年最高'},
//	                    {name : '年最低'}
//	                ]
//	            },
//	            markLine : {
//	                data : [
//	                    {type : 'average', name : '平均值'}
//	                ]
//	            }
	        },
	        {
	            name:'控制区',
	            type:'bar',
	            data:[],
//	            markPoint : {
//	                data : [
//	                    {name : '年最高'},
//	                    {name : '年最低'}
//	                ]
//	            },
//	            markLine : {
//	                data : [
//	                    {type : 'average', name : '平均值'}
//	                ]
//	            }
	        }
	    ]
	};
var chartEventArea = echarts.init(document.getElementById('eventArea'));
chartEventArea.setOption(optionEventArea);	   
var optionEventLevel = {
	    title : {
	        text: '',
	        subtext: ''
	    },
	    tooltip : {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['一级','二级','三级']
	    },
	    toolbox: {
	        show : true,
	        feature : {
	            mark : {show: true},
	            dataView : {show: true, readOnly: false},
	            magicType : {show: true, type: ['line', 'bar']},
	            restore : {show: true},
	            saveAsImage : {show: true}
	        }
	    },
	    calculable : true,
	    xAxis : [
	        {
	            type : 'category',
	            boundaryGap : false,
	            data : ['2017-9-1','2017-9-2','2017-9-3','2017-9-4','2017-9-5','2017-9-6','2017-9-7']
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
	            data:[11, 11, 15, 13, 12, 13, 10],
//	            markPoint : {
//	                data : [
//	                    {type : 'max', name: '最大值'},
//	                    {type : 'min', name: '最小值'}
//	                ]
//	            },
//	            markLine : {
//	                data : [
//	                    {type : 'average', name: '平均值'}
//	                ]
//	            }
	        },
	        {
	            name:'二级',
	            type:'line',
	            data:[1, 2, 2, 5, 3, 2, 0]
	        },
	        {
	            name:'三级',
	            type:'line',
	            data:[1, 3, 2, 5, 3, 2, 0],
	        }
	    ]
	};
	                    
var chartEventLevel = echarts.init(document.getElementById('eventLevel'));
chartEventLevel.setOption(optionEventLevel);	
//事件状态
var eventState = {
		tooltip: {
			trigger: 'axis',
			axisPointer: { // 坐标轴指示器，坐标轴触发有效
				type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
			}
		},
		calculable: true,
		yAxis: [{
			type: 'value',
			axisLabel : {
	               formatter: '{value} 件'
	        }
		}],
		xAxis: [{
			type: 'category',
			data: ['已确认', '已处警', '已处理', '已解除']
		}],
		series: [
			{
				name: '安全事件状态',
				type: 'bar',
				/*  stack: '总量', */
				itemStyle: {
					normal: {
						label: {
							show: true,
							position: 'top'
						}
					}
				},
				data: [45, 12, 20,45]
			}
		]
	};
var chartEventTypeShow = echarts.init(document.getElementById('eventTypeShow'));
chartEventTypeShow.setOption(eventState);
var chartEventAreaShow = echarts.init(document.getElementById('eventAreaShow'));
chartEventAreaShow.setOption(eventState);
var chartEventLevelShow = echarts.init(document.getElementById('eventLevelShow'));
chartEventLevelShow.setOption(eventState);
chartEventType.on('click', function(params) {
	$("#eventType").addClass("hidden");
	$("#eventTypeShow").removeClass("hidden");
});
chartEventTypeShow.on('click', function(params) {
	$("#eventType").removeClass("hidden");
	$("#eventTypeShow").addClass("hidden");
});
chartEventArea.on('click', function(params) {
	$("#eventArea").addClass("hidden");
	$("#eventAreaShow").removeClass("hidden");
});
chartEventAreaShow.on('click', function(params) {
	$("#eventArea").removeClass("hidden");
	$("#eventAreaShow").addClass("hidden");
});
chartEventLevel.on('click', function(params) {
	$("#eventLevel").addClass("hidden");
	$("#eventLevelShow").removeClass("hidden");
});
chartEventLevelShow.on('click', function(params) {
	$("#eventLevel").removeClass("hidden");
	$("#eventLevelShow").addClass("hidden");
});
                    