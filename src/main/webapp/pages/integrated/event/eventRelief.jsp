<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type;X-UA-Compatible" content="text/html; charset=UTF-8;IE=11">
<%@include file="/pages/inc/header.jsp"%>
<title>事件解除</title>
<style type="text/css">
.form-inline .form-control {
	width: 200px;
}
.col-md-7 {
	text-align: left;
}
.col-md-text-right {
	text-align: right;
}
.page-bar {
	background: #f7f7f7;
}
.safeanniu {
	margin-top: 10px;
}
.safesure {
	background: #67809F;
}
img#img {
	display: none;
}
.safeEvent {
	margin-top: 5px;
}
label {
	font-weight: inherit;
}
.row1 {
	height: 30px;
	line-height: 10px;
	margin-top: 5px;
}
.col-md-7 {
	border-radius: 3px;
}
.col-md-3 {
	line-height: 30px;
}
.row{
	margin-bottom: 20px;
}
</style>
</head>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">综合业务平台</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">安全事件管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">事件解除</a></li>
	</ul>
</div>
<div style="clear:both;"></div>
<form class="form-inline" id="addEvenForm" action="#" method="post">
    <input class="col-md-3" style="padding-left: 0px" type="hidden" id="eventId" name="eventId" value="${ event.id }">
    <input class="col-md-3" style="padding-left: 0px" type="hidden" id="handleMan" name="handleMan" value="${loginUser.userName }">
	<div style="margin:10px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
		<img src="<%=path %>/img/event/queren.jpg"/>
		<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">安全事件信息</font>
	</div>
    <div class="row">
		<div class="col-md-1" style="text-align: right;"></div>
		<div class="col-md-2" style="text-align: right;">事件编号：</div>
		<div class="col-md-3"
			style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${ event.eventCode }</div>
		<div class="col-md-2" style="text-align: right;">报警事件：</div>
		<div class="col-md-3"
			style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.eventName }</div>
		<div class="col-md-1" style="text-align: right;"></div>
	</div>
	<div class="row">
		<div class="col-md-1" style="text-align: right;"></div>
		<div class="col-md-2" style="text-align: right;">事件类型：</div>
		<div class="col-md-3"
			style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">
			<c:if test="${event.eventLevel==1}">一级</c:if><c:if test="${event.eventLevel==2}">二级</c:if><c:if test="${event.eventLevel==3}">三级</c:if><c:if test="${event.eventLevel==4}">四级</c:if>
		</div>
		<div class="col-md-2" style="text-align: right;">报警时间：</div>
		<div class="col-md-3"
			style="text-align: left; border: 1px solid #ccc; border-radius: 3px;">${event.alarmTime}
			05:22:21</div>
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
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-1"></div>
		<div class="col-md-2 col-md-text-right">事件描述：</div>
		<div class="col-md-6" style="height: 100px; width: 565px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">${event.eventNote}</div>
		<div class="col-md-3"></div>
	</div>		
	<div style="margin:0px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
			<img src="<%=path %>/img/event/bianji.jpg"/>
			<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">事件确认</font>
	</div>		
	<div class="row">
		<div class="row">
			<div class="col-md-1" style="text-align: right;"></div>
			<div class="col-md-2" style="text-align: right;">确认人：</div>		
			<div class="col-md-3" style="text-align: left;height: 32px;border: 1px solid #ccc; border-radius: 3px;">${eventConfirm.handleMan}</div>
			<div class="col-md-2" style="text-align: right;"></div>
			<div class="col-md-3"></div>
			<div class="col-md-1" style="text-align: right;"></div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件确认意见：</div>
			<div class="col-md-6" style="text-align: left;height: 100px;border: 1px solid #ccc; border-radius: 3px;">${eventConfirm.handleNote}</div>
			<div class="col-md-3"></div>
		</div>
	</div>
	<div style="margin:0px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
		<img src="<%=path %>/img/event/bianji.jpg"/>
		<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">事件接警</font>
	</div>
	<div class="row">
		<div class="col-md-1" style="text-align: right;"></div>
		<div class="col-md-2" style="text-align: right;">分配人：</div>
		<div class="col-md-3" style="text-align: left;height: 32px;border: 1px solid #ccc; border-radius: 3px;">${eventAlarm.handleMan }</div>
		<div class="col-md-2" style="text-align: right;"></div>
		<div class="col-md-3"></div>
		<div class="col-md-1" style="text-align: right;"></div>
	</div>	
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-1"></div>
		<div class="col-md-2 col-md-text-right">安全事件分配意见：</div>
		<div class="col-md-6" style="height: 100px; width: 565px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">
		${eventAlarm.handleNote }
		</div>
		<div class="col-md-3"></div>
	</div>
	<div style="margin:0px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
		<img src="<%=path %>/img/event/bianji.jpg"/>
		<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">事件处理</font>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2" style="text-align: right;">值班人：</div>
		<div class="col-md-3" style="text-align: left;height: 32px;border: 1px solid #ccc; border-radius: 3px;">${eventDeal.handleMan }</div>
		<div class="col-md-2" style="text-align: right;"></div>
		<div class="col-md-3"
			></div>	
		<div class="col-md-3"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-2 col-md-text-right">事件处理意见：</div>
		<div class="col-md-6" style="height: 100px; width: 565px; overflow-y: auto;border: 1px solid #ccc;border-radius: 3px;">
		${eventDeal.handleNote }
		</div>
		<div class="col-md-3"></div>
	</div>
	<div style="margin:0px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
			<img src="<%=path %>/img/event/bianji.jpg"/>
			<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">事件解除</font>
	</div>	
	<div class="row">
	    <div class="row" style="margin-top: 20px;">
			<div class="col-md-1"></div>
			<div class="col-md-2 col-md-text-right">安全事件解除意见：</div>
			<div class="col-md-6" style="padding-left: 0px">
			<textarea name="handleNote" style="height: 100px; width: 565px"></textarea>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="safeanniu" style="text-align: center">
			<input type="button" value="提交" id="confirmEvent" class="sbtn sbtn-blue sbtn30"/> 
			<input type="button"
				class="sbtn sbtn-default sbtn30"  onclick="backLast();" 
				style="margin-left: 45px" value="返回"/>
		</div>
	</div>	
</form>
</body>

<script type="text/javascript">

$(document).ready(function(){	
	$("#confirmEvent").click(function(){
		var eventId = $("#eventId").val();
		//window.external.CallFunction(2,"findEventById",eventId);
		//window.external.CallFunction(3,"getEvent",eventId);
		$.ajax({
			url: "<c:url value='/event/updateEventRelief' />",
			type:"POST",
		 	data:$("#addEvenForm").serialize(),
		 	dataType:'json',
		 	success : function(data, textStatus) {
	 			if (data.returncode == '200'){	
	 				window.location.href = '<c:url value='/eventProcess/page' />';
	 				window.external.CallFunction(2,"searchData","");
					//window.external.CallFunction(3,"getEvent",eventId);
	 			} else {
	 				showMsg('事件解除失败！');
	 			}
 	    	},
			error : function() {	
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	})
});
$(document).ready(function(){	
	if ($("#checkResource").val() == "1"){
		$("#autoType").hide();
	} else {
		$("#artType").hide();
		$("#artTypeTwo").hide();
	}	
})
function backLast(){
	history.go(-1);
}
</script>
</html>