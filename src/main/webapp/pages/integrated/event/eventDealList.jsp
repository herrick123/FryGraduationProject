<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>安全事件接警</title>
</head>
<style type="text/css">
.btn .btn-default{background:#1f4a09;}
.clear{ clear:both;}

.form-inline .form-control{
	width:130px;
}

#exampleInputName2{height: 34px;padding: 6px 12px;}
.page-bar{background:#f7f7f7;}
body {
    background: #fff none repeat scroll 0 0;
}
ol, ul, li {
    list-style: outside none none;
}

#sys-step1 li {
    color: #888;
    float: left;
    position: relative;
    text-align: center;
}
#sys-step1 li.step1 {
    text-align: left;
    width: 120px;
}
#sys-step1 li.step1 p {
    margin-left: -0.8em;
}
#sys-step1 li.step2 p {
    text-align: left; 
}
#sys-step1 li.step3 p {
    text-align: left;
}
#sys-step1 li.step4 p {
    text-align: right;
}

#sys-step1 li.step2 {
    width: 185px;
}
#sys-step1 li.step3 {
    width: 185px;
}
#sys-step1 li.step4 {
    width: 185px;
}
#sys-step1 li.step5 {
	text-align:right;
    width: 160px;
}
.auto_border {
    background: #e6e6e6 none repeat scroll 0 0;
    height: 7px;
    position: absolute;
    top: 9px;
    width: 100%;
    z-index: -1;
}
#sys-step1 li i {
    background: #ccc none repeat scroll 0 0;
    border-radius: 50%;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    height: 24px;
    line-height: 24px;
    margin-bottom: 7px;
    text-align: center;
    width: 24px;
}

#sys-step1 li.step5 i,p{
	margin-left: 60px;
}

#sys-step1 li.active {
    color: #2d456b;
}
#sys-step1 li.active i, #sys-step1 li.active .auto_border {
    background: #2d456b none repeat scroll 0 0;
}
.modal-content{z-index: 1;}
#eventModal{
    position: absolute;
	left: 30%;
	top: 15%;
}
</style>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
			class="fa fa-angle-right"></i></li>
	    <li><a href="#">综合业务平台</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">安全事件管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">安全事件接警</a></li>
	</ul>
</div>
<div style="width:100%;padding:0px 10px;">
	<form class="form-inline" style="margin:10px 0px 10px 0px;" name="" method="post">	
	    <div class="form-group">
			<span>事件名称：</span>
			<input type="text" class="form-control"
				placeholder="请填写事件名称" id="eventName">
		</div>
		<div class="form-group" style="margin-left: 30px;">
			<span>事件类别：</span>
			<select id="eventType" class="form-control">
				<option value="">全部</option>
				<option value="1">公共安全类</option>
				<option value="2">消防安全类</option>
				<option value="3">安防安全类</option>
				<option value="4">空防安全类</option>
			</select>
		</div>
		<div class="form-group" style="margin-left:30px;">
	    	<span>采集方式：</span>
	   		<select id="eventSource" class="form-control">
				<option value="">全部</option>
				<option value="1">人工上报 </option>
				<option value="2">自动采集</option>
			</select>
		</div>
		<div class="form-group" style="margin-left:30px;">
	    	<button type="button" class="sbtn sbtn-blue"  id="searchBtn">查询</button>
		</div>	
	</form>
	<div class="row">
		<div class="col-md-12" style="background-color: #234377; height: 3px;"></div>
	</div>
	<ul class="nav nav-tabs" id="securityTable" style="margin-top: 10px">
			<li class="active"><a data-area-id="daichuliArea"
				style="cursor: pointer;">待处理</a></li>
			<li><a data-area-id="chuliArea" style="cursor: pointer;">已处理</a>
			</li>
			<li style="padding-top: 10px;padding-left: 250px">待分配事件：<font style="color: red;font-weight: bolder;"id="enum"></font>(件)&nbsp;&nbsp;已分配事件：<font style="color: red;font-weight: bolder;"id="ynum"></font>(件)</li>
	</ul>
	
	<div id="daichuliArea" class="area-test">
		<div id="daichuliTable" class="dlshouwen-grid-container"
			style="margin-top: 5px;"></div>
		<div id="daichuliPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
	<div id="chuliArea" class="area-test">
		<div id="chuliTable" class="dlshouwen-grid-container"
			style="margin-top: 5px;"></div>
		<div id="chuliPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
</div>
<div class="modal fade" tabindex="-1" role="dialog"
		id="safeTreatmentState1" aria-labelledby="myModalLabel" >
	<div class="modal-dialog" role="document" style="width: 1000px">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
					<font>处理状态</font>
				</h4>
			</div>
			<div class="modal-body" id="stateBody">
				<div id="sys-step1" class="floatright"style="clear:both;">
					<ul>
						<li class="step1 active"><i>1</i><p>事件报警</p><p id="bjtime"></p><p id="bjp"></p><div class="auto_border"></div></li>
						<li class="step2"><i>2</i><p>报警确认</p><p id="qrtime"></p><p id="qrp"></p><div class="auto_border"></div></li>
						<li class="step3"><i>3</i><p>报警处警</p><p id="jjtime"></p><p id="jjp"></p><div class="auto_border"></div></li>
						<li class="step4"><i>4</i><p>报警处理</p><p id="cltime"></p><p id="clp"></p><div class="auto_border"></div></li>
						<li class="step5 "><i>5</i><p>警报解除</p><div class="auto_border"></div></li>
					</ul>
				</div>
				<div style="clear:both;"></div>
			</div>
			<div class="modal-footer" >
				<button type="button" id="hideGlobalModalBtn"
					class="sbtn sbtn-blue" data-dismiss="modal">返回</button>
			</div>
		</div>
	</div>
</div>
</body>

<script type="text/javascript">
$(document).ready(function() {
var daichuliColumns = [
	{id :'id',title : '序号',type : 'number',columnClass : 'text-center',width:'50',
		resolution : function(value, record, column, grid, dataNo, columnNo) {
		    $("#enum").text(daichuligrid.pager.recordCount);
			return dataNo + 1;
		}
	},
	{id:'eventName', title:'事件名称', type:'string',  columnClass:'text-center',
		resolution : function(value, record, column, grid, dataNo,
				columnNo) {
			var content = '';
			var id = record.id;
			content += "<a href='<c:url value='/event/processDetail' />/"+id+"'>"+value+"</a>"
			return content;
		},
	},
	{id:'eventType', title:'事件类别', type:'string', columnClass:'text-center',
		resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value==1){
				return "公共安全类";
			}else if(value==2){
				return "消防安全类";
			}else if(value==3){
				return "安防安全类";
			}else if(value==4){
				return "空防安全类";
			}
    	}
	},	
	{id:'alarmTime', title:'报警时间', type:'date',format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center'},
	{id:'alarmMan', title:'报警人', type:'string', columnClass:'text-center'},
	{id:'eventSource', title:'采集方式', type:'string', columnClass:'text-center',
		resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value==1){
				return "人工上报";
			}else if(value==2){
				return "自动采集";
			}
    	}
	},
	{id:'eventState', title:'处理状态', type:'string', columnClass:'text-center',	resolution : function(value, record, column, grid, dataNo,
			columnNo) {
		var content = '';
 		var atime = record["alarmTime"];
 		var man = record["alarmMan"];
 		var eventId = record["id"];
		content += '<a href="javascript:void(0)" onclick="doState(1,\'';
		content += eventId;
		content += '\',\'';
		content += atime;
		content += '\',\'';
		content += man;
		content += '\')">待分配</a>';
		 return content;
	}},
	{id:'caozuo', title:'操作', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
		 var content = "";
			 content += "<a href='<c:url value='/event/eventDealPage' />/"+record.id+"'>"+'<button class="sbtn sbtn-blue" style="height:32px; line-height:10px;"">填写处理意见</button></a>';			
		 return content;
	}}
];

var chuliColumns = [
	{id :'id',title : '序号',type : 'number',columnClass : 'text-center',width:'50',resolution : 
		function(value, record, column, grid, dataNo, columnNo) {
		    $("#ynum").text(chuligrid.pager.recordCount);
			return dataNo + 1;
		}
	},               
	{id:'eventName', title:'事件名称', type:'string',  columnClass:'text-center',
		resolution : function(value, record, column, grid, dataNo,
				columnNo) {
			var content = '';
			var id = record.id;
			content += "<a href='<c:url value='/event/processDetail' />/"+id+"'>"+value+"</a>";
			return content;
		},
	},
	{id:'eventType', title:'事件类别', type:'string', columnClass:'text-center',
		resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value==1){
				return "公共安全类";
			}else if(value==2){
				return "消防安全类";
			}else if(value==3){
				return "安防安全类";
			}else if(value==4){
				return "空防安全类";
			}
    	}	
	},	
	{id:'alarmTime', title:'报警时间', type:'date',format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center'},
	{id:'alarmMan', title:'报警人', type:'string', columnClass:'text-center'},
	{id:'updateId', title:'确认人', type:'String',columnClass:'text-center'},
	{id:'eventSource', title:'采集方式', type:'string', columnClass:'text-center',
		resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value==1){
				return "人工上报";
			}else if(value==2){
				return "自动采集";
			}
    	}	
	},
	{id:'eventState', title:'处理状态', type:'string', columnClass:'text-center',	resolution : function(value, record, column, grid, dataNo,
			columnNo) {
		var content = '';
 		var atime = record["alarmTime"];
 		var man = record["alarmMan"];
 		var eventId = record["id"];
		content += '<a href="javascript:void(0)" onclick="doState(4,\'';
		content += eventId;
		content += '\',\'';
		content += atime;
		content += '\',\'';
		content += man;
		content += '\')">已处理</a>';	
		 return content;
	}},
	{id:'caozuo', title:'操作', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
		 var content = "";
			 content += "<a href='<c:url value='/event/reliefDetail' />/"+record.id+"'>"+'<button class="sbtn sbtn-blue" style="height:32px; line-height:10px;"">事件解除</button></a>';			
		 return content;
	}}
];

var daichuli = {
	lang : 'zh-cn',
	ajaxLoad : true,
	loadURL : '<c:url value="/event/eventPageList" />',
	exportFileName : '用户列表',
	columns : daichuliColumns,
	gridContainer : 'daichuliTable',
	toolbarContainer : 'daichuliPage',
	tools : 'refresh',
	pageSize : 20,
	pageSizeLimit : [20, 50]
};
var chuli = {
		lang : 'zh-cn',
		ajaxLoad : true,
		exportFileName : '用户列表',
		loadURL : '<c:url value="/event/eventPageList" />',
		columns : chuliColumns,
		gridContainer : 'chuliTable',
		toolbarContainer : 'chuliPage',
		tools : 'refresh',
		pageSize : 20,
		pageSizeLimit : [20, 50]
	};


//待确认列表
var daichuligrid = $.fn.dlshouwen.grid.init(daichuli);
//已确认
var chuligrid = $.fn.dlshouwen.grid.init(chuli);

//第一次加载
daichuligrid.parameters = new Object();
daichuligrid.parameters['eventState'] = "3";
daichuligrid.parameters['eventSource'] = $("#eventSource").val();
daichuligrid.parameters['eventName'] = $("#eventName").val();
daichuligrid.parameters['eventType'] = $("#eventType").val();
chuligrid.parameters = new Object();
chuligrid.parameters['eventState'] = "4";
chuligrid.parameters['eventSource'] = $("#eventSource").val();
chuligrid.parameters['eventName'] = $("#eventName").val();
chuligrid.parameters['eventType'] = $("#eventType").val();
$("#enum").text("0");
$("#ynum").text("0");
daichuligrid.load();
chuligrid.load();
$('#searchBtn').click(function(){
	daichuligrid.parameters = new Object();
	daichuligrid.parameters['eventSource'] = $("#eventSource").val();
	daichuligrid.parameters['eventName'] = $("#eventName").val();
	daichuligrid.parameters['eventType'] = $("#eventType").val();
	daichuligrid.parameters['eventState'] = "3";
	chuligrid.parameters = new Object();
	chuligrid.parameters['eventSource'] = $("#eventSource").val();
	chuligrid.parameters['eventName'] = $("#eventName").val();
	chuligrid.parameters['eventType'] = $("#eventType").val();
	chuligrid.parameters['eventState'] = "4";
	$("#enum").text("0");
	$("#ynum").text("0");
	daichuligrid.load();
	chuligrid.load(); 
});
$("#chuliArea").hide();
$('#securityTable a').click(function(e) {
	e.preventDefault();//阻止a链接的跳转行为 
	var area = $(this).attr("data-area-id");
	if ($(".btn-default").css("display") == "none") {
		$(".btn-default").css('display','block');
	}else{
		$(".btn-default").css('display','none');
	}
	$(".area-test").hide();
	$("#" + area).show();
	$(this).tab('show');//显示当前选中的链接及关联的content
});
})
function doState(num,eventId,time,man){
	var confirmTime;
	var confirmName;
	var alarmTime;
	var alarmName;
	var dealTime;
	var dealName;
	$.ajax({
		url: "<c:url value='/eventProcess/processDetailOfEvent' />",
		type:"POST",
		data:{id:eventId},
	 	dataType:'json',
	 	success : function(msg) {
		 		var jsonText = eval(msg);
		 		for( var j = 0; j < jsonText.length;j++){
	 			   
	 			   if(jsonText[j].eventState == '2'){
		 			   confirmTime =jsonText[j].createTime; 	
		 			   confirmName = jsonText[j].handleMan;
		 			  $('#qrtime').text($.myTime.UnixToDate(confirmTime,true));
		 			  $('#qrp').text("确认人:"+confirmName);
		 			  $('.step2').addClass('active');
	 			   } else if(jsonText[j].eventState == '3'){
	 				   alarmTime = jsonText[j].createTime;
		 			   alarmName = jsonText[j].handleMan;
			 		   $('#jjtime').text($.myTime.UnixToDate(alarmTime,true));
		 			   $('#jjp').text("接警人:"+alarmName);
		 			   $('.step3').addClass('active');
	 			   }else if(jsonText[j].eventState == '4'){
	 				   dealTime = jsonText[j].createTime;
		 			   dealName = jsonText[j].handleMan;
			 		   $('#cltime').text($.myTime.UnixToDate(dealTime,true));
		 			   $('#clp').text("处理人:"+dealName);
		 			  $('.step4').addClass('active');
	 			   }
	 		    }
	    	},
		error : function() {	
			showMsg('系统暂不可用，请稍后再试！');
		}
	});
	$('#bjtime').text($.myTime.UnixToDate(time,true));
	$('#bjp').text("报警人:"+man);
    $('#safeTreatmentState1').modal('show');	
}
</script>
</html>