<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.input-radius{
		border-radius: 5px !important;
	}
</style>
<%@ include file="/pages/inc/header.jsp" %>
<!-- 前端校验框架 -->
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<!-- tree -->
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/jstree/dist/themes/default/style.min.css" />
<script src="<%=path %>/extends/jstree/dist/jstree.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增角色</title>
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
			<a href="#">组织架构管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">新增组织架构</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="frameForm" class="form-horizontal" id="frameForm" action="<c:url value='/frame/save' />" method="post">
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">组织名称：</span>
				<div class="col-md-4 ">
					<input type="text" class="form-control" id="frameName" name="frameName"  placeholder="组织名称" 
					valid="r" validTitle="必填项" validInfoArea="show_frameName_area">
				</div>
				<div class="col-md-4 help-block" id="show_frameName_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">负责人：</span>
				<div class="col-md-4 ">
					<input type="text" class="form-control" id="frameCode" name="responsible"  placeholder="负责人" 
					valid="r" validTitle="必填项" validInfoArea="show_frameCode_area">
				</div>
				<div class="col-md-4 help-block" id="show_frameCode_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">人数：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="frameNumber" name="frameNumber" value="" placeholder="人数" >
				</div>
				<div class="col-md-4 help-block" id="show_frameCode_area"></div>
			</div>
		</div>
		
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">电话：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="phone" name="phone" value="" placeholder="电话" >
				</div>
				<div class="col-md-4 help-block" id="show_phone_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-blue" type="button" id="subBtn" onclick="submit_frame()" >保存</button>
				<button class="sbtn sbtn-default" type="button" id="backBtn" style="margin-left:45px;">返回</button>
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">

$("#backBtn").click(function(){
	window.location.href = '<c:url value="/pages/sys/organization/frameworkList.jsp" />';
})
//表单验证
var validator_frame;
var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
function submit_frame() {
	if (!validator_user.validResult()) {
		$.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
		return;
	}else if($("#show_frameName_area").html() != name_area){
		$.fn.dlshouwen.validator.tools.toast('角色名验证未通过！', 'error', 3000);
		return;
	}
	$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
	document.getElementById("frameForm").submit();
}    
$(function() {
	var option_frame = {
		elementCallback : {
			success : function(element, css){
				if($(element).is(':checkbox') || $(element).is(':radio')){
					var name = $(element).attr('name');
					$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
				}else{
					$(element).parents('.form-group').removeClass(css.failure);
				}
				//验证登录名
				if($(element).attr('name') == 'frameName'){
					var frameName = $("#frameName").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						url : '<c:url value="/frame/check" />',
						data : "frameName=" + frameName,
						success : function(Data, textStatus) {
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_frameName_area").removeClass("info-area-success");
								$("#show_frameName_area").addClass("info-area-failure");
								$("#show_frameName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;角色名已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_frameName_area").removeClass("info-area-failure");
								$("#show_frameName_area").addClass("info-area-success");
								$("#show_frameName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_frameName_area").removeClass("info-area-success");
								$("#show_frameName_area").addClass("info-area-failure");
								$("#show_frameName_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;角色名获取失败！请联系开发人员！");
								return;
							}
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_frameName_area").removeClass("info-area-success");
							$("#show_frameName_area").addClass("info-area-failure");
							$("#show_frameName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
			}
		}
   	};
	validator_frame = $.fn.dlshouwen.validator.init($('#frameForm'),option_frame);
});
</script>
</html>