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
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">白沟箱包</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">管理中心</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">订单管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">创建订单</a></li>
		</ul>
	</div>
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
	<div class="row" style="margin-top: 30px;margin-left: -12%">
		<div class="col-md-3"></div>
		<div class="col-md-7" style="padding: 0;">
			<form class="form-inline" style="margin-left: 20px;" id="fryOrder" 
				action="<c:url value='/order/save' />" method="post">
				<div id="commodityOrderForm"></div>
				<div style="margin: 0 0 20px 0;font-size: 18px;" align="left">
					<strong>填写收件人物流信息</strong>
				</div>
				<div class="form-group">
					收件人：<input type="text" class="form-control" id="addressee" name="addressee" placeholder="收件人">
				</div>
				<div class="form-group"  style="margin-left: 10px;">
					电话：<input type="text" class="form-control" id="telephone" name="telephone" placeholder="联系电话">
				</div>
				</br>
				<div class="form-group"  style="margin-top: 10px;">
					代发商：<select class="form-control" id="distributorId" name="distributorId">
							<option value="">请选择代发商</option>
							<c:forEach var="user" items="${userList }" >
								<option value="${ user.uuid}">${ user.userName}</option>
							</c:forEach>
						</select>
				</div>
				<div class="form-group"  style="margin-left: 10px;margin-top: 10px;">
					物流：<select class="form-control" id="logistics" name="logistics">
							<option value="中通快递">中通快递</option>
							<option value="顺丰快递">顺丰快递</option>
							<option value="韵达快递">韵达快递</option>
							<option value="EMS">EMS</option>
							<option value="邮政快递">邮政快递</option>
						</select>
				</div>
				<div style="margin: 20px 0 20px 0;font-size: 18px;" align="left">
					<strong>收货地址</strong>
				</div>
				<div class="form-group col-md-12" style="padding: 0;">
					详细地址：
						<input type="text" class="form-control" placeholder="请填写详细地址"  
							style="width:90%;" name="receiveAddress" id="receiveAddress" />
				</div></br>
				<div class="form-group col-md-12" style="padding: 0;margin-top: 15px;">
					订单备注：
						<input type="text" class="form-control" placeholder="请填写订单备注"  
							style="width:90%;" name="remark" id="remark" />
				</div>
			</form>
			<div style="text-align: center; margin-top: 120px;">
				<button id="subBtn" type="button" class="sbtn sbtn-blue">
				<i class="icon-right fa fa-send"></i>提交</button>
				<button style="margin-left: 45px;" type="button" id="backBtn" class="sbtn sbtn-default">
				<i class="icon-right fa fa-reply"></i>返回</button>
			</div>
		</div>
		<div class="col-md-2"></div>
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
	$(function(){
		commodityGrid.parameters = new Object();
		commodityGrid.parameters['status'] = "1";
		commodityGrid.load(); 
	});
	$("body").on("click", ".td-right-span", function(){
		var id = $(this).parent().prop("id");
		var index = id.substring(3, id.length);
		var number = $(this).prev().val() * 1;
		if(number < 100){
			number = number * 1 + 1; 
		}
		$(this).prev().val(number);
		commodityEntity[index].number = number;
	})
	$("body").on("click", ".td-left-span", function(){
		var id = $(this).parent().prop("id");
		var index = id.substring(3, id.length);
		var number = $(this).next().val() * 1;
		if(number > 1){
			number = number * 1 - 1; 
		}
		$(this).next().val(number);
		commodityEntity[index].number = number;
	})
	$("#addBtn").click(function(){
		$("#addCommodityModal").modal();
	});
	$("#toAddCommodity").click(function(){
		console.log(commodityEntity);
		$("#commodityOrder").html("");
		for(var i = 0; i < commodityEntity.length; i++){
			if(typeof(commodityEntity[i].number) == "undefined"){
				commodityEntity[i].number = 1;
			}
			var strVar = "";
		    strVar += "<tr>";
		    strVar += "<td>" + commodityEntity[i].commodityName + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].commodityNumber + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].color + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].size + "<\/td>";
		    strVar += "<td>￥" + commodityEntity[i].price + "<\/td>";
		    strVar += "<td>" + commodityEntity[i].deliveryAddress + "<\/td>";
		    strVar += "<td id=\"td_" + i + "\">";
		    strVar += "<span class=\"glyphicon glyphicon-minus td-left-span\"><\/span>";
		    strVar += "<input value=\"" + commodityEntity[i].number + "\" name=\"count\" class=\"form-control td-input\" readonly=\"readonly\"/>";
		    strVar += "<span class=\"glyphicon glyphicon-plus td-right-span\"><\/span>";
		    strVar += "<\/td>";
		    strVar += "<\/tr>";
		    $("#commodityOrder").append(strVar);
		}
	});
	$("#subBtn").click(function(){
		if($("#addressee").val() == "" || $("#telephone").val() == "" || $("#logistics").val() == "" || 
				$("#receiveAddress").val() == "" || $("#remark").val() == "" || 
				$("#distributorId").val() == "" || commodityEntity.length == 0){
			showMsg("请完整填写订单信息^_^");
			return ;
		}
		$("#commodityOrderForm").html("");
		for(var i = 0; i < commodityEntity.length; i++){
		    var html = "";
		    html += "<input type=\"hidden\" name=\"commodityId\" value=\"" + commodityEntity[i].uuid + "\">";
		    html += "<input type=\"hidden\" name=\"number\" value=\"" + commodityEntity[i].number + "\">";
		    $("#commodityOrderForm").append(html);
		}
		$("#fryOrder").submit();
	});
</script>
</html>