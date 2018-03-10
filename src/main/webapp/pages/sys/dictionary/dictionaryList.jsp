<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>应用分页数据</title>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li>
				<i class="fa fa-home"></i>
				<a href="#">青岛机场安全管理</a> 
				<i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">数据字典管理</a></li>
		</ul>
	</div>
	<div class="row" style="margin:0px;">
		<div class="col-md-12">
			<form class="form-inline">
				<div class="form-group" style="line-height: 50px;">
					字典类型名称：<input type="text" class="form-control" id="typeName" placeholder="请输入">
				</div>
				<div class="form-group" style="line-height: 50px;">
					&#8194;字典类型值：<input type="text" class="form-control" id="typeCode" placeholder="请输入">
				</div>
				<button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
			</form>
		<div class="col-md-12" style="background-color:#234377; height:3px;"></div>
	<div class="row">
    	<div class="col-md-10"> </div>
        <div class="col-md-2" style="margin-top:15px;text-align: right;">
         	<button type="button" id="addBtn" class="sbtn sbtn-blue" style="margin-right:10px">新增</button>&#12288;
         	<button type="button" id="delAllBtn" class="sbtn sbtn-blue" style="margin-right: -7%;float: right;">删除</button>
        </div>
     </div>
	<div id="dictDataList" class="dlshouwen-grid-container"></div>
	<div id="dictPage" class="dlshouwen-grid-toolbar-container"></div>
	</div>
</div>
</body>
<script type="text/javascript">
	var dictColumns = [
			{
				id : 'serialId',
				title : '序号',
				type : 'string',
				columnClass : 'text-center',
				width:45,
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
				id : 'typeName',
				title : '字典分类名称',
				width:320,
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'typeCode',
				title : '字典分类代码',
				width:320,
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'describe',
				title : '字典分类说明',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'operation',
				title : '操作',
				width:220,
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
					content += "<button class='sbtn sbtn-blue btn-sm' id='editBtn' "
							+ "onclick=editDict('"
							+ record.id
							+ "');>编辑</button>";
					content += '  ';
					content += "<button class='sbtn sbtn-default btn-sm' id='editBtn' "
							+ "onclick=deleteDict('"
							+ record.id
							+ "');>删除</button>";
					return content;
				}
			} ];
	var dictOption = {
		lang : 'zh-cn',
		ajaxLoad : true,
		loadURL : '<c:url value="/dictionary/pageList" />',
		columns : dictColumns,
		gridContainer : 'dictDataList',
		toolbarContainer : 'dictPage',
		tools : 'refresh',
		check : true,
	    checkWidth : '20px',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50, 100 ]
	};
	var dictGrid = $.fn.dlshouwen.grid.init(dictOption);
	$(function() {
		$('#searchBtn').click(searchData);
		dictGrid.load();
	});
	function searchData() {
		dictGrid.parameters = new Object();
		dictGrid.parameters['typeName'] = $("#typeName").val();
		dictGrid.parameters['typeCode'] = $("#typeCode").val();
		dictGrid.refresh(true);
	}
	$("#addBtn").click(function() {
		window.location.href = '<c:url value="/dictionary/add" />';
	})
	function editDict(id) {
		window.location.href = '<c:url value="/dictionary/edit" />/' + id;
	}
	
	function deleteDict(id){
		var msg = "删除字典分类将会同时删除分类中的数据！";
		showDelOneMsg(msg,id);
	}
	
	$("#deleteOneBtn").click(function() {
		$.ajax({
			//这里的deleteId是一个全局变量，在delModal.jsp中声明
			url : "<c:url value='/dictionary/delete'/>?ids=" +deleteId,
			type : "POST",
			dataType : "json",
			success : function(data, textStatus) {
				if (data.returncode == '200') {
					window.location.reload();
				} else {
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
	$("#delAll").click(function(){
		 var recordCount = dictGrid.getCheckedRecords().length;
	     var records = dictGrid.getCheckedRecords();
	     var ids = [];
	     for(var i = 0 ;i < records.length; i++ ){
	    	 ids.push(records[i].id);
	     }
	     $.ajax({
	 		url : "<c:url value='/dictionary/delete'/>?ids=" + ids,
	 		type: "POST",
	 		dataType: "json",
	 		success : function(data, textStatus) {
	 			if(data.returncode == '200'){	
	 				window.location.reload();
	 			}else{
	 				$('#delAllModel').modal('hide');
	 				showMsg('数据字典分类删除失败！请联系开发人员！');
	 			}
	 		},
	 		error : function() {	
	 			$('#delAllModel').modal('hide');
	 			showMsg('系统暂不可用，请稍后再试！');
	 		}
	 	});
	})
	
	$("#delAllBtn").click(function(){
		 var recordCount = dictGrid.getCheckedRecords().length;
		 if (recordCount == 0) {
			 showMsg('请至少选择一条数据操作！',3);
		 } else {
			 $("#delAllModel").modal();
		 }
	})
</script>