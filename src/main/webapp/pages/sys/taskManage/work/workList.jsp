<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>工作配置</title>
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
			<li><a href="#">工作配置</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 0px;">
		<div class="col-md-12">
			<form class="form-inline">
				<div class="col-md-12">
					<div class="form-group" style="line-height: 50px;">
						<label for="workName">工作名称：</label> <input type="text"
							class="form-control" id="workName" placeholder="">
					</div>
					<div class="form-group" style="line-height: 50px;">
						<label for="workType">&#8194;&#8194;工作类型：</label> <select name="workType"
							class="form-control">
							<option selected="selected">存储过程</option>
							<option>普通java程序</option>
							<option>sql</option>
							<option>URL</option>
						</select>
					</div>
					<div class="form-group" style="line-height: 50px;">
						<label for="workgroupName">&#8194;&#8194;工作组名称：</label> <input type="text"
							class="form-control" id="workgroupName" placeholder="">
					</div>
					<button type="button" id="searchBtn" onclick="search()"
						class="sbtn sbtn-blue">查询</button>
				</div>
			</form>
			<div class="col-md-12"
				style="background-color: #234377; height: 3px;"></div>
			<div class="col-md-12">
				<div class="col-md-10"></div>
				<div class="col-md-2" style="margin-top:15px;text-align:right">
					<button type="button" id="addBtn" onclick="add()"
						class="sbtn sbtn-blue">新增</button>
					<button type="button" id="delBtn" onclick="del()"
						class="sbtn sbtn-blue">删除</button>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div id="work" class="dlshouwen-grid-container"></div>
			<div id="workPage" class="dlshouwen-grid-toolbar-container"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var datas = [ {
		"workId" : 1,
		"workName" : "工作A",
		"workgroupName" : "工作组A",
		"workType" : "普通java程序",
		"location" : "https://www.baidu.com/",
	}, {
		"workId" : 2,
		"workName" : "工作B",
		"workgroupName" : "工作组B",
		"workType" : "存储过程",
		"location" : "https://www.baidu.com/",
	}, {
		"workId" : 3,
		"workName" : "工作C",
		"workgroupName" : "工作组C",
		"workType" : "普通java程序",
		"location" : "https://www.baidu.com/",
	}, {
		"workId" : 4,
		"workName" : "工作D",
		"workgroupName" : "工作组D",
		"workType" : "sql",
		"location" : "https://www.baidu.com/",
	}, {
		"workId" : 5,
		"workName" : "工作F",
		"workgroupName" : "工作组F",
		"workType" : "URL",
		"location" : "https://www.baidu.com/",
	}, {
		"workId" : 6,
		"workName" : "工作E",
		"workgroupName" : "工作组E",
		"workType" : "存储过程",
		"location" : "https://www.baidu.com/",
	} ];
	var gridColumns = [
			{
				id : 'workId',
				title : '序号',
				type : 'number',
				width : '50',
				columnClass : 'text-center'
			},
			{
				id : 'workName',
				title : '工作名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'workgroupName',
				title : '工作组名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'workType',
				title : '工作类型',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'location',
				title : '工作执行位置',
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
		exportFileName : '工作列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'work',
		toolbarContainer : 'workPage',
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
		window.location.href = "addWork.jsp";
	}
	function search() {
		window.location.href = "workList.jsp";
	}
	function del() {
		window.location.href = "workList.jsp";
	}
	function edit() {
		window.location.href = "updateWork.jsp";
	}
</script>
</html>