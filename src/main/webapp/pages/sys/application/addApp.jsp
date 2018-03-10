<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增应用</title>
<%-- <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script> --%>
<style type="text/css">
.input-radius {
	border-radius: 5px !important;
}
</style>
</head>
<body style="overflow: hidden;">
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">应用管理</a><i class="fa fa-angle-right"></i></li>
			<li><a href="#">添加应用信息</a></li>
		</ul>
	</div>

	<form name="appForm" class="form-horizontal" id="appForm"
		action="<c:url value='/application/save' />" method="post">
		<div class="row" style="margin-top: 50px;">
			<div class="form-group">
				<span for="appName" class="col-sm-4 control-label"> 应用名称：<span
					class="required" style="color: red;">* </span>
				</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="appName"
						name="appName" placeholder="请输入应用名称"
						aria-describedby="sizing-addon2" required="required"
						valid="r|le2-le18" validTitle="必填项" validInfoArea="show_name_area">
				</div>
				<div class="col-md-4 help-block" id="show_name_area"></div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label"> 应用上线文根：<span
					class="required" style="color: red;">* </span>
				</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius"
						id="appContext" name="appContext" placeholder="请输入应用上线文根"
						aria-describedby="sizing-addon2" valid="r" validTitle="必填项"
						validInfoArea="show_context_area">
				</div>
				<div class="col-md-4 help-block" id="show_context_area"></div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label"> 应用显示顺序：<span
					class="required" style="color: red;">* </span>
				</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius"
						id="displayIndex" name="displayIndex" placeholder="请输入应用显示顺序"
						aria-describedby="sizing-addon2" valid="r|le1-le10|number"
						validTitle="必填项" validInfoArea="show_display_area">
				</div>
				<div class="col-md-4 help-block" id="show_display_area"></div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label"> 应用简介：<span
					class="required" style="color: red;">* </span>
				</span>
				<div class="col-md-4">
					<textarea class="form-control input-radius" id="appDesc"
						name="appDesc" placeholder="请输入应用简介"
						aria-describedby="sizing-addon2" valid="r|le1-le255"
						validTitle="必填项" validInfoArea="show_desc_area"></textarea>
				</div>
				<div class="col-md-4 help-block" id="show_desc_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn"
					onclick="submit_app()">保存</button>
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn"
					style="margin-left: 45px;">返回</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	$("#backBtn").click(function() {
		window.location.href = '<c:url value="/application/page" />';
	});
	//表单验证
	var validator_app;
	var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
	function submit_app() {
		if (!validator_app.validResult()) {
			$.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
			return;
		}else if($("#show_name_area").html() != name_area){
			$.fn.dlshouwen.validator.tools.toast('名称验证未通过！', 'error', 3000);
			return;
		}
		$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
		document.getElementById("appForm").submit();
	}
	$(function(){
		var option_app = {
			elementCallback : {
				success : function(element, css){
					if($(element).is(':checkbox') || $(element).is(':radio')){
						var name = $(element).attr('name');
						$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
					}else{
						$(element).parents('.form-group').removeClass(css.failure);
					}
					if($(element).attr('name') == 'appName'){
						var appName = $("#appName").val();
						$.ajax({
							type : "POST",
							dataType : "json",
							url : '<c:url value="/application/check" />',
							data : "appName=" + appName,
							success : function(Data, textStatus) {
								if (Data.returncode == '10000') {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_name_area").removeClass("info-area-success");
									$("#show_name_area").addClass("info-area-failure");
									$("#show_name_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;名称已经存在");
									return;
								} else if (Data.returncode == '200') {
									$(element).parents('.form-group').removeClass(css.failure);
									$("#show_name_area").removeClass("info-area-failure");
									$("#show_name_area").addClass("info-area-success");
									$("#show_name_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
								} else {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_name_area").removeClass("info-area-success");
									$("#show_name_area").addClass("info-area-failure");
									$("#show_name_area").
										html("<i class='fa fa-times'></i>&nbsp;&nbsp;名称获取失败！请联系开发人员！");
									return;
								}
							},
							error : function(data) {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_name_area").removeClass("info-area-success");
								$("#show_name_area").addClass("info-area-failure");
								$("#show_name_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
								return;
							}
						});
					}
				}
			}
		};
		validator_app = $.fn.dlshouwen.validator.init($('#appForm'), option_app);
	});
</script>
</html>