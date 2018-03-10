<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>日志记录</title>
</head>
<style type="text/css">
.btn .btn-default{background:#1f4a09;}
.divcss5{background:#67809F;height:40px;line-height:40px;padding:0px 15px;color:#fff;} 
.divcss5_left{ float:left;width:150px;} 
.divcss5_right{ float:right;width:120px;padding:3px 0px;} 
.clear{ clear:both;}
.form-inline .form-control{width:130px;}
#exampleInputName2{height: 34px;padding: 6px 12px;}
.page-bar{background:#f7f7f7;}
body {background: #fff none repeat scroll 0 0;}
ol, ul, li {list-style: outside none none;}
#sys-step1 li {color: #888; float: left;position: relative;text-align: center;}
#sys-step1 li.step1 { text-align: left;width: 120px;}
#sys-step1 li.step1 p {margin-left: -0.8em;}
#sys-step1 li.step2 p {text-align: left;}
#sys-step1 li.step3 p { text-align: left;}
#sys-step1 li.step4 p { text-align: right;}
#sys-step1 li.step2 {width: 185px;}
#sys-step1 li.step3 { width: 185px;}
#sys-step1 li.step4 {text-align:right;width: 160px;}
.auto_border { background: #e6e6e6 none repeat scroll 0 0;
    height: 7px;position: absolute;top: 9px;width: 100%;z-index: -1;}
#sys-step1 li i {background: #ccc none repeat scroll 0 0;
    border-radius: 50%; color: #fff;display: inline-block;
    font-weight: bold;height: 24px;line-height: 24px;
    margin-bottom: 7px; text-align: center; width: 24px;}
#sys-step1 li.step4 i,p{margin-left: 60px;}
#sys-step1 li.active {color: #2d456b;}
#sys-step1 li.active i, #sys-step1 li.active .auto_border {
    background: #2d456b none repeat scroll 0 0;}
.modal-content{z-index: 1;}
.btn-default { background-color: #fff;border-color: #ccc;color: #333;}
</style>
<body>
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
		<li><a href="#">日志记录</a></li>
	</ul> 
</div>
<div style="width:100%;padding:0px 10px;">
<form class="form-inline" style="margin:10px 0px 10px 0px;" name="" method="post">	
	<div class="form-group">
	    <span>时间：</span>
	    <input type="text" class="form-control" id="exampleInputName2" placeholder="请填写时间">
  	</div>	
	<div class="form-group" style="margin-left:30px;">
		<span>记录类型：</span>
		<select id="cardStatusSearch" name="cardStatusSearch" class="form-control">
			<option value="">请选择</option>
			<option>登录记录</option>
			<option>操作记录</option>
			<option>报警记录</option>
		</select>
	</div>	
	<div class="form-group" style="margin-left:30px;">
    	<button type="submit" class="sbtn sbtn-blue">查询</button>
	</div>	
</form>
<div class="divcss5"> 
    <div class="divcss5_left">日志记录</div>    	
    <div class="divcss5_right"><button class="btn-default" onclick="fn();" style="line-height: 28px;">清除日志</button></div> 
    <div class="clear"></div>
</div> 		
	<ul class="nav nav-tabs" id="securityTable" style="margin-top: 10px">
		<li><a data-area-id="dengluLog" style="cursor: pointer;">登录记录</a></li>
		<li><a data-area-id="caozuoLog" style="cursor: pointer;">操作记录</a></li>
		<li><a data-area-id="baojingLog" style="cursor: pointer;">报警记录</a></li>
	</ul>	
	<div id="dengluLog" class="area-test">
		<div id="dengluTable" class="dlshouwen-grid-container"
			style="margin-top: 5px;"></div>
		<div id="dengluPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
	<div id="caozuoLog" class="area-test">
		<div id="caozuoTable" class="dlshouwen-grid-container"
			style="margin-top: 5px;"></div>
		<div id="caozuoPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
	<div id="baojingLog" class="area-test">
		<div id="baojingTable" class="dlshouwen-grid-container"
			style="margin-top: 5px;"></div>
		<div id="baojingPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>			
</div>
</body>

<script type="text/javascript">
var dengludatas = [{"IPLocation":"127.0.0.1",
	"userName" : "李刚",
	"roleName" : "超级管理员",
	"function" : "视频监控调用、设备的添加修改、查看系统日志权限，设备广播权限",
	"time":"2017-6-15"
}, {
	"IPLocation":"127.0.0.1",
	"userName" : "王飞",
	"roleName" : "管理员",
	"function" : "视频监控调用、查看系统日志权限",	
	"time":"2017-6-15"
} ];

var caozuodatas = [{"userName" : "李刚","roleName" : "超级管理员",
	"function" : "视频监控调用、设备的添加修改、查看系统日志权限，设备广播权限",
	"operationType" : "新增","operationContent" : "安全事件人工上报，安全事件录入",
	"time":"2017-6-15"},
	{"userName" : "李刚","roleName" : "超级管理员",
	"function" : "视频监控调用、设备的添加修改、查看系统日志权限，设备广播权限",
	"operationType" : "新增","operationContent" : "安全事件人工上报，安全事件录入",
	"time":"2017-6-15"}, 
	{"userName" : "王飞","roleName" : "管理员",
	"function" : "视频监控调用、查看系统日志权限","operationType" : "编辑",
	"operationContent" : "安全事件处理，填写处理意见","time":"2017-6-15"} ];

var baojingdatas = [ {
	"eventName":"摄像头不能遥控 ",
	"eventType" : "安防安全类",
	"eventTime" : "2017-01-10 05:22:21",
	"eventLocation" : "控制区 ",
	"collectionMode" : "人工上报"}, 
	{"eventName":"摄像头不能遥控 ",
	"eventType" : "安防安全类",
	"eventTime" : "2017-01-10 05:22:21",
	"eventLocation" : "飞行区 ",
	"collectionMode" : "自动采集"}]

var dengluColumns =[
	{id : 'IPLocation',title : 'IP地址',type : 'string',columnClass : 'text-center'},
	{id : 'userName',title : '用户名',type : 'number',columnClass : 'text-center'},
	{id : 'roleName',title : '角色',type : 'string',columnClass : 'text-center'},
	{id : 'function',title : '功能',type : 'string',columnClass : 'text-center'},
	{id : 'time',title : '操作时间',type : 'string',columnClass : 'text-center'},
	{id : 'operation',title : '操作',type : 'string',columnClass : 'text-center',
		resolution : function(value, record, column, grid, dataNo,columnNo) {
			var content = '';
			content += '<button class="sbtn sbtn-blue" onclick="showImpower();">授权</button>';
			return content;
		}} ];

var caozuoColumns = [{id : 'userName',title : '操作人',
		type : 'number',columnClass : 'text-center'},
	{id : 'roleName',title : '角色',type : 'string',
		columnClass : 'text-center'},
	{id : 'function',title : '功能',type : 'string',
		columnClass : 'text-center'},
	{id : 'operationType',title : '操作类型',type : 'string',
		columnClass : 'text-center'},
	{id : 'operationContent',title : '操作内容',type : 'string',
		columnClass : 'text-center'},
	{id : 'time',title : '操作时间',type : 'string',
		columnClass : 'text-center'},
	{id : 'operation',title : '操作',
		type : 'string',columnClass : 'text-center',
		resolution : function(value, record, column, grid, dataNo,
				columnNo) {var content = '';
			content += '<button class="sbtn sbtn-blue" onclick="showImpower();">授权</button>';
			return content;}}];

var baojingColumns = [{id : 'eventName',
		title : '事件名称',
		type : 'string',
		columnClass : 'text-center'},
		{id : 'eventType',
			title : '事件类别',
			type : 'number',
			columnClass : 'text-center'},
		{id : 'eventTime',
			title : '报警时间',
			type : 'string',
			columnClass : 'text-center'},
		{id : 'eventLocation',
			title : '位置',
			type : 'string',
			columnClass : 'text-center'},
		{id : 'collectionMode',
			title : '采集方式',
			type : 'string',
			columnClass : 'text-center'},
		{id : 'operation',
			title : '操作',
			type : 'string',
			columnClass : 'text-center',
			resolution : function(value, record, column, grid, dataNo,
					columnNo) {
				var content = '';
				content += '<button class="sbtn sbtn-blue" onclick="fn();">删除</button>';
				var content = '';
				content += '<a href="<%=path%>/pages/sys/logManagement/logRecord/showDetails.jsp"><button class="sbtn sbtn-default">查看详情</button></a>';					
				return content;}} ];

var dengluOption = {
		lang : 'zh-cn',
		ajaxLoad : false,
		exportFileName : '用户列表',
		datas : dengludatas,
		columns : dengluColumns,
		gridContainer : 'dengluTable',
		toolbarContainer : 'dengluPage',
		tools : '',
		pageSize : 10,
		pageSizeLimit : [10, 20, 50]};

var caozuoOption = {
	lang : 'zh-cn',
	ajaxLoad : false,
	exportFileName : '用户列表',
	datas : caozuodatas,
	columns : caozuoColumns,
	gridContainer : 'caozuoTable',
	toolbarContainer : 'caozuoPage',
	tools : '',
	pageSize : 10,
	pageSizeLimit : [10, 20, 50]};

var baojingOption = {
		lang : 'zh-cn',
		ajaxLoad : false,
		exportFileName : '用户列表',
		datas : baojingdatas,
		columns : baojingColumns,
		gridContainer : 'baojingTable',
		toolbarContainer : 'baojingPage',
		tools : '',
		pageSize : 10,
		pageSizeLimit : [10, 20, 50]};

var denglu = $.fn.dlshouwen.grid.init(dengluOption);	
var caozuo = $.fn.dlshouwen.grid.init(caozuoOption);
var baojing = $.fn.dlshouwen.grid.init(baojingOption);

$(function(){
	denglu.load();
	$("#dengluLogArea").hide();
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
	});});
$(function(){
	caozuo.load();
	$("#caozuoLogArea").hide();
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
	});});
$(function(){
	baojing.load();
	$("#baojingLogArea").hide();
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
	});});
function fn(){
	confirm("清除所有日志？");
}
function showImpower(){
	window.location.href = "<%=path%>/pages/sys/logManagement/logAnalysisStatistics/authorization.jsp";
}
</script>
</html>