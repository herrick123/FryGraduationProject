<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>接警</title>
</head>
<style type="text/css">
.btn .btn-default {
	background: #1f4a09;
}

.divcss5 {
	background: #67809F;
	height: 40px;
	line-height: 40px;
	padding: 0px 15px;
	color: #fff;
}

.divcss5_left {
	float: left;
	width: 150px;
}

.divcss5_right {
	float: right;
	width: 120px;
	padding: 3px 0px;
}

.clear {
	clear: both;
}

.form-inline .form-control {
	width: 180px;
}

#exampleInputName2 {
	height: 34px;
	padding: 6px 12px;
}

.page-bar {
	background: #f7f7f7;
}

body {
	background: #fff none repeat scroll 0 0;
}

ol, ul, li {
	list-style: outside none none;
}

#sys-step1 li {
	color: #888;
	float: left;
	position: relative;
	text-align: center;
}

#sys-step1 li.step1 {
	text-align: left;
	width: 120px;
}

#sys-step1 li.step1 p {
	margin-left: -0.8em;
}

#sys-step1 li.step2 p {
	text-align: left;
}

#sys-step1 li.step3 p {
	text-align: left;
}

#sys-step1 li.step4 p {
	text-align: right;
}

#sys-step1 li.step2 {
	width: 185px;
}

#sys-step1 li.step3 {
	width: 185px;
}

#sys-step1 li.step4 {
	text-align: right;
	width: 160px;
}

.auto_border {
	background: #e6e6e6 none repeat scroll 0 0;
	height: 7px;
	position: absolute;
	top: 9px;
	width: 100%;
	z-index: -1;
}

#sys-step1 li i {
	background: #ccc none repeat scroll 0 0;
	border-radius: 50%;
	color: #fff;
	display: inline-block;
	font-weight: bold;
	height: 24px;
	line-height: 24px;
	margin-bottom: 7px;
	text-align: center;
	width: 24px;
}

#sys-step1 li.step4 i, p {
	margin-left: 60px;
}

#sys-step1 li.active {
	color: #2d456b;
}

#sys-step1 li.active i, #sys-step1 li.active .auto_border {
	background: #2d456b none repeat scroll 0 0;
}

.modal-content {
	z-index: 1;
}

.row {
	margin-bottom: 20px;
}

.col-md-4 {
	text-align: left;
}
</style>


<body>

	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">安全数据可视化</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">实时视频监控分析</a></li>
		</ul>
	</div>

	<div style="width: 100%; padding: 0px 10px;">
		<form class="form-inline" style="margin: 10px 0px 10px 0px;" name=""
			method="post">
			<div class="row" style="text-align: center;">
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>设备类型：</span> <select id="cardTypeSearch"
							name="cardTypeSearch" class="form-control">
							<option value="">请选择</option>
							<option>模拟球机</option>
							<option>CVSS</option>
							<option>安维斯视频分析服务器</option>
							<option>模拟摄像机</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>资源类型：</span> <select id="cardTypeSearch"
							name="cardTypeSearch" class="form-control">
							<option value="">请选择</option>
							<option>硬盘</option>
							<option>服务器</option>
							<option>根目录</option>
							<option>内存</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>报警类型：</span> <select id="cardTypeSearch"
							name="cardTypeSearch" class="form-control">
							<option value="">请选择</option>
							<option>入侵报警</option>
							<option>绊线报警</option>
							<option>未知故障</option>
						</select>
					</div>
				</div>
			</div>

			<div class="row" style="text-align: center;">
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>报警等级：</span> <select id="cardTypeSearch"
							name="cardTypeSearch" class="form-control">
							<option value="">请选择</option>
							<option>一般报警</option>
							<option>次要报警</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>报警状态：</span> <select id="cardTypeSearch"
							name="cardTypeSearch" class="form-control">
							<option value="">请选择</option>
							<option>当前报警</option>
						</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 15px;">
						<span>故障处理人：</span> <input type="text" class="form-control"
							id="exampleInputName2" placeholder="请输入故障处理人">
					</div>
				</div>
			</div>

			<div class="row" style="text-align: center;">
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 15px;">
						<span>设备名或IP：</span> <input type="text" class="form-control"
							id="exampleInputName2" placeholder="请输入设备名或IP">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>资源名称：</span> <input type="text" class="form-control"
							id="exampleInputName2" placeholder="请输入资源名称">
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group" style="margin-left: 30px;">
						<span>网络名称：</span> <input type="text" class="form-control"
							id="exampleInputName2" placeholder="请输入网络名称">
					</div>
				</div>
			</div>

			<div class="row" style="text-align: left; margin-bottom: 0px">
				<div class="col-md-6">
					<div class="form-group" style="margin-left: 15px;">
						<span>报警时间从：</span> <input type="text" class="form_datetime"
							style="width: 100px"> 到 <input type="text"
							class="form_datetime1" style="width: 100px">
					</div>
				</div>
			</div>

			<div class="row" style="text-align: center;">
				<div class="col-md-4"></div>
				<div class="col-md-4" style="text-align: center;">
					<div class="form-group" style="margin-left: 30px;">
						<button type="submit" class="sbtn sbtn-blue">查询</button>
					</div>
				</div>
			</div>

		</form>

		<ul class="nav nav-tabs" id="securityTable" style="margin-top: 10px">
			<li class="active"><a data-area-id="surArea"
				style="cursor: pointer;">实时报警统计表</a></li>
			<li ><a data-area-id="myBar" style="cursor: pointer;">实时报警统计图</a>
			</li>
		</ul>

		<div id="surArea" class="area-test">
			<div id="surTable" 
				style="margin-top: 5px;"></div>
			<div id="surPage" class="dlshouwen-grid-toolbar-container"></div>
		</div>
		<div class="area-test" id="myBar"
			style="width: 1000px; height: 400px; display: none; margin: 0 auto"></div>
	</div>



</body>

<script type="text/javascript">


	var surDatas = [ {
		"wname" : "青岛机场安保系统",
		"stype" : "模拟球机",
		"sname" : "A区安检",
		"sip" : "172.17.32.11",
		"btype" : "入侵报警",
		"blevel" : "次要报警",
		"bstate" : "当前报警",
		"lasttime" : "2017-07-32 16:45:32",
		"caozuo" : "1"
	}, {
		"wname" : "青岛机场安保系统",
		"stype" : "中心信令控制服务器",
		"sname" : "接入系统",
		"sip" : "172.17.32.13",
		"btype" : "绊线报警",
		"blevel" : "次要报警",
		"bstate" : "当前报警",
	//	"bcontent" : "设备172.17.32.13槽位1端口3(VAS:172.17.32.28 ):绊线报警",
		"lasttime" : "2017-07-32 16:42:22",
		"caozuo" : "1"
	}, {
		"wname" : "青岛机场安保系统",
		"stype" : "CVSS",
		"sname" : "CVSS33",
		"sip" : "172.17.32.33",
		"ztype" : "硬盘",
		"btype" : "未知故障/通用故障",
		"blevel" : "一般报警",
		"bstate" : "当前报警",
		"lasttime" : "2017-07-32 16:45:00",
		"caozuo" : "1"
	}, 
	{
		"wname" : "青岛机场安保系统",
		"stype" : "安维斯视频分析服务器",
		"sname" : "VAS27",
		"sip" : "172.17.32.27",
		"btype" : "未知故障/通用故障",
		"blevel" : "一般报警",
		"bstate" : "当前报警",
		"lasttime" : "2017-07-32 16:44:32",
		"caozuo" : "1"
	}, 
	{
		"wname" : "青岛机场安保系统",
		"stype" : "安维斯视频分析服务器",
		"sname" : "VAS27",
		"sip" : "172.17.32.27",
		"btype" : "未知故障/通用故障",
		"blevel" : "一般报警",
		"bstate" : "当前报警",
		"lasttime" : "2017-07-32 16:40:14",
		"caozuo" : "1"
	}, 
	{
		"wname" : "青岛机场安保系统",
		"stype" : "安维斯视频分析服务器",
		"sname" : "VAS27",
		"sip" : "172.17.32.27",
		"btype" : "未知故障/通用故障",
		"blevel" : "一般报警",
		"bstate" : "当前报警",
		"bcontent" : "一般报警(超时错误)",
		"lasttime" : "2017-07-32 16:44:36",
		"caozuo" : "1"
	}, 
	
	
	];

	var surColumns = [
			{
				id : 'wname',
				title : '网络名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'stype',
				title : '设备类型',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'sname',
				title : '设备名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'sip',
				title : '设备IP',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'btype',
				title : '报警类型',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'blevel',
				title : '报警级别',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'bstate',
				title : '报警状态',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'lasttime',
				title : '最后报警时间',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'caozuo',
				title : '操作',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
					content += '<button class="sbtn sbtn-blue" onclick="surDetails();"> 查看详情</button>';
					return content;
				}
			}
			
			];
	var surOption = {
			lang : 'zh-cn',
			ajaxLoad : false,
			datas : surDatas,
			columns : surColumns,
			gridContainer : 'surTable',
			toolbarContainer : 'surPage',
			tools : '',
			pageSize : 10,
			pageSizeLimit : [ 10, 20, 50 ]
		};

	var sur = $.fn.dlshouwen.grid.init(surOption);
	$(function() {
		sur.load();
		barStatusChartInit();
		$('#securityTable a').click(function(e) {
			e.preventDefault();//阻止a链接的跳转行为 
			var area = $(this).attr("data-area-id");
			if ($(".btn-default").css("display") == "none") {
				$(".btn-default").css('display','block');
			}else{
				$(".btn-default").css('display','none');
			}
			$(".area-test").hide();
			$("#" + area).show();
			$(this).tab('show');//显示当前选中的链接及关联的content

		});
	}); 
	
function surDetails(){
	window.location.href = "/qdsodb/pages/visualizationAnalysis/data/videoDetails.jsp";
} 	
	
	 	 
var option = {
	    tooltip : {
	        trigger: 'axis',
	        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	        }
	    },
	    legend: {
	        data: ['航站区','飞行区','公共区','控制区'],
			left: 'right',
			padding:38
	    },
	    grid: {
	        left: '3%',
	        right: '4%',
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
	            name:'日期',
	            data : ['2017-07-25','2017-07-26','2017-07-27','2017-07-28','2017-07-29','2017-07-30',
	                    '2017-07-31','2017-08-01','2017-08-02','2017-08-03','2017-08-04','2017-08-05'],
	            axisTick: {
	                alignWithLabel: true
	            }
	        }
	    ],
	    yAxis : [
	        {
	            type : 'value',
	            name:'报警件数(件):'
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
	
function barStatusChartInit(){
 

            // 基于准备好的dom，初始化echarts图表
            var myChartbar = echarts.init(document.getElementById('myBar'));
            // 为echarts对象加载数据 
            myChartbar.setOption(option);

}
	 
	
</script>
</html>