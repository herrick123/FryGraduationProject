<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>用户密码修改</title>
</head>
<body>
	<form name="userForm" class="form-horizontal" id="userForm"
		action="<c:url value='/user/updatePassword' />" method="post">
		<input type="hidden" id="uuid" name="uuid" value="${user.uuid }"/>
		<input type="hidden" id="pwd" name="pwd" value="${user.password }"/>
		<div class="row" style="margin-top: 50px;">
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">原密码<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="password" class="form-control" placeholder="请填写原密码"  
						valid="r|le6-l20" validTitle="原密码" validInfoArea="show_oldPassword_area"
						value="" name="oldPassword" id="oldPassword" />
				</div>
				<div class="col-md-4 help-block" id="show_oldPassword_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">新密码<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="password" class="form-control" placeholder="请填写新密码"  
						valid="r|le6-l20" validTitle="新密码" validInfoArea="show_password_area"
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
					<input type="password" class="form-control" placeholder="请填写确认密码"  
						valid="r|le6-l20" validTitle="密码" validInfoArea="show_confirmPwd_area"
						value="" name="confirmPwd" id="confirmPwd" validPassword="password" />
				</div>
				<div class="col-md-4 help-block" id="show_confirmPwd_area"></div>
			</div>
		</div>
		<div style="text-align: center; margin-top: 20px;">
			<button id="subBtn" type="button" class="sbtn sbtn-blue" onclick="submit_user();">
			<i class="icon-right fa fa-send"></i>确认修改</button>
			<!-- <button style="margin-left: 45px;" type="button" id="backBtn" class="sbtn sbtn-default">
			<i class="icon-right fa fa-reply"></i>返回</button> -->
		</div>
	</form>
</body>
<script type="text/javascript">
	//表单验证
	var validator_user;
	var option_user = {
		elementCallback : {
			success : function(element, css){
				if($(element).is(':checkbox') || $(element).is(':radio')){
					var name = $(element).attr('name');
					$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
				}else{
					$(element).parents('.form-group').removeClass(css.failure);
				}
				//验证授权分组名称
				if($(element).attr('name') == 'oldPassword'){
					var oldPassword = $("#oldPassword").val();
					var pwd = $("#pwd").val();
					if(oldPassword != pwd){
						$(element).parents('.form-group').addClass(css.failure);
						$("#show_oldPassword_area").removeClass("info-area-success");
						$("#show_oldPassword_area").addClass("info-area-failure");
						$("#show_oldPassword_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;原密码不正确");
						return;
					}else{
						$(element).parents('.form-group').removeClass(css.failure);
						$("#show_oldPassword_area").removeClass("info-area-failure");
						$("#show_oldPassword_area").addClass("info-area-success");
						$("#show_oldPassword_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
					}
				}
			}
		}
	};
	var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
	function submit_user() {
		if (!validator_user.validResult()) {
			return;
		}else if($("#show_oldPassword_area").html() != name_area){
			$.fn.dlshouwen.validator.tools.toast('原密码验证未通过！', 'error', 3000);
			return;
		}
		$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
		document.getElementById("userForm").submit();
	}
	$(function() {
		validator_user = $.fn.dlshouwen.validator.init($('#userForm'), option_user);
	});
	/* $("#backBtn").click(function() {
		window.location.href = '<c:url value="/user" />';
	}); */
</script>
</html>