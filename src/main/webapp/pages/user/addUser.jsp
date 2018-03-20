<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>用户注册</title>
</head>
<body>
	<form name="userForm" class="form-horizontal" id="userForm"
		action="<c:url value='/user/save' />" method="post">
		<div class="row" style="margin-top: 50px;">
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">用户名<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写用户名"  
						valid="r" validTitle="必填项" validInfoArea="show_userName_area"
						value="" name="userName" id="userName" />
				</div>
				<div class="col-md-4 help-block" id="show_userName_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">密码<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写密码"  
						valid="r|english_number|l6-le20" validTitle="必填项" validInfoArea="show_password_area"
						value="" name="password" id="password" />
				</div>
				<div class="col-md-4 help-block" id="show_password_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">确认密码<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写确认密码"  
						valid="r|english_number|l6-le20" validTitle="必填项" validInfoArea="show_confirmPwd_area"
						value="" name="confirmPwd" id="confirmPwd" />
				</div>
				<div class="col-md-4 help-block" id="show_confirmPwd_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">联系人<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写联系人"  
						valid="r" validTitle="必填项" validInfoArea="show_contacts_area"
						value="" name="contacts" id="contacts" />
				</div>
				<div class="col-md-4 help-block" id="show_contacts_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">手机<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写手机号"  
						valid="r|mobile" validTitle="必填项" validInfoArea="show_phone_area"
						value="" name="phone" id="phone" />
				</div>
				<div class="col-md-4 help-block" id="show_phone_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">QQ<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写QQ"  
						valid="r|qq" validTitle="必填项" validInfoArea="show_qq_area"
						value="" name="qq" id="qq" />
				</div>
				<div class="col-md-4 help-block" id="show_qq_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">网供名称<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写您的工厂/公司名称"  
						valid="r" validTitle="必填项" validInfoArea="show_address_area"
						value="" name="address" id="address" />
				</div>
				<div class="col-md-4 help-block" id="show_address_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">拿货地址<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写您的拿货地址"  
						valid="r" validTitle="必填项" validInfoArea="show_deliveryAddress_area"
						value="" name="deliveryAddress" id="deliveryAddress" />
				</div>
				<div class="col-md-4 help-block" id="show_deliveryAddress_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">代发区域<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写您的代发区域"  
						valid="r" validTitle="必填项" validInfoArea="show_area_area"
						value="" name="area" id="area" />
				</div>
				<div class="col-md-4 help-block" id="show_area_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">服务费<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写服务费"  
						valid="r|" validTitle="必填项" validInfoArea="show_serviceCharge_area"
						value="" name="serviceCharge" id="serviceCharge" />
				</div>
				<div class="col-md-4 help-block" id="show_serviceCharge_area"></div>
			</div>
		</div>
		<div style="text-align: center; margin-top: 40px;">
			<button id="subBtn" type="button" class="sbtn sbtn-blue" onclick="submit_emPower();">
			<i class="icon-right fa fa-send"></i>提交</button>
			<button style="margin-left: 45px;" type="button" id="backBtn" class="sbtn sbtn-default">
			<i class="icon-right fa fa-reply"></i>返回</button>
		</div>
	</form>
	<!-- 选择角色-->
	<div class="modal" id="addRoleModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width: 950px; height: auto;max-height: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<span>选择角色</span>
				</div>
				<div class="modal-body">
					<form class="form-inline" style="margin: 10px 0px 10px 0px;">
						<div class="form-group">
							角色名：<input type="text" class="form-control" id="roleName" placeholder="设备分组编号">
						</div>
						<div class="form-group"  style="margin-left: 30px;">
							角色编码：<input type="text" class="form-control" id="roleCode" placeholder="设备分组名称">
						</div>
						<button type="button" onclick="searchRoleData()" class="sbtn sbtn-blue" 
							style="margin-left: 15px;"><i class="icon-right fa fa-search"></i>查询</button>
					</form>
					<div style="max-height: 600px;height:auto;overflow: auto;">
						<div id="roleDataList" class="dlshouwen-grid-container"></div>
						<div id="rolePage" class="dlshouwen-grid-toolbar-container"></div>
					</div>
					<div style="text-align: center;margin-top:10px;">
						<button id="toAddRole" type="button" class="sbtn sbtn-blue"  data-dismiss="modal">
							<i class="icon-right fa fa-save"></i>确定</button>
						<button style="margin-left: 45px;" type="button"
							class="sbtn sbtn-default" data-dismiss="modal">
							<i class="icon-right fa fa-reply"></i>取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 选择用户 -->
	<div class="modal" id="addUserModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width: 950px; height: auto;max-height: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<span>选择用户</span>
				</div>
				<div class="modal-body">
					<form class="form-inline" style="margin: 10px 0px 10px 0px;">
						<div class="form-group">
							登录名：<input type="text" class="form-control" id="loginName" placeholder="登录名">
						</div>
						<div class="form-group"  style="margin-left: 5px;">
							用户名称：<input type="text" class="form-control" id="userName" placeholder="用户名称">
						</div>
						<!-- <div class="form-group"  style="margin-left: 5px;">
							部门名：<input type="text" class="form-control" id="orgName" placeholder="部门名">
						</div> -->
						<button type="button" onclick="searchUserData()" class="sbtn sbtn-blue" 
							style="margin-left: 5px;"><i class="icon-right fa fa-search"></i>查询</button>
					</form>
					<div style="max-height: 600px;height:auto;overflow: auto;">
						<div id="userDataList" class="dlshouwen-grid-container" ></div>
						<div id="userPage" class="dlshouwen-grid-toolbar-container"></div>
					</div>
					<div style="text-align: center;margin-top:10px;">
						<button id="toAddUser" type="button" class="sbtn sbtn-blue"  data-dismiss="modal">
							<i class="icon-right fa fa-save"></i>确定</button>
						<button style="margin-left: 45px;" type="button"
							class="sbtn sbtn-default" data-dismiss="modal">
							<i class="icon-right fa fa-reply"></i>取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//记录表格勾中的id
	var roleIds = [];
	var roleNames = [];
	var userIds = [];
	var userNames = [];
	var roleColumns = [
	    {id:'uuid', title:'主键', type:'string', hide:true,
	    	resolution : function(value, record, column, grid, dataNo,columnNo) {
            	for(var i = 0; i < roleIds.length; i++){
        			if(roleIds[i] == value){
        				setTimeout(function(){
             				$("input[datano="+dataNo+"]").attr("checked",true);
 						}, 200);
        			}
        		}
            	return value;
            }
	    },
	    {id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:50,
	    	resolution:function(value, record, column, grid, dataNo, columnNo){
				return dataNo+1;
			}
	    },
	    {id:'roleName', title:'角色名', type:'string', columnClass:'text-center'},
	    {id:'roleCode', title:'角色代码', type:'string', columnClass:'text-center'}
	];
	var roleOption = {
		lang : 'zh-cn',
		ajaxLoad : true,
	    loadURL : '<c:url value="/equ/auth/role/pageList" />',
	    columns : roleColumns,
	    gridContainer : 'roleDataList',
	    toolbarContainer : 'rolePage',
	    tools : 'refresh',
	    pageSize : 10,
	    check : true,
	    checkWidth : '22px',
	    pageSizeLimit : [10, 20, 50, 100],
	    onCheck : function(isChecked, record, grid, dataNo, row, extraCell, e){
	    	if(isChecked == true){
	    		var flag = true;
	    		for(var i = 0; i < roleIds.length;i++){
	    			if(roleIds[i] == record.uuid){
	    				flag = false;
	    				break;
	    			}
	    		}
	    		if(flag == true){
	    			roleIds.push(record.uuid);
	    			roleNames.push(record.roleName);
	    		}
	    	}else{
	    		for(var i = 0; i < roleIds.length;i++){
	    			if(roleIds[i] == record.uuid){
	    				roleIds.splice(i,1);
	    				roleNames.splice(i,1);
	    			}
	    		}
	    	}
	    }
	};
	var userColumns = [
		{id:'uuid', title:'主键', type:'string', hide:true,
	    	resolution : function(value, record, column, grid, dataNo,
    				columnNo) {
            	for(var i = 0; i < userIds.length; i++){
        			if(userIds[i] == value){
        				setTimeout(function(){
             				$("input[datano="+dataNo+"]").attr("checked",true);
 						}, 200);
        			}
        		}
            	return value;
            }
	    },
		{id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:50, 
			resolution:function(value, record, column, grid, dataNo, columnNo){
				return dataNo+1;
			}
		},
		{id:'loginName', title:'登录名', type:'string', columnClass:'text-center'},
		{id:'userName', title:'用户名', type:'string', columnClass:'text-center'},
		{id:'orgName', title:'部门', type:'string',width:90, columnClass:'text-center'},
		{id:'userNumber', title:'工号', type:'string',width:45,columnClass:'text-center'},
		{id:'roleName', title:'角色', type:'string',  columnClass:'text-center'},
		{id:'titleName', title:'职称', type:'string',  columnClass:'text-center'},
		{id:'educationName', title:'学历', type:'string',  columnClass:'text-center'}
	];
	var userOption = {
		lang : 'zh-cn',
		ajaxLoad : true,
		loadURL : '<c:url value="/equ/auth/user/pageList" />',
		columns : userColumns,
		gridContainer : 'userDataList',
		toolbarContainer : 'userPage',
		tools : 'refresh',
		check : true,
		checkWidth : '20px',
		pageSize : 10,
		pageSizeLimit : [10, 20, 50,100],
		onCheck : function(isChecked, record, grid, dataNo, row, extraCell, e){
	    	if(isChecked == true){
	    		var flag = true;
	    		for(var i = 0; i < userIds.length;i++){
	    			if(userIds[i] == record.uuid){
	    				flag = false;
	    				break;
	    			}
	    		}
	    		if(flag == true){
	    			userIds.push(record.uuid);
		    		userNames.push(record.userName);
	    		}
	    	}else{
	    		for(var i = 0; i < userIds.length;i++){
	    			if(userIds[i] == record.uuid){
	    				userIds.splice(i,1);
	    				userNames.splice(i,1);
	    			}
	    		}
	    	}
	    }
	};
	var roleGrid = $.fn.dlshouwen.grid.init(roleOption);
	var userGrid = $.fn.dlshouwen.grid.init(userOption);
	//查询角色
	function searchRoleData(){
		roleGrid.parameters = new Object();
		roleGrid.parameters['roleName'] = $("#roleName").val();
		roleGrid.parameters['roleCode'] = $("#roleCode").val();
		roleGrid.refresh(true);
	}
	//查询用户
	function searchUserData(){
		userGrid.parameters = new Object();
		userGrid.parameters['loginName'] = $("#loginName").val();
		userGrid.parameters['userName'] = $("#userName").val();
		//userGrid.parameters['orgName'] = $("#orgName").val();
		userGrid.refresh(true);
	}
	$("#addRole").click(function(){
		roleGrid.load();
		$("#addRoleModal").modal();
	});
	$("#addUser").click(function(){
		userGrid.load();
		$("#addUserModal").modal();
	});
	$("#toAddRole").click(function(){
		var roleI = roleIds.join(",");
		var roleN = roleNames.join(",");
		$("#roleIds").val(roleI);
		$("#roleNames").val(roleN);
		$("#roleNames").blur();
	});
	$("#toAddUser").click(function(){
		var userI = userIds.join(",");
		var userN = userNames.join(",");
		$("#userIds").val(userI);
		$("#userNames").val(userN);
		$("#userNames").blur();
	});
	var ipNo = 0;
	//增加多个IP地址的div块
	function addIpDiv() {
		var html = '';
		html = '<div class="form-group col-md-12" id="addIpDiv_'+ ipNo +'">'+
				'<div class="col-md-1"></div>'+
				'<label class="col-md-3 control-label">IP地址</label>'+
				'<div class="col-md-4">'+
					'<input type="text" name="ip" class="form-control ipFormate" placeholder="请填写ip地址">'+
				'</div>'+
				'<div class="col-md-1 help-block" style="width:15px;">'+
				'<i class="icon-left fa fa-minus cursor" style="font-size: 2rem;cursor: pointer;" onclick="minusIpDiv('+ ipNo +');" ></i>'+
				'</div>'+
			'</div>'; 
		$("#ipFormGroup").append(html);
		ipNo = Number(ipNo) + 1;
	}
	//删除IP地址的div块
	function minusIpDiv(no) {
		$("#addIpDiv_" + no).remove();
	}
	//增加多个IP段的div块
	function addIpParaDiv() {
		var html = '';
		html = '<div class="form-group col-md-12" id="startIpFormGroup_'+ ipNo +'" >'+
			'<div class="col-md-1"></div>'+
			'<label class="col-md-3 control-label">起始IP'+
			'</label>'+
			'<div class="col-md-4">'+
				'<input type="text" name="startIp" class="form-control ipFormate" placeholder="请填写起始ip地址">'+
			'</div>'+
			'<div class="col-md-1 help-block" style="width:15px;">'+
				'<i class="icon-left fa fa-minus cursor" style="font-size: 2rem;cursor: pointer;" onclick="minusIpParaDiv('+ ipNo +');"></i>'+
			'</div>'+
		'</div>';
		html += '<div class="form-group col-md-12" id="endIpFormGroup_'+ ipNo +'" >'+
			'<div class="col-md-1"></div>'+
			'<label class="col-md-3 control-label">结束IP'+
			'</label>'+
			'<div class="col-md-4">'+
				'<input type="text" name="endIp" class="form-control ipFormate" placeholder="请填写结束ip地址">'+
			'</div>'+
		'</div>';
		$("#ipGroupPara").append(html);
		ipNo = Number(ipNo) + 1;
	}
	//删除IP段的div块
	function minusIpParaDiv(no) {
		$("#startIpFormGroup_" + no).remove();
		$("#endIpFormGroup_" + no).remove();
	}
	//表单验证
	var validator_auth;
	var code_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
	var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
	function judge(str){
		var regexp = /^((0{0,2}\d|0?\d{2}|1\d{2}|2[0-4]\d|25[0-5])\.){3}(0{0,2}\d|0?\d{2}|1\d{2}|2[0-4]\d|25[0-5])$/;
		var rs = regexp.test(str);
		return rs;
	}
	function submit_emPower() {
		if (!validator_auth.validResult()) {
			return;
		}else if($("#show_authCode_area").html() != code_area){
			$.fn.dlshouwen.validator.tools.toast('授权编号验证未通过！', 'error', 3000);
			return;
		}else if($("#show_authName_area").html() != name_area){
			$.fn.dlshouwen.validator.tools.toast('授权名称验证未通过！', 'error', 3000);
			return;
		}
		var flag = true;
		var ip = $("#ip").val();
		var startIp = $("#startIp").val();
		var endIp = $("#endIp").val();
		var ipReslut = judge(ip);
		var startIpReslut = judge(startIp);
		var endIpReslut = judge(endIp);
		if((ip == "" && startIpReslut == endIpReslut && endIpReslut == true)
				|| (ipReslut == true && startIp == endIp && endIp == "") 
				|| (ipReslut == true && startIpReslut == endIpReslut && endIpReslut == true)){
			$(".ipFormate").each(function(){
				console.log($(this).val());
				var str = $(this).val();
				rs = judge(str);
				if(rs == false){
					flag = false;
				}
				console.log(rs + "，str=" +str);
			});
		}else{
			flag = false;
		}
		if(flag == false){
			showMsg("ip地址填写有误或有漏填", 3);
		}else{
			$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
			document.getElementById("userForm").submit();
		}
	}
	$(function() {
	    var option_auth = {
			elementCallback : {
				success : function(element, css){
					if($(element).is(':checkbox') || $(element).is(':radio')){
						var name = $(element).attr('name');
						$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
					}else{
						$(element).parents('.form-group').removeClass(css.failure);
					}
					//验证授权分组名称
					if($(element).attr('name') == 'authName'){
						var authName = $("#authName").val();
						var strLength = fucCheckLength($("#authName").val());
						if(strLength <= 2 ){
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_authName_area").removeClass("info-area-success");
							$("#show_authName_area").addClass("info-area-failure");
							$("#show_authName_area"). html("<i class='fa fa-times'></i>  授权名称长度必须大于2");
							return;
						}
						if(strLength > 20){
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_authName_area").removeClass("info-area-success");
							$("#show_authName_area").addClass("info-area-failure");
							$("#show_authName_area"). html("<i class='fa fa-times'></i>  授权名称长度不能大于20");
							return;
						}
						$.ajax({
							type : "POST",
							dataType : "json",
							async : false,
							url : '<c:url value="/equ/auth/check" />',
							data : "authName=" + authName,
							success : function(Data, textStatus) {
								//授权分组名称验证
								if (Data.returncode == '10000') {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_authName_area").removeClass("info-area-success");
									$("#show_authName_area").addClass("info-area-failure");
									$("#show_authName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;授权名称已经存在");
									return;
								} else if (Data.returncode == '200') {
									$(element).parents('.form-group').removeClass(css.failure);
									$("#show_authName_area").removeClass("info-area-failure");
									$("#show_authName_area").addClass("info-area-success");
									$("#show_authName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
								} else {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_authName_area").removeClass("info-area-success");
									$("#show_authName_area").addClass("info-area-failure");
									$("#show_authName_area").
										html("<i class='fa fa-times'></i>&nbsp;&nbsp;授权分组名称获取失败！请联系开发人员！");
									return;
								}							
							},
							error : function(data) {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_authName_area").removeClass("info-area-success");
								$("#show_authName_area").addClass("info-area-failure");
								$("#show_authName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
								return;
							}
						});
					}
					//验证授权分组编码
					if($(element).attr('name') == 'authCode'){
						var authCode = $("#authCode").val();
						$.ajax({
							type : "POST",
							dataType : "json",
							async : false,
							url : '<c:url value="/equ/auth/check" />',
							data : "authCode=" + authCode,
							success : function(Data, textStatus) {
								//授权分组编码验证
								if (Data.returncode == '10000') {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_authCode_area").removeClass("info-area-success");
									$("#show_authCode_area").addClass("info-area-failure");
									$("#show_authCode_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;授权编码已经存在");
									return;
								} else if (Data.returncode == '200') {
									$(element).parents('.form-group').removeClass(css.failure);
									$("#show_authCode_area").removeClass("info-area-failure");
									$("#show_authCode_area").addClass("info-area-success");
									$("#show_authCode_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
								} else {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_authCode_area").removeClass("info-area-success");
									$("#show_authCode_area").addClass("info-area-failure");
									$("#show_authCode_area").
										html("<i class='fa fa-times'></i>&nbsp;&nbsp;授权分组编码获取失败！请联系开发人员！");
									return;
								}		
							},
							error : function(data) {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_authCode_area").removeClass("info-area-success");
								$("#show_authCode_area").addClass("info-area-failure");
								$("#show_authCode_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
								return;
							}
						});
					}
				}
			}
	   	};
		validator_auth = $.fn.dlshouwen.validator.init($('#userForm'), option_auth);
	});
	$("#backBtn").click(function() {
		window.location.href = '<c:url value="/equ/auth/page" />';
	});
</script>
</html>