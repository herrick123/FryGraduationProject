<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header_jstree.jsp" %>
<%@ include file="/pages/inc/delModal.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>猛码请假申请</title>
<script src="<%=path %>/js/tree/layout.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/js/laydate.js"></script>
<style>
	td {
   		white-space:nowrap;
   		overflow:hidden;
   		text-overflow: ellipsis;
	}
	table {   
        table-layout:fixed;  
    } 
    .form-group{
    margin-top:20px;
    }
    
</style>
</head>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i>
			<a href="#">猛码学员管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
			<li>
			<a href="#">请假管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">请假申请</a></li>
	</ul>
</div>
<div class="portlet blue-hoki box">
		<form id="leaveForm" class="form-horizontal" action="<c:url value='/leave/save' />" method="post" >
			<div class="row" style="margin-top: 50px;">
				<input name="userId" type="hidden"  value="${loginUser.userId }"/>
				<div class="form-group">
					<span class="col-sm-4 control-label">姓名：</span>
					<div class="col-md-4">
						<input name="name" type="text" class="form-control" id="name" style="width:50%" value="${loginUser.userName }" readonly/>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">请假开始时间：</span>
					<div class="col-md-4">
						<input name="startTime" type="text"	 class="form-control" id="startTime" style="width:50%"/>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">请假结束时间：</span>
					<div class="col-md-4">
						<input name="endTime" type="text" class="form-control" id="endTime" style="width:50%"/>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">请假时长：</span>
					<div class="col-md-4">
						<input onfocus="setvalue()" name="timeLength" type="text" class="form-control" id="timeLength" style="width:50%" readonly/>
					</div>
				</div>
				<div class="form-group" hidden>
					<span class="col-sm-4 control-label">操作：</span>
					<div class="col-md-4">
						<input name="operation" type="text" class="form-control" id="operation" value="L01"/>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">请假类型：</span>
					<div class="col-md-4">
						<select name="type" id="type" class="form-control" style="width:50%">
							<option value="1" >病假</option>
							<option value="2">陪产假</option>
							<option value="3">年假</option>
							<option value="4">事假</option>
							<option value="5">婚假</option>
							<option value="6">丧假</option>
							<option value="7">例假</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">原因：</span>
					<div class="col-md-4">
						<textarea name="reason" id="reason"  class="textinput"  maxlength=15 style="text-align:left;width:50%;">
						</textarea>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-4">
						<input id="subBtn" type="button" class="sbtn sbtn-blue sbtn30"  onclick="saveLeaveTime();"  value="提交" style="margin-left:121%;"/>
					</div>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
	laydate.render({
		  elem: '#startTime',
	});
	laydate.render({
		  elem: '#endTime',
	});
	function check() {
		var startTime = document.getElementById("startTime").value;
		var endTime = document.getElementById("endTime").value;
		var timeLength = document.getElementById("timeLength").value;
		if (startTime == "" || endTime == "") {
			showMsg("请假开始日期和结束日期不能为空！");
			return false;
		}
		if (timeLength == "") {
			showMsg("请假天数不能为空！");
			return false;
		}
		 var flag = setvalue();
			return flag;
	}
	function setvalue() {
		var date1 = document.getElementById('startTime').value;
		var date2 = document.getElementById('endTime').value;
		var currentday = new Date();
		currentday = new Date(currentday.getFullYear(), currentday.getMonth(), currentday.getDate());
		var startTime = new Date(Date.parse(date1.replace(/-/g, "/"))); //转换成Date();
		var endTime = new Date(Date.parse(date2.replace(/-/g, "/"))); //转换成Date();
		var timeLength = document.getElementById("timeLength").value;
		if (date1 == "") {
			showMsg("请假开始日期不能为空！");
			document.getElementById('timeLength').blur();
			return false;
		}
		if (startTime < currentday) {
			showMsg("请假开始日期不能早于当前日期!");
			document.getElementById('timeLength').blur();
			return false;
		}
		if (date2 == "") {
			showMsg("请假结束日期不能为空！");
			document.getElementById('timeLength').blur();
			return false;
		}
		var day = (Number(endTime) - Number(startTime))
				/ (1000 * 60 * 60 * 24);
		if (day < 0) {
			showMsg("请假结束日期不能早于请假开始日期，请重新选择日期！");
			document.getElementById('timeLength').blur();
			return false;
		}
		 if (day == 0) {
			day = 1;
		} else {
			day = day + 1;
		}
		document.getElementById('timeLength').value = day; 
		checkTime();
		return true;
	}
	function convertStringToDate(dateString) {
		dateString = dateString.split('-');
		return new Date(dateString[0], dateString[1] - 1, dateString[2]);
	}
	//检查请假日期是否重复
	function checkTime(){
		var flag;
		var startTime = $("#startTime").val();
		var endTime = $("#endTime").val();
		var name = $("#name").val();
		if($.ajax({
	 		url : '<c:url value="/leave/check"/>?name='+name+'&startTime='+startTime+'&endTime='+endTime, 
	 		type: "post",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.returncode == '200'){
	 				flag = true;
	 			}else{
	 				flag = false;
	 				showMsg('当前时间段已经存在请假信息，不要重复请假');
	 			}
	 		},
	 		error : function() {
	 			flag = false;
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	})){
			flag=true;
		}else{
			flag=false;
		}
		return flag;
	}
	function saveLeaveTime() {
		var flag = checkTime();
		var flag1 = check();
		if (flag && flag1) {
			setvalue();
			showConfirmLeaveMsg("确定请假吗？");
			$("#confirm").click(function(){
				document.forms[0].submit();
			});
		}
	 };
	
	
</script>
</html>