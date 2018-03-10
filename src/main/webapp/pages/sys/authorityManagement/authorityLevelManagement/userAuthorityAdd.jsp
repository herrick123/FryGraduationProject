<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>新增</title>
<link rel="shortcut icon" href="favicon.ico" />
<style type="text/css">
.portlet-title {
    background-color: #67809f;
}
.portlet-title {
    border-bottom: 0 none;
    color: #fff;
    margin-bottom: 0;
    padding: 0 10px;
}
.portlet-title {
    border-radius: 4px 4px 0 0;
    min-height: 41px;  
}
 .caption {
    color: #ffffff;
    padding: 11px 0 9px;
    display: inline-block;
    float: left;
    font-size: 14px;
    line-height: 18px;
}
</style>
</head>
<body>			
<div class="sodb-page-home" style="margin-bottom:20px">
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
		<li><a href="#">用户权限分级管理</a></li>
	</ul> 
</div>
<div class="tabbable" id="tabs-293139" style="position: relative;">
	<div class="portlet-title">
		<div class="caption" id="title">
			用户新增
		</div>		
	</div>		
	<div class="tab-content">
		<div class="tab-pane active" id="panel-331421">
			<div class="portlet-body form" style="margin-top:20px">
				<form id="form1" class="form-horizontal" role="form" action="#"
					enctype="multipart/form-data" method="post">
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-4 control-label">用户名：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control"
								value="" placeholder="请输入用户名">
							</div>
							<label class="col-md-4 control-label">部门：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control" 
									value="" placeholder="请输入部门">
							</div>
							<label class="col-md-4 control-label">角色：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control" 
									value="" placeholder="请输入角色">
							</div>
							<label class="col-md-4 control-label">功能：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control" 
									value="" placeholder="请输入功能">
							</div>
							<label class="col-md-4 control-label">时间：
							<span class="required">* </span>
							</label>
							<div class="col-md-6">
								<input type="text" class="form-control" 
									value="" placeholder="请输入时间">
							</div>
						</div>
					</div>	
					<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-5 col-md-10" style="margin-top:30px">
								<button type="submit" class="sbtn sbtn-blue sbtn30">
									保存
								</button>								
								<button type="button" 
									onclick="history.go(-1);"
									class="sbtn sbtn-default sbtn30" style="margin-left:15px">
									返回
								</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>	
	</div>
</div>
<script type="text/javascript">	
</script>
</body>
</html>