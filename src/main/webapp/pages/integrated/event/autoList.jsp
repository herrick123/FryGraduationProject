<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>自动采集</title>
</head>
<style>
</style>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
			class="fa fa-angle-right"></i></li>
		<li><a href="#">综合业务平台</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">安全事件管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">自动采集</a></li>
	</ul>
</div>
<div style="width: 100%; padding: 0px 10px;">
	<form class="form-inline" style="margin: 10px 0px 10px 0px;">
		<input type="hidden" class="form-control" id="eventSource" value="2">
		<div class="form-group">
			事件名称：
			<input type="text" class="form-control"
				placeholder="请填写事件名称" id="eventName">
		</div>
		<div class="form-group" style="margin-left: 30px;">
			事件类别：
			<select id="eventType" class="form-control">
				<option value="">全部</option>
				<option value="1">公共安全类</option>
				<option value="2">消防安全类</option>
				<option value="3">安防安全类</option>
				<option value="4">空防安全类</option>
			</select>
		</div>
		<div class="form-group" style="margin-left: 30px;">
			处理状态：
			<select id="eventState" class="form-control">
				<option value="">全部</option>
				<option value="1">待确认</option>
				<option value="2">已确认</option>
				<option value="5">已解除</option>
			</select>
		</div>
		<div class="form-group" style="margin-left: 30px;">
			<button type="button" class="sbtn sbtn-blue" id="searchBtn">查询</button>
		</div>
	</form>
	<div class="row">
		<div class="col-md-12"
			style="background-color: #234377; height: 3px;"></div>
	</div>		
	<div class="tabbable" style="margin-top:10px;">
		<div class="tab-content">
			<div class="tab-pane active" id="manual">
				<div id="manualDataList" class="dlshouwen-grid-container"
					style="margin-top: 5px;"></div>
				<div id="manualPage" class="dlshouwen-grid-toolbar-container"></div>
			</div>
		</div>
	</div>
</div>	
<%-- 安全事件处理状态的弹窗1--%>
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
						<li class="step5"><i>5</i><p>警报解除</p><p id="jctime"></p><p id="jcp"></p><div class="auto_border"></div></li>
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
//人工采集
var manualColumns = [
    {id:'id', title:'主键ID', type:'string', hide:true},
    {id :'id',title : '序号',type : 'number',columnClass : 'text-center',width:'50',resolution : 
    	function(value, record, column, grid, dataNo, columnNo) {
			return dataNo + 1;
		}
	},
    {id:'eventName', title:'事件名称', type:'string', columnClass:'text-center', 
    	resolution:function(value, record, column, grid, dataNo, columnNo){
    		var id = record.id;
    		var content = "<a href='<c:url value='/event/processDetail' />/"+id+"'>"+value+"</a>";
			return content;
    	}
    },
    {id:'eventType', title:'事件类型', type:'string',  columnClass:'text-center', 
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
    {id:'eventLevel', title:'事件级别', type:'string',  columnClass:'text-center', 
    	resolution:function(value, record, column, grid, dataNo, columnNo){
			if(value==1){
				return "一级";
			}else if(value==2){
				return "二级";
			}else if(value==3){
				return "三级";
			}else if(value==4){
				return "四级";
			}
    	}
    },
    {id:'eventSource', title:'事件来源', type:'string', hide:true},
    {id:'alarmTime', title:'报警时间', type:'date', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center',
    },
    {id:'equName', title:'设备名称', type:'string',  columnClass:'text-center'},
    {id:'equType', title:'设备类型', type:'string',  columnClass:'text-center'},
    {id:'eventState', title:'事件状态', type:'string',  columnClass:'text-center', 
    	resolution:function(value, record, column, grid, dataNo, columnNo){
    		var content = '';
    		var atime = record["alarmTime"];
	 		var man = record["equName"];
	 		var eventId = record["id"];
    	 	if(value==1){
    			content += '<a href="javascript:void(0)" onclick="doState(1,\'';
    			content += eventId;
    			content += '\',\'';
    			content += atime;
    			content += '\',\'';
    			content += man;
    			content += '\')">待确认</a>';
    		} else if(value == 2){
    			content += '<a href="javascript:void(0)" onclick="doState(2,\'';
    			content += eventId;
    			content += '\',\'';
    			content += atime;
    			content += '\',\'';
    			content += man;
    			content += '\')">已确认</a>';
    	 	} else if(value == 3){
    	 		var atime = record["alarmTime"];
    	 		var man = record["alarmMan"];
    	 		var eventId = record["id"];
    			content += '<a href="javascript:void(0)" onclick="doState(5,\'';
    			content += eventId;
    			content += '\',\'';
    			content += atime;
    			content += '\',\'';
    			content += man;
    			content += '\')">已处警</a>';
    	 	} else if(value == 4){
    	 		var atime = record["alarmTime"];
    	 		var man = record["alarmMan"];
    	 		var eventId = record["id"];
    			content += '<a href="javascript:void(0)" onclick="doState(5,\'';
    			content += eventId;
    			content += '\',\'';
    			content += atime;
    			content += '\',\'';
    			content += man;
    			content += '\')">已处理</a>';
    	 	} else {
    	 		var atime = record["alarmTime"];
    	 		var man = record["alarmMan"];
    	 		var eventId = record["id"];
    			content += '<a href="javascript:void(0)" onclick="doState(5,\'';
    			content += eventId;
    			content += '\',\'';
    			content += atime;
    			content += '\',\'';
    			content += man;
    			content += '\')">已解除</a>';
    	 	}
    		 return content;       		
    	}
    }
];
 
var manualOption = {
		lang : 'zh-cn',
	    ajaxLoad : true,
	    loadURL : '<c:url value="/event/eventPageList" />',
	    columns : manualColumns,
	    gridContainer : 'manualDataList',
	    toolbarContainer : 'manualPage',
	    tools : 'refresh',
	    checkWidth : '20px',
	    pageSize : 20,
	    pageSizeLimit : [20, 50,100]
};
	
var manualGrid = $.fn.dlshouwen.grid.init(manualOption); 


$(function(){
	manualGrid.parameters = new Object();
	manualGrid.parameters['eventSource'] = "2";
	manualGrid.parameters['eventName'] = $("#eventName").val();
	manualGrid.parameters['eventType'] = $("#eventType").val();
	manualGrid.parameters['eventState'] = $("#eventState").val();
	manualGrid.refresh(true);
	$('#searchBtn').click(searchData); 
	manualGrid.load();
 	$("#manualTab").click(function(){
		$("#eventSource").val("2");
		$("#addBtn").show();
	});
});
function searchData(){
	manualGrid.parameters = new Object();
	manualGrid.parameters['eventSource'] = "2";
	manualGrid.parameters['eventName'] = $("#eventName").val();
	manualGrid.parameters['eventType'] = $("#eventType").val();
	manualGrid.parameters['eventState'] = $("#eventState").val();
	manualGrid.refresh(true);
}
$("#addBtn").click(function(){
	window.location.href = '<c:url value="/event/add" />';
})
//控制时间状态弹框
function doState(num,eventId,time,man){
	var confirmTime;
	var confirmName;
	var reliefTime;
	var reliefName;
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
		 			   }else if(jsonText[j].eventState == '3'){
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
		 			   }else if(jsonText[j].eventState == '5'){
		 				   reliefTime = jsonText[j].createTime;
			 			   reliefName = jsonText[j].handleMan;
				 		   $('#jctime').text($.myTime.UnixToDate(reliefTime,true));
			 			   $('#jcp').text("解除人:"+reliefName);
			 			   $('.step5').addClass('active');
		 			   }
	 		    }
	    	},
		error : function() {	
			showMsg('系统暂不可用，请稍后再试！');
		}
	});
	$('#bjtime').text($.myTime.UnixToDate(time,true));
	$('#bjp').text("报警设备:"+man);
    $('#safeTreatmentState1').modal('show');	
}
</script>
</html>