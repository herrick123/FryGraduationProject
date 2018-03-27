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
            border: 0px solid #ddd !important;
            border-top:1px solid #ddd !important;
        }
        th{
       		 border: 0px solid #ddd !important;
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
            <a href="#">白沟箱包网</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li><a href="#">商家管理</a>
        	<i class="fa fa-angle-right"></i>
        </li>
        <li><a href="#">产品列表</a></li>
    </ul>
</div>
<div class="row" style="margin:0px;">
    <div class="col-md-12">
        <form class="form-inline">
            <div class="form-group" style="line-height: 50px;margin-top: 10px">
               <input type="text" class="form-control" id="address" placeholder="请输入网供名称">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;margin-top: 10px;background-color: #53bee6;border: 0px;">查询</button>
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
            id : 'address',
            title : '网供名称',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo) {
				var content = '';
					content += '<a href="<c:url value="/commodity/pageUserCommoditys" />/'
						+ record.uuid +'">' + record.address + '</a>';
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
            id : 'deliveryAddress',
            title : '拿货地址',
            type : 'string',
            columnClass : 'text-center',
        },
		
    ];

    var areaOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/commodity/firmListpages" />',
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
        areaGrid.parameters['address'] = $("#address").val();
        areaGrid.refresh(true);
    }
    $(function() {
        $('#searchBtn').click(searchData);
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