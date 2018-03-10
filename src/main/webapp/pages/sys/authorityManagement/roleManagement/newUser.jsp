<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>${title }</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" href="<%=path %>/css/pilotcockpit.css" />
<link rel="stylesheet" href="<%=path %>/css/dataTables.bootstrap.css" />
<link rel="stylesheet" href="<%=path %>/css/pagebar.css" />
<script src="<%=path %>/js/jstree.min.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery.dataTables.min.js" type="text/javascript"></script>
<style type="text/css">
.page-content {
    padding: 8px 3px 0;
}
.divcss5 {
	background: #67809F;
	height: 40px;	
	margin-bottom:20px;
	padding: 0px 15px;
	color: #fff;
}
.divcss5_title {
	line-height: 40px;
}
.divcss5_left {
	float: left;
	width: 150px;
}
</style>
</head>
<body>
<div class="page-content">
<div class="page-bar">
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li>
				<i class="fa fa-home"></i> 
				<a href="#">青岛机场安全管理</a> 
				<i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">权限管理</a>
				<i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">新建角色</a></li>
		</ul> 
	</div>
</div>
<div class="page-content">
<div class="divcss5">
	<div class="divcss5_left"><span class="divcss5_title">角色信息</span></div>			
	<div class="clear"></div>
</div>
<div class="form-group" style="text-align:center;">
	<div class="row">
	<div class="col-md-3 col-md-text-right">
	<span>角色名称：</span>
	<span class="required">* </span>
	</div>
	<div class="col-md-6 col-md-text-left">
	<input type="text" class="form-control"
		id="roleName" placeholder="请输入角色名称">
	</div>
	</div>
</div>
<div class="form-group" style="text-align:center;">
	<div class="row">
	<div class="col-md-3 col-md-text-right">
	<span>模块控制：</span>
	<span class="required">* </span>
	</div>
	<div class="col-md-6 col-md-text-left">
	<select id="modeControl" name="modeControl" class="form-control">
		<option value="0">机场信息管理</option>
		<option value="1">机场集团应急管理</option>
		<option value="2">机场警卫路线管理</option>
		<option value="3">机场地图服务管理</option>
	</select>
	</div>
	</div>
</div>
<div class="col-md-offset-5 col-md-9" style="margin-top:70px;">
	<button type="submit" class="sbtn sbtn-blue sbtn30" style="margin-right:30px">
		 保存
	</button>
	<button type="button" onclick="history.go(-1)" class="sbtn sbtn-default  sbtn30">取消</button>
</div>
</div>
</div>  
<script type="text/javascript">
</script>
</body>
</html>