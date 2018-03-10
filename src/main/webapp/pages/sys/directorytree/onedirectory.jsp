<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %>
<%@ include file="/pages/inc/delModal.jsp"%> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<title>目录树管理</title>	 
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a>
			<i class="fa fa-angle-right"></i></li>
			<li><a href="#">设备可视化</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">设备资源分类树管理</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 10px 0px 10px 10px;">
		<div class="col-md-2">
			<div class="portlet blue-hoki box">
				<div class="portlet-title">
					<div class="caption" id="title">
						<i class="fa fa-th-list"></i>资源目录管理
					</div>
				</div>
				<div class="portlet-body">
					<div id="tree_2" class="jstree-default"></div>
				</div>
			</div>
		</div>
		<div class="col-md-10">
			<div class="portlet box blue-hoki">
				<div class="portlet-title">
					<div class="caption"  id="leveltitle">
						<i class="fa fa-th-list"></i>目录信息
					</div>
					<div  style="float: right;padding: 5px 0px;margin-left: 5px;">
					    <button type="button" id="deleteBtn" class="sbtn sbtn-default">批量删除</button>
				    </div>
					
				    <div  style="float: right;padding: 5px 0px;margin-left: 5px;">
					    <button type="button" data-toggle="modal" id="addbtn" data-target="#addChild" class="sbtn sbtn-default">添加目录</button>
				    </div>
					
					<div  style="float: right;padding: 5px 0px;" id="returndiv">
					    <div style="position: relative; left:0 px">
							<button type="button" id="backDirectory" class="sbtn sbtn-default">返回上级目录</button>
						</div>
					</div>  
				</div>						
				<div id="resourceDataList" style="padding-top:10px"></div>
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
							<i class="fa fa-th-list"></i>添加目录
						</div>
					</div>
					<div class="portlet-body form" style="margin-top: 30px;">
						<form  action="#" id="addform"  class="form-horizontal" role="form" onsubmit="return addcheck()">						
							<input type="hidden" class="form-control" id="addparentId" name="parentId" value="#">						   
							<input type="hidden" class="form-control" id="addleve" name="leve" value="1">
							<input type="hidden" class="form-control" id="addparentname" name="parentName" value="根">
							<div class="form-group">
								<label for="firstname" class="col-sm-4 control-label">目录名称</label>
								<div class="col-sm-5">
								<input type="text" class="form-control" id="addname" name="name"
											placeholder="请输入目录名称">
								</div>
	                            <div id="checkName"></div>
							</div>
							<div class="form-group" id="tree_codediv">
								<label for="firstname" class="col-sm-4 control-label">目录编号</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" id="addtreeCode" name="treeCode"
											placeholder="请输入目录编号">
								</div>
								<div id="checkTreeCode"></div>
							</div>
							<div class="form-group">
								<label for="firstname" class="col-sm-4 control-label">备注</label>
								<div class="col-sm-5">
									<textarea  class="form-control" id="addnote" name="note"></textarea>
								</div>
							</div>
							<div class="form-group">
						        <div style="margin-left: 35%;">
							        <button type="button" id="saddbtn" class="sbtn sbtn-blue" data-dismiss="modal">保存</button>
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
							<i class="fa fa-th-list"></i>编辑目录信息
						</div>
					</div>
					<div class="portlet-body form" style="margin-top: 30px;">
						<form action="#" id="editform"  class="form-horizontal" role="form" onsubmit="return editcheck()">					    
							 <input type="hidden" class="form-control" id="editid" name="id">
							 <input type="hidden" class="form-control" id="editparentid" name="parentId">
							 <input type="hidden" class="form-control" id="editparentname" name="parentName"> 
							 <input type="hidden" class="form-control" id="editleve" name="leve"> 
							 <input type="hidden" class="form-control" id="editcreateid" name="createId">
							 <input type="hidden" class="form-control" id="editupdateid" name="updateId">
							 
							 <div class="form-group">
								 <label for="parentname" class="col-sm-4 control-label">目录名称</label>
								 <div class="col-sm-5">
									 <input type="text" class="form-control" id="editname" name="name">
								 </div>
								  <div id="checkEditName"></div>
							 </div>
							 <div class="form-group" id="edittree_codediv">
								  <label for="parentname" class="col-sm-4 control-label">目录编号</label>
								  <div class="col-sm-5">
								      <input type="text" class="form-control" id="edittreecode" name="treeCode">
								  </div>
								   <div id="checkEditTreeCode"></div>
							 </div>				
							 <div class="form-group">
								 <label for="level" class="col-sm-4 control-label">备注</label>
								 <div class="col-sm-5">
									<textarea class="form-control" id="editnote" name="note"></textarea>
								 </div>
							 </div>
							 <div class="form-group">
						        <div style="margin-left: 35%;">
							        	   <button type="button" id="seditbtn" class="sbtn sbtn-blue" data-dismiss="modal">保存</button>
								           <button onclick="editCancel();" id="editCancel" style="margin-left: 45px;" type="button"
									               class="sbtn sbtn-default" data-dismiss="modal">取消</button>
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

	//判断当前父节点id name
	function check(){
	    if(parentids.length == 0) {
	 	    parentids.push("#");
	    }
	    if(parentnames.length == 0) {
	 	    parentnames.push("根");
	    }
	    if(backparentids.length == 0){
	      backparentids.push('#');  
	    }
	    if(leve == 0) {
	 	   leve=1;
	    }
	}
	//点击进入下一级
	function nextDirectory(){
		isnext=true;
	}
	//添加目录表单验证
	function addcheck(){
		if(!$("#tree_codediv").is(':hidden')){
		    if(($("#checkName").html()=="验证通过")&&($("#checkTreeCode").html()=="验证通过")){
		    	return true;
		    }
		} else {
			if($("#checkName").html()=="验证通过"){
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
		{id:'id', title:'编号', type:'int',columnClass:'text-center',hide:true},
		{id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
				return dataNo+1;}},
		{id:'name', title:'目录名字', type:'string', columnClass:'text-center'},
		{id:'parentId', title:'父目录编号', type:'string', columnClass:'text-center',hide:true},
		{id:'parentName', title:'上级目录', type:'string', columnClass:'text-center'},
		{id:'createTime', title:'创建时间', type:'date', columnClass:'text-center',hide:true},
		{id:'updateTime', title:'更新时间', type:'date', columnClass:'text-center',hide:true},
		{id:'createId', title:'创建编号', type:'string', columnClass:'text-center',hide:true},
		{id:'updateId', title:'更新编号', type:'string', columnClass:'text-center',hide:true},
		{id:'treeCode', title:'目录编码', type:'string', columnClass:'text-center',hide:true},
		{id:'note', title:'备注', type:'string', columnClass:'text-center',hide:true},
		{id:'leve', title:'级别', type:'int', columnClass:'text-center'},
		{	
			id : 'next',
			title : '下级目录',
			type : 'string',
			width: 195,
			columnClass : 'text-center',
			resolution : function(value, record,column, grid, dataNo, columnNo) {		                             							        
				var content = '';
				content += '<a onclick="nextDirectory();"><button class="sbtn sbtn-default" id="nextDirectory" style="height:32px; line-height:10px;">进入下级目录</button></a>';
				return content;
			}
		
		},
		{
			id : 'caozuo',
			title : '操作',
			type : 'string',
			width:195,
			columnClass : 'text-center',
			resolution : function(value, record,column, grid, dataNo, columnNo) {
				var content = '';				
				content += "<button type='button' class='sbtn sbtn-blue' data-toggle='modal' data-target='#edit' style='height:32px; line-height:10px;'"
		                + "onclick=edit('"
		        		+ record.id
		        		+ "');>  编辑</button>";
		        content += '  ';
		        content += "<button class='sbtn sbtn-default' style='height:32px; line-height:10px;'"
			            + "onclick=delBtn('"
			    		+ record.id
			    		+ "');>  删除</button>";		
				return content;
			}
		}];
	var resourceOption = {
		lang : 'zh-cn',
	    ajaxLoad : true,
	    loadURL : '<c:url value="/directory/find" />',
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
	           if (columnNo==13){
		      	   var ids=[];
		      	   ids.push(record.id);	      	  
		      	   if (isClickeditbtn==true){
		      		  $("#checkEditName").text("");
		      	      $("#checkEditTreeCode").text("");
		       		  $("#editid").val(record.id);
		       		  $("#editparentid").val(record.parentId);
		       		  $("#editparentname").val(record.parentName);
		       		  $("#editleve").val(record.leve);
		       		  $("#editcreateid").val(record.createId);
		       		  $("#editupdateid").val(record.updateId);
		       		  $("#editname").val(record.name);
		       		  $("#edittreecode").val(record.treeCode);
		       		  $("#editnote").val(record.note);
		       	  }			            	        	  
	         } else if (columnNo == 12){
		      	 if(isnext == true){ 
			      	 leve = record.leve+1;
			      	 userGrid.parameters = new Object();
			  	     userGrid.parameters['parentId'] = record.id;
			  	     parentids.push(record.id); 
			  	     parentnames.push(record.name);
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
	window.onload = function() {
		userGrid.parameters = new Object();
		userGrid.parameters['parentId'] = "#";
		userGrid.load();
	}
	$("#deleteOneBtn").click(function() {
		var id=$("#modalId").val();	      	  
     	$.ajax({
	 		url : "<c:url value='/directory/deleteTree'/>?ids=" + id,
	 		type: "POST",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.deletes =='2'){
	 				window.location.reload();
	 			}else{
		 			 if(data.deletes =='0'){
		 				$('#delOneModel').modal('hide');
		 				showMsg('此部门是组织机构部门，不能删除！');
		 			 }else{
	 					 if(data.deletes =='1'){
	 						 $('#delOneModel').modal('hide');
		 					 showMsg('该部门下面有用户，不能删除');
		 				 }
		 			 }
	 			 }
	 			 
	 		},
	 		error : function() {	
	 			showMsg('系统暂不可用，请稍后再试！',3);
 		 	}
   	 	});     	  	  
	});
	
	//删除多条记录
	$("#deleteBtn").click(function(){
		var recordCount = userGrid.getCheckedRecords().length;
		if(recordCount == 0) {
		    showMsg('请至少选择一条数据操作！');
		} else {
			$("#delAllModel").modal();
		}
	})
	$("#delAll").click(function(){
		var recordCount = userGrid.getCheckedRecords().length;
		if(recordCount == 0) {
		    showMsg('请至少选择一条数据操作！',3);
		} else {
			$("#delAllModel").modal();
		    var records = userGrid.getCheckedRecords();
		    var ids = [];
		    for(var i = 0 ;i < records.length; i++ ){
		   	    ids.push(records[i].id);
		    }
		    $.ajax({
				url : "<c:url value='/directory/deleteTree'/>?ids=" + ids,
				type: "POST",
				dataType: "json",
				success : function(data, textStatus) {
					if(data.deletes =='2'){
		 				window.location.reload();
		 			}else{
			 			if(data.deletes =='0'){
			 				 $('#delAllModel').modal('hide');
			 				 showMsg('此部门是组织机构部门，不能删除！');
			 			}else{
			 				if(data.deletes =='1'){
			 					$('#delAllModel').modal('hide');
				 				showMsg('该部门下面有用户，不能删除');
				 			}
			 			}
		 			}
				},
				error : function() {	
					showMsg('系统暂不可用，请稍后再试！');
				}
			});
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
	$("#saddbtn").click(function(){		
		if(addcheck()){
			$.ajax({
				url: "<c:url value='/directory/save' />",
				type:'POST',
				data:$('#addform').serialize(),
				dataType:'json',
				success:function(data, textStatus){				    
					userGrid.parameters = new Object();
				    userGrid.parameters['parentId'] = $("#addparentId").val();			   			   			    
				    userGrid.load();		   
				},
				error:function(){
					showMsg('系统暂不可用，请稍后再试！');
				}		
			});
		}
	});
	
	$("#seditbtn").click(function(){		
		if(editcheck()){			
			$.ajax({
				url: "<c:url value='/directory/update' />",
				type:'POST',
				data:$('#editform').serialize(),
				dataType:'json',
				success : function(data, textStatus) {
		 			if(data.returncode == '200'){
	 					userGrid.parameters = new Object();
					    userGrid.parameters['parentId'] = $("#editparentid").val();			   			   			    
					    userGrid.load();
		 			} else {
		 				showMsg('节点修改失败！请联系开发人员！',3);
		 			}
		 		},
		 		error : function() {	
		 			showMsg('系统暂不可用，请稍后再试！',3);
		 		 }
			});
		}
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
		$.ajax({
			url: "<c:url value='/directory/checkName' />",
			data:{name:$("#addname").val()},
			type: "POST",
			dataType: "json",
			beforeSend:function(){
				$("#checkName").text("正在验证");
			},
			success:function(data, textStatus){
				if(data.returncode == "201"){
					$("#checkName").text("请输入").css({"color":"red","font-weight":"600"});;
				} else if(data.returncode == "10000"){
					$("#checkName").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
				} else if(data.returncode == "200"){
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
			$.ajax({
				url: "<c:url value='/directory/checkTreeCode' />",
				data:{treeCode:$("#addtreeCode").val()},
				type: "POST",
				dataType: "json",
				beforeSend:function(){
					$("#checkTreeCode").text("正在验证");
				},
				success:function(data, textStatus){			
					if(data.returncode=="201"){
						$("#checkTreeCode").text("请输入").css({"color":"red","font-weight":"600"});;
					} else if(data.returncode=="10000"){
						$("#checkTreeCode").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
					} else if(data.returncode=="200"){
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
		$.ajax({
			url: "<c:url value='/directory/checkEditName' />",
			data:{name:$("#editname").val(),id:$("#editid").val()},
			type: "POST",
			dataType: "json",
			beforeSend:function(){
				$("#checkEditName").text("正在验证");
			},
			success:function(data, textStatus){			
				if(data.returncode=="201"){
					$("#checkEditName").text("请输入").css({"color":"red","font-weight":"600"});;
				} else if(data.returncode=="10000"){
					$("#checkEditName").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
				} else if(data.returncode=="200"){
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
			$.ajax({
				url: "<c:url value='/directory/checkEditTreeCode' />",
				data:{treecode:$("#edittreecode").val(),id:$("#editid").val()},
				type: "POST",
				dataType: "json",
				beforeSend:function(){
					$("#checkEditTreeCode").text("正在验证");
				},
				success:function(data, textStatus){			
					if(data.returncode=="201"){
						$("#checkEditTreeCode").text("请输入").css({"color":"red","font-weight":"600"});;
					} else if(data.returncode=="10000"){
						$("#checkEditTreeCode").text("抱歉，已经存在").css({"color":"red","font-weight":"600"});;
					} else if(data.returncode=="200"){
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
	$('#tree_2').on('select_node.jstree', function(e, data){
		var selectedLength = data.selected.length;
		var i, j, r = [],t = [];
		for (i = 0, j = selectedLength; i < j; i++) {
			var s = r.push(data.instance.get_node(data.selected[i]).id);
			var v = t.push(data.instance.get_node(data.selected[i]).text);
		}
		parentResourceId = r.join(s);
		//对表格的title进行判断
		if(parentResourceId > 0){
			$("#leveltitle").text(t.join(', '));	
		} else{
			$("#leveltitle").text(t.join(v));		
		}		
	}).jstree({
		"core" : {
			"themes" : {
				"stripes" : true
			},
	        'data' : {
	        	'url' : '<c:url value='/directory/onetree' />',
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
			},
		},
	 	/* "plugins" : ["state","types" ]  */  
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
	    if(id){
	        $.ajax({
				url: "<c:url value='/directory/getTreeCode' />",
				data:{id:data.instance.get_node(data.selected[0]).id},
				success:function(res){			
					$("#addtreeCode").val(res);
				},
				error:function(){
					$("#addtreeCode").val("");
				}			
		    });
	    	$.ajax({
				url: "<c:url value='/directory/getLevel' />",
				data:{id:data.instance.get_node(data.selected[0]).id},
				success:function(res){	
					leve = res+1;
					$("#addleve").val(res+1);
				},
				error:function(){
					$("#addleve").val(1);
				}			
			}); 
	    }
	    parentids = [];
	    parentids.push("#");
	    parentnames = [];
	    parentnames.push("根");
	    backparentids = [];
	    backparentids.push("#");
	    parentids.push(id);
	    parentnames.push(name);
	    backparentids.push(pid);     
	    userGrid.load();
	});
});
 		
	//点击删除
	function delBtn(id){
/* 		showMsg("-----1----");
		return; */
		$("#modalId").val(id);
		$("#delOneModel").modal();
	}

</script>
</body>
</html>