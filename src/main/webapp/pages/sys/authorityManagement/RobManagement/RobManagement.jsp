<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>抢权管理</title>
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
<li><a href="#">抢权管理</a></li>
</ul> 
</div>
<div class="page-container" style="width:100%;">
<div class="page-content-wrapper">
<div class="page-content">
<div class="row"> 
<div id="content_1">
<div class="portlet box blue-hoki">			
		<div class="portlet-title">
			<div class="caption" id="title">
				抢权管理
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
					<span>区域：</span>
						<input type="text" class="form-control" id="name" placeholder="区域">
				</div>
				<div class="form-group" style="margin-left:30px;">
				    <button type="submit" class="sbtn sbtn-blue">查询</button>
				</div>
			</form>
		</div>							
			<div id="robgridColumnspolicehold" class="dlshouwen-grid-container" style="margin-top:5px;"></div>
			<div id="robgridColumnspolice" class="dlshouwen-grid-toolbar-container"></div>
</div>
</div>
</div>
</div>
</div>
</div>
<script type="text/javascript" src="<%=path %>/js/deviceJstreeManage.js"></script>
<script type="text/javascript">
function sn(){
	window.location.href="#";
}
function fn(){
	  confirm("是否删除？");
}
$(document).ready(function() {	
	var robdatas = [
{ "userName":"李龙" , "withinArea":"航站区","cameraNumber":"T3-1001","area":"3号航站楼"},
{ "userName":"李飞" , "withinArea":"航站区","cameraNumber":"T2-1003","area":"2号航站楼"},
{ "userName":"张龙" , "withinArea":"航站区","cameraNumber":"T3-1005","area":"3号航站楼"},
{ "userName":"张权" , "withinArea":"航站区","cameraNumber":"T3-1007","area":"3号航站楼"}
];    	
	var robgridColumns = [    	
     	{id:'userName', title:'用户名', type:'string', columnClass:'text-center'},    	
     	{id:'withinArea', title:'所辖区域', type:'string',  columnClass:'text-center'},
     	{id:'cameraNumber', title:'摄像机编号', type:'string', columnClass:'text-center'},    	
     	{id:'area', title:'区域', type:'string',  columnClass:'text-center'},    	  	
      	{id:'operation', title:'操作', type:'string', columnClass:'text-center'
      		, resolution:function(value, record, column, grid, dataNo, columnNo){ 	                     			
 			        var content = ''; 	                     			
 			        content += '<a href="robDetails.jsp"><button class="sbtn sbtn-default">查看详情</button></a>'; 	                     			
 			        content += '  ';	                     			
 			        content += '<a onclick="fn();"><button  class="sbtn sbtn-blue">删除</button></a>'; 	                     			
 			       	content += '  ';	                     			
			        content += '<a href="impower.jsp"><button  class="sbtn sbtn-impower">授权</button></a>'; 	                     			
 			        return content;                    			
 			    }		
      	}
     ];
     var robOption = {
     	lang : 'zh-cn',
     	ajaxLoad : false,
     	exportFileName : '用户列表',
     	datas : robdatas,
     	columns : robgridColumns,
     	gridContainer : 'robgridColumnspolicehold',
     	toolbarContainer : 'robgridColumnspolice',
     	tools : '',
     	pageSize : 10,
     	pageSizeLimit : [10, 20, 50]
     };
     var robgrid = $.fn.dlshouwen.grid.init(robOption);
     $(function(){
     	robgrid.load();
     })	  
})
</script>				
</body>
</html>