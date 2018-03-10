<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>${title }</title>
</head>
<style type="text/css">
.page-content-wrapper .page-content {
    padding: 8px 3px 0;
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
<div id="content_1">
<div class="portlet box blue-hoki">			
		<div class="portlet-title">
			<div class="caption"  id="title">
				用户列表
			</div>
			<div style="margin-left:92%;padding-top:4px;">
				<button type="button" class="sbtn sbtn-default" onclick="window.location.href='newUserAdd.jsp'">新增</button>
			</div>
		</div>			
		<div class="portlet-body form"> 
			<form action="userList.jsp" id="equId" class="form-inline" style="margin:10px 0px 10px 10px;" name="" method="post">
				<input type="hidden" name="equipment" id="eq" class="equip" value=""/>		
				<div class="form-group">
					   <span>姓名：</span>
					   <input type="text" class="form-control" id="name" placeholder="姓名">
				  </div>
				<div class="form-group" style="margin-left:30px;">
					<span>角色：</span>
						<input type="text" class="form-control" id="name" placeholder="请选择角色">
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
function sn(){
	window.location.href="#";
}
$(document).ready(function() {	
	var datas = [
{ "name":"管理员" , "jobNum":"E00001","role":"超级管理员","time":"2017-6-15"},
{ "name":"赵测试" , "jobNum":"E00002","role":"应用系统管理员","time":"2017-6-15"},
{ "name":"陈锋" , "jobNum":"E00003","role":"应用系统管理员","time":"2017-6-15"},
{ "name":"孙悦" , "jobNum":"E00004","role":"内容审核员内容发布操作员","time":"2017-6-15"},
{ "name":"杨凯" , "jobNum":"E00005","role":"内容审核员内容发布操作员","time":"2017-6-15"}
];    	
	var gridColumns_2_1_1 = [    	
     	{id:'name', title:'姓名', type:'string', columnClass:'text-center'},    	
     	{id:'jobNum', title:'工号', type:'string',  columnClass:'text-center'},
     	{id:'role', title:'角色', type:'string',  columnClass:'text-center'},
     	{id:'time', title:'创建时间', type:'string',  columnClass:'text-center'},
      	{id:'operation', title:'操作', type:'string', columnClass:'text-center'
      		, resolution:function(value, record, column, grid, dataNo, columnNo){ 	                     			
 			        var content = ''; 	                     			
 			        content += '<a href="editRole.jsp"><button class="sbtn sbtn-default">编辑</button></a>'; 	                     			
 			        content += '  ';	                     			
 			        content += '<a onclick="fn();"><button  class="sbtn sbtn-blue">删除</button></a>'; 	                     			
 			       	content += '  ';	                     			
			        content += '<a onclick="sn();"><button  class="sbtn sbtn-impower">授权</button></a>'; 	                     			
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