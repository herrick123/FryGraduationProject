<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>角色列表编辑</title>
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
		<li><a href="#">角色列表</a></li>
	</ul> 
</div>
<div class="tabbable" id="tabs-293139" style="position: relative;">
	<div class="portlet-title">
		<div class="caption"  id="title">
			角色列表
		</div>		
	</div>		
	<div class="tab-content">
		<div class="tab-pane active" id="panel-331421">
			<div class="portlet-body form" style="margin-top:20px">
				<form id="form1" class="form-horizontal" role="form" action="#"
					enctype="multipart/form-data" method="post">
					<div class="form-body">
						<div class="form-group">
							<label class="col-md-4 control-label">姓名：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control"
								value="管理员" readonly="readonly">
							</div>
							<label class="col-md-4 control-label">工号：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control" 
									value="E00001" readonly="readonly">
							</div>
							<label class="col-md-4 control-label">角色：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control" 
									value="超级管理员" readonly="readonly">
							</div>
							<label class="col-md-4 control-label">创建时间：
							<span class="required">* </span>
							</label>
							<div class="col-md-6" style="margin-bottom: 10px;">
								<input type="text" class="form-control" 
									value="2017-6-15" readonly="readonly">
							</div>
						</div>
					</div>	
					<div class="form-actions">
						<div class="row">
							<div class="col-md-offset-5 col-md-10" style="margin-top:30px">
								<button type="submit" class="sbtn sbtn-blue sbtn30">
									保存
								</button>
								<button type="button" class="sbtn sbtn-blue  sbtn30" onclick="update()" style="margin-left:15px">
									编辑
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
	function update(){
		$(".form-control").removeAttr("readonly");
	}
</script>
</body>
</html>