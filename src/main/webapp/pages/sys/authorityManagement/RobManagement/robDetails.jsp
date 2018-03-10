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
				<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> 
				<i class="fa fa-angle-right"></i></li>
				<li><a href="#">权限管理</a> <i class="fa fa-angle-right"></i></li>
				<li><a href="#">抢权管理</a></li>	
			</ul>
		</div>
		<div style="clear: both;"></div>
		<div style="margin: 10px 0px 10px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/queren.jpg" /> 
			<font style="font-size: 16px; color: #2d456b; vertical-align: middle;">抢权跟踪</font>
		</div>
		<div id="sys-step1" style="clear:both;">
			<ul>
				<li class="step1 active"><i>1</i><p>抢权失败</p><p>2017年7月13日 15:30:45</p><p>抢权用户:赵飞</p><p>区域:飞行区</p><div class="auto_border"></div></li>
				<li class="step1 active"><i>2</i><p>抢权失败</p><p>2017年7月13日 15:31:45</p><p>抢权用户:王飞</p><p>区域:飞行区</p><div class="auto_border"></div></li>
				<li class="step1 active"><i>3</i><p>抢权失败</p><p>2017年7月13日 15:32:45</p><p>抢权用户:赵权</p><p>区域:飞行区</p><div class="auto_border"></div></li>
				<li class="step1 active"><i>4</i><p>抢权失败</p><p>2017年7月13日 16:30:45</p><p>抢权用户:赵飞</p><p>区域:控制区区</p><div class="auto_border"></div></li>
			</ul>		
		</div>
		<div style="clear: both;"></div>
		<div style="margin: 0px 0px 10px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/queren.jpg" /> 
			<font style="font-size: 16px; color: #2d456b; vertical-align: middle;">抢权详情</font>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">用户名：</div>
			<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">李龙</div>
			<div class="col-md-2" style="text-align: right;">所在区域：</div>
			<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">航站区</div>
			<div class="col-md-1" style="text-align: right;"></div>	
		</div>
		<div class="row">
				<div class="col-md-1" style="text-align: right;"></div>
				<div class="col-md-2" style="text-align: right;">摄像机编号：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">T3-1001</div>
				<div class="col-md-2" style="text-align: right;">区域：</div>
				<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">3号航站楼</div>
				<div class="col-md-1" style="text-align: right;"></div>
		</div>						
		<div class="safeanniu" style="text-align: center">
			<input type="button" value="返回" class="sbtn sbtn-default sbtn30"
				onclick="history.go(-1)" />
		</div>
	</form>
</body>
</html>