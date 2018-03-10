<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header_jstree.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>数据字典分类信息管理</title>
<style>
	td {
   		white-space:nowrap;
   		overflow:hidden;
   		text-overflow: ellipsis;
	}
	table {   
        table-layout:fixed;  
    } 
	.file{
	    position: absolute;
	    right: 0;
	    top: 0;
	    height: 24px;
	    filter: alpha(opacity:0);
	    opacity: 0;
	    width: 250px;
	    font-size: 32px;
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
			<li><a href="#">数据字典分类信息管理</a></li>
		</ul>
	</div>
	<div class="row" style="margin:0px;">
		<div class="col-md-12">
			<form class="form-inline">
				<div class="form-group" style="line-height: 50px;">
					字典名称：<input type="text" class="form-control" id="valueName" placeholder="请输入应用名称">
				</div>
				<div class="form-group" style="line-height: 50px;">
					字典类型编码：<input type="text" class="form-control" id="valueCode" placeholder="请输入应用名称">
				</div>
				<button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
			</form>
	<div class="col-md-12" style="background-color:#234377; height:3px;"></div>
	<div class="row">
    	<div class="col-md-10"> </div>
        <div class="col-md-2" style="margin-top:15px;text-align: right;">
         	<button type="button" id="addBtn" class="sbtn sbtn-blue" style="margin-right:10px">新增</button>&#12288;
         	<button type="button" id="delAllBtn" class="sbtn sbtn-blue" style="margin-right: -7%;float: right;">删除</button>
         	<button type="button" id="importBtn" class="sbtn sbtn-blue">导入</button>
        </div>
     </div>
	<div class="row">
		<div class="col-md-2">
			 <div id="tree" class="#"></div>
		</div>
		<div class="col-md-10">
			<div id="constantDataList" class="dlshouwen-grid-container"></div>
			<div id="constantPage" class="dlshouwen-grid-toolbar-container"></div>
		</div>
	</div>
	</div>
</div>
<div id=fileUpLoadMod class="modal fade">
    <div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">数据字典的批量导入</h4>
			</div>
			<div class="modal-body" style="text-align: center;">
				<form>
					<input type="text" name="textfieldArea" id="textfieldArea"  style="height:35px; border:1px solid #cdcdcd; width:250px;"readonly="readonly" autocomplete="off" disableautocomplete=""placeholder="   点击选择文件"> 
					<input type="file" name="uploadFile" class="file" id="uploadFile" style="top:25%;left:90px;line-height: 32px;height:32px;" size="28" onchange="document.getElementById('textfieldArea').value=this.value;" autocomplete="off" disableautocomplete="">
					<button type="button" id="import" class="sbtn sbtn-green" style="margin-left: 20px;">导入</button>
					<button class="sbtn sbtn-default" data-dismiss = "modal" style="margin-left: 20px;">取消</button>
				</form>
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
	           	'url' : '<c:url value="/constant/appTree" />',
				'dataType' : 'JSON',
			}
		},
	});
	var dictionaryId = '1';
	$('#tree').on('changed.jstree',function(e,data){
		//当前选中节点的id
	    //console.log(data.instance.get_node(data.selected[0]).id);
	    dictionaryId = data.instance.get_node(data.selected[0]).id;
	    if(dictionaryId == null || dictionaryId == 1){
	    	$("#addBtn").css('display','none');
		}else{
	    	$("#addBtn").css('display','');
		}
	    //刷新列表
	    if(dictionaryId!=null){
	    	if(dictionaryId == 1){
	    		constantGrid.parameters = new Object();
	    		constantGrid.parameters['dictionaryId'] = null;
	    	}else{
	    		constantGrid.parameters = new Object();
	    		constantGrid.parameters['dictionaryId'] = dictionaryId;
	    	}
	    	constantGrid.refresh(true);
	    }
	});
	//初始化表格
	var constantColumns = [
			{
				id : 'serialId',
				title : '序号',
				type : 'string',
				width:45,
				columnClass : 'text-center',
				resolution:function(value, record, column, grid, dataNo, columnNo){
					return dataNo+1;
				}
			},
			{
				id : 'id',
				title : '主键',
				type : 'string',
				hide : true
			},
			{
				id : 'valueName',
				title : '字典名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'valueCode',
				title : '字典类型编码',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'constantDesc',
				title : '字典类型简介',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'operation',
				title : '操作',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
					content += "<button class='sbtn sbtn-blue btn-sm' id='editBtn' "
							+ "onclick=editConstant('"
							+ record.id
							+ "');>编辑</button>";
					content += '  ';
					content += "<button class='sbtn sbtn-default btn-sm' id='editBtn' "
							+ " onclick=deleteConstant('"
							+ record.id
							+ "');>删除</button>";
					return content;
				}
			} 
		];
	
	var constantOption = {
		lang : 'zh-cn',
		ajaxLoad : true,
		loadURL : '<c:url value="/constant/pageList" />',
		columns : constantColumns,
		gridContainer : 'constantDataList',
		toolbarContainer : 'constantPage',
		tools : 'refresh',
		check : true,
	    checkWidth : '27px',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50, 100 ],
		onCellMouseOver : function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
       		if(columnNo==4){
       			cell.attr("title",value);
       		}
    	}
	};
	
	var constantGrid = $.fn.dlshouwen.grid.init(constantOption);
	
	$(function() {
		$('#searchBtn').click(searchData);
		constantGrid.load();
	});
	
	function searchData() {
		constantGrid.parameters = new Object();
		constantGrid.parameters['valueName'] = $("#valueName").val();
		constantGrid.parameters['valueCode'] = $("#valueCode").val();
		constantGrid.refresh(true);
	}
	
	$("#addBtn").click(function() {
		window.location.href = '<c:url value="/constant/add" />?dictionaryId=' +dictionaryId;
	})
	
	function editConstant(id) {
		window.location.href = '<c:url value="/constant/edit" />/' + id;
	}
	
	function deleteConstant(id){
		$("#delOneModel").modal();
		$("#modalId").val(id);
	}
	
	$("#deleteOneBtn").click(function() {
		id=$("#modalId").val();
		$.ajax({
			url : "<c:url value='/constant/delete'/>?ids=" + id,
			type : "POST",
			dataType : "json",
			success : function(data, textStatus) {
				if (data.returncode == '200') {
					window.location.reload();
				} else {
					$('#delOneModel').modal('hide');
					showMsg('数据字典删除失败！请联系开发人员！');
				}
			},
			error : function() {
				$('#delOneModel').modal('hide');
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	});
	
	$("#delAll").click(function(){
		 var recordCount = constantGrid.getCheckedRecords().length;
	     var records = constantGrid.getCheckedRecords();
	     var ids = [];
	     for(var i = 0 ;i < records.length; i++ ){
	    	 ids.push(records[i].id);
	     }
	     $.ajax({
	 		url : "<c:url value='/constant/delete'/>?ids=" + ids,
	 		type: "POST",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.returncode == '200'){	
	 				window.location.reload();
	 			}else{
	 				$('#delAllModel').modal('hide');
	 				showMsg('数据字典失败！请联系开发人员！');
	 			}
	 		},
	 		error : function() {	
	 			$('#delAllModel').modal('hide');
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	});
	})
	
	$("#delAllBtn").click(function(){
		 var recordCount = constantGrid.getCheckedRecords().length;
		 if (recordCount == 0) {
			 showMsg('请至少选择一条数据操作！',3);
		 } else {
			 $("#delAllModel").modal();
		 }
	})
	//文件上传
    $("#importBtn").click(function(){
    	$("#textfieldArea").val("");
    	$("#uploadFile").val("");
    	$("#fileUpLoadMod").modal();
    	$("#import").click(function(){
    		var uploadFile = $("#uploadFile").val();
    		if(uploadFile == ''){
    			$("#fileUpLoadMod").modal('hide');
    			showMsg('请选择要上传的文件！');
    			return;
    		}
    		$.ajaxFileUpload({
    			url: "<c:url value='/constant/uploadExcel' />",
    			secureuri:false,
    			fileElementId: 'uploadFile',
    			type: 'post',
    			//dataType: 'json',
    			success : function(data, status) {
    				var str = $(data).find("body").text();//获取返回的字符串
    			    var json = $.parseJSON(str);//把字符串转化为json对象
    				//success
    				if(json.returncode == '200'){
    					$("#fileUpLoadMod").modal('hide');
    					showMsg(json.msg);
    	 				
    				//failed
    				}else{
    					$("#fileUpLoadMod").modal('hide');
    					showMsg(json.msg);
    				}
    			},
    			error: function (data, status, e){//服务器响应失败处理函数
    				$("#fileUpLoadMod").modal('hide');
    				showMsg("服务器错误，请重试!");
    	        }
    		});
    	});
    	$("#fileUpLoadMod").modal();
    });
</script>