<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作组管理</title>
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
			<li><a href="#">工作组管理</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 0px;">
		<div class="col-md-12">
			<form class="form-inline">
				<div class="col-md-12">
					<div class="form-group" style="line-height: 50px;">
						<label for="workgroupName">工作组名称：</label> <input type="text"
							class="form-control" id="workgroupName" placeholder="">
					</div>
					<button type="button" id="searchBtn" onclick="search()"
						class="sbtn sbtn-blue">查询</button>
				</div>
			</form>
			<div class="col-md-12"
				style="background-color: #234377; height: 3px;"></div>
			<div class="col-md-12"> 
				<div class="col-md-10"> </div>
				<div class="col-md-2" style="margin-top:15px;text-align:right">
					<button type="button" id="addBtn" onclick="add()"
						class="sbtn sbtn-blue">新增</button>
					<button type="button" id="delBtn" onclick="del()"
						class="sbtn sbtn-blue">删除</button>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-12">
		<div id="workgroup" class="dlshouwen-grid-container"></div>
		<div id="workgroupPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
</body>
<script type="text/javascript">
	var datas = [ {
		"workgroupId" : 1,
		"workgroupName" : "工作组A",
		"describe" : "工作组A的描述"
	}, {
		"workgroupId" : 2,
		"workgroupName" : "工作组B",
		"describe" : "工作组B的描述"
	}, {
		"workgroupId" : 3,
		"workgroupName" : "工作组C",
		"describe" : "工作组C的描述"
	}, {
		"workgroupId" : 4,
		"workgroupName" : "工作组D",
		"describe" : "工作组D的描述"
	}, {
		"workgroupId" : 5,
		"workgroupName" : "工作组E",
		"describe" : "工作组E的描述"
	}, {
		"workgroupId" : 6,
		"workgroupName" : "工作组F",
		"describe" : "工作组F的描述"
	} ];
	var gridColumns = [
			{
				id : 'workgroupId',
				title : '序号',
				type : 'number',
				width : '50',
				columnClass : 'text-center'
			},
			{
				id : 'workgroupName',
				title : '工作组名称',
				width : '250',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'describe',
				title : '描述',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'operation',
				title : '操作',
				type : 'string',
				width : '250',
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
		exportFileName : '工作组列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'workgroup',
		toolbarContainer : 'workgroupPage',
		check : true,
		checkWidth : 50,
		tools : 'refresh',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50 ]
	};
	var grid = $.fn.dlshouwen.grid.init(gridOption);
	$(function() {
		grid.load();
	});

	function add() {
		window.location.href = "addWorkgroup.jsp";
	}
	function search() {
		window.location.href = "workgroupList.jsp";
	}
	function del() {
		window.location.href = "workgroupList.jsp";
	}
	function edit() {
		window.location.href = "updateWorkgroup.jsp";
	}
</script>
</html>