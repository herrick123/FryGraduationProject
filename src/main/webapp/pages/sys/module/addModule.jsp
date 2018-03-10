<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增模块</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>

</head>
<body style="overflow: hidden; ">
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i>
			<a href="#">青岛机场安全管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">模块管理</a><i class="fa fa-angle-right"></i></li>
		<li><a href="#">新增模块</a></li>
	</ul>
</div>
<form name="moduleForm" class="form-horizontal" id="moduleForm" action="<c:url value='/module/save' />" method="post">
	<div class="row" style="margin-top: 50px;">
		<div class="form-group">
			<span class="col-sm-4 control-label">所属应用：</span>
			<div class="col-md-4">
				<input type="hidden" name="appId" id="appId"  value="<c:out value='${app.id }' />"/>
				<input type="text" class="form-control" id="appName" name="appName" value="${app.appName }" disabled="disabled" placeholder="模块名称" aria-describedby="sizing-addon2">
			</div>
		</div>
		<div class="form-group">
			<span class="col-sm-4 control-label">模块名称：</span>
			<div class="col-md-4">
				<input type="text" class="form-control" id="moduleName" name="moduleName" placeholder="模块名称"
				valid="r|l2-le18" validTitle="必填项" validInfoArea="show_moduleName_area">
			</div>
			<div class="col-md-4 help-block" id="show_moduleName_area"></div>
		</div>
		<div class="form-group">
			<span class="col-sm-4 control-label">模块Url：</span>
			<div class="col-md-4">
				<input type="text" class="form-control" id="moduleUrl" name="moduleUrl" placeholder="模块URL"
				valid="r" validTitle="必填项" validInfoArea="show_moduleUrl_area">
			</div>
			<div class="col-md-4 help-block" id="show_moduleUrl_area"></div>
		</div>
		<div class="form-group">
			<span class="col-sm-4 control-label">模块显示顺序：</span>
			<div class="col-md-4">
				<input type="text" class="form-control" id="displayIndex" name="displayIndex" placeholder="显示顺序" 
				valid="r|number|l0-le5" validTitle="必填项" validInfoArea="show_displayIndex_area">
			</div>
			<div class="col-md-4 help-block" id="show_displayIndex_area"></div>
		</div>
		<div class="form-group">
			<span class="col-sm-4 control-label">所属模块组：</span>
			<div class="col-md-4">
				<input type="text" class="form-control" id="moduleGroup" name="moduleGroup" placeholder="模块组">
			</div>
			<div class="col-md-4 help-block" id="show_moduleGroup_area"></div>
		</div>
		<div style=" text-align:center;"><p  style="color: #FF3847">如果需要将该模块放到某个二级菜单（注意是二级）下显示才添加，否则一定留空</p></div>
	</div>
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-10" style="text-align: center;">
			<button class="sbtn sbtn-blue" type="button" id="subBtn" onclick="submit_modu()">提交</button>
			<button class="sbtn sbtn-default" type="button" id="backBtn" style="margin-left:45px;">返回</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
$("#backBtn").click(function(){
	window.location.href = '<c:url value="/module/page" />';
})
//表单验证
var validator_modu;
var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
function submit_modu() {
	if (!validator_modu.validResult()) {
		$.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
		return;
	}else if($("#show_moduleName_area").html() != name_area){
		$.fn.dlshouwen.validator.tools.toast('模块名验证未通过！', 'error', 3000);
		return;
	}
	$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
	document.getElementById("moduleForm").submit();
}
$(function() {
	var option_modu = {
		elementCallback : {
			success : function(element, css){
				if($(element).is(':checkbox') || $(element).is(':radio')){
					var name = $(element).attr('name');
					$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
				}else{
					$(element).parents('.form-group').removeClass(css.failure);
				}
				//验证模块名
				if($(element).attr('name') == 'moduleName'){
					var moduleName = $("#moduleName").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						url : '<c:url value="/module/check" />',
						data : "moduleName=" + moduleName,
						success : function(Data, textStatus) {
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_moduleName_area").removeClass("info-area-success");
								$("#show_moduleName_area").addClass("info-area-failure");
								$("#show_moduleName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;模块名已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_moduleName_area").removeClass("info-area-failure");
								$("#show_moduleName_area").addClass("info-area-success");
								$("#show_moduleName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_moduleName_area").removeClass("info-area-success");
								$("#show_moduleName_area").addClass("info-area-failure");
								$("#show_moduleName_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;模块获取失败！请联系开发人员！");
								return;
							}
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_moduleName_area").removeClass("info-area-success");
							$("#show_moduleName_area").addClass("info-area-failure");
							$("#show_moduleName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
				//验证模块url
				if($(element).attr('name') == 'moduleUrl'){
					var moduleUrl = $("#moduleUrl").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						url : '<c:url value="/module/check" />',
						data : "moduleUrl=" + moduleUrl,
						success : function(Data, textStatus) {
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_moduleUrl_area").removeClass("info-area-success");
								$("#show_moduleUrl_area").addClass("info-area-failure");
								$("#show_moduleUrl_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;模块名已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_moduleUrl_area").removeClass("info-area-failure");
								$("#show_moduleUrl_area").addClass("info-area-success");
								$("#show_moduleUrl_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_moduleUrl_area").removeClass("info-area-success");
								$("#show_moduleUrl_area").addClass("info-area-failure");
								$("#show_moduleUrl_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;模块获取失败！请联系开发人员！");
								return;
							}
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_moduleUrl_area").removeClass("info-area-success");
							$("#show_moduleUrl_area").addClass("info-area-failure");
							$("#show_moduleUrl_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
			}
		}
   	};
	validator_modu = $.fn.dlshouwen.validator.init($('#moduleForm'),option_modu);
});
</script>
</html>