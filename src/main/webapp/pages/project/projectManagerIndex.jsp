<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <%@ include file="/pages/inc/delModal.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>分区管理列表</title>
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
            <a href="#">猛码学员管理</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li><a href="#">高校管理</a></li>
    </ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height: 50px;">
                项目名称：<input type="text" class="form-control" id="projectName" placeholder="请输入项目名称">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
            
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div id="schoolDataList" class="dlshouwen-grid-container"></div>
        <div id="schoolPage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    var appColumns = [
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
            id : 'employeeCode',
            title : '学生编号',
            width:160,
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'employeeName',
            title : '学生姓名',
            width:160,
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'type',
            title : '请假类型',
            width:160,
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'startTime',
            title : '开始时间',
            type : 'date',
            width:160,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center'
        },
        {
            id : 'endTime',
            title : '结束时间',
            type : 'date',
            width:160,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center'
        },
        {
            id : 'timeLength',
            title : '请假时长',
            type : 'string',
            width:160,
            columnClass : 'text-center'
        },
        {
            id : 'reason',
            title : '请假原因',
            type : 'string',
            width:160,
            columnClass : 'text-center'
        },
        {
            id : 'operation',
            title : '审批状态',
            type : 'string',
            width:160,
            columnClass : 'text-center'
        },
        {
            id : 'projectName',
            title : '所在项目名称',
            type : 'string',
            width:160,
            columnClass : 'text-center'
        },
    ];

    var areaOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/projectManager/projectManagerLeaveList" />',
        columns : appColumns,
        gridContainer : 'schoolDataList',
        toolbarContainer : 'schoolPage',
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

    var areaGrid = $.fn.dlshouwen.grid.init(areaOption);

    $(function() {
        $('#searchBtn').click(searchData);
        areaGrid.load();
    });

    function searchData() {
        areaGrid.parameters = new Object();
        areaGrid.parameters['projectName'] = $("#projectName").val();
        areaGrid.refresh(true);
    }

    $("#addBtn").click(function() {
        window.location.href = '<c:url value="/pages/area/addArea.jsp" />';
    })

    function editApp(id) {
        window.location.href = '<c:url value="/area/editArea" />/' + id;
    }

    function deleteApp(id){
        $("#delOneModel").modal();
        $("#modalId").val(id);
    }


</script>