<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <%@ include file="/pages/inc/delModal.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>项目管理</title>
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
        <li><a href="#">项目管理</a></li>
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
        <div class="row">
            <div class="col-md-10"> </div>
            <div  style="margin-top:15px;text-align:right;">
            	<button type="button" id="addBtn" class="sbtn sbtn-blue" >${staff}新增</button>&#12288;
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
            id : 'projectCode',
            title : '项目编号',
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'projectName',
            title : '项目名称',
            width:160,
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'startTime',
            title : '创建时间',
            type : 'date',
            width:120,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center'
        },
        {
            id : 'endTime',
            title : '结束时间',
            type : 'date',
            width:120,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center'
        },
        {
            id : 'type',
            title : '项目类型',
            type : 'string',
            width:140,
            columnClass : 'text-center'
            
        },
        {
            id : 'staff',
            title : '项目成员',
            type : 'string',
            columnClass : 'text-center'
        },
        {
			id : 'projectSkill',
			title : '项目技术',
			type : 'string',
			width:160,
			columnClass : 'text-center',
			resolution : function(value, record, column, grid, dataNo, columnNo) {
				var content = '';
				if(record.projectSkill != null && record.projectSkill != ""){
					content += '<a href="<c:url value="/projectManage/addProjeceSkill" />/'
						+ record.id +'">' + record.projectSkill + '</a>';
				}else{
					content += '<a href="<c:url value="/projectManage/addProjeceSkill" />/'
						+ record.id +'">' +'点击添加'+ '</a>';
				}
				
				return content;
			}
		},
        {
            id : 'operation',
            title : '操作',
            width:300,
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo,
                                  columnNo) {
                var content = '';
                content += "<button class='sbtn sbtn-blue btn-sm' id='editBtn' "
                    + "onclick=editApp('"
                    + record.id
                    + "');>新增学员</button>";
                content += '  ';
                content += "<button class='sbtn sbtn-default btn-sm' id='editBtn' "
                    + "onclick=deleteApp('"
                    + record.id
                    + "');>删除</button>";
                    content += '  ';
                    content += "<button class='sbtn sbtn-blue btn-sm' id='editBtn' "
                        + "onclick=statusApp('"+ record.id + ","+record.projectName+"');>查看学员状态</button>";
                return content;
            }
        }
    ];

    var areaOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/projectManage/projectManageList" />',
        columns : appColumns,
        gridContainer : 'schoolDataList',
        toolbarContainer : 'schoolPage',
        tools : 'refresh',
        check : true,
        checkWidth : '27px',
        pageSize : 10,
        pageSizeLimit : [ 10, 20, 50, 100 ],
        onCellMouseOver : function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
            if(columnNo!=9){
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
        window.location.href = '<c:url value="/projectManage/add" />';
    })

    function editApp(id) {
    	window.location.href = '<c:url value="/projectManage/updataProjectManage?id=" />' + id;
    } 

    /* 跳转到学员状态页面 */
    function statusApp(paramters) {
    	param = paramters.split(',');
        window.location.href = '<c:url value="/proEmp/page" />/?id='+param[0]+'&projectName='+param[1];
    }

    function deleteApp(id){
        $("#delOneModel").modal();
        $("#modalId").val(id);
    }

    function deleteApp(id){
        $("#delOneModel").modal();
        $("#modalId").val(id);
    }

    $("#deleteOneBtn").click(function() {
        id=$("#modalId").val();
        $.ajax({
            url : "<c:url value='/projectManage/deleteProjectManage'/>?ids=" + id,
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

</script>