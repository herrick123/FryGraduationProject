<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>部门管理</title>
<style>
</style>
</head>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a>
		<i class="fa fa-angle-right"></i></li>
		<li><a href="#">用户权限管理</a> <i class="fa fa-angle-right"></i></li>
		<li><a href="#">部门管理</a></li>
	</ul>
</div>
<div class="row" style="margin: 10px 0px 10px 10px;">
	<div class="col-md-3">
		<div class="portlet blue-hoki box">
			<div class="portlet-title">
				<div class="caption" id="title">
					<i class="fa fa-th-list"></i>部门目录管理
				</div>
			</div>
			<div class="portlet-body">
				<div id="tree_2" class="jstree-default"></div>
			</div>
		</div>
	</div>
	<div class="col-md-9">
		<div class="portlet box blue-hoki">
			<div class="portlet-title">
				<div class="caption"  id="leveltitle">
					<i class="fa fa-th-list"></i>部门信息
				</div>
				 <div  style="float: right;padding: 3px 0px;margin-left: 5px;">
				    <a href="#"><button type="button" id="deleteBtn" class="sbtn sbtn-default">批量删除</button></a>
			    </div>
				
			    <div  style="float: right;padding: 3px 0px;margin-left: 5px;">
				    <button type="button" data-toggle="modal" id="addbtn" data-target="#addChild" class="sbtn sbtn-default">添加部门</button>
			    </div>
				
				<div  style="float: right;padding: 3px 0px;" id="returndiv">
				    <div style="position: relative; left:0 px" >
						<button type="button" id="backDirectory" class="sbtn sbtn-default">返回上级部门</button>
					</div>
				</div>
			</div>						
			<div id="resourceDataList" style="padding-top:10px"></div>
			<!-- 分页框 -->
			<div id="resourcePage" class="dlshouwen-grid-toolbar-container"></div>										
		</div>
	</div>
</div>
<!-- 添加节点模态框 -->
<div class="modal fade bs-example-modal-sm" id="addChild" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 500px; height: 500px;">
		<div class="modal-content">
			<div class="portlet box blue-hoki">
				<div class="portlet-title">
					<div class="caption" id="title">
						<i class="fa fa-th-list"></i>添加部门
					</div>
				</div>
				<div class="portlet-body form" style="margin-top: 30px;">
					<form  action="<c:url value='/department/save'/>" id="addform" method="post" class="form-horizontal" role="form" onsubmit="return addcheck()">						
						<input type="hidden" class="form-control" id="addparentId" name="parentId" value="#">						   
						<input type="hidden" class="form-control" id="addleve" name="leve" value="1">
						<input type="hidden" class="form-control" id="addparentname" name="parentName" value="根">
						<div class="form-group">
							<label for="firstname" class="col-sm-4 control-label">部门名称</label>
							<div class="col-sm-5">
							<input type="text" class="form-control" id="addname" name="departmentName"
										placeholder="请输入部门名称">
							</div>
                            <div id="checkName"></div>
						</div>
						<div class="form-group" id="tree_codediv">
							<label for="firstname" class="col-sm-4 control-label">部门编号</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" id="addtreeCode" name="treeCode"
										placeholder="请输入部门编号">
							</div>
							<div id="checkTreeCode"></div>
						</div>
						<div class="form-group">
					        <div style="margin-left: 35%;">
						        <button type="submit" id="saddbtn" class="sbtn sbtn-blue">保存</button>
						        <button id="addCancel" style="margin-left: 45px;" type="button"
							      class="sbtn sbtn-default" data-dismiss="modal">取消</button>
					        </div>
				        </div>
						</form>
					</div>
				</div>	
		  </div>
	 </div>
</div>
<!-- 编辑模态框-->
<div class="modal fade bs-example-modal-sm" id="edit" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" style="width: 500px; height: 500px;">
		<div class="modal-content">
			<div class="portlet box blue-hoki">
				<div class="portlet-title">
					<div class="caption" id="title">
						<i class="fa fa-th-list"></i>编辑部门信息
					</div>
				</div>
				<div class="portlet-body form" style="margin-top: 30px;">
					<form action="<c:url value='/department/update'/>" id="editform" method="post" class="form-horizontal" role="form" onsubmit="return editcheck()">					    
						 <input type="hidden" class="form-control" id="editid" name="departmentId">
						 <input type="hidden" class="form-control" id="editparentid" name="parentId">
						 <input type="hidden" class="form-control" id="editparentname" name="parentName"> 
						 <input type="hidden" class="form-control" id="editleve" name="leve"> 
						 <div class="form-group">
							 <label for="parentname" class="col-sm-4 control-label">部门名称</label>
							 <div class="col-sm-5">
								 <input type="text" class="form-control" id="editname" name="departmentName">
							 </div>
							  <div id="checkEditName"></div>
						 </div>
						 <div class="form-group" id="edittree_codediv">
							  <label for="parentname" class="col-sm-4 control-label">部门编号</label>
							  <div class="col-sm-5">
							      <input type="text" class="form-control" id="edittreecode" name="treeCode">
							  </div>
							   <div id="checkEditTreeCode"></div>
						 </div>				
						 <div class="form-group">
				        	  <div style="margin-left: 35%;">
					        	   <button type="submit" id="seditbtn" class="sbtn sbtn-blue">保存</button>
						           <button onclick="editCancel();" id="editCancel" style="margin-left: 45px;" type="button"
							             class="sbtn sbtn-default" data-dismiss="modal">取消
							       </button>
					          </div>
				        </div>
					</form>
				</div>
			</div>				
		</div>
	</div>
</div>
<script type="text/javascript">

//点击树节点刷新列表记录treeCode
var recordTreeCode;
var recordTreePname;
//返回上一级时父节点
var backparentids = [];
    backparentids.push('#');
//记录父节点
var parentids = [];
	parentids.push("#");
//记录父节点名称
var parentnames = [];
    parentnames.push("根");
//记录级别
var leve = 1;
//判断是否进入下一级
var isnext = false;
var isClickdelbtn = false;
var isClickeditbtn = false;
//点击编辑
function edit(){
    isClickeditbtn = true;
    isClickdelbtn = false;
}
//取消编辑
function editCancel(){
	isClickeditbtn = false;
}
//点击删除
function del(){
	isClickdelbtn = true;
	isClickeditbtn = false;
}
//判断当前父节点id name
function check(){
    if (parentids.length == 0) {
 	    parentids.push("#");
    }
    if (parentnames.length == 0) {
 	    parentnames.push("根");
    }
    if(backparentids.length == 0){
      backparentids.push('#');  
    }
    if (leve == 0) {
 	   leve=1;
    }
}
//点击进入下一级
function nextDepartment(){
	isnext=true;
}
//添加目录表单验证
function addcheck(){
	if (!$("#tree_codediv").is(':hidden')){
	    if (($("#checkName").html()=="验证通过")&&($("#checkTreeCode").html()=="验证通过")){
	    	return true;
	    }
	} else {
		if ($("#checkName").html()=="验证通过"){
			return true;
		 }
	}
	return false;
	
}
//编辑目录表单验证
function editcheck(){
	if(($("#checkEditName").html()=="验证通过")&&($("#checkEditTreeCode").html()=="验证通过")){
		return true;
	}
	if(($("#checkEditName").html()=="")&&(($("#checkEditTreeCode").html()=="验证通过")||($("#checkEditTreeCode").html()==""))){
		return true;
	}
	if(($("#checkEditTreeCode").html()=="")&&(($("#checkEditName").html()=="验证通过")||($("#checkEditName").html()==""))){
		return true;
	}
	return false;
	
}

$(document).ready(function() {
    $("#returndiv").hide();
    var resourceColumns = [
	{id:'departmentId', title:'编号', type:'string',columnClass:'text-center',hide:true},
	{id:'departmentName', title:'部门名字', type:'string', columnClass:'text-center'},
	{id:'parentId', title:'父部门编号', type:'string', columnClass:'text-center',hide:true},
	{id:'parentName', title:'上级部门', type:'string', columnClass:'text-center'},
	{id:'treeCode', title:'目录编码', type:'string', columnClass:'text-center',hide:true},
	{id:'leve', title:'级别', type:'int', columnClass:'text-center'},
	{
		id : 'next',
		title : '下级部门',
		type : 'string',
		columnClass : 'text-center',
		resolution : function(value, record,
				column, grid, dataNo, columnNo) {
	                             							        
			var content = '';
			content += '<a onclick="nextDepartment();"><button class="sbtn sbtn-default" id="nextDepartment">进入下级部门</button></a>';
			return content;
		}
	
	},
	{
		id : 'caozuo',
		title : '操作',
		type : 'string',
		columnClass : 'text-center',
		resolution : function(value, record,
				column, grid, dataNo, columnNo) {
			var content = '';
			var id=record.id;
			content += '<a onclick="edit();"><button class="sbtn sbtn-default" data-toggle="modal" data-target="#edit">编辑</button></a>';
			content += '  ';
			content += '<a onclick="del();"><button id="delbtn" class="sbtn sbtn-blue">删除</button></a>';
			return content;
		}
	}];
var resourceOption = {
	lang : 'zh-cn',
    ajaxLoad : true,
    loadURL : '<c:url value="/department/find" />',
    columns : resourceColumns,
    gridContainer : 'resourceDataList',
    toolbarContainer : 'resourcePage',
    tools : 'refresh',
    check : true,
    checkWidth : '20px',
    pageSize : 10,
    pageSizeLimit : [10, 20, 50,100],
    onCellClick : 
 	   function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
         if (columnNo==7){
      	   var ids=[];
      	   ids.push(record.departmentId);
      	   if (isClickdelbtn==true){
      	  	 if(confirm("删除该部门会级联删除下级部门，是否继续？")){
      	  		 $.ajax({
	 				url : "<c:url value='/department/deleteAll'/>?ids=" + ids,
	 				type: "POST",
	 				dataType: "json",
	 				success : function(data, textStatus) {
	 			if (data.returncode == '200'){	
	 				window.location.reload();
	 			} else {
	 					showMsg('用户删除失败！请联系开发人员！');
	 				}
	 		},
	 		error : function() {	
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	   });
      	   }
      	   }
      	   if (isClickeditbtn==true){
      		  $("#checkEditName").text("");
      	      $("#checkEditTreeCode").text("");
       		  $("#editid").val(record.departmentId);
       		  $("#editparentid").val(record.parentId);
       		  $("#editparentname").val(record.parentName);
       		  $("#editleve").val(record.leve);
       		  $("#editname").val(record.departmentName);
       		  $("#edittreecode").val(record.treeCode);
       	  }			            	        	  
         } else if (columnNo == 6){
      	   if (isnext == true){ 
      	   leve = record.leve+1;
      	   userGrid.parameters = new Object();
  	       userGrid.parameters['parentId'] = record.departmentId;
  	       parentids.push(record.departmentId);
  	       parentnames.push(record.departmentName);
  	       backparentids.push(record.parentId);
  	       userGrid.load();
  	       $("#returndiv").show();
  	       $("#tree_codediv").hide();
  	       $("#addtreeCode").val(record.treeCode);
  	       $("#edittree_codediv").hide();
      	   }
      	   }
         }
};
var userGrid = $.fn.dlshouwen.grid.init(resourceOption);

userGrid.parameters = new Object();
userGrid.parameters['parentId'] = "#";
userGrid.load();
$("#deleteBtn").click(function(){
	var recordCount = userGrid.getCheckedRecords().length;
	if (recordCount == 0) {
	 showMsg('请至少选择一条数据操作！',3);
	} else {
	    var records = userGrid.getCheckedRecords();
	    var ids = [];
	    for(var i = 0 ;i < records.length; i++ ){
	   	 ids.push(records[i].departmentId);
	    }
	    if(confirm("全部删除所选部门会级联删除下级部门，是否继续？")){
	    $.ajax({
			url : "<c:url value='/department/deleteAll'/>?ids=" + ids,
			type: "POST",
			dataType: "json",
			success : function(data, textStatus) {
				if (data.returncode == '200'){	
					window.location.reload();
				} else {
					showMsg('用户删除失败！请联系开发人员！');
				}
			},
			error : function() {	
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	    }
	}
});									 
//添加节点的级别
//添加节点父节点
$("#addbtn").click(function(){
	$("#checkName").text("");
    $("#checkTreeCode").text("");
	$("#addleve").val(leve);
	var pid=parentids.pop();
	var pname=parentnames.pop();
	parentids.push(pid);
	parentnames.push(pname);
	$("#addparentId").val(pid);
	$("#addparentname").val(pname);
});

//返回上级目录
$("#backDirectory").click(function(){
	leve--;
    userGrid.parameters = new Object();
    userGrid.parameters['parentId'] = backparentids.pop();
    parentids.pop();
    parentnames.pop();
    userGrid.load();
    if (leve == 1 || leve == 0){
    	$("#returndiv").hide();
    	$("#tree_codediv").show();
    	$("#edittree_codediv").show();
    }
    check();      
});	
 //添加时验证name
$("#addname").blur(function(){
	var res=0;
	$.ajax({
		url: "<c:url value='/department/checkName' />",
		data:{name:$("#addname").val()},
		beforeSend:function(){
			$("#checkName").text("正在验证");
		},
		success:function(res){			
			if (res=="0"){
				$("#checkName").text("请输入").css({"color":"red","font-weight":"600"});;
			} else if (res=="2"){
				$("#checkName").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
			} else if (res=="1"){
				$("#checkName").text("验证通过").css({"color":"red","font-weight":"600"});;
			}			
		},
		error:function(){
			$("#checkName").text("验证出错").css({"color":"red","font-weight":"600"});
		}		
	});
})
//添加时验证treeCode
$("#addtreeCode").blur(function(){
	if(!$("#tree_codediv").is(':hidden')){
	var res=0;
	$.ajax({
		url: "<c:url value='/department/checkTreeCode' />",
		data:{treeCode:$("#addtreeCode").val()},
		beforeSend:function(){
			$("#checkTreeCode").text("正在验证");
		},
		success:function(res){			
			if (res=="0"){
				$("#checkTreeCode").text("请输入").css({"color":"red","font-weight":"600"});;
			} else if (res=="2"){
				$("#checkTreeCode").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
			} else if (res=="1"){
				$("#checkTreeCode").text("验证通过").css({"color":"red","font-weight":"600"});;
			}			
		},
		error:function(){
			$("#checkTreeCode").text("验证出错").css({"color":"red","font-weight":"600"});
		}
		
	});
	}
});
//编辑时验证name
$("#editname").blur(function(){
	var res=0;
	$.ajax({
		url: "<c:url value='/department/checkEditName' />",
		data:{name:$("#editname").val(),id:$("#editid").val()},
		beforeSend:function(){
			$("#checkEditName").text("正在验证");
		},
		success:function(res){			
			if (res=="0"){
				$("#checkEditName").text("请输入").css({"color":"red","font-weight":"600"});;
			} else if (res=="2"){
				$("#checkEditName").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
			} else if (res=="1"){
				$("#checkEditName").text("验证通过").css({"color":"red","font-weight":"600"});;
			}			
		},
		error:function(){
			$("#checkEditName").text("验证出错").css({"color":"red","font-weight":"600"});
		}
		
	});
});
//编辑时验证根目录treeCode
$("#edittreecode").blur(function(){
	if(!$("#edittree_codediv").is(':hidden')){
	var res=0;
	$.ajax({
		url: "<c:url value='/department/checkEditTreeCode' />",
		data:{treecode:$("#edittreecode").val(),id:$("#editid").val()},
		beforeSend:function(){
			$("#checkEditTreeCode").text("正在验证");
		},
		success:function(res){			
			if (res=="0"){
				$("#checkEditTreeCode").text("请输入").css({"color":"red","font-weight":"600"});;
			} else if (res=="2"){
				$("#checkEditTreeCode").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
			} else if (res=="1"){
				$("#checkEditTreeCode").text("验证通过").css({"color":"red","font-weight":"600"});;
			}			
		},
		error:function(){
			$("#checkEditTreeCode").text("验证出错").css({"color":"red","font-weight":"600"});
		}
		
	});
	}
});
//jstree
var parentResourceId = "0";
$('#tree_2').on('select_node.jstree', function(e, data) {
	var selectedLength = data.selected.length;
	var i, j, r = [],t = [];
	for (i = 0, j = selectedLength; i < j; i++) {
		r.push(data.instance.get_node(data.selected[i]).id);
		t.push(data.instance.get_node(data.selected[i]).text);
	}
	parentResourceId = r.join(', ');
	if (parentResourceId > 0){
		$("#leveltitle").text(t.join(', '));
		
	} else {
		$("#leveltitle").text("所有部门信息");		
	}
   	}).jstree({
	"core" : {
		"themes" : {
			"stripes" : true
		},
        'data' : {
        	'url' : '<c:url value='/department/onetree' />',
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
	"plugins" : ["state","types" ] 
});	
$('#tree_2').on('changed.jstree',function(e,data){
   //当前选中节点的文本值
    $("#returndiv").show();
    $("#edittree_codediv").hide();
    $("#tree_codediv").hide();
    var pid = data.instance.get_node(data.selected[0]).parent;
    var id = data.instance.get_node(data.selected[0]).id;
    var pname = data.instance.get_node(data.selected[0]).parentName;
    var ptreeCode = data.instance.get_node(data.selected[0]).treeCode;
    var name = data.instance.get_node(data.selected[0]).text;
    var levell = data.instance.get_node(data.selected[0]).leve;
    userGrid.parameters = new Object();
    //得到该点的子节点
    userGrid.parameters['parentId'] = id;
    $.ajax({
		url: "<c:url value='/department/getTreeCode' />",
		data:{id:data.instance.get_node(data.selected[0]).id},
		success:function(res){			
			$("#addtreeCode").val(res);
		},
		error:function(){
			$("#addtreeCode").val("");
		}
		
	});
    $.ajax({
		url: "<c:url value='/department/getLevel' />",
		data:{id:data.instance.get_node(data.selected[0]).id},
		success:function(res){	
			leve = res+1;
			$("#addleve").val(res+1);
		},
		error:function(){
			$("#addleve").val(1);
		}
		
	});
    parentids = [];
    parentids.push("#");
    parentnames = [];
    parentnames.push("根");
    backparentids = [];
    backparentids.push('#');
    parentids.push(id);
    parentnames.push(name);
    backparentids.push(pid);     
    userGrid.load();
});
});
</script>
</body>
</html>