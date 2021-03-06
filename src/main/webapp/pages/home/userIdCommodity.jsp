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
<!-- <div class="sodb-page-home">
    <ul class="sodb-page-ul">
        <li>
            <i class="fa fa-home"></i>
            <a href="#">白沟箱包网</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li><a href="#">商家产品</a>
        	<i class="fa fa-angle-right"></i>
        </li>
        <li><a href="#">产品列表</a></li>
    </ul>
</div> -->
<div class="row" style="margin:0px;">
    <div class="col-md-12">
    <input type="hidden" id="userUuid" value="${uuid}">
        <form class="form-inline">
            <div class="form-group" style="line-height: 50px;margin-top: 10px">
               <input type="text" class="form-control" id="commodityName" placeholder="请输入产品名称">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;margin-top: 10px;background-color: #53bee6;border: 0px;">查询</button>
        </form>
        <div id="commodityDataList" class="dlshouwen-grid-container" style="margin-top: 10px"></div>
        <div id="commodityPage" class="dlshouwen-grid-toolbar-container"></div>
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
            id : 'productPicture',
            title : '产品首图',
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo){
            	var content='';
            	content +='<img src="<c:url value="/'+record.productPicture+'" />" style="width:180px;height:160px;">';
            	
            	console.log(record.productPicture);
				return content;
            } 
        
        },
        {
            id : 'commodityName',
            title : '产品名称',
            type : 'string',
            columnClass : 'text-center',
           	resolution : function(value, record, column, grid, dataNo, columnNo){
                	var content='';
                	content +='<a style="font-family: Microsoft Yahei;font-weight: bold;text-decoration:none;"  href="<c:url value="/home/commodityMessage/" />/'
						+ record.uuid +'">' + record.commodityName + '</a>';
                	return content;

                } 
        },
    
        {
            id : 'price',
            title : '¥价格',
            width:160,
            type : 'string',
            columnClass : 'text-center',
            resolution : function(value, record, column, grid, dataNo, columnNo){
            	var content='';
            	content +='<span style="font-family: fantasy;font-size: 18px">¥</span><span style="color:red;font-family: fantasy;font-size: 28px">'+record.price+'</span>';
            	return content;

            } 
        },

        {
            id : 'releaseTime',
            title : '发布时间',
            type : 'date',
            width:160,
            format:'yyyy-MM-dd',
            otype:'time_stamp_ms',
            columnClass : 'text-center',
        },
		{
			id : 'status',
			title : '状态',
			type : 'string',
			width:160,
			columnClass : 'text-center',
			resolution : function(value, record, column, grid, dataNo, columnNo) {
				var content = '';
				if(record.status == '1'){
					content += '<span style="color: green;font-weight: bold;font-family: Microsoft Yahei;font-size:16px">' +'销售中'+ '</span>';
				}
				else if (record.status == '0'){
					content += '<span style="color: #a1a1a1;font-weight: bold;font-family: Microsoft Yahei;font-size:16px">' +'已下架'+ '</span>';
				}
				console.log(record.status);
				return content;
			}
		}
		
    ];
    var uuid = $("#userUuid").val();
    var commodityOption = {
        lang : 'zh-cn',
        ajaxLoad : true,
        loadURL : '<c:url value="/home/pageUserCommodity/" />'+uuid,
        columns : appColumns,
        gridContainer : 'commodityDataList',
        toolbarContainer : 'commodityPage',
        tools : 'refresh',
        pageSize : 10,
        pageSizeLimit : [ 10, 20, 50, 100 ],
    };

    var commodityGrid = $.fn.dlshouwen.grid.init(commodityOption);
	
    function searchData() {
        commodityGrid.parameters = new Object();
        commodityGrid.parameters['commodityName'] = $("#commodityName").val();
        commodityGrid.refresh(true);
    }
    $(function() {
        $('#searchBtn').click(searchData);
        commodityGrid.load();
    });

</script>