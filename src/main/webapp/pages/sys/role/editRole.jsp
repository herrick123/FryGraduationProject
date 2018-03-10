<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<!-- 前端校验框架 -->
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新角色</title>
<style type="text/css">

</style>
</head>
<body style="overflow: hidden; ">
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i>
			<a href="#">青岛机场安全管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
			<li>
			<a href="#">系统管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">角色管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">编辑角色</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="roleForm" class="form-horizontal" id="roleForm" action="<c:url value='/role/update' />" method="post">
		<input type="hidden" name="roleId" id="roleId"  value="<c:out value='${ roleEntity.roleId}' />"/>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">角色名：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="roleName" name="roleName" value="<c:out value='${ roleEntity.roleName }' />" placeholder="角色名" 
					valid="r" validTitle="必填项" validInfoArea="show_roleName_area">
				</div>
				<div class="col-md-4 help-block" id="show_roleName_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">角色编码：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="roleCode" name="roleCode" value="<c:out value='${ roleEntity.roleCode }' />" placeholder="角色编码" 
					valid="r" validTitle="必填项" validInfoArea="show_roleCode_area">
				</div>
				<div class="col-md-4 help-block" id="show_roleCode_area"></div>
			</div>
		</div>
		
		<div class="row" style="margin-top:10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-blue" type="button" id="subBtn" onclick="submit_role()" >提交</button>
				<button class="sbtn sbtn-default" type="button" id="backBtn" style="margin-left:45px;">返回</button>
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
$("#backBtn").click(function(){
	window.location.href = '<c:url value="/role/page" />';
})
//表单验证
var validator_role;
var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
function submit_role() {
	if (!validator_role.validResult()) {
		$.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
		return;
	}else if($("#show_roleName_area").html() != name_area){
		$.fn.dlshouwen.validator.tools.toast('角色名验证未通过！', 'error', 3000);
		return;
	}
	$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
	document.getElementById("roleForm").submit();
}    
$(function() {
	var option_role = {
		elementCallback : {
			success : function(element, css){
				if($(element).is(':checkbox') || $(element).is(':radio')){
					var name = $(element).attr('name');
					$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
				}else{
					$(element).parents('.form-group').removeClass(css.failure);
				}
				//验证登录名
				if($(element).attr('name') == 'roleName'){
					var roleName = $("#roleName").val();
					var roleId = $("#roleId").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						url : '<c:url value="/role/check" />',
						data : "roleName=" + roleName + "&roleId="+roleId,
						success : function(Data, textStatus) {
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_roleName_area").removeClass("info-area-success");
								$("#show_roleName_area").addClass("info-area-failure");
								$("#show_roleName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;角色名已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_roleName_area").removeClass("info-area-failure");
								$("#show_roleName_area").addClass("info-area-success");
								$("#show_roleName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_roleName_area").removeClass("info-area-success");
								$("#show_roleName_area").addClass("info-area-failure");
								$("#show_roleName_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;角色名获取失败！请联系开发人员！");
								return;
							}
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_roleName_area").removeClass("info-area-success");
							$("#show_roleName_area").addClass("info-area-failure");
							$("#show_roleName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
			}
		}
   	};
	validator_role = $.fn.dlshouwen.validator.init($('#roleForm'),option_role);
});
</script>
</html>