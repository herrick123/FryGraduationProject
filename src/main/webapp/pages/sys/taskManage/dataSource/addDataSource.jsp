<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加数据源</title>
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
			<li><a href="#">任务配置</a><i class="fa fa-angle-right"></i></li>
			<li><a href="#">数据源配置</a><i class="fa fa-angle-right"></i></li>
			<li><a href="#">添加数据源</a></li>
		</ul>
	</div>
	<div class="col-md-12" style="background-color: #234377; height: 3px;"></div>
	<br>
	<br>
	<form name="demoForm" id="demoForm"
		action="<c:url value='/demo/save' />" method="post"
		enctype="multipart/form-data">
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">数据源名称：</span> <input type="text"
						class="form-control" id="dataSourceName" name="dataSourceName"
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">数据库类型：</span> <select name="dataSourceType"
						class="form-control" id="dataSourceType" name="dataSourceType">
						<option selected="selected">JDBC</option>
						<option>JNDI</option>
					</select>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">数据库版本：</span><input type="text"
						class="form-control" id="version" name="version"
						aria-describedby="sizing-addon2"> 
				</div>
			</div>
				<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">数据库访问路径：</span><input type="text"
						class="form-control" id="URL" name="URL"
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<br><br>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-default" type="button" id="addBtn"
					style="margin-left: 45px;" onclick="add()">添加</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	function add() {
		window.location.href="dataSourceList.jsp";
	}
</script>
</html>