<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据源分类配置</title>
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
			<li><a href="#">数据源分类配置</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 0px;">
		<div class="col-md-12">
			<form class="form-inline">
						<div class="form-group" style="line-height: 50px;">
							<label for="dataSourceGenreName">数据源分类名称：</label> <input
								type="text" class="form-control" id="dataSourceGenreName"
								placeholder="">
						</div>
						<button type="button" id="searchBtn" onclick="search()"
							class="sbtn sbtn-blue">查询</button>
			</form>
			<div class="col-md-12"
				style="background-color: #234377; height: 3px;"></div>
			<div class="row col-md-12" >
					<div class="col-md-10"></div>
					<div class="col-md-2"  style="margin-top:15px;text-align:right">
						<button type="button" id="addBtn" onclick="add()"
							class="sbtn sbtn-blue">新增</button>
						<button type="button" id="delBtn" onclick="del()"
							class="sbtn sbtn-blue">删除</button>
					</div>
			</div>
		</div>
		<div class="col-md-12">
			<div id="dataSourceGenre" class="dlshouwen-grid-container"></div>
			<div id="dataSourceGenrePage"
				class="dlshouwen-grid-toolbar-container"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var datas = [ {
		"dataSourceGenreId" : 1,
		"dataSourceGenreName" : "数据源分类A",
		"describe" : "数据源分类A的描述"
	}, {
		"dataSourceGenreId" : 2,
		"dataSourceGenreName" : "数据源分类B",
		"describe" : "数据源分类B的描述"
	}, {
		"dataSourceGenreId" : 3,
		"dataSourceGenreName" : "数据源分类C",
		"describe" : "数据源分类C的描述"
	}, {
		"dataSourceGenreId" : 4,
		"dataSourceGenreName" : "数据源分类D",
		"describe" : "数据源分类D的描述"
	}, {
		"dataSourceGenreId" : 5,
		"dataSourceGenreName" : "数据源分类E",
		"describe" : "数据源分类E的描述"
	}, {
		"dataSourceGenreId" : 6,
		"dataSourceGenreName" : "数据源分类F",
		"describe" : "数据源分类F的描述"
	} ];
	var gridColumns = [
			{
				id : 'dataSourceGenreId',
				title : '序号',
				type : 'number',
				width : '50',
				columnClass : 'text-center'
			},
			{
				id : 'dataSourceGenreName',
				title : '数据源分类名称',
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
		exportFileName : '数据源分类列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'dataSourceGenre',
		toolbarContainer : 'dataSourceGenrePage',
		check : true,
		checkWidth : 40,
		tools : 'refresh',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50 ]
	};
	var grid = $.fn.dlshouwen.grid.init(gridOption);
	$(function() {
		grid.load();
	});

	function add() {
		window.location.href = "addDataSourceGenre.jsp";
	}
	function search() {
		window.location.href = "dataSourceGenreList.jsp";
	}
	function del() {
		window.location.href = "dataSourceGenreList.jsp";
	}
	function edit() {
		window.location.href = "updateDataSourceGenre.jsp";
	}
</script>
</html>