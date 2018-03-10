<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>角色列表</title>
</head>
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
<div id="content_1">
<div class="portlet box blue-hoki">			
		<div class="portlet-title">
			<div class="caption"  id="title">
				角色列表
			</div>
			<div style="margin-left:92%;padding-top:4px;">
				<button type="button" class="sbtn sbtn-default" onclick="window.location.href='newUser.jsp'">新增角色</button>
			</div>
		</div>			
		<div class="portlet-body form"> 
			<form action="roleManagement.jsp" id="equId" class="form-inline" style="margin:10px 0px 10px 10px;" name="" method="post">
				<input type="hidden" name="equipment" id="eq" class="equip" value=""/>		
				<div class="form-group">
					   <span>角色名称：</span>
					   <input type="text" class="form-control" id="name" placeholder="角色名称">
				  </div>
				<div class="form-group" style="margin-left:30px;">
					<span>可管理模块：</span>
						<input type="text" class="form-control" id="name" placeholder="可管理模块">
				</div>
				<div class="form-group" style="margin-left:30px;">
				    <button type="submit" class="sbtn sbtn-blue">查询</button>
				</div>
			</form>
		</div>							
			<div id="policehold_211" class="dlshouwen-grid-container" style="margin-top:5px;"></div>
			<div id="police_211" class="dlshouwen-grid-toolbar-container"></div>
</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="<%=path %>/js/deviceJstreeManage.js"></script>
<script type="text/javascript">
function fn(){
	  confirm("是否删除？");
}
$(document).ready(function() {	
	var datas = [
{ "name":"测试应用管理员" , "management":"应急救援队伍管理/用户管理/应景救援人员管理/权限管理/培训计划上报"},
{ "name":"应急救援系统设置管理员" , "management":"应急救援队伍管理/用户管理/应景救援人员管理/权限管理/培训计划上报"},
{ "name":"内容审核员" , "management":"应急救援队伍管理/用户管理/应景救援人员管理/权限管理/培训计划上报"},
{ "name":"应用系统管理员" , "management":"应急救援队伍管理/用户管理/应景救援人员管理/权限管理/培训计划上报"},
{ "name":"权限管理员" , "management":"应急救援队伍管理/用户管理/应景救援人员管理/权限管理/培训计划上报"},
];    	
	var gridColumns_2_1_1 = [    	
     	{id:'name', title:'角色名称', type:'string', columnClass:'text-center'},    	
     	{id:'management', title:'可管理模块', type:'string',  columnClass:'text-center'},	                     	
      	{id:'operation', title:'操作', type:'string', columnClass:'text-center'
      		, resolution:function(value, record, column, grid, dataNo, columnNo){ 	                     			
 			        var content = ''; 	                     			
 			        content += '<a href="editDetails.jsp"><button class="sbtn sbtn-default">编辑</button></a>'; 	                     			
 			        content += '  ';	                     			
 			        content += '<a onclick="fn();"><button  class="sbtn sbtn-blue">删除</button></a>'; 	                     			
 			        return content;                    			
 			    }		
      	}
     ];
     var gridOption_2_1_1 = {
     	lang : 'zh-cn',
     	ajaxLoad : false,
     	exportFileName : '用户列表',
     	datas : datas,
     	columns : gridColumns_2_1_1,
     	gridContainer : 'policehold_211',
     	toolbarContainer : 'police_211',
     	tools : '',
     	pageSize : 10,
     	pageSizeLimit : [10, 20, 50]
     };
     var grid_2_1_1 = $.fn.dlshouwen.grid.init(gridOption_2_1_1);
     $(function(){
     	grid_2_1_1.load();
     })	  
})
</script>				
</body>
</html>