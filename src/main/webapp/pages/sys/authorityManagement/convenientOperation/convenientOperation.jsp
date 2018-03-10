<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>便捷化操作</title>
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
<a href="#">权限管理</a>
<i class="fa fa-angle-right"></i>
</li>
<li><a href="#">便捷化操作</a></li>
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
				便捷化操作
			</div>
			<div style="margin-left:92%;padding-top:4px;">
				<button type="button" class="sbtn sbtn-default" onclick="window.location.href='#'">新增</button>
			</div>
		</div>			
		<div class="portlet-body form"> 
			<form action="#" id="equId" class="form-inline" style="margin:10px 0px 10px 10px;" name="" method="post">
				<input type="hidden" name="equipment" id="eq" class="equip" value=""/>		
				<div class="form-group">
					   <span>用户名：</span>
					   <input type="text" class="form-control" id="name" placeholder="用户名">
				</div>
				<div class="form-group" style="margin-left:30px;">
					   <span>角色：</span>
					   <input type="text" class="form-control" id="name" placeholder="角色">
				</div>
				<div class="form-group" style="margin-left:30px;">
					<span>功能：</span>
						<input type="text" class="form-control" id="name" placeholder="功能">
				</div>
				<div class="form-group" style="margin-left:30px;">
				    <button type="submit" class="sbtn sbtn-blue">查询</button>
				</div>
			</form>
		</div>							
			<div id="convenientpolicehold" class="dlshouwen-grid-container" style="margin-top:5px;"></div>
			<div id="convenientpolice" class="dlshouwen-grid-toolbar-container"></div>
</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="<%=path %>/js/deviceJstreeManage.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	var convenientdatas = [
{ "name":"李龙" , "role":"管理员","function":"视频监控调用、设备的添加修改、查看系统日志权限，设备广播权限","time":"2017-6-22"},
{ "name":"李飞" , "role":"测试员","function":"视频监控调用","time":"2017-6-22"},
{ "name":"马龙" , "role":"安保组长","function":"视频监控调用、设备的添加修改","time":"2017-6-22"},
{ "name":"张全" , "role":"运维员","function":"视频监控调用","time":"2017-6-22"}
];    	
	var convenientgridColumns = [    	
     	{id:'name', title:'用户名', type:'string', columnClass:'text-center'},
     	{id:'role', title:'角色', type:'string', columnClass:'text-center'},    	
     	{id:'function', title:'功能', type:'string',  columnClass:'text-center'},
     	{id:'time', title:'时间', type:'string', columnClass:'text-center'},    	
      	{id:'operation', title:'操作', type:'string', columnClass:'text-center'
      		, resolution:function(value, record, column, grid, dataNo, columnNo){ 	                     			
 			        var content = ''; 	                     			
 			        content += '<a href="#"><button class="sbtn sbtn-default">克隆</button></a>'; 	                     			
 			        content += '  ';	                     			
			        content += '<button  class="sbtn sbtn-impower" onclick="fn();">删除</button>'; 	                     			
 			        return content;                    			
 			    }		
      	}
     ];
     var convenientgridOption = {
     	lang : 'zh-cn',
     	ajaxLoad : false,
     	exportFileName : '用户列表',
     	datas : convenientdatas,
     	columns : convenientgridColumns,
     	gridContainer : 'convenientpolicehold',
     	toolbarContainer : 'convenientpolice',
     	tools : '',
     	pageSize : 10,
     	pageSizeLimit : [10, 20, 50]
     };
     var convenientgrid = $.fn.dlshouwen.grid.init(convenientgridOption);
     $(function(){
    	 convenientgrid.load();
     })	  
})
function fn(){
	  confirm("是否删除？");
}
</script>				
</body>
</html>