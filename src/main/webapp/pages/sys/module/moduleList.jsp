<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header_jstree.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>模块分页数据</title>
</head>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i>
			<a href="#">青岛机场安全管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">模块管理</a></li>
	</ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height:50px;">
           		 模块名：<input type="text" class="form-control" id="moduleName" placeholder="请输入模块名">
            </div>
            <div class="form-group" style="line-height:50px;margin-left:10px;">
				模块路径：<input type="text" class="form-control" id="moduleUrl" placeholder="请输入模块路径">
            </div>
             <div class="form-group" style="line-height:50px;margin-left:10px;">
				 应用名称：
                <select name="ApplicationNames" class="form-control" id="appId">
                	<option value ="">-请选择-</option>
               		<c:forEach var="ApplicationName" items="${ApplicationNames}">
               			<option value ="${ApplicationName.id }">${ApplicationName.appName }</option>
					</c:forEach>
                </select>
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue">查询</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div class="row">
        	<div class="col-md-10"> </div>
            <div class="col-md-2" style="margin-top:15px;text-align: right;">
	            <button type="button" id="addBtn" class="sbtn sbtn-blue">新增</button>&#12288;
	            <button type="button" id="deleteBtn" class="sbtn sbtn-blue" style="margin-right: -7%;float: right;">删除</button>
            </div>
        </div>
        <div class="row">
        	<div class="col-md-2">
				 <div id="tree" class="#"></div>
			</div>
			<div class="col-md-10">
				<div id="moduleDataList" class="dlshouwen-grid-container" ></div>
				<div id="modulePage" class="dlshouwen-grid-toolbar-container"></div>
				<%-- <fmt:formatDate value="${module.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/> 
        		<fmt:formatDate value="${module.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/> --%>  
			</div>
        </div>
    </div>
	<!--批量删除 -->
    <div id="mymodel" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
				</div>
				<div class="modal-body" style="text-align: center;">该删除是不可恢复的，你确认要删除吗？</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" id="deleteAllBtn" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 删除单个 -->
	<div id="mymodelOne" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="modal-body" style="text-align: center;">
						该删除是不可恢复的，你确认要删除吗？
					</div>
					<input type="hidden" id="modalId">
				</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" id="deleteOneBtn" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
//加载树
$('#tree').jstree({
	"core" : {
		"themes" : {
			"responsive" : false
		},
        'data' : {
           	'url' : '<c:url value="/module/appTree" />',
			'dataType' : 'JSON',
		}
	},
});
var appId = '1';
$('#tree').on('changed.jstree',function(e,data){
	//当前选中节点的id
    appId = data.instance.get_node(data.selected[0]).id;
    if(appId==null||appId==1){
    	$("#addBtn").css('display','none');
	}else{
    	$("#addBtn").css('display','');
	}
    //刷新列表
    if(appId!=null){
    	if(appId==1){
    		moduleGrid.parameters = new Object();
            moduleGrid.parameters['appId'] = null;
    	}else{
    		moduleGrid.parameters = new Object();
            moduleGrid.parameters['appId'] = appId;
    	}
        moduleGrid.refresh(true);
    }
    
});


//加载表格
var moduleColumns = [
    {id:'moduleId', title:'主键id', type:'string', hide:true},
    {id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
		return dataNo+1;
	}},
    {id:'moduleName', title:'模块名', width:'140', type:'string', columnClass:'text-center'},
    {id:'moduleUrl', title:'模块路径', width:'160', type:'string', columnClass:'text-center'},
    {id:'appName', title:'所属应用', type:'string',  columnClass:'text-center'},
    {id:'moduleGroup', title:'所属模块组', type:'string',  columnClass:'text-center'},
    {id:'createTime', title:'创建时间', type:'date', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center'},
    {id:'operation', title:'操作', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
        var content = '';
        content += "<button class='sbtn sbtn-blue' style='height:32px; line-height:10px;'"
                + "onclick=editModule('"
        		+ record.moduleId
        		+ "');>  编辑</button>";
        content += '  ';
        content += "<button class='sbtn sbtn-default' style='height:32px; line-height:10px;'"
	            + "onclick=deleteOneModule('"
	    		+ record.moduleId
	    		+ "');>  删除</button>";
        return content;}
    }
];

var moduleOption = {
	lang : 'zh-cn',
    ajaxLoad : true,
    loadURL : '<c:url value="/module/pageList" />',
    columns : moduleColumns,
    gridContainer : 'moduleDataList',
    toolbarContainer : 'modulePage',
    tools : 'refresh',
    check : true,
    checkWidth : '20px',
    pageSize : 10,
    pageSizeLimit : [10, 20, 50,100]
};

var moduleGrid = $.fn.dlshouwen.grid.init(moduleOption);
$(function(){
	$('#searchBtn').click(searchData);
	moduleGrid.load();
});

function searchData(){
	moduleGrid.parameters = new Object();
	moduleGrid.parameters['moduleName'] = $("#moduleName").val();
	moduleGrid.parameters['moduleUrl'] = $("#moduleUrl").val();
	moduleGrid.parameters['appId'] = $("#appId").val();
	moduleGrid.refresh(true);
}
function editModule(id){
	 window.location.href = '<c:url value="/module/edit" />/' + id; 
}

function deleteOneModule(id){
	$("#mymodelOne").modal();
	$("#modalId").val(id);
}

$("#deleteOneBtn").click(function(){
	deleteId=$("#modalId").val();
	$.ajax({
 		url : "<c:url value='/module/delete'/>?moduleIds=" + deleteId,
 		type: "POST",
 		dataType: "json",
 		success : function(data, textStatus) {
 			if(data.returncode == '200'){	
 				window.location.reload();
 			}else{
 				$('#delOneModel').modal('hide');
 				showMsg('用户删除失败！请联系开发人员！');
 			}
 		},
 		error : function() {
 			$('#delOneModel').modal('hide');
 			showMsg('系统暂不可用，请稍后再试！');
 		}
 	});
});
	
$("#deleteBtn").click(function(){
	 var recordCount = moduleGrid.getCheckedRecords().length;
	 if (recordCount == 0) {
		 showMsg('请至少选择一条数据操作！',3);
	 } else {
		 $("#delAllModel").modal();
	 }
})

$("#delAll").click(function(){
	var records = moduleGrid.getCheckedRecords();
    var ids = [];
    for(var i = 0 ;i < records.length; i++ ){
   	 ids.push(records[i].moduleId);
    }
    $.ajax({
		url : "<c:url value='/module/delete'/>?moduleIds=" + ids,
		type: "POST",
		dataType: "json",
		success : function(data, textStatus) {
			if(data.returncode == '200'){	
				window.location.reload();
			}else{
				$('#delAllModel').modal('hide');
				showMsg('用户删除失败！请联系开发人员！');
			}
		},
		error : function() {	
			$('#delAllModel').modal('hide');
			showMsg('系统暂不可用，请稍后再试！');
		}
	});
})

$("#addBtn").click(function(){
	if(appId==null||appId==1){
		return;
	}
	window.location.href = '<c:url value="/module/add" />?appId='+appId;
})
</script>
</html>