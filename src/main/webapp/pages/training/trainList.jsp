<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <%@ include file="/pages/inc/delModal.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>训练营分页数据</title>
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
            <a href="#">猛码训练营管理</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li><a href="#">训练营管理</a></li>
    </ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height: 50px;">
                区域名称：<input type="text" class="form-control" id="areaName" placeholder="请输入地区名称">
            </div>
            <div class="form-group" style="line-height: 50px;">
                &#8194;训练营期数：<input type="text" class="form-control" id="issue" placeholder="请输入训练营期数">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div class="row">
            <div class="col-md-10"> </div>
            <div class="col-md-2" style="margin-top:15px;text-align: right;">
                <button type="button" id="addBtn" class="sbtn sbtn-blue" style="margin-right:10px">新增</button>&#12288;
                <button type="button" id="deleteBtn"class="sbtn sbtn-blue" style="margin-right: -7%;float: right;">删除</button>
            </div>
        </div>
        <div id="trainDataList" class="dlshouwen-grid-container" style="width: 100%;"></div>
        <div id="trainPage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>
</body>

    
<script type="text/javascript">
    var trainColumns = [
    	{id : 'serialId', title : '序号', type : 'string', columnClass : 'text-center', width:45, resolution:function(value, record, column, grid, dataNo, columnNo){
			return dataNo+1;
		}},
        {id:'id', title:'主键', type:'string', hide:true},
        {id:'issue', title:'期数', type:'string',width:60, columnClass:'text-center'},
        {id:'areaName', title:'分区名称', type:'string', columnClass:'text-center'},
        {id:'startTime', title:'开始时间', type:'date',width:120 ,format:'yyyy-MM-dd',otype:'time_stamp_ms',columnClass:'text-center'},
        {id:'endTime', title:'结束时间', type:'date',width:120,format:'yyyy-MM-dd ',otype:'time_stamp_ms',columnClass:'text-center'},
        {id:'course', title:'课程', type:'string',  columnClass:'text-center'},
        {id:'path', title:'课程计划路径', type:'string',  columnClass:'text-center'},
        {id:'teacherName', title:'培训讲师', type:'string',  columnClass:'text-center'},
        {id:'num', title:'总人数', type:'string',width:80,  columnClass:'text-center'},
        {
            id : 'operation',
            title : '操作',
            width:300,
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo,columnNo) {
                var content = '';
                content += "<button class='sbtn sbtn-blue btn-sm' id='editBtn' "+ "onclick=edit('"+ record.id+ "');>编辑</button>";
                content += "<button class='sbtn sbtn-default btn-sm'style='margin-left:5px;' id='' "+ "onclick=deleteApp('"+ record.id+ "');>删除</button>";
                content += "<button class='sbtn sbtn-blue btn-sm'style='margin-left:5px;' id='' "+ "onclick=query('"+ record.id+ "');>本期成员</button>";
                    return content;
            }
        }
    ];
    var trainOption = {
    	lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/train/pageList" />',
        columns : trainColumns,
        gridContainer : 'trainDataList',
        toolbarContainer : 'trainPage',
        tools : 'refresh',
        check : true,
        checkWidth : '30px',
        pageSize : 10,
        pageSizeLimit : [10, 20, 50,100],
    	onCellMouseOver : function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
        if(columnNo==3){
            cell.attr("title",value);
        }
    }
    };
    var trainGrid = $.fn.dlshouwen.grid.init(trainOption);
  	$(function(){
    	$('#searchBtn').click(searchData);
    	trainGrid.parameters = new Object();
    	trainGrid.load();
    });
 
    function searchData(){
    	trainGrid.parameters = new Object();
    	trainGrid.parameters['areaName'] = $("#areaName").val();
    	trainGrid.parameters['issue'] = $("#issue").val();
    	trainGrid.refresh(true);
    }
     
    function edit(id){
    	window.location.href = '<c:url value="/train/edit"/>/'+id; 
    }
    function query(id){
    	window.location.href = '<c:url value="/train/emp"/>/'+id; 
    }
    function deleteApp(id){
        $("#delOneModel").modal();
        $("#modalId").val(id);
    }

  $("#deleteOneBtn").click(function() {
        id=$("#modalId").val();
        $.ajax({
            url : "<c:url value='/train/delete'/>?ids=" + id,
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
    
  $("#deleteBtn").click(function(){
		 var recordCount = trainGrid.getCheckedRecords().length;
		 if (recordCount == 0) {
			 showMsg('请至少选择一条数据操作！',3);
		 } else {
		     var records = trainGrid.getCheckedRecords();
		     var ids = [];
		     for(var i = 0 ;i < records.length; i++ ){
		    	 ids.push(records[i].id);
		     }
		     $.ajax({
		 		url : "<c:url value='/train/delete'/>?ids=" + ids,
		 		type: "POST",
		 		dataType: "json",
		 		success : function(data, textStatus) {
		 			if(data.returncode == '200'){	
		 				window.location.reload();
		 			}else{
		 				showMsg('用户删除失败！请联系开发人员！');
		 			}
		 		},
		 		error : function() {	
		 			showMsg('系统暂不可用，请稍后再试！');
		 		}
		 	});
		 }
	});
    

    $("#addBtn").click(function(){
    	window.location.href = '<c:url value="/train/add" />';
    }) 
    
</script>