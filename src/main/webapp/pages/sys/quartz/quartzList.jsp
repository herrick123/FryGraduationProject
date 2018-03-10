<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>定时任务分页数据</title>
<style>
	td {
   		white-space:nowrap;
   		overflow:hidden;
   		text-overflow: ellipsis;
	}
	table {   
        table-layout:fixed;  
    } 
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
			<a href="#">系统管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">定时任务管理</a>
		</li>
		
	</ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height:50px;">
               	 任务名称：
                <input type="text" class="form-control" name="jobName" id="jobName" placeholder="请输入任务名称">
            </div>
            
            <button type="button" id="searchBtn" class="sbtn sbtn-blue">查询</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div class="row">
       	 	<div class="col-md-12" style="margin-top: 5px">
	            <button style="float: right;margin-left: 10px" type="button" id="deleteBtn" class="sbtn sbtn-blue">删除</button>
	            <button style="float: right; margin-left: 10px" type="button" id="editBtn" class="sbtn sbtn-blue">编辑</button>
	            <button style="float: right;"  type="button" id="addBtn" class="sbtn sbtn-blue">新增</button>
            </div>
        </div>
		<div id="quartzDataList" class="dlshouwen-grid-container"></div>
		<div id="quartzPage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>

</body>
<script type="text/javascript">
var roleColumns = [
    {id:'id', title:'主键', type:'string', hide:true},
    {id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
		return dataNo+1;
	}},
    {id:'jobName', title:'任务名称', type:'string', columnClass:'text-center'},
	{id:'updateTime', title:'修改时间',  type:'date', format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center'},
    {id:'jobStatus', title:'任务状态', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
    	var content = '';
    	if(value == "1"){
    		content += "已启动";
    	}else{
    		content += "已停止";
    	}
    	return content;
    }},
    {id:'scheme', title:'任务执行方案', type:'string', columnClass:'text-center'},
    {id:'operation', title:'操作', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
    	var content = '';
    	if(record.jobStatus =="1"){
       		content += '<button class="sbtn btn-xs sbtn-blue" style="height:32px;line-height:10px" onclick="stop(\''+record.id+'\',this);"> 停止</button>';
       	}else{
       		content += '<button class="sbtn btn-xs sbtn-blue" style="height:32px;line-height:10px" onclick="start(\''+record.id+'\',this);"> 启动</button>';
       	}
       return content;
    }}
];
var quartzOption = {
	lang : 'zh-cn',
	ajaxLoad : true,
    loadURL : '<c:url value="/quartz/quartzList" />',
    columns : roleColumns,
    gridContainer : 'quartzDataList',
    toolbarContainer : 'quartzPage',
    tools : 'refresh',
    check : true,
    checkWidth : '30px',
    pageSize : 5,
    pageSizeLimit : [5, 10, 20,50],
};

var quartzGrid = $.fn.dlshouwen.grid.init(quartzOption);
$(function(){
	$('#searchBtn').click(searchData);
	quartzGrid.load();
});

function searchData(){
	quartzGrid.parameters = new Object();
	quartzGrid.parameters['jobName'] = $("#jobName").val();
	quartzGrid.refresh(true);
}

$("#editBtn").click(function(){
	 var recordCount = quartzGrid.getCheckedRecords().length;
	 if (recordCount == 0) {
		 showMsg('请选择一条数据进行编辑！',3);
	 } else if (recordCount > 1) {
		 showMsg('一次只能编辑一条数据！');
	 } else {
	     var records = quartzGrid.getCheckedRecords();
	     if(records[0].jobStatus == 0){
		 	window.location.href = '<c:url value="/quartz/edit" />/' + records[0].id; 
	     }else{
	    	 showMsg('请先停止选择的定时任务');
	     }
	     
	 }
})

$("#deleteBtn").click(function(){
	 var recordCount = quartzGrid.getCheckedRecords().length;
	 if (recordCount == 0) {
		 showMsg('请至少选择一条数据操作！',3);
	 } else {
	     var records = quartzGrid.getCheckedRecords();
	     var ids = [];
	     for(var i = 0 ;i < records.length; i++ ){
	    	 if(records[i].jobStatus == 1){
	    		 showMsg('请先停止选择的定时任务');
	    		 return
	    	 }
	    	 ids.push(records[i].id);
	     }
	     $("#delAllModel").modal();
	 }
})

$("#delAll").click(function(){
	 var recordCount = quartzGrid.getCheckedRecords().length;
     var records = quartzGrid.getCheckedRecords();
     var ids = [];
     for(var i = 0 ;i < records.length; i++ ){
    	 ids.push(records[i].id);
     }
     $.ajax({
 		url : "<c:url value='/quartz/delete'/>?ids=" + ids,
 		type: "POST",
 		dataType: "json",
 		success : function(data, textStatus) {
 			if(data.returncode == '200'){	
 				window.location.reload();
 			}else{
 				$('#delAllModel').modal('hide');
 				showMsg('删除定时任务失败！请联系开发人员！');
 			}
 		},
 		error : function() {	
 			$('#delAllModel').modal('hide');
 			showMsg('系统暂不可用，请稍后再试！');
 		}
 	});
})

function start(id,obj){
	$.ajax({
		url : "<c:url value='/quartz/resume'/>?id=" + id,
		type: "POST",
		dataType: "json",
		success : function(data, textStatus) {
			if(data.returncode == '200'){	
				window.location.reload();
			}else{
				$('#delOneModel').modal('hide');
				showMsg('定时任务恢复失败！请联系开发人员！');
			}
		},
		error : function() {	
			$('#delOneModel').modal('hide');
			showMsg('系统暂不可用，请稍后再试！');
		}
	});
}
function stop(id,obj){
	$.ajax({
		url : "<c:url value='/quartz/pause'/>?id=" + id,
		type: "POST",
		dataType: "json",
		success : function(data, textStatus) {
			if(data.returncode == '200'){	
				window.location.reload();
			}else{
				showMsg('定时任务暂停失败！请联系开发人员！');
			}
		},
		error : function() {	
			showMsg('系统暂不可用，请稍后再试！');
		}
	});
}
function edit(id){
	window.location.href = '<c:url value="/quartz/edit"/>/'+id; 
}
function deleteQuartz(id){
	window.location.href = '<c:url value="/quartz/delete"/>/'+id; 
}


$("#addBtn").click(function(){
	window.location.href = '<c:url value="/quartz/add" />';
})
</script>
</html>