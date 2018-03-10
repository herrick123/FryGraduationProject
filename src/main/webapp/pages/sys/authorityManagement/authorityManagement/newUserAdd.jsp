<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>${title }</title>
</head>
<style type="text/css">
.form-group{
margin-top:10px;
text-align: center;
}	
</style>
<body>
<div class="sodb-page-home">
<ul class="sodb-page-ul">
<li>
<i class="fa fa-home"></i> 
<a href="#">青岛机场安全管理</a> 
<i class="fa fa-angle-right"></i>
</li>
<li>
<a href="#">系统管理子系统</a>
<i class="fa fa-angle-right"></i>
</li>
<li><a href="#">权限管理</a></li>
</ul> 
</div>
<div class="page-container" style="width:100%;">
<div class="page-content-wrapper">
<div class="page-content">
<div class="row"> 
<div class="col-md-9" id="content_1">
<div class="portlet box blue-hoki">			
		<div class="portlet-title">
			<div class="caption"  id="title">
				新建用户
			</div>			
		</div>			
		<div class="portlet-body form"> 			
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">账号：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="账号">
						</div>
					</div>
				</div>	
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">密码：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="密码">
						</div>
					</div>
				</div>	
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">姓名：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="姓名">
						</div>
					</div>
				</div>	
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">性别：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="radio" name="sexChoose" value="1" />男
    						<input type="radio" name="sexChoose" value="2" />女
						</div>
					</div>
				</div>	
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">工号：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="工号">
						</div>
					</div>
				</div>
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">手机：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="手机">
						</div>
					</div>
				</div>
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">座机：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="座机">
						</div>
					</div>
				</div>
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">Email：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="Email">
						</div>
					</div>
				</div>
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">职务：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="职务">
						</div>
					</div>
				</div>
				
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">角色：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="text" class="form-control" placeholder="角色">
						</div>
					</div>
				</div>	
							
				<div class="form-group" >
					<div class="row">
						<label class="col-md-4 control-label">是否负责人：
							<span class="required">* </span>
						</label>
						<div class="col-md-6">					
							<input type="radio" name="manager" value="1" />是
							<input type="radio" name="manager" value="2" />否
						</div>
					</div>
				</div>
				
				<div class="form-group">							
				    <button type="submit" class="sbtn sbtn-blue">保存</button>
				    <button  class="sbtn sbtn-blue" onclick="window.location.href='userList.jsp'">取消</button>				
				</div>		
		</div>									
</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="<%=path %>/js/deviceJstreeManage.js"></script>
<script type="text/javascript">
</script>				
</body>
</html>