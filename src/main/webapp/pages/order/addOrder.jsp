<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>创建订单</title>
</head>
<style>
	.td-left-span{
		float:left;
		margin-right: 5px;
		cursor: pointer;
	}
	.td-input{
		width: 40px;
		height: 20px;
		float:left;
	}
	.td-right-span{
		float:left;
		margin-left: 5px;
		cursor: pointer;
	}
</style>
<body>
	<h3 style="font-weight:border;margin: 20px;" align="center">创建订单</h3>
	<div class="row" style="margin-top: 30px;margin-left: -12%">
		<div class="col-md-3"></div>
		<div class="col-md-7">
			<table class="table">
				<thead>
					<tr>
						<th>商品名称</th>
						<th>货号</th>
						<th>颜色</th>
						<th>尺码</th>
						<th>单价</th>
						<th>拿货地址</th>
						<th>数量</th>
					</tr>
				</thead>
				<tbody id="commodityOrder"></tbody>
			</table>
			
		</div>
		<div class="col-md-2">
			<button type="button" id="addBtn" class="sbtn sbtn-default">新增商品</button>
		</div>
	</div>
	<!-- 选择商品-->
	<div class="modal" id="addCommodityModal" role="dialog" aria-hidden="true">
		<div class="modal-dialog" style="width: 950px; height: auto;max-height: 800px;">
			<div class="modal-content">
				<div class="modal-header">
					<span>选择商品</span>
				</div>
				<div class="modal-body">
					<form class="form-inline" style="margin: 10px 0px 10px 0px;">
						<div class="form-group">
							商品名称：<input type="text" class="form-control" id="commodityName" placeholder="商品名称">
						</div>
						<div class="form-group"  style="margin-left: 30px;">
							货号：<input type="text" class="form-control" id="commodityNumber" placeholder="货号">
						</div>
						<button type="button" onclick="searchCommodityData()" class="sbtn sbtn-blue" 
							style="margin-left: 15px;"><i class="icon-right fa fa-search"></i>查询</button>
					</form>
					<div style="max-height: 600px;height:auto;overflow: auto;">
						<div id="commodityDataList" class="dlshouwen-grid-container"></div>
						<div id="commodityPage" class="dlshouwen-grid-toolbar-container"></div>
					</div>
					<div style="text-align: center;margin-top:10px;">
						<button id="toAddCommodity" type="button" class="sbtn sbtn-blue"  data-dismiss="modal">
							<i class="icon-right fa fa-save"></i>确定</button>
						<button style="margin-left: 45px;" type="button"
							class="sbtn sbtn-default" data-dismiss="modal">
							<i class="icon-right fa fa-reply"></i>取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var commodityEntity = [];
	var commodityColumns = [
	    {
	        id : 'uuid',
	        title : '主键',
	        type : 'string',
	        hide : true,
	        resolution : function(value, record, column, grid, dataNo,
    				columnNo) {
            	for(var i = 0; i < commodityEntity.length; i++){
        			if(commodityEntity[i].uuid == value){
        				setTimeout(function(){
             				$("input[datano="+dataNo+"]").attr("checked",true);
 						}, 200);
        			}
        		}
            	return value;
            }
	    }, {
	        id : 'productPicture',
	        title : '产品首图',
	        type : 'string',
	        columnClass : 'text-center',
	        resolution : function(value, record, column, grid, dataNo, columnNo){
	        	var content='';
	        	content +='<img src="<c:url value="/'+record.productPicture+'" />" style="width:60px;height:45px;">';
				return content;
	        } 
	    }, {
	        id : 'commodityNumber',
	        title : '商品货号',
	        type : 'string',
	        columnClass : 'text-center',
	    }, {
	        id : 'commodityName',
	        title : '产品名称',
	        type : 'string',
	        columnClass : 'text-center',
	    }, {
	        id : 'classification',
	        title : '分类',
	        type : 'string',
	        columnClass : 'text-center',
	    }, {
	        id : 'size',
	        title : '尺寸',
	        type : 'string',
	        columnClass : 'text-center',
	    }, {
	        id : 'color',
	        title : '颜色',
	        type : 'string',
	        columnClass : 'text-center',
	    }, {
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
	    }, {
	        id : 'deliveryAddress',
	        title : '拿货地址',
	        type : 'string',
	        columnClass : 'text-center',
	    }, {
	        id : 'releaseTime',
	        title : '发布时间',
	        type : 'date',
	        width:160,
	        format:'yyyy-MM-dd',
	        otype:'time_stamp_ms',
	        columnClass : 'text-center',
	    }
	];
	
	var commodityOption = {
	    lang : 'zh-cn',
	    ajaxLoad : true,
	    loadURL : '<c:url value="/commodity/pageList" />',
	    columns : commodityColumns,
	    gridContainer : 'commodityDataList',
	    toolbarContainer : 'commodityPage',
	    tools : 'refresh',
	    check : true,
	    checkWidth : '27px',
	    pageSize : 5,
	    pageSizeLimit : [ 5, 10, 20, 50, 100 ],
	    onCheck : function(isChecked, record, grid, dataNo, row, extraCell, e){
	    	if(isChecked == true){
	    		var flag = true;
	    		for(var i = 0; i < commodityEntity.length;i++){
	    			if(commodityEntity[i].uuid == record.uuid){
	    				flag = false;
	    				break;
	    			}
	    		}
	    		if(flag == true){
	    			commodityEntity.push(record);
	    		}
	    	}else{
	    		for(var i = 0; i < commodityEntity.length; i++){
	    			if(commodityEntity[i].uuid == record.uuid){
	    				commodityEntity.splice(i,1);
	    			}
	    		}
	    	}
	    }
	};
	var commodityGrid = $.fn.dlshouwen.grid.init(commodityOption);
	function searchCommodityData() {
		commodityGrid.parameters = new Object();
		commodityGrid.parameters['commodityName'] = $("#commodityName").val();
		commodityGrid.parameters['commodityNumber'] = $("#commodityNumber").val();
		commodityGrid.parameters['status'] = "1";
		commodityGrid.refresh(true);
	}
	function reduce(e){
		var number = $(e).next().val() * 1;
		if(number > 1){
			number = number * 1 - 1; 
		}
		$(e).next().val(number);
	}
	function plus(e){
		var number = $(e).prev().val() * 1;
		if(number < 100){
			number = number * 1 + 1; 
		}
		$(e).prev().val(number);
	}
	$(function(){
		commodityGrid.parameters = new Object();
		commodityGrid.parameters['status'] = "1";
		commodityGrid.load(); 
	});
	$("#addBtn").click(function(){
		$("#addCommodityModal").modal();
	});
	$("#toAddCommodity").click(function(){
		console.log(commodityEntity.length);
		console.log(commodityEntity);
		for(var i = 0; i < commodityEntity.length; i++){
			console.log(commodityEntity[i].number);
			var strVar = "";
		    strVar += "<tr>";
		    strVar += "<td>" + commodityEntity[i].commodityName + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].commodityNumber + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].color + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].size + "<\/td>";
		    strVar += "<td>￥" + commodityEntity[i].price + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].deliveryAddress + "<\/td>";
		    strVar += "<td>";
		    strVar += "<span class=\"glyphicon glyphicon-minus td-left-span\" onclick=\"reduce(this)\"><\/span>";
		    strVar += "<input value=\"\" name=\"number\" class=\"form-control td-input\" readonly=\"readonly\"/>";
		    strVar += "<span class=\"glyphicon glyphicon-plus td-right-span\" onclick=\"plus(this)\"><\/span>";
		    strVar += "<\/td>";
		    strVar += "<\/tr>";
		    $("#commodityOrder").append(strVar);
		}
	});
</script>
</html>