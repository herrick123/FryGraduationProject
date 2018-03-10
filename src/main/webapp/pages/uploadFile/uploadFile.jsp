<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工上传作业</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="<%=path%>/js/bootstrapValidator.min.js"></script>
<style type="text/css">
.input-radius {
	border-radius: 5px !important;
}
.file{
    position: absolute;
    right: 0;
    top: 0;
    height: 24px;
    filter: alpha(opacity:0);
    opacity: 0;
    width: 250px;
    font-size: 32px;
}
</style>
</head>
<body style="overflow: hidden;">
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">学员管理系统</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">上传作业</a></li>
		</ul>
	</div>

	<form name="uploadForm" class="form-horizontal" id="uploadForm"
		action="<c:url value='/uploadFile/upload' />" method="post" enctype="multipart/form-data">
		<div class="row" style="margin-top: 50px;">
			<div class="form-group">
				<span for="appName" class="col-sm-4 control-label">上传文件名称：</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="fileName"
						name="fileName" placeholder="请输入上传文件名称"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label">开始时间：</span>
				<div class="col-md-4">
					<input type="text"
						class="calender-birthday form-control input-radius" id="startTime"
						name="startTime" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})"
						placeholder="请输入开始时间" required="required">
				</div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label">结束时间：</span>
				<div class="col-md-4">
					<input type="text"
						class="calender-birthday form-control input-radius" id="endTime"
						name="endTime" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})"
						placeholder="请输入结束时间" required="required">
				</div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label">采用的技术：</span>
				<div class="col-md-4">
					<c:forEach var="skill" items="${skills }">
						<input type="checkbox" name="skill" value="${skill.typeCode }" />${skill.typeName }
		  		</c:forEach>
				</div>
			</div>
			<br>
			<div class="form-group">
				<span class="col-sm-4 control-label">文件描述：</span>
				<div class="col-md-4">
					<textarea class="form-control input-radius" id="remark"
						name="remark" placeholder="请输入文件描述"
						aria-describedby="sizing-addon2"></textarea>
				</div>
			</div>
		</div>
		<div class="form-group">
			<span class="col-md-4 control-label" >选择要上传的文件：</span>
			<div class="col-md-8 modal-body">
					<input type="text" name="filePath" id="filePath"
							style="height: 35px; border: 1px solid #cdcdcd; width: 250px;"
							readonly="readonly" autocomplete="off" disableautocomplete=""
							placeholder="   点击选择文件">
					<input type="file" name="uploadFile" class="file" id="uploadFile"
						style="top: 25%; left: 20px; line-height: 32px; height: 32px;"
						size="28"
						onchange="document.getElementById('filePath').value=this.value;"
						autocomplete="off" disableautocomplete="" >
			</div>
		</div>
	<div class="row" style="margin-top: 20px;">
		<div class="col-md-12" style="text-align: center;">
			<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn">保存</button>
			<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn"
				style="margin-left: 45px;">返回</button>
		</div>
	</div>
</form>
</body>
<script type="text/javascript">
	$("#backBtn").click(function() {
		/*  window.location.href = '<c:url value="/school/page" />';
				返回前一级页面
		 */
	})
	
	$(function() {
		$('#uploadForm').bootstrapValidator({
			message : 'This value is not valid',
			feedbackIcons : {
				invalid : 'glyphicon glyphicon-remove',
				validating : 'glyphicon glyphicon-refresh'
			},
			fields : {
				fileName : {
					message : '上传文件名称验证失败',
					validators : {
						notEmpty : {
							message : '上传文件名称不能为空'
						},
						stringLength : {
							min : 4,
							max : 50,
							message : '上传文件名称长度必须在4到50位之间'
						}
					}
				},
				/*   skill:{
				      validators: {
				          notEmpty: {
				              message: '采用的技术不能为空'
				          }
				      }
				  }, */
				remark : {
					validators : {
						notEmpty : {
							message : '文件描述不能为空'
						},
						stringLength : {
							min : 0,
							max : 255,
							message : '文件描述长度必须在1到255位之间'
						}
					}
				}
			}
		});

		$("#uploadForm").submit(function(ev) {
			ev.preventDefault();
		});

		$("#subBtn").on(
				"click",
				function() {
					var bootstrapValidator = $("#uploadForm").data(
							'bootstrapValidator');
					bootstrapValidator.validate();
					if (bootstrapValidator.isValid()) {
						var appName = $("#uploadForm").val();
						$.ajax({
							type : "POST",
							dataType : "json",
							url : '<c:url value="/uploadFile/checkUpload" />',
							data : "name=" + appName,
							success : function(Data, textStatus) {
								if (Data.returncode == '10000') {
									showMsg(Data.info);
								} else if (Data.returncode == '200') {
									document.getElementById("uploadForm").submit();
								} else {
									showMsg('上传文件失败！');
								}
							},
							error : function(data) {
								showMsg("服务器异常，稍后尝试");
							}
						});
					} else {
						return;
					}
				});
	})
</script>
</html>