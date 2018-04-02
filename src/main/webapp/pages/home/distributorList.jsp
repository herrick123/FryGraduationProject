<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <%@ include file="/pages/inc/delModal.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>代发管理</title>
</head>
<body>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height: 50px;margin-top: 10px">
               <input type="text" class="form-control" id="area" placeholder="请输入代发区域">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;margin-top: 10px;border: 0px;">查询</button>
        </form>
        <div id="schoolDataList" class="dlshouwen-grid-container" style="margin-top: 10px"></div>
        <div id="schoolPage" class="dlshouwen-grid-toolbar-container"></div>
    </div>
</div>
</body>
<script type="text/javascript">
    var appColumns = [
        {
            id : 'uuid',
            title : '主键',
            type : 'string',
            hide : true 
        },
        {
            id : 'userName',
            title : '用户名',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo) {
            	var content='';
            	content +='<span style="font-family: fantasy;font-size: 18px"></span><span >'+record.userName+'</span>';
            	return content;
			}

        },
        {
            id : 'area',
            title : '代发区域',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo) {
            	var content='';
            	content +='<span style="font-family: fantasy;font-size: 18px"></span><span >'+record.area+'</span>';
            	return content;
			}
        },
        {
            id : 'contacts',
            title : '联系人',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo){
            	var content='';
            	content +='<span style="font-family: fantasy;font-size: 18px"></span><span >'+record.contacts+'</span>';
            	return content;

            } 
        },
        {
            id : 'qq',
            title : '联系QQ',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo){
            	var content='';
            	content +='<span style="font-family: fantasy;font-size: 18px"></span><span >'+record.qq+'</span>';
            	return content;

            } 
        },
        {
            id : 'phone',
            title : '联系电话',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo){
            	var content='';
            	content +='<span style="font-family: fantasy;font-size: 18px"></span><span >'+record.phone+'</span>';
            	return content;

            } 
        },
        {
            id : 'serviceCharge',
            title : '服务费',
            type : 'string',
            columnClass : 'text-center',
        },{
            id : 'alipay',
            title : '支付宝',
            type : 'string',
            columnClass : 'text-center',
        },{
            id : 'bond',
            title : '保证金',
            type : 'string',
            columnClass : 'text-center',
        },
		
    ];

    var areaOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/home/firmListpages" />',
        columns : appColumns,
        gridContainer : 'schoolDataList',
        toolbarContainer : 'schoolPage',
        tools : 'refresh',
        check : true,
        checkWidth : '27px',
        pageSize : 10,
        pageSizeLimit : [ 10, 20, 50, 100 ],
    };

    var areaGrid = $.fn.dlshouwen.grid.init(areaOption);
	
    function searchData() {
        areaGrid.parameters = new Object();
        areaGrid.parameters['role'] = "3";
        areaGrid.parameters['area'] = $("#area").val();
        areaGrid.refresh(true);
    }
    $(function() {
        $('#searchBtn').click(searchData);
        areaGrid.parameters = new Object();
        areaGrid.parameters['role'] = "3";
        areaGrid.load();
    });

    $("#addBtn").click(function() {
        window.location.href = '<c:url value="/projectManage/add" />';
    })

    function editApp(uuid) {
    	window.location.href = '<c:url value="/commodity/editCommodity/" />' + uuid;
    } 


    function deleteApp(uuid){
        $("#delOneModel").modal();
        $("#modalId").val(uuid);
    }

    $("#deleteOneBtn").click(function() {
        uuid=$("#modalId").val();  
        $.ajax({
            url : "<c:url value='/commodity/deleteCommodity'/>?uuids=" + uuid,
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
    function deletesApp(uuid){
        $.ajax({
            url : "<c:url value='/commodity/deletesCommodity'/>?uuids=" + uuid,
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
    }


</script>