<%@page  pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<!DOCTYPE html>
<html  lang="en">
<head>
<meta charset="utf-8" />
<title>资源分组管理</title>
<style>
</style>
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
<li><a href="#">资源分组管理</a></li>
</ul> 
</div>
<div class="page-container">
<div class="page-content-wrapper">
<div class="page-content">
<div class="row">
    <div class="col-md-3">
       <div class="portlet blue-hoki box">
			<div class="portlet-title">
			<div class="caption">
			<i class="fa fa-cogs"></i>摄像机组织树														
			</div>			
			</div>
			<div class="portlet-body">
			<div id="tree_2" class="tree-demo"></div>
			</div>
    	</div>
    </div>
<div class="col-md-9" id="content_1">
<div class="portlet box blue-hoki">			
		<div class="portlet-title">
			<div class="caption" id="title">
				<i class="fa fa-th-list"></i>全部分类信息
			</div>
<!-- class="actions" -->					
		</div>								
	<div id="resourceGroupgridContainer" class="dlshouwen-grid-container" style="margin-top: 0px"></div>
	<div id="resourceGrouptoolbarContainer" class="dlshouwen-grid-toolbar-container" ></div>
</div>
</div>
</div>
</div>
</div>
</div>
<%-- <script type="text/javascript" src="<%=path %>/js/deviceJstreeManage.js"></script>  --%>
<script type="text/javascript">
$(document).ready(function() {	
	var resourceGroupdatas = [
{ "id":"1" , "numID":"T3-10001","area" : "飞行区","function":"视频监控调用，查看实时图像，系统配置的更改","state" : "正常"},																			
{ "id":"2" , "numID":"T3-10002","area" : "航站区","function":"视频监控调用","state" : "正常"},
{ "id":"3" , "numID":"T3-10003","area" : "控制区","function":"视频监控调用","state" : "正常"},
{ "id":"4" , "numID":"T3-10004","area" : "安全区","function":"查看实时图像","state" : "正常"} ];
	 var tree = $('#tree_2').jstree({
			"core" : {
				"themes" : {
					"responsive" : false
				},
				"check_callback" : true,
	            'data' : [
	                      {
	                    	'id':'0',
	                      	'text' : '摄像机分类', 
	                          //'url' : ,
	                          'dataType': 'JSON',
	                          'data' : function (node) {
	                          	return { 'id' : node.id};
	                          },
	                          'state' : {
	                	           'opened' : true,
	                	           'selected' : false
	                	         },
	                	         
	                          'children' : [	                                                   
	            {
	            	'id':'1',
	            	'text' : '区域', 
	                //'url' : ,
	                'dataType': 'JSON',
	                'data' : function (node) {
	                	return { 'id' : node.id};
	                },
	                'state' : {
	      	           'opened' : true,
	      	           'selected' :false
	      	         },
	                'children' :null
	            },
	            {
	            	'id':'2',
	            	'text' : '功能 ', 
	                //'url' : ,
	                'dataType': 'JSON',
	                'data' : function (node) {
	                	return { 'id' : node.id};
	                },
	                'state' : {
	      	           'opened' : true,
	      	           'selected' : false
	      	         },	      	         
	                'children' : null
	            },
	            {
	            	'id':'3',
	            	'text' : '状态', 
	                //'url' : ,
	                'dataType': 'JSON',
	                'data' : function (node) {
	                	return { 'id' : node.id};
	                },
	                'state' : {
	      	           'opened' : true,
	      	           'selected' :false
	      	         },	      	         
	                'children' :null
	            }	           	      	                                
	            ]
	                      }
	            ]
			},
			"types" : {
				"default" : {
					"icon" : "fa fa-folder icon-state-warning icon-lg"
				},
				"file" : {
					"icon" : "fa fa-file icon-state-warning icon-lg"
				}
			},
			"plugins" : ["types" ] 
		});
	 var ref = $('#tree_2').jstree(true);		
		// 树加载完毕后设置节点状态
		$('#tree_2').on('ready.jstree', function(e, data) {
			var openNodeId = "${param.node}";
			if(openNodeId == ""){
				openNodeId = "0";
			}
			var sel = ref.get_node(openNodeId);
			ref.select_node(sel);
			ref.open_node(sel);});	
	var resourceGroupColumns = [
     	{id:'id', title:'序号', type:'number', columnClass:'text-center'},
     	{id:'numID', title:'编号', type:'string', columnClass:'text-center'},
     	{id:'area', title:'区域', type:'string',style:'width:10px;', columnClass:'text-center'},
     	{id:'function', title:'功能', type:'string', columnClass:'text-center'},
     	{id:'state', title:'状态', type:'string', columnClass:'text-center'},
      	{id:'operation', title:'操作', type:'string', columnClass:'text-center'
      		, resolution:function(value, record, column, grid, dataNo, columnNo){ 	                     			
 			        var content = ''; 	                     			
 			        content += '<a href="#"><button class="sbtn sbtn-default">授权</button></a>'; 	                     			
 			        content += '  ';	                     			
 			        content += '<a onclick="exhibition();"><button  class="sbtn sbtn-blue">展示</button></a>'; 	                     			
 			        return content;                     			
 			    }}];
     var resourceGroupgridOption = {
     	lang : 'zh-cn',
     	ajaxLoad : false,
     	exportFileName : '用户列表',
     	datas : resourceGroupdatas,
     	columns : resourceGroupColumns,
     	gridContainer : 'resourceGroupgridContainer',
     	toolbarContainer : 'resourceGrouptoolbarContainer',
     	tools : '',
     	pageSize : 10,
     	pageSizeLimit : [10, 20, 50]
     };
     var resourceGroupgridOption1 = $.fn.dlshouwen.grid.init(resourceGroupgridOption);
     $(function(){
    	 resourceGroupgridOption1.load();
     });    
 	//给树绑定事件
     $('#tree_2').on('changed.jstree',function(e,data){
    	 //当前选中节点的文本值
            var value = data.instance.get_node(data.selected[0]).text;   	 
    	    var html='';
    	    if(value=="摄像机分类"){
                html+='<i class="fa fa-th-list"></i>摄像机分类';	                    	    	
    	    	$('#title').html(html);
    	    }
    	    else if(value=="区域"){
    	    	html+='<i class="fa fa-th-list"></i>区域';	                    	    	
    	    	$('#title').html(html);
            }
            else if(value=="功能"){
            	html+='<i class="fa fa-th-list"></i>功能';	                            
    	    	$('#title').html(html);
            }
            else if(value=="状态"){	                            	 
            	html+='<i class="fa fa-th-list"></i>状态';	                            
    	    	$('#title').html(html);
            }
        });
 });
$(".syn").click(function(){
	confirm("是否同步摄像头？");
});
function exhibition(){
	  confirm("展示");
}
</script>				
</body>
</html>