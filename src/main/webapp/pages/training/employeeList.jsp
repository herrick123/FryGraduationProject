<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%@ include file="/pages/inc/header.jsp"%>
    <%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息列表页面</title>
<style type="text/css">
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
            <a href="#">猛码员工管理系统</a>
            <i class="fa fa-angle-right"></i>
        </li>
        
        <li>
	        <a href="#">员工信息管理</a>
	        <i class="fa fa-angle-right"></i>
        </li>
        <li>
	        <a href="#">员工信息</a>
        </li>
    </ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
        	
               <input type="hidden" class="form-control" id="issueId" value="${ids}">
           
            <div class="form-group" style="line-height: 50px;">
                员工姓名：<input type="text" class="form-control" id="employeeName" placeholder="请输入员工姓名">
            </div>
            <div class="form-group" style="line-height: 50px;">
                &#8194;员工编号：<input type="text" class="form-control" id="employeeCode" placeholder="请输入员工编号">
            </div>
            <div class="form-group" style="line-height: 50px;">
                &#8194;专业：<input type="text" class="form-control" id="major" placeholder="请输入专业">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
        	<button type="button"  id="backBtn" class="sbtn sbtn-green" style="margin-left: 15px;">返回</button>
        </form>
        <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
        
        <div id="employeeDataList" class="dlshouwen-grid-container"></div>
        <div id="employeePage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>

</body>
<script type="text/javascript">
    var employeeColumns = [
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
            title : '员工编号',
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'employeeName',
            title : '员工姓名',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo,
					columnNo) {
				var content = record.employeeName; 
				return '<a href="<c:url value="/employee/employeeInfo"/>/' + record.id
						+ '">' + record.employeeName + '</a>';
			}
        },
        {
            id : 'schoolName',
            title : '所在学校',
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'abilityLevel',
            title : '能力级别',
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'major',
            title : '专业',
            type : 'string',
            columnClass : 'text-center'
        },
        {
            id : 'phone',
            title : '联系方式',
            type : 'string',
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
  
    var employeeOption = {
    		
    	lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : "<c:url value='/train/pageEmpList'/>",
        data: {"issueId":$("#issueId").val()},
        columns : employeeColumns,
        gridContainer : 'employeeDataList',
        toolbarContainer : 'employeePage',
        tools : 'refresh',
        check : true,
        checkWidth : '27px',
        pageSize : 10,
        pageSizeLimit : [ 10, 20, 50, 100 ]
    };

    var employeeGrid = $.fn.dlshouwen.grid.init(employeeOption);
	
    $(function(){
    	lodeDate();
    })
    function lodeDate(){
    	employeeGrid.parameters = new Object();
    	employeeGrid.parameters['issueId'] = $("#issueId").val();
    	employeeGrid.refresh(true);
    }
    $(function() {
    	
       $('#searchBtn').click(searchData);
        employeeGrid.load();
    });
	
    function searchData() {
    	employeeGrid.parameters = new Object();
    	employeeGrid.parameters['issueId'] = $("#issueId").val();
    	employeeGrid.parameters['employeeName'] = $("#employeeName").val();
    	employeeGrid.parameters['employeeCode'] = $("#employeeCode").val();
    	employeeGrid.parameters['major'] = $("#major").val();
    	employeeGrid.refresh(true);
    }
	
  //返回
    $("#backBtn").click(function() {
         window.location.href = '<c:url value="/pages/training/trainList.jsp" />';
     })
    function editApp(id) {
        window.location.href = '<c:url value="/employee/edit" />/' + id;
    }
    
    function deleteApp(id){
        $("#delOneModel").modal();
        $("#modalId").val(id);
    }

    $("#deleteOneBtn").click(function() {
        id=$("#modalId").val();
        $.ajax({
            url : "<c:url value='/employee/deleteEmployee'/>?ids=" + id,
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
    })
</script>
</html>