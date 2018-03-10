<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改任务</title>
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
			<li><a href="#">任务管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">修改任务</a></li>
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
					<span class="input-group-addon">任务名称：</span> <input type="text"
						class="form-control" id="tasktName" name="tasktName"
						readonly="readonly" value="任务A" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">运行方式：</span> <input type="text"
						class="form-control" id="runMode" name="runMode" value="串行"
						readonly="readonly" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">优先级：</span> <input type="text"
						class="form-control" id="level" name="level" value="1"
						readonly="readonly" aria-describedby="sizing-addon2">
				</div>
			</div>
				<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">调度方式：</span> <input type="text"
						class="form-control" id="dispatchMode" name="dispatchMode" value="00"
						readonly="readonly" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">开始日期：</span> <input type="text"
						class="form-control" id="beginDate" name="beginDate"
						value="2017-10-01" readonly="readonly"
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">开始时间：</span> <input type="text"
						class="form-control" id="beginTime" name="beginTime"
						value="10:00AM" readonly="readonly"
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">结束日期：</span> <input type="text"
						class="form-control" id="endDate" name="endDate" value="2017-10-10"
						readonly="readonly" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">结束时间：</span> <input type="text"
						class="form-control" id="endTime" name="endTime"
						value="10:00PM" readonly="readonly" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div><br><br>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-default" type="button" id="editBtn"
					style="margin-left: 45px;" onclick="edit()">编辑</button>
				<button class="sbtn sbtn-default" type="button" id="updateBtn"
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
	}
	function update() {
		window.location.href="taskList.jsp";
	}
	function goBack() {
		window.location.href="taskList.jsp";
	}
</script>
</html>