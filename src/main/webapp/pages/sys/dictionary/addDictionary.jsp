<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<style type="text/css">
	.input-radius{
		border-radius: 5px !important;
	}
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
				<a href="#">数据字典管理</a><i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">添加数据字典信息</a>
			</li>
		</ul>
	</div>
<div class="content">	
	<form name="dictForm" class="form-horizontal" id="dictForm" action="<c:url value='/dictionary/save' />" method="post">
		<input type="hidden" name="creator" id="creator" value="<c:out value='${ loginUser.userName }' />" />
		<input type="hidden" name="modifier" id="modifier" value="<c:out value='${ loginUser.userName }' />" />
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span for="typeName" class="col-sm-4 control-label">字典类别名称：</span>
				<div class="col-md-4  ">
					<input type="text" class="form-control" id="typeName" name="typeName" placeholder="请输入字典类别名称"
					valid="r|le2-le18" validTitle="必填项" validInfoArea="show_typeName_area">
				</div>
				<div class="col-md-4 help-block" id="show_typeName_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span for="typeCode" class="col-sm-4 control-label">字典类别值：</span>
				<div class="col-md-4 ">
					 <input type="text" class="form-control" id="typeCode" name="typeCode" placeholder="请输入字典类别值"
					valid="r|le1-le20" validTitle="必填项" validInfoArea="show_typeCode_area">
				</div>
				<div class="col-md-4 help-block" id="show_typeCode_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span for="describe" class="col-sm-4 control-label">字典类别描述：</span>
				<div class="col-md-4 ">
					<textarea class="form-control" id="describe" name="describe" placeholder="请输入字典类别描述：" 
					valid="r|le1-le255" validTitle="必填项" validInfoArea="show_describe_area"></textarea>
				</div>
				<div class="col-md-4 help-block" id="show_describe_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-11" style="text-align: center;">
				<button class="sbtn sbtn-blue sbtn30" type="button" onclick="submit_dict()" id="subBtn">保存</button>
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left: 45px;">返回</button>
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
$("#backBtn").click(function() {
	window.location.href = '<c:url value="/dictionary/page" />';
})
//表单验证
var validator_dict;
var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';

function submit_dict() {
	if (!validator_dict.validResult()) {
		$.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
		return;
	}else if($("#show_typeName_area").html() != name_area){
		$.fn.dlshouwen.validator.tools.toast('字典类别名称验证未通过！', 'error', 3000);
		return;
	}
	$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
	document.getElementById("dictForm").submit();
}  
$(function () {
	var option_dict = {
			elementCallback : {
				success : function(element, css){
					if($(element).is(':checkbox') || $(element).is(':radio')){
						var name = $(element).attr('name');
						$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
					}else{
						$(element).parents('.form-group').removeClass(css.failure);
					}
					//验证字典类别别名
					if($(element).attr('name') == 'typeName'){
						var typeName = $("#typeName").val();
						$.ajax({
							type : "POST",
							dataType : "json",
							url : '<c:url value="/dictionary/check" />',
							data : "typeName=" + typeName,
							success : function(Data, textStatus) {
								if (Data.returncode == '10000') {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_typeName_area").removeClass("info-area-success");
									$("#show_typeName_area").addClass("info-area-failure");
									$("#show_typeName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典类别别名已经存在");
									return;
								} else if (Data.returncode == '200') {
									$(element).parents('.form-group').removeClass(css.failure);
									$("#show_typeName_area").removeClass("info-area-failure");
									$("#show_typeName_area").addClass("info-area-success");
									$("#show_typeName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
								} else {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_typeName_area").removeClass("info-area-success");
									$("#show_typeName_area").addClass("info-area-failure");
									$("#show_typeName_area").
										html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典类别别名获取失败！请联系开发人员！");
									return;
								}
							},
							error : function(data) {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_typeName_area").removeClass("info-area-success");
								$("#show_typeName_area").addClass("info-area-failure");
								$("#show_typeName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
								return;
							}
						});
					}
					//验证字典类别值
					if($(element).attr('name') == 'typeCode'){
						var typeCode = $("#typeCode").val();
						$.ajax({
							type : "POST",
							dataType : "json",
							url : '<c:url value="/dictionary/check" />',
							data : "typeCode=" + typeCode,
							success : function(Data, textStatus) {
								if (Data.returncode == '10000') {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_typeCode_area").removeClass("info-area-success");
									$("#show_typeCode_area").addClass("info-area-failure");
									$("#show_typeCode_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典类别值已经存在");
									return;
								} else if (Data.returncode == '200') {
									$(element).parents('.form-group').removeClass(css.failure);
									$("#show_typeCode_area").removeClass("info-area-failure");
									$("#show_typeCode_area").addClass("info-area-success");
									$("#show_typeCode_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
								} else {
									$(element).parents('.form-group').addClass(css.failure);
									$("#show_typeCode_area").removeClass("info-area-success");
									$("#show_typeCode_area").addClass("info-area-failure");
									$("#show_typeCode_area").
										html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典类别值获取失败！请联系开发人员！");
									return;
								}
							},
							error : function(data) {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_typeCode_area").removeClass("info-area-success");
								$("#show_typeCode_area").addClass("info-area-failure");
								$("#show_typeCode_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
								return;
							}
						});
					}
				}
			}
	   	};
		validator_dict = $.fn.dlshouwen.validator.init($('#dictForm'),option_dict);
});
</script>
</html>