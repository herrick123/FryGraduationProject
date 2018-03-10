<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<style type="text/css">
.form-inline .form-control {
	width: 200px;
}

.col-md-8 {
	text-align: left;
}

.col-md-text-right {
	text-align: right;
}

.row1 {
	height: 35px;
	line-height: 35px;
	margin-top: 20px;
}

.page-bar {
	background: #f7f7f7;
}

.safeanniu {
	margin-top: 40px;
}

.safesure {
	background: #67809F;
	height: 40px;
	line-height: 40px;
	padding: 0px 15px;
	color: #fff;
}

.row{
	margin-bottom: 20px;
}
.col-md-3{
	line-height: 30px;
}


</style>
</head>
<body>
	<form class="form-inline">
		<div class="sodb-page-home">
			<ul class="sodb-page-ul">
				<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="#">权限管理</a> <i class="fa fa-angle-right"></i></li>
				<li><a href="#">报警记录</a></li>
			</ul>
		</div>
		<div style="clear: both;"></div>
		<div
			style="margin: 30px 0px 30px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/queren.jpg" /> <font
				style="font-size: 16px; color: #2d456b; vertical-align: middle;">报警详情</font>
		</div>
		

			<div class="row">
				<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">事件编号：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">10001</div>
				<div class="col-md-2" style="text-align: right;">报警事件：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">摄像头不能扭转</div>
				<div class="col-md-1" style="text-align: right;"></div>
				
			</div>
	
		<div class="row">
				<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">事件类型：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">门禁</div>
				<div class="col-md-2" style="text-align: right;">报警时间：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">2017-01-10 05:22:21</div>
				<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
				<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">报警位置：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">
				航站区10楼第二个门
				
				</div>
				<div class="col-md-2" style="text-align: right;">报警人：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">张三丰</div>
				<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">报警人联系方式：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">18895731508</div>
				<div class="col-md-2" style="text-align: right;">报警人类别：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">机场值班人员</div>
				<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">报警方式：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">电话</div>
				<div class="col-md-2" style="text-align: right;">采集方式：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">人工上报</div>
				<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">事件描述：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">系统故障引起的事故</div>
			<div class="col-md-3"></div>

		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件确认意见：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">检查维护系统，不定期检查</div>
			<div class="col-md-3"></div>
		</div>
		<div class="safeanniu" style="text-align: center">
			<input type="button" value="返回" class="sbtn sbtn-default sbtn30"
				onclick="history.go(-1)" />
		</div>
	</form>
</body>
</html>