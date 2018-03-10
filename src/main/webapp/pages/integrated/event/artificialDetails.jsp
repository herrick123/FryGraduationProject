<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>事件详细</title>
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
				<li><a href="#">综合业务平台</a> <i class="fa fa-angle-right"></i></li>
	           	<li><a href="#">安全事件管理</a> <i class="fa fa-angle-right"></i></li>
				<li><a href="#">事件确认</a> <i class="fa fa-angle-right"></i></li>
				<li><a href="#">事件详情</a></li>
				
			</ul>
		</div>
		<div style="clear: both;"></div>
		<div
			style="margin: 10px 0px 10px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/event/queren.jpg" /> <font
				style="font-size: 16px; color: #2d456b; vertical-align: middle;">事件跟踪</font>
		</div>	
		<div id="sys-step1" style="clear:both;">
			<ul>
				<li class="step1 active"><i>1</i><p>事件报警</p><p>${event.alarmTime}</p><p><c:if test="${event.eventSource==1}">报警人:${event.alarmMan}</c:if><c:if test="${event.eventSource==2}">报警设备:${event.equName }</c:if></p><div class="auto_border"></div></li>
				<li class="step2 "><i>2</i><p>报警确认</p><p id="qrtime">${eventConfirm.createTime}</p><p>${eventConfirm.handleMan}</p><div class="auto_border"></div></li>
				<li class="step3 "><i>3</i><p>报警接警</p><p id="jjtime">${eventAlarm.createTime}</p><p>${eventAlarm.handleMan}</p><div class="auto_border"></div></li>
				<li class="step4 "><i>4</i><p>报警处理</p><p id="cltime">${eventDeal.createTime}</p><p>${eventDeal.handleMan}</p><div class="auto_border"></div></li>
				<li class="step5 "><i>5</i><p>警报解除</p><p id="jctime">${eventRelief.createTime}</p><p>${eventRelief.handleMan}</p><div class="auto_border"></div></li>
			</ul>
		</div>
		<div style="clear: both;"></div>
		<div
			style="margin: 0px 0px 10px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/event/queren.jpg" /> <font
				style="font-size: 16px; color: #2d456b; vertical-align: middle;">事件详情</font>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">事件编号：</div>
			<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">${ event.eventCode }</div>
			<div class="col-md-2" style="text-align: right;">报警事件：</div>
			<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">${event.eventName }</div>
			<div class="col-md-1" style="text-align: right;"></div>			
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">事件类型：</div>
			<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">
			<c:if test="${event.eventLevel==1}">一级</c:if><c:if test="${event.eventLevel==2}">二级</c:if><c:if test="${event.eventLevel==3}">三级</c:if><c:if test="${event.eventLevel==4}">四级</c:if>
			</div>
			<div class="col-md-2" style="text-align: right;">报警时间：</div>
			<div class="col-md-3" style="text-align: left;border: 1px solid #ccc;border-radius: 3px;">${event.alarmTime}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
		    <input type="hidden" id="checkResource" value="${event.eventSource }"/>
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">事件所在楼层：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;"><c:if test="${event.eventFloor==1}">F1</c:if><c:if test="${event.eventFloor==2}">F2</c:if><c:if test="${event.eventFloor==3}">F3</c:if></div>
			<div class="col-md-2" style="text-align: right;">采集方式：</div>
			<div class="col-md-3" id="checkResource"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">
				<c:if test="${event.eventSource==1}">人工上报</c:if><c:if test="${event.eventSource==2}">自动采集</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">经度：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.eventLng}</div>
			<div class="col-md-2" style="text-align: right;">纬度：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.eventLat}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row" id="artType">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">报警人：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.alarmMan}</div>
			<div class="col-md-2" style="text-align: right;">报警人联系方式：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.alarmContact}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row" id="artTypeTwo">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">报警人类别：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">
			<c:if test="${event.alarmManType==1}">机场人员</c:if><c:if test="${event.alarmManType==2}">公众</c:if>	
			</div>			
			<div class="col-md-2" style="text-align: right;">报警方式：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">
			<c:if test="${event.alarmType==1}">对讲</c:if><c:if test="${event.alarmType==2}">电话</c:if>		
			</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row" id="autoType">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">设备名称：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.equName}</div>
			<div class="col-md-2" style="text-align: right;">设备类型：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.equType}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		
		<div class="row" style="margin-bottom: 0px">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">事件描述：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">${event.eventNote}</div>
			<div class="col-md-3"></div>

		</div>
		<div
			style="margin: 0px 0px 10px 30px; border-bottom: solid #2d456b thin;">
			<img src="<%=path%>/img/event/queren.jpg" /> <font
				style="font-size: 16px; color: #2d456b; vertical-align: middle;">处理过程</font>
		</div>
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">确认人：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">
				${eventConfirm.handleMan}
			</div>
			<div class="col-md-2" style="text-align: right;">确认时间：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">${eventConfirm.createTime}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件确认意见：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">${eventConfirm.handleNote}</div>
			<div class="col-md-3"></div>
		</div>	
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">接警人：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">
				${eventAlarm.handleMan}
			</div>
			<div class="col-md-2" style="text-align: right;">接警时间：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">${eventAlarm.createTime}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件接警意见：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">${eventAlarm.handleNote}</div>
			<div class="col-md-3"></div>
		</div>	
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">处理人：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">
				${eventDeal.handleMan}
			</div>
			<div class="col-md-2" style="text-align: right;">处理时间：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">${eventDeal.createTime}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件处理意见：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">${eventDeal.handleNote}</div>
			<div class="col-md-3"></div>
		</div>	
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">解除人：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">
				${eventRelief.handleMan}
			</div>
			<div class="col-md-2" style="text-align: right;">解除时间：</div>
			<div class="col-md-3"
				style="text-align: left; border: 1px solid #ccc; border-radius: 3px;height: 50px;">${eventRelief.handleMan}</div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件解除意见：</div>
			<div class="col-md-6" style="height: 100px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">${eventRelief.handleMan}</div>
			<div class="col-md-3"></div>
		</div>	
		<div class="safeanniu" style="text-align: center">
			<input type="button" value="返回" class="sbtn sbtn-default sbtn30"
				onclick="history.go(-1)" />
		</div>
	</form>
</body>
<script type="text/javascript">
$(document).ready(function(){	
	if ($("#qrtime").text() != ""){
		$(".step2").addClass("active");
	}
	if ($("#jjtime").text() != ""){
		$(".step3").addClass("active");
	} 
	if ($("#cltime").text() != ""){
		$(".step4").addClass("active");
	} 
	if ($("#jctime").text() != ""){
		$(".step5").addClass("active");
	} 
	if ($("#checkResource").val() == "1"){
		$("#autoType").hide();
	} else {
		$("#artType").hide();
		$("#artTypeTwo").hide();
	}	
})
</script>
</html>