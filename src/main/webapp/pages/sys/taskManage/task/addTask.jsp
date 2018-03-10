<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加任务</title>
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
			<li><a href="#">任务管理</a><i class="fa fa-angle-right"></i></li>
			<li><a href="#">添加任务</a></li>
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
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">运行方式：</span> <select name="role"
						class="form-control" id="runMode" name="runMode">
						<option selected="selected">串行</option>
						<option>并行</option>
					</select>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">优先级：</span> <select name="role"
						class="form-control"  id="level" name="level">
						<option selected="selected">1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
					</select>
				</div>
			</div>
				<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">调度方式：</span> <select name="role"
						class="form-control"  id="" name="">
						<option selected="selected"> </option>
						<option>00</option>
						<option>mi</option>
						<option>hh</option>
						<option>dd</option>
						<option>yy</option>
						<option>ww</option>
						<option>mm</option>
					</select>
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">开始日期：</span> <input type="date"
						class="form-control" id="beginDate" name="beginDate"
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
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="margin-top: 10px;">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div class="input-group">
					<span class="input-group-addon">结束日期：</span> <input type="date"
						class="form-control" id="endDate" name="endDate"
						aria-describedby="sizing-addon2">
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
						aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="col-md-4"></div>
		</div><br><br>
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
		window.location.href="taskList.jsp";
	}
</script>
</html>