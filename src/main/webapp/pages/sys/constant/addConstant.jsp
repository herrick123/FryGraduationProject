<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<script type="text/javascript" src="<%=path%>/js/sysManage/constant/addConstant.js"></script>
<style type="text/css">
	.input-radius{
		border-radius: 5px;
	}
	 .constant-label{
	 	text-align:right;
	 	line-height:30px;
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
				<a href="#">数据字典分类信息管理</a><i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">添加数据字典分类信息</a>
			</li>
		</ul>
	</div>
	<form name="constantForm" class="form-horizontal" id="constantForm" action="<c:url value='/constant/save' />" method="post">
		<div class="row" style="margin-top: 50px;">
			<input type="hidden" name="creator" id="creator" value="<c:out value='${ loginUser.userName }' />" />
			<input type="hidden" name="modififer" id="modififer" value="<c:out value='${ loginUser.userName }' />" />
			<div class="form-group">		
				<span  class="col-sm-4 constant-label">所属字典类别：</span> 
				<div class="col-md-4 ">
					<input type="hidden" class="form-control" id="dictionaryId" name="dictionaryId" value="${dictionary.id }" >
					<input type="hidden" class="form-control" id="dictionaryId" name="dictionaryCode" value="${dictionary.typeCode }" >
					<input type="text" class="form-control" id="dictionaryName" value="${dictionary.typeName }" disabled="disabled" placeholder="" aria-describedby="sizing-addon2">
				</div>
			</div>
			<div class="form-group" style="margin-top: 20px;">
				<span class="col-sm-4 constant-label">字典名称：</span> 
				<div class="col-md-4 ">
					<input type="text" class="form-control" id="valueName" name="valueName" placeholder="请输入字典名称"
					valid="r|le1-le20" validTitle="必填项" validInfoArea="show_valueName_area">
				</div>
				<div class="col-md-4 help-block" id="show_valueName_area"></div>
			</div>
			<div class="form-group">
				<span class="col-sm-4 constant-label">字典类型编码：</span> 
				<div class="col-md-4 ">
					<input type="text" class="form-control" id="valueCode" name="valueCode" placeholder="请输入字典类型编码" 
					valid="r|le1-le20" validTitle="必填项" validInfoArea="show_valueCode_area">
				</div>
				<div class="col-md-4 help-block" id="show_valueCode_area"></div>
			</div>
			<div class="form-group">
				<span class="col-sm-4 constant-label">字典类型简介：</span> 
				<div class="col-md-4 "> 
					<input type="text" class="form-control" id="constantDesc" name="constantDesc" placeholder="请输入字典类型简介"
					valid="r" validTitle="必填项" validInfoArea="show_constantDesc_area">
				</div>
				<div class="col-md-4 help-block" id="show_constantDesc_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-11" style="text-align: center;">
				<button class="sbtn sbtn-blue sbtn30" type="button" onclick="submit_constant()" id="subBtn">保存</button>
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left: 45px;"
				onclick="javascript:location.href='<%=path%>/constant/page';">返回
				</button>
			</div>
		</div>
	</form>
</body>
</html>