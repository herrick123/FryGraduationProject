<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据源配置</title>
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
			<li><a href="#">数据源配置</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 0px;">
		<div class="col-md-12">
			<form class="form-inline">
				<div class="col-md-12">
					<div class="form-group" style="line-height: 50px;">
						<label for="dataSourceName">数据源名称：</label> <input type="text"
							class="form-control" id="dataSourceName" placeholder="">
					</div>
					<div class="form-group" style="line-height: 50px;">
						<label for="dataSourceType">&#8194;&#8194;数据源类型：</label> <select
							name="dataSourceType" class="form-control">
							<option selected="selected">JDBC数据源</option>
							<option>JNDI数据源</option>
						</select>
					</div>
					<button type="button" id="searchBtn" onclick="search()"
						class="sbtn sbtn-blue">查询</button>
				</div>
			</form>
			<div class="col-md-12"
				style="background-color: #234377; height: 3px;"></div>
			<div class="col-md-12">
				<div class="col-md-10"></div>
				<div class="col-md-2" style="margin-top: 15px; text-algin: right">
					<button type="button" id="addBtn" onclick="add()"
						class="sbtn sbtn-blue">新增</button>
					<button type="button" id="delBtn" onclick="del()"
						class="sbtn sbtn-blue">删除</button>
				</div>
			</div>
		</div>
		<div class="col-md-12">
			<div id="dataSource" class="dlshouwen-grid-container"></div>
			<div id="dataSourcePage" class="dlshouwen-grid-toolbar-container"></div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var datas = [ {
		"dataSourceId" : 1,
		"dataSourceName" : "数据源A",
		"dataSourceType" : "JDBC",
		"version" : "1.1",
		"URL" : "https://www.baidu.com/",
	}, {
		"dataSourceId" : 2,
		"dataSourceName" : "数据源B",
		"dataSourceType" : "JNDI",
		"version" : "1.2",
		"URL" : "https://www.baidu.com/",
	}, {
		"dataSourceId" : 3,
		"dataSourceName" : "数据源C",
		"dataSourceType" : "JDBC",
		"version" : "1.3",
		"URL" : "https://www.baidu.com/",
	}, {
		"dataSourceId" : 4,
		"dataSourceName" : "数据源D",
		"dataSourceType" : "JNDI",
		"version" : "1.4",
		"URL" : "https://www.baidu.com/",
	}, {
		"dataSourceId" : 5,
		"dataSourceName" : "数据源F",
		"dataSourceType" : "JDBC",
		"version" : "1.5",
		"URL" : "https://www.baidu.com/",
	}, {
		"dataSourceId" : 6,
		"dataSourceName" : "数据源E",
		"dataSourceType" : "JDBC",
		"version" : "1.6",
		"URL" : "https://www.baidu.com/",
	} ];
	var gridColumns = [
			{
				id : 'dataSourceId',
				title : '序号',
				type : 'number',
				width : '50',
				columnClass : 'text-center'
			},
			{
				id : 'dataSourceName',
				title : '数据源名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'dataSourceType',
				title : '数据库类型',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'version',
				title : '数据库版本',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'URL',
				title : '数据库访问路径',
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
		exportFileName : '数据源列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'dataSource',
		toolbarContainer : 'dataSourcePage',
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
		window.location.href = "addDataSource.jsp";
	}
	function search() {
		window.location.href = "dataSourceList.jsp";
	}
	function del() {
		window.location.href = "dataSourceList.jsp";
	}
	function edit() {
		window.location.href = "updateDataSource.jsp";
	}
</script>
</html>