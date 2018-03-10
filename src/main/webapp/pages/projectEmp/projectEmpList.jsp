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
        <!-- <form class="form-inline">
            <div class="form-group" style="line-height: 50px;">
                项目名称：<input type="text" class="form-control" id="projectName" placeholder="请输入项目名称">
            </div>
            <div class="form-group" style="line-height: 50px;">
                起始时间：<input type="text" class="form-control" id="startTime" placeholder="请输入项目名称">
            </div>
            <div class="form-group" style="line-height: 50px;">
                结束时间：<input type="text" class="form-control" id="endTime" placeholder="请输入项目编号">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
        </form> -->
        <div class="form-group" style="line-height: 50px;">
        	<input type="hidden" id="ids" value="${ids}">
        	<input type="hidden" id="projectName" value="${projectName}">
        	<span class="col-sm-4 control-label" >项目名称:&nbsp&nbsp${projectName}</span><br>
        	<span class="col-sm-4 control-label">参与学员：</span>
        </div>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        <div class="row">
            <div class="col-md-10"> </div>
        </div>
        <div id="empDataList" class="dlshouwen-grid-container"></div>
        <div id="empPage" class="dlshouwen-grid-toolbar-container"></div>
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
            id : 'employeeId',
            title : '主键',
            type : 'string',
            hide : true
        },
        {
            id : 'projectId',
            title : '项目编号',
            type : 'string',
            hide :true
        },
        
        {
            id : 'employeeName',
            title : '成员姓名',
            width:110,
            type : 'string',
            columnClass : 'text-center'
        },
        
        {
            id : 'status',
            title : '成员状态',
            type : 'string',
            width:120,
            columnClass : 'text-center'
        },
        {
            id : 'skill',
            title : '项目技术',
            type : 'string',
            width:120,
            columnClass : 'text-center'
        },

        {
            id : 'judge',
            title : '人员评价',
            type : 'string',
            width:120,
            columnClass : 'text-center'
        },
        {
            id : 'judgeTime',
            title : '评价时间',
            type : 'string',
            width:120,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center',
            resolution:function(value, record, column, grid, dataNo, columnNo){
                if(value != ''){
                    return $.myTime.UnixToDate(value,false);
                }else{
                    return "";
                }
            }   
        },
        {
            id : 'addTime',
            title : '起始时间',
            type : 'date',
            width:120,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center',
            resolution:function(value, record, column, grid, dataNo, columnNo){
                if(value != ''){
                    return $.myTime.UnixToDate(value,false);
                }else{
                    return "";
                }
            }   
        },
        {
            id : 'endTime',
            title : '预计离开时间',
            type : 'date',
            width:120,
            format:'yyyy-MM-dd hh:mm:ss',
            columnClass : 'text-center',
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
				  content += "<button class='sbtn sbtn-blue btn-sm' id='statusBtn' "
			          + "onclick=status('"+ record.employeeId + ","+record.projectId+"');>查看工作日历</button>";
				  content += '  ';
				  content += "<button class='sbtn sbtn-default btn-sm' id='editBtn' "
				      + "onclick=addApp('"
				      + record.id
				      + ","+ record.employeeId + ","+record.projectId+"');>添加评语</button>";
				  return content;
			}
        }
    ];

    var empOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/proEmp/pageList" />',
        columns : appColumns,
        gridContainer : 'empDataList',
        toolbarContainer : 'empPage',
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

    var empGrid = $.fn.dlshouwen.grid.init(empOption);
	
   $(function(){
    	lodeDate();
    })
    function lodeDate(){
    	empGrid.parameters = new Object();
    	empGrid.parameters['projectId'] = $("#ids").val();
    	empGrid.refresh(true);
    }
   
   /* 跳转到学员日历页面 */
   function status(paramters) {
   	   param = paramters.split(',');
       window.location.href = '<c:url value="/empLeave/workCalendar" />/?id='+param[0]+'&projectId='+param[1];
   }
 	/*添加评语*/
   function addApp(paramters){
 		var projectName=$("#projectName").val();
 		param=paramters.split(',');
 		window.location.href='<c:url value="/proEmp/savePage" />/?id='+param[0]+'&employeeId='+param[1]+'&projectId='+param[2]+'&projectName='+projectName;
 	}
    /* $(function() {
        $('#searchBtn').click(searchData);
        empGrid.load();
    });

    function searchData() {
    	empGrid.parameters = new Object();
    	empGrid.parameters['projectName'] = $("#projectName").val();
    	empGrid.parameters['startTime'] = $("#startTime").val();
    	empGrid.parameters['endTime'] = $("#endTime").val();
    	empGrid.refresh(true);
    } */
</script>