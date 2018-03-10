<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改数据源分类</title>
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
			<li><a href="#">数据源分类配置</a><i class="fa fa-angle-right"></i></li>
			<li><a href="#">修改数据源分类</a></li>
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
					<span class="input-group-addon">数据源分类名称：</span> <input type="text"
						class="form-control" id="dataSourceGenreName" name="dataSourceGenreName"
						readonly="readonly" value="数据源分类A" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">数据源分类的描述：</span> 
					<textarea class="form-control" id="describe" name="describe" cols="4" rows="15"
						readonly="readonly" aria-describedby="sizing-addon2">这是数据源分类A的描述
						</textarea>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<br>
		<br>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-default" type="button" id="backBtn"
					style="margin-left: 45px;" onclick="edit()">编辑</button>
				<button class="sbtn sbtn-default" type="button" id="backBtn"
					style="margin-left: 45px;" onclick="update()">修改</button>
				<button class="sbtn sbtn-default" type="button" id="backBtn"
					style="margin-left: 45px;" onclick="goBack()">返回</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	function edit() {
		$("input").removeAttr("readonly");
		$("textarea").removeAttr("readonly");
	}
	function update() {
		window.location.href = "workgroupList.jsp";
	}
	function goBack() {
		window.location.href = "workgroupList.jsp";
	}
</script>
</html>