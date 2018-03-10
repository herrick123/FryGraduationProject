<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header_jstree.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>猛码学员请假列表</title>
<style type="text/css">
.sbtn-green{border:1px solid #009966;background-color:#009966;color:#fff; }
.sbtn-yellow{border:1px solid #NaNNaNNaN;background-color:#fff;color:#808080;}
.sbtn-green:hover{border:1px solid #47A447;background-color:#47A447;color:#fff; }
.sbtn-default{background-color: #fff;border:1px solid  #ccc;color: #333;}
.sbtn-default:hover{border:1px solid #ccc;background-color:#e6e6e6;color:#333; }
.sbtn-red{border:1px solid red;background-color:rgba(232, 63, 36, 1);;color:#fff; }
</style>
</head>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i>
			<a href="#">猛码学员管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
			<li>
			<a href="#">请假管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">请假审核</a></li>
	</ul>
</div>
<div class="portlet blue-hoki box">
	<div class="row" style="margin:0px;">
	    <div class="col-md-12 marry-background" >
	        <form class="form-inline">
	            <div class="form-group" style="line-height:50px;margin-left:10px;">
	     			 用户名：<input type="text" class="form-control" id="name" placeholder="请输入用户名">
	            </div>
	            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="height: 35px;margin-top:4px;margin-left:5px;">查&nbsp;&nbsp;询</button>
	        </form>
	        <div class="col-md-12" style="background-color:rgb(4, 109, 167); height:3px;"></div>
	        <br>
			<div id="leaveDataList" class="dlshouwen-grid-container"></div>
			<div id="leavePage" class="dlshouwen-grid-toolbar-container"></div>
	    </div>
	</div>
</div>
</body>
<script type="text/javascript">
var leaveColumns = [
    {id:'id', title:'主键', type:'string', hide:true},
    {id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
			return dataNo+1;
	}},
	{id:'name', title:'用户名', type:'string', columnClass:'text-center'},
	{id:'startTime', title:'请假开始时间', type:'date', format:'yyyy-MM-dd', otype:'time_stamp_ms', columnClass:'text-center'},
    {id:'endTime', title:'请假结束时间', type:'date', format:'yyyy-MM-dd', otype:'time_stamp_ms', columnClass:'text-center'},
    {id:'timeLength', title:'请假时长', type:'string',  columnClass:'text-center'},
    {id:'type', title:'请假类型', type:'string', columnClass:'text-center'},
    {id:'reason', title:'请假事由', type:'string', columnClass:'text-center'},
    {id:'operation', title:'操作', type:'string', columnClass:'text-center',resolution:function(value, record, column, grid, dataNo, columnNo){
         var content = '';
         if(${loginUser.role eq 'S00002'}){  
        	 if(value == "L01"){
        		 content +=  '<span style="color:orange">待审核</span>';
        	 }else if(value == "L02"){
        		 content +=  '<span style="color:green">审核通过</span>';
        	 }
        	 else{
        		 content +=  '<span style="color:red">审核未通过</span>';
        	 }
         }else{ 
        	//2.登陆身份是管理员
        	 //如果请假状态是待审核
      	   if(value == "L01"){
      		 	content +=  '<span id ="pass'+record.id+'" style="display:none;color:green;">审核通过</span>';
      		 	content +=  '<span id = "nopass'+record.id+'" style="display:none;color:red;">审核未通过</span>';
           		content +='<button id="pbtn'+record.id+'" class="sbtn sbtn-blue" style="height:32px;line-height:10px;" onclick="editStatus(\''+record.id+'\',\'L02\',\''+record.timeLength+'\',\''+record.leaveType+'\',\''+record.name+'\');">批&nbsp;&nbsp;准</button>'; 
           		content +='<button id="npbtn'+record.id+'" class="sbtn sbtn-red" style="height:32px;line-height:10px;margin-left:40px;" onclick="editStatus(\''+record.id+'\',\'L03\',\'\',\'\',\''+record.name+'\');">不批准</button>'; 
      	   }else{
      		 //否则请假已审核
      		 if(value == "L02"){
      			content += '<span style="color:green">审核通过</span>';
      		 }else{
      			content += '<span style="color:red">审核不通过</span>';
      		 }
           }
         }
         return content;
      }}
	];
var userOption = {
	lang : 'zh-cn',
    ajaxLoad : true,
    loadURL : '<c:url value="/leave/pageList" />',
    columns : leaveColumns,
    gridContainer : 'leaveDataList',
    toolbarContainer : 'leavePage',
    tools : 'refresh',
    check : true,
    checkWidth : '20px',
    pageSize : 10,
    pageSizeLimit : [10, 20, 50,100]
};
var leaveGrid = $.fn.dlshouwen.grid.init(userOption);
//请假审核
function editStatus(id,value,timeLength,type,name){
	$.ajax({
 		url : '<c:url value="/leave/editLeaveStatus"/>?id='+id+"&operation="+value+"&type="+type+"&timeLength="+timeLength+"&name="+name, 
 		type: "get",
 		dataType: "json",
 		success : function(data, textStatus) {
 			if(data.returncode == '200'){	
 				$("#pbtn"+id).css("display","none");
 				$("#npbtn"+id).css("display","none");
 				if(value=="L02"){
 					$("#pass"+id).css("display","");
 				}
 				else if(value=="L03"){
 					$("#nopass"+id).css("display","");
 				}
 				showMsg('操作成功！');
 			}else{
 				showMsg('请假状态修改失败！请联系开发人员！');
 			}
 		},
 		error : function() {
 			showMsg('系统暂不可用，请稍后再试！');
 		}
 	});
} 
$(function(){
	$('#searchBtn').click(searchData);
	leaveGrid.parameters = new Object();
	leaveGrid.load();
});
function searchData(){
	leaveGrid.parameters = new Object();
	leaveGrid.parameters['name'] = $("#name").val();
	leaveGrid.refresh(true);
}
function reload(){
	window.location.reload();
}
</script>
</html>