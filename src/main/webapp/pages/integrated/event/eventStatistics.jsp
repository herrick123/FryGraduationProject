<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>安全事件统计</title>
</head>
<body>
<div style="margin:10px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
	<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">安全事件统计--事件类型</font>
</div>
<div class="row">
    <div class="col-md-12">
		<span>事件发生时间:</span>
		<input type="text" placeholder="从" class="Wdate form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" style="display:inline-block;width:12%;"> 
		<span>-</span> 
		<input type="text" placeholder="至" class="Wdate form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" style="display:inline-block;width:12%;">
		<button class="sbtn sbtn-blue sbtn30" type="button">查询</button>		
   </div>
</div>
<div class="row">
   <div class="col-md-4" id="eventType" style="height:200px;margin-top:20px;">
   </div>
   <div class="col-md-4 hidden" id="eventTypeShow" style="height:200px;width:570px;margin-top:20px;">
   </div>
   <div class="col-md-8">
	   <div class="tabbable" style="margin-top:10px;">
			<div class="tab-content">
				<div class="tab-pane active">
					<div id="eventTypeDataList" class="dlshouwen-grid-container"
						style="margin-top: 5px;"></div>
					<div id="eventTypePage" class="dlshouwen-grid-toolbar-container"></div>
				</div>
			</div>
		</div>
   </div>
</div>
</body>
<div style="margin:10px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
	<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">安全事件统计--发生区域</font>
</div>
<div class="row">
    <div class="col-md-12">
		<span>事件发生时间:</span>
		<input type="text" placeholder="从" class="Wdate form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" style="display:inline-block;width:12%;"> 
		<span>-</span> 
		<input type="text" placeholder="至" class="Wdate form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" style="display:inline-block;width:12%;">
		<button class="sbtn sbtn-blue sbtn30" type="button">查询</button>		
   </div>
</div>
<div class="row">
   <div class="col-md-4" id="eventArea" style="height:200px;margin-top:20px;">
   </div>
   <div class="col-md-4 hidden" id="eventAreaShow" style="height:200px;width:570px;margin-top:20px;">
   </div>
   <div class="col-md-8">
	   <div class="tabbable" style="margin-top:10px;">
			<div class="tab-content">
				<div class="tab-pane active">
					<div id="eventAreaDataList" class="dlshouwen-grid-container"
						style="margin-top: 5px;"></div>
					<div id="eventAreaPage" class="dlshouwen-grid-toolbar-container"></div>
				</div>
			</div>
		</div>
   </div>
</div>
<div style="margin:10px 0px 10px 30px; border-bottom: solid #2d456b thin;" >
	<font style="font-size: 16px; color: #2d456b;vertical-align: middle;">安全事件统计--事件级别</font>
</div>
<div class="row">
    <div class="col-md-12">
		<span>事件发生时间:</span>
		<input type="text" placeholder="从" class="Wdate form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" style="display:inline-block;width:12%;"> 
		<span>-</span> 
		<input type="text" placeholder="至" class="Wdate form-control" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'%y-%M-%d'})" style="display:inline-block;width:12%;">
		<button class="sbtn sbtn-blue sbtn30" type="button">查询</button>		
   </div>
</div>
<div class="row">
   <div class="col-md-4" id="eventLevel" style="height:200px;margin-top:20px;">
   </div>
   <div class="col-md-4 hidden" id="eventLevelShow" style="height:200px;width:570px;margin-top:20px;">
   </div>
   <div class="col-md-8">
	   <div class="tabbable" style="margin-top:10px;">
			<div class="tab-content">
				<div class="tab-pane active">
					<div id="eventLevelDataList" class="dlshouwen-grid-container"
						style="margin-top: 5px;"></div>
					<div id="eventLevelPage" class="dlshouwen-grid-toolbar-container"></div>
				</div>
			</div>
		</div>
   </div>
</div>
<script type="text/javascript" src="<%=path %>/js/integrated/eventStatistics.js"></script>
<script>
var datas = [
{ "id":"1" , "eventType":"1","eventNum":"220","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"2" , "eventType":"1","eventNum":"23","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"3" , "eventType":"1","eventNum":"120","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"4" , "eventType":"1","eventNum":"430","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
];
var eventTypeColumns = [
           {id :'id',title : '序号',type : 'number',columnClass : 'text-center',width:'50',resolution : 
           	function(value, record, column, grid, dataNo, columnNo) {
       			return dataNo + 1;
       		}
       	   },
           {id:'eventType', title:'安全事件类型', type:'string',  columnClass:'text-center', 
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
           {id:'eventNum', title:'安全事件总数', type:'string', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center',
           },
           {id:'percentage', title:'百分比', type:'string',  columnClass:'text-center'},
           {id:'confirmNum', title:'已确认', type:'string',  columnClass:'text-center'},
           {id:'alarmNum', title:'已处警', type:'string',  columnClass:'text-center'},
           {id:'dealNum', title:'已处理', type:'string',  columnClass:'text-center'},
           {id:'reliefNum', title:'已解除', type:'string',  columnClass:'text-center'},
                 ];
var eventTypeOption = {
		lang : 'zh-cn',
	    ajaxLoad : false,
	    //loadURL : '',
	    datas : datas,
	    columns : eventTypeColumns,
	    gridContainer : 'eventTypeDataList',
	    toolbarContainer : 'eventTypePage',
	    tools : 'refresh',
	    checkWidth : '20px',
	    pageSize : 20,
	    pageSizeLimit : [20, 50,100]
};
	
var eventTypeGrid = $.fn.dlshouwen.grid.init(eventTypeOption); 
eventTypeGrid.load();
var datasLevel = [
{ "id":"1" , "eventLevel":"一级","eventNum":"220","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"2" , "eventLevel":"二级","eventNum":"23","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"3" , "eventLevel":"三级","eventNum":"120","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"4" , "eventLevel":"一级","eventNum":"430","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
];
var eventLevelColumns = [
           {id :'id',title : '序号',type : 'number',columnClass : 'text-center',width:'50',resolution : 
           	function(value, record, column, grid, dataNo, columnNo) {
       			return dataNo + 1;
       		}
       	   },
           {id:'eventLevel', title:'安全事件级别', type:'string',  columnClass:'text-center', 
           },
           {id:'eventNum', title:'安全事件总数', type:'string', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center',
           },
           {id:'percentage', title:'百分比', type:'string',  columnClass:'text-center'},
           {id:'confirmNum', title:'已确认', type:'string',  columnClass:'text-center'},
           {id:'alarmNum', title:'已处警', type:'string',  columnClass:'text-center'},
           {id:'dealNum', title:'已处理', type:'string',  columnClass:'text-center'},
           {id:'reliefNum', title:'已解除', type:'string',  columnClass:'text-center'},
                 ];
var eventLevelOption = {
		lang : 'zh-cn',
	    ajaxLoad : false,
	    //loadURL : '',
	    datas : datasLevel,
	    columns : eventLevelColumns,
	    gridContainer : 'eventLevelDataList',
	    toolbarContainer : 'eventLevelPage',
	    tools : 'refresh',
	    checkWidth : '20px',
	    pageSize : 20,
	    pageSizeLimit : [20, 50,100]
};
	
var eventLevelGrid = $.fn.dlshouwen.grid.init(eventLevelOption); 
eventLevelGrid.load();
var datasArea = [
{ "id":"1" , "eventArea":"航站区","eventNum":"220","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"2" , "eventArea":"飞行区","eventNum":"23","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"3" , "eventArea":"公共区","eventNum":"120","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
{ "id":"4" , "eventArea":"控制区","eventNum":"430","percentage":"20%","confirmNum":"20","alarmNum":"20","dealNum":"20","reliefNum":"20"},
];
var eventAreaColumns = [
           {id :'id',title : '序号',type : 'number',columnClass : 'text-center',width:'50',resolution : 
           	function(value, record, column, grid, dataNo, columnNo) {
       			return dataNo + 1;
       		}
       	   },
           {id:'eventArea', title:'安全事件区域', type:'string',  columnClass:'text-center', 
           },
           {id:'eventNum', title:'安全事件总数', type:'string', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center',
           },
           {id:'percentage', title:'百分比', type:'string',  columnClass:'text-center'},
           {id:'confirmNum', title:'已确认', type:'string',  columnClass:'text-center'},
           {id:'alarmNum', title:'已处警', type:'string',  columnClass:'text-center'},
           {id:'dealNum', title:'已处理', type:'string',  columnClass:'text-center'},
           {id:'reliefNum', title:'已解除', type:'string',  columnClass:'text-center'},
                 ];
var eventAreaOption = {
		lang : 'zh-cn',
	    ajaxLoad : false,
	    //loadURL : '',
	    datas : datasArea,
	    columns : eventAreaColumns,
	    gridContainer : 'eventAreaDataList',
	    toolbarContainer : 'eventAreaPage',
	    tools : 'refresh',
	    checkWidth : '20px',
	    pageSize : 20,
	    pageSizeLimit : [20, 50,100]
};
	
var eventAreaGrid = $.fn.dlshouwen.grid.init(eventAreaOption); 
eventAreaGrid.load();
</script>
</html>