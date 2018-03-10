<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户分页数据</title>
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
		<li><a href="#">角色管理</a></li>
	</ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height:50px;">
               	 角色名：
                <input type="text" class="form-control" name="roleName" id="roleName" placeholder="请输入角色名">
            </div>
            
            <button type="button" id="searchBtn" class="sbtn sbtn-blue">查询</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div class="row">
            <div class="col-md-10"> </div>
            <div class="col-md-2" style="margin-top:15px;text-align:right">
	            <button type="button" id="addBtn" class="sbtn sbtn-blue" style="margin-right: -7%;float: right;">新增</button>
            </div>
        </div>
		<div id="roleDataList" class="dlshouwen-grid-container"></div>
		<div id="rolePage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>

</body>
<script type="text/javascript">
var roleColumns = [
    {id:'roleId', title:'主键', type:'string', hide:true},
    {id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
		return dataNo+1;
	}},
    {id:'roleName', title:'角色名',width:180, type:'string', columnClass:'text-center'},
    {id:'roleCode', title:'角色代码',width:180, type:'string', columnClass:'text-center'},
    {id:'modulesName', title:'拥有模块',width:420, type:'string', columnClass:'text-center'},
    {id:'operation', title:'操作', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
       var content = '';
       content += '<button class="sbtn btn-xs sbtn-blue" style="height:32px;line-height:10px" onclick="edit(\''+record.roleId+'\');"> 编辑</button>';
       content += '  ';
       content += '<button class="sbtn btn-xs sbtn-blue" style="height:32px;line-height:10px" onclick="auth(\''+record.roleId+'\');"> 分配权限</button>';
       content += '  ';
       content += '<button class="sbtn btn-xs sbtn-default" style="height:32px;line-height:10px" onclick="deleteOneRecord(\''+record.roleId+'\');">  删除</button>';
       
       return content;
    }}
];
var roleOption = {
	lang : 'zh-cn',
	ajaxLoad : true,
    loadURL : '<c:url value="/role/asyncRoleList" />',
    columns : roleColumns,
    gridContainer : 'roleDataList',
    toolbarContainer : 'rolePage',
    tools : 'refresh',
    pageSize : 5,
    pageSizeLimit : [5, 10, 20,50],
    onCellMouseOver : function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
    	if(columnNo==4){
    		cell.attr("title",value);
    	}
	}
};

var roleGrid = $.fn.dlshouwen.grid.init(roleOption);
$(function(){
	$('#searchBtn').click(searchData);
	roleGrid.load();
});

function searchData(){
	roleGrid.parameters = new Object();
	roleGrid.parameters['roleName'] = $("#roleName").val();
	roleGrid.refresh(true);
}

function edit(id){
	window.location.href = '<c:url value="/role/edit"/>/'+id; 
}

function auth(aid){
	window.location.href = '<c:url value="/role/auth"/>/'+aid; 
}

//删除单条记录 
function deleteOneRecord(id){
	$("#modalId").val(id);
	$("#delOneModel").modal();
}

$("#deleteOneBtn").click(function() {
	var id=$("#modalId").val();
   	$.ajax({
    		url : "<c:url value='/role/delete'/>?id=" + id,
    		type: "POST",
    		dataType: "json",
    		success : function(data, textStatus) {
    			if(data.returncode == '200'){	
    				window.location.reload();
    			}else{
    				$('#delOneModel').modal('hide');
    				showMsg('角色删除失败！请联系开发人员！');
    			}
    		},
    		error : function() {	
    			$('#delOneModel').modal('hide');
    			showMsg('系统暂不可用，请稍后再试！');
    		}
    	});
});

$("#addBtn").click(function(){
	window.location.href = '<c:url value="/role/add" />';
})
</script>
</html>