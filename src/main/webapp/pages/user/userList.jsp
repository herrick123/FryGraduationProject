<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户分页数据</title>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">白沟箱包</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">系统管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">用户管理</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 5px 2px 5px 10px;">
		<div class="col-md-12" style="padding-left:0;">
			<form class="form-inline">
				<div class="form-group"
					style="line-height: 50px; margin-left: 5px;">
					用户名称：<input type="text" class="form-control" id="userName"
						placeholder="请输入用户名称">
				</div>
				<div class="form-group"
					style="line-height: 50px; margin-left: 10px;">
					用户角色：<select class="form-control" id="role">
							<option value="">请选择用户角色</option>
							<option value="1">淘宝店家</option>
							<option value="2">供货厂家</option>
							<option value="3">代发厂家</option>
						   </select>
				</div>
				<button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 10px;">查询</button>
			</form>
		</div>
		<div class="col-md-12"
			style="background-color: #234377; height: 3px;"></div>
	</div>
	<div class="row" style="margin: 10px 0px 5px 10px;">
		<div class="col-md-12" style="padding-left:0;">
			<div id="userDataList" class="dlshouwen-grid-container"></div>
			<div id="userPage" class="dlshouwen-grid-toolbar-container"></div>
		</div>
	</div>
	<!-- 审核确认 -->
	<div id="auditModel" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
					<h4 class="modal-title">审核确认</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<input type="hidden" id="id">
					你是否确认要审核通过所选用户？
				</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" data-dismiss = "modal" id="audit" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var userColumns = [
			{
				id : 'uuid',
				title : '主键',
				type : 'string',
				hide : true
			},
			{
				id : 'serialId',
				title : '序号',
				type : 'string',
				columnClass : 'text-center',
				width : 45,
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					return dataNo + 1;
				}
			},
			{
				id : 'userName',
				title : '用户名',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'role',
				title : '角色',
				type : 'string',
				width : 90,
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					if(value == '0'){
						return "管理员";
					}else if(value == '1'){
						return "淘宝店家";
					}else if(value == '2'){
						return "供货厂家";
					}else if(value == '3'){
						return "代发厂家";
					}
				}
			},
			{
				id : 'contacts',
				title : '联系人',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'phone',
				title : '手机',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'userStatus',
				title : '状态',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					if(value == '0'){
						return "未认证";
					}else if(value == '1'){
						return "认证通过";
					}
				}
			},
			{
				id : 'operation',
				title : '操作',
				type : 'string',
				width : 160,
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
					if(record.userStatus == '0'){
						content += '<button class="sbtn sbtn-blue" style="height:32px;line-height:10px" onclick="audit(\''
							+ record.uuid + '\')">审核</button>';
					}else if(record.userStatus == '1'){
						content += '已审核';
					}
					return content;
				}
			} ];
	var userOption = {
		lang : 'zh-cn',
		ajaxLoad : true,
		loadURL : '<c:url value="/user/pageList" />',
		columns : userColumns,
		gridContainer : 'userDataList',
		toolbarContainer : 'userPage',
		tools : 'refresh',
		check : true,
		checkWidth : '20px',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50, 100 ]
	};
	var userGrid = $.fn.dlshouwen.grid.init(userOption);
	$(function() {
		$('#searchBtn').click(function() {
			userGrid.parameters = new Object();
			userGrid.parameters['userName'] = $("#userName").val();
			userGrid.parameters['role'] = $("#role").val();
			userGrid.refresh(true);
		});
		userGrid.load();
	});
	function audit(id){
		$("#id").val(id);
		$("#auditModel").modal();
	}
	$("#audit").click(function(){
		$.ajax({
			url : "<c:url value='/user/userAudit'/>?id=" + $("#id").val(),
			type : "POST",
			dataType : "json",
			success : function(data, textStatus) {
				if (data.returncode == '200') {
					userGrid.refresh(true);
					showMsg('审核通过！');
				} else if (data.returncode == '10000') {
					showMsg('审核用户失败！请联系开发人员！');
				} else {
					showMsg('审核用户失败！');
				}
			},
			error : function() {
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	});
</script>
</html>