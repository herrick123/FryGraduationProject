<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>任务配置</title>
<style>
td {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

table {
	table-layout: fixed;
}
</style>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><i class="fa fa-home"></i> <a href="#">任务管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">任务配置</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 0px;">
		<div class="col-md-12">
			<form class="form-inline">
				<div class="col-md-12">
						<div class="form-group" style="line-height: 50px;">
							<label for="taskName"> 任务名称：</label> <input type="text"
								class="form-control" id="taskName" placeholder="">
						</div>
						<div class="form-group" style="line-height: 50px;">
							<label for="workMode">&#8194;工作状态：</label> <select name="role"
								class="form-control">
								<option selected="selected">开发</option>
								<option>生产</option>
							</select>
						</div>
						<div class="form-group" style="line-height: 50px;">
							<label for="runMode">&#8194;运行方式：</label> <select name="role"
								class="form-control">
								<option selected="selected">串行</option>
								<option>并行</option>
							</select>
						</div>
						<button type="button" id="searchBtn" onclick="search()"
							class="sbtn sbtn-blue">查询</button>
					</div>
			</form>
			<div class="col-md-12"
				style="background-color: #234377; height: 3px;"></div>
			<div>
				<div class="col-md-10"></div>
				<div class="col-md-2" style="margin-top:15px;text-align:right">
					<button type="button" id="addBtn" onclick="add()"
						class="sbtn sbtn-blue">新增</button>
					<button type="button" id="delBtn" onclick="del()"
						class="sbtn sbtn-blue">&#8194;删除</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div id="task" class="dlshouwen-grid-container"></div>
		<div id="taskPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
</body>
<script type="text/javascript">
	var datas = [ {
		"taskId" : 1,
		"taskName" : "任务A",
		"runMode" : "并行",
		"level" : "1",
		"dispatchMode" : "00",
		"beginDate" : "2017-10-01",
		"beginTime" : "10:00AM",
		"endDate" : "2017-10-10",
		"endTime" : "10:00PM"
	}, {
		"taskId" : 2,
		"taskName" : "任务B",
		"runMode" : "串行",
		"level" : "2",
		"dispatchMode" : "dd",
		"beginDate" : "2017-10-01",
		"beginTime" : "10:00AM",
		"endDate" : "2017-10-10",
		"endTime" : "10:00PM"
	}, {
		"taskId" : 3,
		"taskName" : "任务C",
		"runMode" : "串行",
		"level" : "3",
		"dispatchMode" : "dd",
		"beginDate" : "2017-10-01",
		"beginTime" : "10:00AM",
		"endDate" : "2017-10-10",
		"endTime" : "10:00PM"
	}, {
		"taskId" : 4,
		"taskName" : "任务D",
		"runMode" : "并行",
		"level" : "4",
		"dispatchMode" : "mm",
		"beginDate" : "2017-10-01",
		"beginTime" : "10:00AM",
		"endDate" : "2017-10-10",
		"endTime" : "10:00PM"
	}, {
		"taskId" : 5,
		"taskName" : "任务F",
		"runMode" : "串行",
		"level" : "5",
		"dispatchMode" : "yy",
		"beginDate" : "2017-10-01",
		"beginTime" : "10:00AM",
		"endDate" : "2017-10-10",
		"endTime" : "10:00PM"
	}, {
		"taskId" : 6,
		"taskName" : "任务E",
		"runMode" : "并行",
		"level" : "6",
		"dispatchMode" : "ww",
		"beginDate" : "2017-10-01",
		"beginTime" : "10:00AM",
		"endDate" : "2017-10-10",
		"endTime" : "10:00PM"
	} ];
	var gridColumns = [
			{
				id : 'taskId',
				title : '序号',
				type : 'number',
				width : '50',
				columnClass : 'text-center'
			},
			{
				id : 'taskName',
				title : '任务名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'runMode',
				title : '运行方式',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'level',
				title : '优先级',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'dispatchMode',
				title : '调度方式',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'beginDate',
				title : '开始日期',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'beginTime',
				title : '开始时间',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'endDate',
				title : '结束日期',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'endTime',
				title : '结束时间',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'operation',
				title : '操作',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
					content += '<button class="sbtn sbtn-blue" onclick="edit();"> 编辑</button>';
					content += ' ';
					content += '<button class="sbtn sbtn-blue" onclick="del();"> 删除</button>';
					return content;
				}
			} ];
	var gridOption = {
		lang : 'zh-cn',
		ajaxLoad : false,
		exportFileName : '任务列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'task',
		toolbarContainer : 'taskPage',
		tools : 'refresh',
		check : true,
		checkWidth : 40,
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50 ]
	};
	var grid = $.fn.dlshouwen.grid.init(gridOption);
	$(function() {
		grid.load();
	});

	function add() {
		window.location.href = "addTask.jsp";
	}
	function search() {
		window.location.href = "taskList.jsp";
	}
	function del() {
		window.location.href = "taskList.jsp";
	}
	function edit() {
		window.location.href = "updateTask.jsp";
	}
</script>
</html>