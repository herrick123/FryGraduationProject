<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/pages/inc/deviceHeadTree.jsp" %> 
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户分页数据</title>
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
		<li><a href="#">用户管理</a></li>
	</ul>
</div>
<div class="row" style="margin: 10px 0px 10px 10px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height:50px;">
				登录名：<input type="text" class="form-control" id="userAccount" placeholder="请输入登录名">
            </div>
            <div class="form-group" style="line-height:50px;margin-left:10px;">
     			 用户名称：<input type="text" class="form-control" id="userName" placeholder="请输入用户名称">
            </div>
            <div class="form-group" style="line-height:50px;margin-left:10px;">
              	  部门：<input type="text" class="form-control" id="departmentName" placeholder="请输入部门">
              	  <input type="hidden" id="departmentId">
            </div> 
            <button type="button" id="searchBtn" class="sbtn sbtn-blue">查询</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        </div>
        </div>
               
        <div class="row" style="margin: 10px 0px 10px 10px;">
		<div class="col-md-3">
			<div class="portlet blue-hoki box">
				<div class="portlet-title">
					<div class="caption" id="title">
						<i class="fa fa-th-list"></i>组织机构
					</div>
				</div>
				<div class="portlet-body">
					<div class="jstree-default tree"></div>
				</div>
			</div>
		</div>
        <div class="col-md-9">
			<div class="portlet box blue-hoki">
				<div class="portlet-title">
					<div class="caption"  id="leveltitle">
						<i class="fa fa-th-list"></i>用户信息
					</div>
                <div style="float: right;padding: 3px 0px;margin-left: 5px;">
            	<button type="button" id="resetBtn" class="sbtn sbtn-default">重置密码</button>&nbsp;
            	</div>
	            <div style="float: right;padding: 3px 0px;margin-left: 5px;">
	           <button type="button" id="deleteBtn" class="sbtn sbtn-default">删除</button>&nbsp;
	           </div>
	           <div style="float: right;padding: 3px 0px;margin-left: 5px;">
	            <button type="button" id="addBtn" class="sbtn sbtn-default">新增</button>&nbsp;
	            </div>
            </div>
        </div>
		<div id="userDataList" class="dlshouwen-grid-container"></div>
		<div id="userPage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>
</body>
<script type="text/javascript">
var userColumns = [
    {id:'userId', title:'主键', type:'string', hide:true},
    {id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
			return dataNo+1;
	}},
    {id:'userAccount', title:'登录名', type:'string', columnClass:'text-center',resolution:function(value, record, column, grid, dataNo, columnNo){
    		var content = record.userAccount;
			return '<a href="<c:url value="/user/details"/>/'+record.userId+'">'+record.userAccount+'</a>';
	}},
    {id:'userName', title:'用户名', type:'string', columnClass:'text-center'},
    {id:'departmentName', title:'部门', type:'string',width:90, columnClass:'text-center'},
    {id:'iDNO', title:'工号', type:'string',width:45,columnClass:'text-center'},
    {id:'roleName', title:'角色', type:'string',  columnClass:'text-center'},
    {id:'createTime', title:'创建时间', type:'date', width:180,format:'yyyy-MM-dd hh:mm:ss', otype:'time_stamp_ms', columnClass:'text-center'},
    {id:'operation', title:'操作', type:'string',width:160, columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
       var content = '';
       content += '<button class="sbtn sbtn-blue" style="height:32px;line-height:10px" onclick="edit(\''+record.userId+'\')"> 编辑</button>';
       content += '  ';
       content += '<button class="sbtn sbtn-default" style="height:32px;line-height:10px" onclick="deleteOneRecord(\''+record.userId+'\');">  删除</button>';
       return content;
    }}
];
var userOption = {
	lang : 'zh-cn',
    ajaxLoad : true,
    loadURL : '<c:url value="/user/getDepartment" />',
    columns : userColumns,
    gridContainer : 'userDataList',
    toolbarContainer : 'userPage',
    tools : 'refresh',
    check : true,
    checkWidth : '20px',
    pageSize : 10,
    pageSizeLimit : [10, 20, 50,100]
};
var userGrid = $.fn.dlshouwen.grid.init(userOption);
$(function(){
	$('#searchBtn').click(function(){
		$("#departmentId").val("10010101");
		searchData();
	});
	userGrid.load();
});
function searchData(){
	userGrid.parameters = new Object();
	userGrid.parameters['userAccount'] = $("#userAccount").val();
	userGrid.parameters['userName'] = $("#userName").val();
	userGrid.parameters['departmentName'] = $("#departmentName").val();
	userGrid.refresh(true);
}

// 删除单条记录 
function deleteOneRecord(id){
	$("#modalId").val(id);
	$("#delOneModel").modal();
}

$("#deleteOneBtn").click(function() {
	var id=$("#modalId").val();
	$.ajax({
 		url : "<c:url value='/user/delete'/>?ids=" + id,
 		type: "POST",
 		dataType: "json",
 		success : function(data, textStatus) {
 			if(data.returncode == '200'){	
 				window.location.reload();
 			}else{
 				$('#delOneModel').modal('hide');
 				showMsg('存在管理员，无法删除，请确认后删除！');
 			}
 		},
 		error : function() {
 			$('#delOneModel').modal('hide');
 			showMsg('系统暂不可用，请稍后再试！');
 		}
 	});
});

//删除多条记录
$("#deleteBtn").click(function(){
	 var recordCount = userGrid.getCheckedRecords().length;
	 if (recordCount == 0) {
		 showMsg('请至少选择一条数据操作！',3);
	 } else {
		 $("#delAllModel").modal();
	 }
})

$("#delAll").click(function(){
	 var recordCount = userGrid.getCheckedRecords().length;
	 if (recordCount == 0) {
		 showMsg('请至少选择一条数据操作！',3);
	 } else {
		 $("#delAllModel").modal();
	     var records = userGrid.getCheckedRecords();
	     var ids = [];
	     for(var i = 0 ;i < records.length; i++ ){
	    	 ids.push(records[i].userId);
	     }
	     $.ajax({
	 		url : "<c:url value='/user/delete'/>?ids=" + ids,
	 		type: "POST",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.returncode == '200'){	
	 				window.location.reload();
	 			}else if(data.returncode == '10000'){
	 				$('#delAllModel').modal('hide');
	 				showMsg('存在管理员，无法删除，请确认后删除');
	 			}else{
	 				$('#delAllModel').modal('hide');
	 				showMsg('用户删除失败！');
	 			}
	 		},
	 		error : function() {	
	 			$('#delAllModel').modal('hide');
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	});
	 }
})

//重置密码	
$("#resetBtn").click(function(){
	var recordCount = userGrid.getCheckedRecords().length;
	 if (recordCount == 0) {
		 showMsg('请至少选择一条数据操作！',3);
	 } else {
		 var records = userGrid.getCheckedRecords();
	     var ids = [];
	     for(var i = 0 ;i < records.length; i++ ){
	    	 ids.push(records[i].userId);
	     }
	     $.ajax({
	 		url : "<c:url value='/user/reset'/>?ids=" + ids,
	 		type: "POST",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.returncode == '200'){
	 				showMsg('用户密码重置成功！');
	 			}else if(data.returncode == '10000'){
	 				showMsg('用户密码重置失败！请联系开发人员！');
	 			}else{
	 				showMsg('用户密码重置失败！');
	 			}
	 		},
	 		error : function() {	
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	});
	 }
})

/* 部门树 */
var parentResourceId = "0";
$('.tree').on('select_node.jstree', function(e, data) {
	var selectedLength = data.selected.length;
	var i, j, r = [],t = [];
	for (i = 0, j = selectedLength; i < j; i++) {
		var s = r.push(data.instance.get_node(data.selected[i]).id);
		var v = t.push(data.instance.get_node(data.selected[i]).text);
	}
	parentResourceId = r.join(s);
	if (parentResourceId > 0){
		$("#leveltitle").text(t.join(', '));
		
	} else {
		$("#leveltitle").text(t.join(v));
	}
   	}).jstree({
	"core" : {
		"themes" : {
			"stripes" : true
		},
        'data' : {
        	'url' : '<c:url value='/user/getTree' />',
            'dataType': 'JSON',
            'data' : function (node) {
            	return { 'id' : node.id };
             } 
        }
	},
	 "state": { "key": "airCorpTree" },
	"types" : {
		"default" : {
			"icon" : "fa fa-folder icon-state-warning icon-lg"
		},
		"file" : {
			"icon" : "fa fa-file icon-state-warning icon-lg"
		}
	},
	 /* "plugins" : ["state","types" ] */
});	

$(".tree").on("changed.jstree",function(e,data){
	var departmentId = data.instance.get_node(data.selected[0]).id;
	userGrid.parameters = new Object(); 	
	userGrid.parameters['departmentId'] = departmentId;
	userGrid.refresh(true);
	$("#addBtn").click(function(){		
		 $.ajax({
	 		url : "<c:url value='/user/addcheck' />?departmentId=" + departmentId,
	 		type: "GET",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.returncode == '10000'){
	 				showMsg('请选择要添加的部门！');	 				
	 			}else if(data.returncode == '200'){
	 				window.location.href = '<c:url value="/user/add" />?departmentId=' + departmentId;
	 			}
	 		},
	 		error : function() {	
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	}); 
		});
});

function edit(id){
	window.location.href = '<c:url value="/user/edit" />?id=' +id;
}
</script>
</html>