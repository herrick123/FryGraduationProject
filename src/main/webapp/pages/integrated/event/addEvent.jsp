<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>资源信息录入</title>
<style>
.layer-content {
	min-height: 50px;
	padding: 10px 15px;
	font-family: "微软雅黑" !important;
	font-size: 10px !important;
}

.layer-content table {
	font-family: "微软雅黑" !important;
	font-size: 10px !important;
	border-collapse: collapse;
	color: #333;
	empty-cells: show;
	line-height: 24px;
	text-align: left;
}

#gisDiv {
	position: absolute;
	left: 11%;
	top: 15%;
}

.form-inline .form-control {
	width: 230px;
}

.row {
	margin-bottom: 20px;
}

.col-md-3 {
	line-height: 30px;
}

#map2 {
	position: absolute;
	top: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
}

#buffer {
	position: absolute;
	top: 100px;
	left: 0;
	pointer-events: none;
}

#buffer div {
	background-color: #fff;
	padding: 5px 0;
	text-indent: 10px;
	white-space: nowrap;
	text-shadow: -1px -1px 0 #fff, 1px -1px 0 #fff, -1px 1px 0 #fff, 1px 1px
		0 #fff;
}

#menu0 {
	position: absolute;
	background-color: rgba(255, 255, 255, 0.5);
	padding: 0px;
	top: 0px;
	height: 27px;
	right: 15px;
	width: 300px;
	font-family: 'Open Sans', sans-serif;
	z-index: 1000;
}

#menu {
	position: absolute;
	background-color: rgba(255, 255, 255, 0.5);
	padding: 0px;
	top: 49px;
	right: 15px;
	width: 300px;
	font-family: 'Open Sans', sans-serif;
}

#fly {
	display: block;
	position: relative;
	margin: 0px auto;
	width: 25%;
	height: 40px;
	padding: 10px;
	border: none;
	border-radius: 3px;
	font-size: 12px;
	text-align: center;
	color: #fff;
	background: #ee8a65;
}

.map-overlay {
	font: 12px/20px 'Helvetica Neue', Arial, Helvetica, sans-serif;
	position: absolute;
	width: 300px;
	top: 73px;
	right: 10px;
	padding: 0px;
}

.map-overlay .map-overlay-inner {
	background-color: #fff;
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.10);
	border-radius: 3px;
	padding: 10px;
	margin-bottom: 10px;
}

.map-overlay-inner fieldset {
	border: none;
	padding: 0;
	margin: 0 0 10px;
}

.map-overlay-inner fieldset:last-child {
	margin: 0;
}

.map-overlay-inner select {
	width: 100%;
}

.map-overlay-inner label {
	display: block;
	font-weight: bold;
	margin: 0 0 5px;
}

.map-overlay-inner button {
	display: inline-block;
	width: 36px;
	height: 20px;
	border: none;
	cursor: pointer;
}

.map-overlay-inner button:focus {
	outline: none;
}

.map-overlay-inner button:hover {
	box-shadow: inset 0 0 0 3px rgba(0, 0, 0, 0.10);
}

.marker {
	display: block;
	border: none;
	border-radius: 50%;
	cursor: pointer;
	padding: 0;
}
</style>
</head>
<body style="overflow: hidden;">
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li><i class="fa fa-home" style="padding-left:40px;"></i> <a href="#">青岛机场安全管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">综合业务平台</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">报警事件管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">安全事件录入</a></li>
	</ul>
</div>
<div style="clear: both;"></div>
<div style="margin: 20px 0px 10px 30px;">
</div>
<form name="eventForm" id="eventForm" class="form-horizontal"
	role="form" action="<c:url value='/event/save' />" method="post"
	enctype="multipart/form-data">
	<div class="form-body">
		<div class="row">
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件编号<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5">
					<input type="text" class="form-control" placeholder="事件编号"
						 value="<c:out value='${ eventCode }' />" valid="r|english_number|l2-le36" validTitle="必填项"
						validInfoArea="show_event_num_area"
						name="eventCode" id="eventCode" />
				</div>
				<div class="col-md-4 help-block" id="show_event_num_area"></div>
			</div>
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件名称<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5">
					<input type="text" class="form-control" placeholder="事件名称"
						name="eventName" id="eventName" valid="r|l2-le60" validTitle="必填项"
						validInfoArea="show_name_area" />
				</div>
				<div class="col-md-4 help-block" id="show_name_area"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件类型<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<select name="eventType" class="form-control" id="eventType"
						valid="r" validTitle="必填项" validInfoArea="show_type_area">
						<option value="">请选择事件类型</option>
						<option value="1">公共安全类</option>
						<option value="2">消防安全类</option>
						<option value="3">安防安全类</option>
						<option value="4">空防安全类</option>
					</select>
				</div>
				<div class="col-md-4 help-block" id="show_type_area"></div>
			</div>
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件级别<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<select name="eventLevel" class="form-control" id="eventLevel"
						valid="r" validTitle="必填项" validInfoArea="show_level_area">
						<option value="">请选择事件级别</option>
						<option value="1">一级</option>
						<option value="2">二级</option>
						<option value="3">三级</option>
						<option value="4">四级</option>
					</select>
				</div>
				<div class="col-md-4 help-block" id="show_level_area"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件所在楼层<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<select class="form-control" name="eventFloor" id="eventFloor"
						valid="r" validTitle="必填项" validInfoArea="show_floor_area">
						<option value="">请选择楼层</option>
						<option value="1">F1</option>
						<option value="2">F2</option>
						<option value="3">F3</option>
					</select>
				</div>
				<div class="col-md-4 help-block" id="show_floor_area"></div>
			</div>
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件位置<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-2">
					<input type="text" class="form-control" placeholder="经度"
						name="eventLng" id="eventLng" valid="r" validTitle="必填项"
						validInfoArea="show_lng_area" />
				</div>
				<div class="col-md-2">
					<input type="text" class="form-control" placeholder="纬度"
						name="eventLat" id="eventLat" valid="r" validTitle="必填项"
						validInfoArea="show_lng_area" />
				</div>
				<div class="col-md-1">
					<a class="point"
						style="text-shadow: none; color: #5b9bd1; cursor: pointer;"
						id="showMap"> <i style="font-size: 26px;"
						class="fa fa-map-marker"></i>
					</a>
				</div>
				<div class="col-md-4 help-block" id="show_lng_area"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件时间<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<input type="text" class="Wdate form-control" name="alarmTime"
						id="alarmTime"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" valid="r"
						validTitle="必填项" validInfoArea="show_time_area">
				</div>
				<div class="col-md-4 help-block" id="show_time_area"></div>
			</div>
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">报警方式<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<select name="alarmType" class="form-control" id="alarmType"
						valid="r" validTitle="必填项" validInfoArea="show_alarm_area">
						<option value="">请选择报警方式</option>
						<option value="1">对讲</option>
						<option value="2">电话</option>
					</select>
				</div>
				<div class="col-md-4 help-block" id="show_alarm_area"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">报警人<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<input type="text" class="form-control" placeholder="报警人"
						name="alarmMan" id="alarmMan" valid="r|l2-le8" validTitle="必填项"
						validInfoArea="show_man_area" />
				</div>
				<div class="col-md-4 help-block" id="show_man_area"></div>
			</div>
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">报警人类别<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<select name="alarmManType" class="form-control" id="alarmManType"
						valid="r" validTitle="必填项" validInfoArea="show_man_type_area">
						<option value="">请选择报警人类别</option>
						<option value="1">机场人员</option>
						<option value="2">公众</option>
					</select>
				</div>
				<div class="col-md-4 help-block" id="show_man_type_area"></div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">报警人电话<span
					class="required" style="color: red;">* </span></label>
				<div class="col-md-5" style="text-align: left;">
					<input type="text" class="form-control" placeholder="报警人电话"
						name="alarmContact" id="alarmContact" valid="r|phone" validTitle="必填项"
						validInfoArea="show_contact_area" />
				</div>
				<div class="col-md-4 help-block" id="show_contact_area"></div>
			</div>
			<div class="col-md-6">
				<label class="col-md-3 control-label" style="text-align: right;">事件描述</label>
				<div class="col-md-8" style="text-align: left;">
					<textarea name="eventNote" class="form-control" rows="5"
						placeholder="事件描述" id="eventNote" ></textarea>
				</div>
				
			</div>
		</div>
	</div>
	<div style="text-align: center; margin-top: 40px;">
		<input type="button" value="提交" class="sbtn sbtn-blue sbtn30"
			id="subBtn" onclick="submit_2_1_1();" /> 
		<input type="button" class="sbtn sbtn-default sbtn30" onclick="history.go(-1)"
			style="margin-left: 45px" value="返回" />
	</div>
</form>
<!-- map -->
<div id="gisDiv" style="width: 1200px;display:none;"  draggable="true">
	<div style="height: 50px; width: 1200px; background: #8BA1B5">
		<div style="padding-top: 15px; padding-left: 10px;">选择资源位置</div>
	</div>
	<div style="height: 500px; width: 1200px;">
		<div id="bglayer" style="width: 100%;height: 500px;background-color: #f7f7f7;z-index: 5000;position: absolute;">
			<h1 style="position: absolute;font-size:50px;top: 30%;left: 43%;font-weight: bolder;color:#67809f;vertical-align: middle;">地图加载中。。。</h1>
			<img src="<%=path%>/img/gis/tool/timg.gif" style=" position: absolute;top: 40%;left: 50%;"/>
	    </div>
		<div id='map2' style="overflow:hidden;top:50px;width:100%;height: 500px;"></div>
		<div id='map' style="width:100%;height: 100%;z-index: 1000;overflow:hidden"></div>
		<div id='buffer' style="display: none">
			<em>Waiting for data...</em>
		</div>
		<!-- 初始化点线面工具 防止报错 -->
		<div style="width: 160px; height: 32px; display: none">
			<img alt="" id="drawmarker" title="画点"
				src="<%=path%>/img/equipment/point.png" /> <img alt=""
				id="drawpolyline" title="画线"
				src="<%=path%>/img/equipment/wire.png" /> <img alt=""
				id="drawpolygon" title="画面"
				src="<%=path%>/img/equipment/cover.png" /> <img alt="" id="dis"
				title="测距" src="<%=path%>/img/equipment/ceju.png" /> <img alt=""
				id="area" title="侧面" src="<%=path%>/img/equipment/cemian.png" />
		</div>
	</div>
	<div style="height: 50px; width: 1200px; background: #8BA1B5">
		<div class="row" style="padding-top: 10px;">
			<div class="col-md-12" style="text-align: center;">
				<button type="button" class="sbtn sbtn-blue sbtn30" id="sub_btn">确定
				</button>
				<button style="margin-left: 45px;" type="button"
					class="sbtn sbtn-default sbtn30" id="cancel_btn">取消</button>
			</div>
		</div>
	</div>
</div>
<!-- map -->
<script type="text/javascript" src="<%=path%>/js/airport/map.js"></script>
<script type="text/javascript" src="<%=path%>/js/gis/jquery-ui.min.js"></script>
<script type="text/javascript">
map.setMinZoom(20);
$(document).ready(function() {
	$("#gisDiv").hide();
	//$("#gisDiv").draggable();
	$("#showMap").click(function() {
		$("#gisDiv").show();
		map.resize();
	});
	$("#cancel_btn").click(function() {
		$("#gisDiv").hide();
	})
})
$(function() {
	$("#sub_btn").click(function() {
		$("#gisDiv").hide();
	});
})
var mark = new Array();
addEvent("click", addPoint);
function addPoint(e) {
	for (var i = 0; i < mark.length; i++) {
		mark[i].remove();
	}
	mark = new Array();
	var el = document.createElement('div');
	el.id = createUniqueID();
	el.className = 'marker';
	el.style.backgroundImage = 'url(/qdsodb/img/gis/day.png)';
	el.style.position = 'absolute';
	el.style.width = "24px";
	el.style.height = "24px";

	marker = new vmapx.Marker(el).setLngLat(
			[ e.lngLat.lng, e.lngLat.lat ]).addTo(map);
	mark.push(marker);
	el.addEventListener('click', function(e) {
		if (marker) {
			if (e && e.stopPropagation)
				e.stopPropagation();
			else
				window.event.cancelBubble = true;

			var html = '<div class="layer-content" style="">';
			html += '<table>';

			html += '<tr>';
			html += '<th>经度：</th>';
			html += '<td>' + marker.getLngLat().lng + '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<th>纬度：</th>';
			html += '<td>' + marker.getLngLat().lat + '</td>';
			html += '</tr>';

			html += '</table>';
			html += '</div>';
			if (popup) {
				popup.remove();
				popup = null;
			}
			popup = new vmapx.Popup({
				offset : new vmapx.Point(-5, -20)
			}).setLngLat(marker.getLngLat()).setHTML(html).addTo(map);
		}
	}, false);
	document.getElementById("eventLng").value = e.lngLat.lng;
	document.getElementById("eventLat").value = e.lngLat.lat;
}
//表单验证
var validator_2_1_1;
function submit_2_1_1() {
	if (!validator_2_1_1.validResult()) {
		return;
	}
	$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
	document.getElementById("eventForm").submit();
}
$(function() {
	validator_2_1_1 = $.fn.dlshouwen.validator.init($('#eventForm'));
});
</script>
</body>
</html>