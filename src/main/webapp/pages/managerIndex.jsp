
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="<%=path%>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<script
	src="http://s1.bdstatic.com/r/www/cache/ecom/echarts/3-0-0/echarts.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/theme/theme.js"></script>
<script src="http://lib.sinaapp.com/js/jquery/1.9.1/jquery-1.9.1.min.js"></script>
<style type="text/css">
/* html, body, #pie1{
        width: 100%;
        height: 400px;
    } 
    div{
    	border: 1px solid red;
    }*/
.echars_div {
	height: 300px;
	background: #F7F7F7;
	margin-left: 20px;
}

.echars_div_bar {
	width: 100%;
	height: 30px;
	background: #F7F7F7;
	border-bottom: 2px solid white;
}

.echars_p {
	color: grey;
	font-size: 10px;
	margin-left: 0px;
	margin-top: 10px;
}

.pie {
	width: 50%;
	height: 130px;
	float: left;
}

.line {
	width: 100%;
	height: 270px;
}

.bar {
	width: 100%;
	height: 270px;
}

.pie1 {
	width: 100%;
	height: 130px;
	float: left;
}
</style>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul" style="margin-left: 44px;">
			<li><i class="fa fa-home"></i> <a href="#">猛码学员管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">首页</a></li>
		</ul>
	</div>
	<div class="content">
		<div class="row form-group col-md-12" style="margin-top: 50px;">
			<div class="form-group col-md-3 echars_div">
				<div class="echars_div_bar">
					<p class="echars_p">当前时间下猛码科技的员工参数比例：</p>
				</div>
				<div id="pie1" class="pie"></div>
				<div id="pie2" class="pie"></div>
				<div id="pie3" class="pie"></div>
				<div id="pie4" class="pie"></div>
			</div>
			<div class="form-group col-md-5 echars_div">
				<div class="echars_div_bar">
					<p class="echars_p">项目的完成度：</p>
				</div>
				<div id="line2" class="line"></div> 
			</div>
			<div class="form-group col-md-3 echars_div">
				<div class="echars_div_bar">
					<p class="echars_p">其他参数比例：</p>
				</div>
				<div id="pie5" class="pie1"></div>
				<div id="pie6" class="pie1"></div>
			</div>
		</div>
		<div class="row form-group col-md-12" style="margin-top: 10px;">
			<div class="form-group col-md-3 echars_div">
				<div class="echars_div_bar">
					<p class="echars_p">当前时间下员工能力级别：</p>
				</div>
				<div id="line1" class="line"></div>
			</div>
			<div class="form-group col-md-5 echars_div">
				<div class="echars_div_bar">
					<p class="echars_p">当前时间下员工能力级别：</p>
				</div>
				<div id="bar1" class="bar"></div>
			</div>
			<div class="form-group col-md-3 echars_div"></div>
		</div>
	</div>
	<!-- <div id="pie1"></div> -->
	<!-- <div id="line2" class="line"></div> -->
</body>
<script type="text/javascript">
    $(document).ready(function(){
        var theme = new Theme();
        echarts.registerTheme("macarons", theme.getTheme("macarons"));
        
        var pie1 = echarts.init(document.getElementById('pie1'), "macarons");
        var pie2 = echarts.init(document.getElementById('pie2'), "macarons");
        var pie3 = echarts.init(document.getElementById('pie3'), "macarons");
        var pie4 = echarts.init(document.getElementById('pie4'), "macarons");
        var pie5 = echarts.init(document.getElementById('pie5'), "macarons");
        var pie6 = echarts.init(document.getElementById('pie6'), "macarons");
        var line1 = echarts.init(document.getElementById('line1'), "macarons");
        var bar1 = echarts.init(document.getElementById('bar1'), "macarons");
        var line2 = echarts.init(document.getElementById('line2'), "macarons"); 

        option1 = {
      		title:{
   	   			text: '性别',
   	   			x: 'left',
       			textStyle:{
       		        'color':'black',
       		        'fontStyle':'normal',
       		        'fontWeight':'normal',
       		        'fontFamily':'sans-serif',
       		　　　　	'fontSize':14
       		    } 
   	   		}, 
            tooltip : {
                trigger: 'item',
                x:'right',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            series : [{
                "name": "男女人数（比例）",
                "type": "pie",
                "radius" : ['50%', '70%'],
                "itemStyle" : {
                    "normal" : {
                        "label" : {"show" : false},
                        "labelLine" : {
                        	"normal" : {"show" : false}
                        }
                    }
                }, 
                "data": [
                    {value:20, name:'男性'},
                    {value:9, name:'女性'}
                ]
            }]
        };
        option2 = {
       		title:{
   	   			text: '学校',
   	   			x: 'left',
       			textStyle:{
       				'color':'black',
       		        'fontStyle':'normal',
       		        'fontWeight':'normal',
       		        'fontFamily':'sans-serif',
       		　　　　	'fontSize':14
       		    } 
   	   		},
            tooltip : {
                trigger: 'item',
                x:'right',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            series : [{
                "name": "学校人数（比例）",
                "type": "pie",
                "radius" : ['50%', '70%'],
                "itemStyle" : {
                    "normal" : {
                        "label" : {"show" : false},
                        "labelLine" : {"show" : false}
                    }
                },
                "data": [
                    {value:24, name:'山东理工大学'},
                    {value:1, name:'宿州大学'},
                    {value:2, name:'长江大学'},
                    {value:4, name:'齐齐哈尔大学'},
                    {value:1, name:'北京工业大学'},
                    {value:1, name:'包头师范学院'}
                ]
            }]
        };
        option3 = {
       		title:{
   	   			text: '学历',
   	   			x: 'left',
       			textStyle:{
       				'color':'black',
       		        'fontStyle':'normal',
       		        'fontWeight':'normal',
       		        'fontFamily':'sans-serif',
       		　　　　	'fontSize':14
       		    } 
   	   		},
            tooltip : {
                trigger: 'item',
                x:'right',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            series : [{
                "name": "学历人数（比例）",
                "type": "pie",
                "radius" : ['50%', '70%'],
                "itemStyle" : {
                    "normal" : {
                        "label" : {"show" : false},
                        "labelLine" : {"show" : false}
                    }
                },
                "data": [
                    {value:12, name:'本科'},
                    {value:9, name:'硕士'},
                    {value:4, name:'博士'},
                    {value:2, name:'博士后'}
                ]
            }]
        };
        option4 = {
       		title:{
   	   			text: '专业',
   	   			x: 'left',
       			textStyle:{
       				'color':'black',
       		        'fontStyle':'normal',
       		        'fontWeight':'normal',
       		        'fontFamily':'sans-serif',
       		　　　　	'fontSize':14
       		    } 
   	   		},
            tooltip : {
                trigger: 'item',
                x:'right',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            series : [{
                "name": "专业人数（比例）",
                "type": "pie",
                "radius" : ['50%', '70%'],
                "itemStyle" : {
                    "normal" : {
                        "label" : {"show" : false},
                        "labelLine" : {"show" : false}
                    }
                },
                "data": [
                    {value:12, name:'计算机科学与技术'},
                    {value:9, name:'软件工程'},
                    {value:13, name:'通信原理'},
                    {value:8, name:'网络安全'},
                    {value:10, name:'网站建设与网页设计'}
                ]
            }]
        };
        option5 = {
       		title:{
       			text: '分区',
       			x: 'left',
       			textStyle:{
       				'color':'black',
       		        'fontStyle':'normal',
       		        'fontWeight':'normal',
       		        'fontFamily':'sans-serif',
       		　　　　	'fontSize':16
       		    } 
       		},
            tooltip : {
                trigger: 'item',
                x:'right',
                formatter: function(datas) 
                {
                    var res = datas.data.name + ':' + datas.data.value + '人' , val;
                    if( datas.data.name == '北京' ){
                    	val = ' 一期：20人 <br/> 二期：10人';
                    }
                    else if( datas.data.name == '天津' ){
                    	val = ' 一期：10人 <br/> 二期：15人';
                    }
                    res += '<br/>' + val;
                    return res;
                 }
            },
            series : [{
                "name": "分区人数（比例）",
                "type": "pie",
                "itemStyle" : {
                    "normal" : {
                        "label" : {"show" : true},
                        "labelLine" : {"show" : true}
                    }
                },
                "data": [
                    {value:30, name:'北京'},
                    {value:25, name:'天津'}
                ]
            }]
        };
        option6 = {
      		title:{
	   			text: '项目类型',
	   			x: 'left',
       			textStyle:{
       				'color':'black',
       		        'fontStyle':'normal',
       		        'fontWeight':'normal',
       		        'fontFamily':'sans-serif',
       		　　　　	'fontSize':16
       		    } 
	   		},
            tooltip : {
                trigger: 'item',
                x:'right',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            series : [{
                "name": "项目类型数量（比例）",
                "type": "pie",
                "itemStyle" : {
                    "normal" : {
                        "label" : {"show" : true},
                        "labelLine" : {"show" : true}
                    }
                },
                "data": [
                    {value:12, name:'集成类型'},
                    {value:9, name:'开发类型'},
                    {value:13, name:'产品研发'},
                    {value:8, name:'数据处理'},
                    {value:10, name:'实施'}
                ]
            }]
        };
        option7 = {
       	    tooltip : {
       	        trigger: 'axis'
       	    },
       	    legend: {
       	        data:['能力级别']
       	    },
       	    xAxis : [
       	        {
       	            type : 'category',
       	            boundaryGap : false,
       	            data : ['M0','M1','M2','M3','M4']
       	        }
       	    ],
       	    yAxis : [
       	        {
       	            type : 'value'
       	        }
       	    ],
       	    series : [
       	    	{
       	            name:'能力级别',
       	            type:'line',
       	            stack: '总量',
       	            smooth: true,
       	            symbol: 'none',     // 系列级个性化拐点图形
       	            symbolSize: 8,
       	            data:[
       	               	8,
       	                {
       	                    value:13,
       	                    symbol: 'none',  // 数据级个性化拐点图形
       	                    symbolSize : 15,
       	                    itemStyle : { normal: {label : {
       	                        show: false,
       	                        textStyle : {
       	                            fontSize : '20',
       	                            fontFamily : '微软雅黑',
       	                            fontWeight : 'bold'
       	                        }
       	                    }}}
       	                },
       	                {
       	                    value:6,
       	                    symbol: 'triangle'
       	                },
       	                5, 
       	                {
       	                    value : 6,
       	                    symbol: 'star',
       	                    symbolSize: 8
       	                }
       	            ]
       	        }
       	    ]
       	};
        option8 = {
       	    tooltip : {
       	    	trigger: 'item',
                x:'right',
                formatter: function(datas) 
                {
                    var res_seriesIndex = datas.seriesIndex ;
                    var res_dataIndex = datas.dataIndex;
                    var res ;
                    switch(res_seriesIndex){
                    	case 0:
                    		switch(res_dataIndex){
	                   			case 0:
	                   				res = '需求分析阶段：' + datas.data;
	                    			break;
	                   			case 1:
	                   				res = '原型设计阶段：' + datas.data;
	                    			break;
	                   			case 2:
	                   				res = '概要设计阶段：' + datas.data;
	                    			break;
	                   			case 3:
	                   				res = '数据库设计阶段：' + datas.data;
	                    			break;
	                   			case 4:
	                   				res = '编码阶段：' + datas.data;
	                    			break;
	                   			case 5:
	                   				res = '测试阶段：' + datas.data;
	                    			break;
	                   			case 6:
	                   				res = '交付阶段：' + datas.data;
	                    			break;
                    			default:
                    				break;
                    		}
                    		break;
                    	case 1:
                    		switch(res_dataIndex){
                   			case 0:
                   				res = '低难度：' + datas.data;
                    			break;
                   			case 1:
                   				res = '中难度：' + datas.data;
                    			break;
                   			case 2:
                   				res = '高难度：' + datas.data;
                    			break;
                			default:
                				break;
                		}
                		break;
                    		break;
                    	default:
                    		break;
                    }
                    return res;  
                 }
       	    },
       	    legend: {
       	        data:['项目阶段','项目难度']
       	    },
       	    calculable : true,
       	    xAxis : [
       	        {
       	            type : 'category',
       	            data : ['','','','','','','']
       	        }
       	    ],
       	    yAxis : [
       	        {
       	            type : 'value'
       	        }
       	    ],
       	    series : [
       	        {
       	            name:'项目阶段',
       	            type:'bar',
       	            data:[2, 4, 7, 12, 5, 2, 13],
       	            markPoint : {
       	                data : [
       	                    {type : 'max', name: '最大值'}
       	                ]
       	            }
       	        },
       	        {
       	            name:'项目难度',
       	            type:'bar',
       	            data:[2, 5, 9],
       	            markPoint : {
       	                data : [
       	                    {type : 'max', name: '最大值'}
       	                ]
       	            }
       	        }
       	    ]
       	};
        /* var mydate = new Date();
        var time = mydate.toLocaleDateString(); */
        
        option9 = {
           	    tooltip : {
           	        trigger: 'axis'
           	    },
           	    legend: {
           	        data:['全部项目','未完成项目','已完成项目']
           	    },
           	    xAxis : [
           	        {
           	            type : 'category',
           	            boundaryGap : false,
           	            data : ['2017/1','2017/2','2017/3','2017/4','2017/5','2017/6','2017/7','2017/8','2017/9','2017/10','2017/11']
           	        }
           	    ],
           	    yAxis : [
           	        {
           	            type : 'value'
           	        }
           	    ],
           	    series : [
           	    	{
           	            name:'全部项目',
           	            type:'line',
           	            stack: '总量',
           	            smooth: true,
           	            symbol: 'none',     // 系列级个性化拐点图形
           	            symbolSize: 8,
           	            data:[12,13,10,5,5,3,12,32,12,24,12]
           	        },
           	     	{
           	            name:'未完成项目',
           	            type:'line',
           	            stack: '总量',
           	            smooth: true,
           	            symbol: 'none',     // 系列级个性化拐点图形
           	            symbolSize: 8,
           	            data:[12,13,10,5,5,3,12,32,12,24,12]
           	        },
           	        {
           	            name:'已完成项目',
           	            type:'line',
           	            stack: '总量',
           	            smooth: true,
           	            symbol: 'none',     // 系列级个性化拐点图形
           	            symbolSize: 8,
           	            data:[12,13,10,5,5,3,12,32,12,24,12]
           	        }
           	    ]
           	};
        
        pie1.setOption(option1);
        pie2.setOption(option2);
        pie3.setOption(option3);
        pie4.setOption(option4);
        pie5.setOption(option5);
        pie6.setOption(option6);
        line1.setOption(option7);
        bar1.setOption(option8);
        line2.setOption(option9);  
    })
    
                    
</script>
</html>