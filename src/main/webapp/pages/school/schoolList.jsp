<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <%@ include file="/pages/inc/delModal.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>高校分页数据</title>
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
                高校名称：<input type="text" class="form-control" id="name" placeholder="请输入高校名称">
            </div>
            <div class="form-group" style="line-height: 50px;">
                &#8194;高校编码：<input type="text" class="form-control" id="school_code" placeholder="请输入高校编码">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div class="row">
            <div class="col-md-10"> </div>
            <div class="col-md-2" style="margin-top:15px;text-align: right;">
                <button type="button" id="addBtn" class="sbtn sbtn-blue" style="margin-right:10px">新增</button>&#12288;
                <button type="button" id="delAllBtn"class="sbtn sbtn-blue" style="margin-right: -7%;float: right;">删除</button>
            </div>
        </div>
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
            id : 'name',
            title : '高校名称',
            width:200,
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'school_code',
            title : '高校编码',
            width:220,
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'introduction',
            title : '高校简介',
            type : 'string',
            width:240,
            columnClass : 'text-center'
        },
        {
            id : 'operation',
            title : '操作',
            width:200,
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo,
                                  columnNo) {
                var content = '';
                content += "<button class='sbtn sbtn-blue btn-sm' id='editBtn' "
                    + "onclick=editApp('"
                    + record.id
                    + "');>编辑</button>";
                content += '  ';
                content += "<button class='sbtn sbtn-default btn-sm' id='editBtn' "
                    + "onclick=deleteApp('"
                    + record.id
                    + "');>删除</button>";
                return content;
            }
        }
    ];

    var schoolOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/school/pageList" />',
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

    var schoolGrid = $.fn.dlshouwen.grid.init(schoolOption);

    $(function() {
        $('#searchBtn').click(searchData);
        schoolGrid.load();
    });

    function searchData() {
        schoolGrid.parameters = new Object();
        schoolGrid.parameters['appName'] = $("#appName").val();
        schoolGrid.parameters['displayIndex'] = $("#displayIndex").val();
        schoolGrid.refresh(true);
    }

    $("#addBtn").click(function() {
        window.location.href = '<c:url value="/school/add" />';
    })

    function editApp(id) {
        window.location.href = '<c:url value="/school/edit" />/' + id;
    }

    function deleteApp(id){
        $("#delOneModel").modal();
        $("#modalId").val(id);
    }

    $("#deleteOneBtn").click(function() {
        id=$("#modalId").val();
        $.ajax({
            url : "<c:url value='/application/delete'/>?ids=" + id,
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
        var recordCount = appGrid.getCheckedRecords().length;
        var records = appGrid.getCheckedRecords();
        var ids = [];
        for(var i = 0 ;i < records.length; i++ ){
            ids.push(records[i].id);
        }
        $.ajax({
            url : "<c:url value='/application/delete'/>?ids=" + ids,
            type: "POST",
            dataType: "json",
            success : function(data, textStatus) {
                if(data.returncode == '200'){
                    window.location.reload();
                }else{
                    $('#delAllModel').modal('hide');
                    showMsg('应用删除失败！请联系开发人员！');
                }
            },
            error : function() {
                $('#delAllModel').modal('hide');
                showMsg('系统暂不可用，请稍后再试！');
            }
        });
    })

    $("#delAllBtn").click(function(){
        var recordCount = appGrid.getCheckedRecords().length;
        if (recordCount == 0) {
            showMsg('请至少选择一条数据操作！',3);
        } else {
            $("#delAllModel").modal();
        }
    })
</script>