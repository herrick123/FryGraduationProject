<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<!-- 前端校验框架 -->
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新</title>
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
			<a href="#">组织架构管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">编辑组织架构</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="frameForm" class="form-horizontal" id="frameForm" action="<c:url value='/pages/sys/organization/FrameworkList.jsp' />" method="post">
		<input type="hidden" name="frameId" id="frameId"  value="<c:out value='${ frameEntity.frameId}' />"/>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">组织名称：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="frameName" name="frameName" value="" placeholder="组织名称" 
					valid="r" validTitle="必填项" validInfoArea="show_frameName_area">
				</div>
				<div class="col-md-4 help-block" id="show_frameName_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">人数：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="frameCode" name="frameCode" value="" placeholder="人数" >
				</div>
				<div class="col-md-4 help-block" id="show_frameCode_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">负责人：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="frameCode" name="frameCode" value="" placeholder="负责人" >
				</div>
				<div class="col-md-4 help-block" id="show_frameCode_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">部门电话：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="phone" name="phone" value="" placeholder="部门电话" 
					valid="r" validTitle="必填项" validInfoArea="show_frameCode_area">
				</div>
				<div class="col-md-4 help-block" id="show_frameCode_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-blue" type="button" id="subBtn" onclick="submit_frame()" >提交</button>
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
</script>
</html>