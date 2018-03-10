<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/datePicker/skin/WdatePicker.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path%>/extends/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>录入员工信息</title>
<style type="text/css">

.employeeImage {
	width: 126px;
	height: 160px;
	background-color: blue;
	float: right;
}
img{
	width: 126px;
	height: 160px;
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
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">员工管理系统</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">员工信息管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">录入员工信息</a></li>
		</ul>
	</div>
	<div class="content">
		<form name="addProjectSkillForm" class="form-horizontal" id="addProjectSkillForm" action="<c:url value='/projectManage/updataProjectManageSkill' />" method="GET" enctype="multipart/form-data">
			<div class="row form-group col-md-12" style="margin-top:10px;margin-left: -220px;">
				<div class="form-group">
					<span class="col-sm-4 control-label" >为项目添加技能：</span>
					<br>	
					<input name="id"  value="${id}" style="display:none">				
					<div class="col-md-8">
						<c:forEach var="projectSkill" items="${projectSkills }">						
								<div class="col-md-2">
					  				<input type="checkbox"  name="projectSkill" value="${projectSkill.valueCode}" 
										<c:forEach var="strList" items="${strList }">
											<c:if test="${projectSkill.valueCode eq strList}"> checked="checked"</c:if>
										</c:forEach>
									 />${projectSkill.valueName }
					  			</div>
				  		</c:forEach>
				  	</div>
				</div>
			</div>
			<div class="row form-group" style="margin-top:10px;">
				<div class="col-md-12 " style="text-align: center; margin-top:30px;">
					<button class="sbtn sbtn-blue sbtn30" type="submit" id="submit" >提交</button>
					<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left:46px;">返回</button>
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
/* 返回页面 */
$("#backBtn").click(function(){
	window.location.href = '<c:url value="/projectManage/page" />';
})


</script>
</html>
