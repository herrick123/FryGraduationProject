<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
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
	margin-top: 10px;
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
li{
	display:inline;
}

</style>
</head>
<body>
	<form class="form-inline">
		<div class="sodb-page-home">
			<ul class="sodb-page-ul">
				<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
					class="fa fa-angle-right"></i></li>
				<li><a href="#">安全数据可视化</a> <i class="fa fa-angle-right"></i></li>
				<li><a href="#">实时视频监控分析</a> <i class="fa fa-angle-right"></i></li>
				<li><a href="#">视频详情</a></li>
				
			</ul>
		</div>
		
		<div style="clear: both;"></div>
		<div
			style="margin: 10px 0px 10px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/queren.jpg" /> <font
				style="font-size: 16px; color: #2d456b; vertical-align: middle;">报警详情</font>
		</div>
		

			<div class="row">
				<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">网络名称：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">青岛机场安保系统</div>
				<div class="col-md-2" style="text-align: right;">设备类型：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">模拟球机</div>
				<div class="col-md-1" style="text-align: right;"></div>
				
			</div>
	
		<div class="row">
				<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">设备名称：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">A区安检</div>
				<div class="col-md-2" style="text-align: right;">设备IP：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">172.17.32.11</div>
				<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">资源名称：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">&nbsp;</div>
			<div class="col-md-2" style="text-align: right;">资源类型：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">&nbsp;</div>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">报警类型：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">入侵报警</div>
			<div class="col-md-2" style="text-align: right;">报警级别：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">18895731508</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>

		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">报警状态：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">当前报警</div>
			<div class="col-md-2" style="text-align: right;">最后报警时间：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">2017-07-31 16:45:37</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row" style="margin-bottom: 0px">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">报警内容：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">设备172.17.32.13槽位1端口3(VAS:172.17.32.28 ):绊线报警</div>
			<div class="col-md-3"></div>

		</div>
		
		<div class="safeanniu" style="text-align: center">
			<input type="button" value="返回" class="sbtn sbtn-default sbtn30"
				onclick="history.go(-1)" />
		</div>
	</form>
</body>
</html>