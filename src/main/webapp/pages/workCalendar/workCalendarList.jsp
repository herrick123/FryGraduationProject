<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset='utf-8' />
<%@include file="/pages/inc/header.jsp"%>
<link href='<%=path%>/css/calendar/fullcalendar.min.css' rel='stylesheet' />
<link href='<%=path%>/css/calendar/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<script src='<%=path%>/js/fullcalendar/moment.min.js'></script>
<script src='<%=path%>/js/fullcalendar/fullcalendar.min.js'></script>
<script type="text/javascript" src="<%=path%>/js/laydate.js"></script>
<style>
	body {
		margin: 40px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}

	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}
</style>
<body>
	<div class="sodb-page-home">
	    <ul class="sodb-page-ul">
	        <li>
	            <i class="fa fa-home"></i>
	            <a href="#">猛码学员管理</a>
	            <i class="fa fa-angle-right"></i>
	        </li>
	        <li><a href="#">为参与项目学员安排工作内容</a></li>
	    </ul>
	</div>
	<div class="row" style="margin:0px;">
	    <div class="col-md-12">
	    	<div class="col-md-12" style="background-color:#234377; height:3px;"></div>
	        <div class="form-group" style="line-height: 40px;">
        		<span class="col-sm-4 control-label">项目经理填写学员每日情况（点击日期增加事件及用到的技能标签）：</span><br>
        	</div>
	        <div id="empLeaveDataList" class="dlshouwen-grid-container"></div>
	        <div id="empLeavePage" class="dlshouwen-grid-toolbar-container"></div>
	    </div>
	</div>
	<div class="col-md-12" style="background-color:#234377; height:3px;margin-top: 7px;"></div>
	<div id='calendar' style="margin-left: 10px;margin-top: 40px;"></div>
	<form name="" class="form-horizontal" id="workForm" action="" method="post" style="margin-left: 600px;margin-top: -650px;width: 80%;">
	    <div class="row" style="margin-top: 50px;">
	        <div class="form-group" style="margin-top: -10px">
	            <span  for="areaCode" class="col-sm-4 control-label"></span>
	            <div class="col-md-4">
	             <!--  员工id -->
	        	<input type="hidden" id="employeeId"  name="employeeId" value="${employeeId}">
	      		<!--  项目id -->
	        	<input type="hidden" id="projectId" name="projectId" value="${projectId }">
	            <input type="hidden"  id="id" name="id" value="" >
	                <input type="text" class="form-control input-radius" id="stime" name="stime" value="" placeholder="任务起始时间"  aria-describedby="sizing-addon2">
	            </div>
	        </div>
	        <br>
	        <div class="form-group" style="margin-top: -10px">
	            <span  class="col-sm-4 control-label"></span>
	            <div class="col-md-4">
	                <input type="text" class="form-control input-radius" id="etime" name="etime" value="" placeholder="任务结束时间" >
	            </div>
	        </div>
	        <div class="form-group" style="margin-top: 30px">
	            <span class="col-sm-4 control-label"></span>
	            <div class="col-md-4">
	            	<textarea rows="10" cols="50px" class="form-control input-radius" id="tast" name="tast"  placeholder="请输入任务内容" aria-describedby="sizing-addon2"></textarea>
	            </div>
	        </div>
	    </div>
	    <div class="row" style="margin-top: 20px;">
	        <div class="col-md-12" style="text-align: center;">
	        <button class="sbtn sbtn-blue sbtn30" type="button" id="addBtn" >添加</button>
	        <button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn" style="display: none">修改</button>
	        </div>
	    </div>
	</form>
	<script type="text/javascript">
	    var empLeaveColumns = [
	    	{id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
				return dataNo+1;
			}},
	        {id:'id', title:'主键', type:'string', hide:true},
	        {id:'employeeId', title:'员工主键', type:'string',hide:true},
	        {id:'projectId', title:'项目id', type:'string',hide:true },
	        {id:'employeeCode', title:'员工编号', type:'string', columnClass:'text-center'},
	        {id:'employeeName', title:'员工名称', type:'string', columnClass:'text-center'},
	        {id:'length', title:'请假时长', type:'string', columnClass:'text-center'},
	        {id:'reason', title:'请假原因', type:'string', columnClass:'text-center'},
	        {id:'operation', title:'是否批准', type:'string', columnClass:'text-center'},
	        {id:'proStartTime', title:'项目开始时间', type:'date', hide:true,format:'yyyy-MM-dd',otype:'time_stamp_ms',columnClass:'text-center'},
	        {id:'proEndTime', title:'项目结束时间', type:'date', hide:true,format:'yyyy-MM-dd',otype:'time_stamp_ms',columnClass:'text-center'},
	        {id:'startTime', title:'开始时间', type:'date',width:120 ,format:'yyyy-MM-dd',otype:'time_stamp_ms',columnClass:'text-center'},
	        {id:'endTime', title:'结束时间', type:'date',width:120,format:'yyyy-MM-dd ',otype:'time_stamp_ms',columnClass:'text-center'},
	        {id:'type', title:'请假类型', type:'string',  columnClass:'text-center'}
	    ];
	    var empLeaveOption = {
	    	lang : 'zh-cn',
	        ajaxLoad : true,
	        loadURL : '<c:url value="/empLeave/pageList" />',
	        columns : empLeaveColumns,
	        gridContainer : 'empLeaveDataList',
	        toolbarContainer : 'empLeavePage',
	        tools : 'refresh',
	        check : true,
	        checkWidth : '30px',
	        pageSize : 5,
	        pageSizeLimit : [5,10,20],
	    	onCellMouseOver : function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
	    }
	    };
	    var empLeaveGrid = $.fn.dlshouwen.grid.init(empLeaveOption);
	  	$(function(){
	  		empLeaveGrid.parameters = new Object();
	  		empLeaveGrid.parameters['employeeId'] = $("#employeeId").val();
	  		empLeaveGrid.load();
	    });
	  	//时间的初始化
 	    laydate.render({
 	      		  elem: '#stime',
 	      	});
 	      	laydate.render({
 	      		  elem: '#etime',
 	      	});
 	      	function check() {
 	      		var startTime = document.getElementById("stime").value;
 	      		var endTime = document.getElementById("etime").value;
 	      		
 	      		if (startTime == "" || endTime == "") {
 	      			showMsg("开始日期和结束日期不能为空！");
 	      			return false;
 	      		}
 	      		 var flag = setvalue();
 	      			return flag;
 	      	}
 	      	function setvalue() {
 	      		var date1 = document.getElementById('stime').value;
 	      		var date2 = document.getElementById('etime').value;
 	      		var currentday = new Date();
 	      		currentday = new Date(currentday.getFullYear(), currentday.getMonth(), currentday.getDate());
 	      		var startTime = new Date(Date.parse(date1.replace(/-/g, "/"))); //转换成Date();
 	      		var endTime = new Date(Date.parse(date2.replace(/-/g, "/"))); //转换成Date();
 	      		if (date1 == "") {
 	      			showMsg("开始日期不能为空！");
 	      			return false;
 	      		}
 	      		if (date2 == "") {
 	      			showMsg("结束日期不能为空！");
 	      			return false;
 	      		}
 	      		var day = (Number(endTime) - Number(startTime))
 	      				/ (1000 * 60 * 60 * 24);
 	      		if (day < 0) {
 	      			showMsg("请假结束日期不能早于请假开始日期，请重新选择日期！");
 	      			return false;
 	      		}
 	      		return true;
 	      	}
 	      	function convertStringToDate(dateString) {
 	      		dateString = dateString.split('-');
 	      		return new Date(dateString[0], dateString[1] - 1, dateString[2]);
 	      	};
 	      	
 	     //点击添加按钮
 		  	$("#addBtn").click(function(){
 		  		$.ajax({
 		  	         type: "POST",
 		  	         url:'<c:url value='/calendar/save' />',
 		  	         data:$('#workForm').serialize(),// 要提交的表单
 		  	         success: function(data,textStatus) {
 		  	        	if(data.returncode != '10000'){
 		  	        		document.getElementById("etime").value = null;
 							document.getElementById("stime").value =null;
 			  	  	  		document.getElementById("tast").value =null;//清空内容
 			  	        	$('#calendar').fullCalendar('refetchEvents');
 			  	        	showMsg('添加成功');
 		  	        	}
 		  	        	else{
 		  	        		 showMsg('添加失败！请联系开发人员！');
 		  	        	}
 		  	         }
 		  	     });
 		  	});
	  	
	  	//点击修改
	  	$("#subBtn").click(function(){
	  		$.ajax({
	  	         type: "POST",
	  	         url:'<c:url value='/calendar/update'/>',
	  	         data:$('#workForm').serialize(),// 要提交的表单
	  	         success: function(data,textStatus) {
	  	        	
	  	        	if(data.returncode != '10000'){
	  	        		document.getElementById("etime").value = null;
						document.getElementById("stime").value =null;
		  	  	  		document.getElementById("tast").value =null;//清空内容
		  	        	$('#calendar').fullCalendar('refetchEvents');
		  	        	showMsg('修改成功');
	  	        	}
	  	        	else{
	  	        		showMsg('修改失败！请联系开发人员！');
	  	        	}
	  	         }
	  	     });
	  	});
		  	        	
	  	//清空任务详情
	  	document.getElementById("tast").value =null;
	  	//定义对象接受json
		var eventss;
		//ajax 动态查询
		var employeeId=$("#employeeId").val();
		var projectId=$("#projectId").val();
		$('#calendar').fullCalendar({
			defaultDate: new Date(),
			editable: true,
			eventLimit: true, // allow "more" link when too many events
			//点击日历中某一天执行
			dayClick : function( date ) {
				//do something here...
				$("#addBtn").show();
				$("#subBtn").hide();
				document.getElementById("etime").value = null;
				document.getElementById("stime").value =null;
  	  	  		document.getElementById("tast").value =null;//清空内容
				document.getElementById("stime").value =date.format();
				console.log('dayClick触发的时间为：', date.format());
				// ...
			},
			//初始化数据
			events:function(start,end,timezone, callback){
				var events;
				var date = this.getDate().format('YYYY-MM-DD');
				$.ajax({
		            type:"POST",
		            dataType:"json",
		            async:false,
		            url:'<c:url value="/calendar/page" />',
		            data:"employeeId="+employeeId+"&projectId="+projectId+"&date="+date,
		            success:function(data,textStatus){
		            	events = data;
		            },
		            error:function(data){
		                showMsg("服务器异常，稍后尝试");
		            }
		        });
				 callback(events);
			},
			//任务被点击
			eventClick : function( event ){
				$("#addBtn").hide();
				$("#subBtn").show();
				$("#id").attr("value",'');//清空内容
				$("#id").attr("value",event.id);//填充内容
				document.getElementById("etime").value = event.end.format('YYYY-MM-DD');
				document.getElementById("stime").value =event.start.format('YYYY-MM-DD');
				document.getElementById("tast").value = event.title;
				//do something here...
				console.log('eventClick中选中Event的id属性值为：', event.id);
				console.log('eventClick中选中Event的title属性值为：', event.title);
				console.log('eventClick中选中Event的start属性值为：', event.start.format('YYYY-MM-DD'));
				console.log('eventClick中选中Event的end属性值为：', event.end.format('YYYY-MM-DD'));
				console.log('eventClick中选中Event的color属性值为：', event.color);
				console.log('eventClick中选中Event的className属性值为：', event.className);
				// ...
			},
			//拖动
			eventDrop : function( event, dayDelta, revertFunc ) {
				//do something here...
				console.log('eventDrop --- start ---');
				console.log('eventDrop被执行，Event的title属性值为：', event.title);
				if(dayDelta._days != 0){
					console.log('eventDrop被执行，Event的start和end时间改变了：', dayDelta._days+'天！');
				}else if(dayDelta._milliseconds != 0){
					console.log('eventDrop被执行，Event的start和end时间改变了：', dayDelta._milliseconds/1000+'秒！');
				}else{
					console.log('eventDrop被执行，Event的start和end时间没有改变！');
				}
				document.getElementById("etime").value = event.end.format('YYYY-MM-DD');
				document.getElementById("stime").value =event.start.format('YYYY-MM-DD');
				$("#id").attr("value",'');//清空内容
				$("#id").attr("value",event.id);//填充内容 
				document.getElementById("tast").value = event.title;
				console.log('eventClick中选中Event的start属性值为：', event.start.format('YYYY-MM-DD'));
				console.log('eventClick中选中Event的end属性值为：', event.end.format('YYYY-MM-DD'));
				//revertFunc();
				console.log('eventDrop --- end ---');
				// ...
			},
			//拖拽
			eventResize : function( event, dayDelta, revertFunc ) {
				//do something here...
				console.log(' --- start --- eventResize');
				console.log('eventResize被执行，Event的title属性值为：', event.title);
				console.log('eventResize被执行，Event的id属性值为：', event.id);
				if(dayDelta._days != 0){
					console.log('eventResize被执行，Event的start和end时间改变了：', dayDelta._days+'天！');
				}else if(dayDelta._milliseconds != 0){
					console.log('eventResize被执行，Event的start和end时间改变了：', dayDelta._milliseconds/1000+'秒！');
				}else{
					console.log('eventResize被执行，Event的start和end时间没有改变！');
				}
				$("#stime").attr("value",'');//清空内容
				$("#stime").attr("value",event.start.format('YYYY-MM-DD'));//填充内容 
				$("#etime").attr("value",'');//清空内容
				$("#etime").attr("value",event.end.format('YYYY-MM-DD'));//填充内容
				$("#id").attr("value",'');//清空内容
				$("#id").attr("value",event.id);//填充内容 
				document.getElementById("tast").value = event.title;
				console.log('eventClick中选中Event的start属性值为：', event.start.format('YYYY-MM-DD'));
				console.log('eventClick中选中Event的end属性值为：', event.end.format('YYYY-MM-DD'));
				//revertFunc();
				console.log('--- end --- eventResize');
				// ...
			}
		});
	</script>
</body>
</html>
