<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/pages/inc/header.jsp"%>
<%@ include file="/pages/inc/delModal.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核订单</title>
</head>
<style>
	#statuesUl{
		list-style: none;
		margin-top: 10px;
		padding-left: 15px;
	}
	#statuesUl li{
		float:left;
		margin-right: 10px;
		font-size:16px;
		cursor: pointer;
	}
	#statuesUl li:hover{
		color:#FF6C60;
		border-bottom: 2px solid #FF6C60;
	}
	.statuesUl-li-active{
		color:#FF6C60;
		border-bottom: 2px solid #FF6C60;
	}
	
</style>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">白沟箱包</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">管理中心</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">代发管理</a></li>
		</ul>
	</div>
	<div class="row" style="margin: 10px 0px 5px 10px;">
		<div class="col-md-12" style="padding-left:0;">
			<div id="fryOrderDataList" class="dlshouwen-grid-container"></div>
			<div id="fryOrderPage" class="dlshouwen-grid-toolbar-container"></div>
		</div>
	</div>
	<!-- 订单确认 -->
	<div id="confirmModel" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
					<h4 class="modal-title" id="msgModel"></h4>
				</div>
				<input type="hidden" id="id">
				<input type="hidden" id="status">
				<div class="modal-body" style="text-align: center;" id="msgModelBody">
					
				</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" data-dismiss = "modal" id="submitModel" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var fryOrderColumns = [
			{
				id : 'uuid',
				title : '主键',
				type : 'string',
				hide : true
			},
			{
				id : 'serialId',
				title : '序号',
				type : 'string',
				columnClass : 'text-center',
				width : 45,
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					return dataNo + 1;
				}
			},
			{
				id : 'order',
				title : '订单详情',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '<div style="text-align:left;float:left;">' + $.myTime.UnixToDate(record.createTime, true);
					content += '&nbsp;&nbsp;&nbsp;订单号：' + record.createTime + '</div></br>';
					for(var i = 0; i < record.commodityList.length; i++){
						content += '<div style="width:104%;height:1px;background:#AAAAAA;margin:0 0 10px -8px;"></div>';
						var curCommodity = record.commodityList[i];
						content += '<div style="vertical-align: middle;line-height:60px;height:60px;width:100%;">';
						content += '<img src="<c:url value="/' + curCommodity.productPicture+'"/>" style="width:60px;height:60px;float:left;">';
						content += '<div style="float:left;">&nbsp;&nbsp;' + curCommodity.commodityName + '&nbsp;&nbsp;';
						content += curCommodity.color + '&nbsp;&nbsp;';
						content += curCommodity.size + '&nbsp;&nbsp;</div>';
						content += '<div style="float:right;">￥' + curCommodity.price + 'x' + curCommodity.number + '</div>';
						content += '</div></br>';
					}
					return content;
				}
			},
			{
				id : 'consignee',
				title : '收货人',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
					content += '<div style="text-align:left;">';
					content += record.addressee + '</br>';
					content += record.telephone + '</br>';
					content += record.receiveAddress + '</br>';
					content += record.remark + '</br></div>';
					return content;
				}
			},
			{
				id : 'express',
				title : '快递',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '<div style="text-align:left;">代发商：</br>';
					content += '【' + record.distributorName + '】</br>';
					content += record.logistics + '</br></div>';
					return content;
				}
			},
			{
				id : 'sum',
				title : '金额',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var cost = 0;//货款
					var freight = 5;//运费
					var count = 0;//商品数
					var num = record.commodityList.length;
					for(var i = 0; i < num; i++){
						count += record.commodityList[i].number;
						cost += record.commodityList[i].price * record.commodityList[i].number;
						freight += record.commodityList[i].number * 2;
					}
					var total = cost + freight + record.serviceCharge * count;
					var content = '<div style="text-align:left;">';
					content += '<div style="color:#FF6C60;">￥' + total + '</div>';
					content += '商品数：x' + count + '</br>';
					content += '<div style="color:#AAAAAA;">'
					content += '货款：￥' + cost + '</br>';
					content += '运费：￥' + freight + '</br>';
					content += '服务费：￥' + record.serviceCharge * count + '</br>';
					content += '</div></div>';
					return content;
				}
			},
			{
				id : 'alipayRecord',
				title : '转账记录',
				type : 'string',
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var name = value;
					if (name.length > 10) {
		                name = value.substring(0, 10)+ "...";
		            }
					var content = '';
						content += '<div title="' + value + '">' + name + '</div>';
					return content;
				}
			},
			{ 
				id : 'operation',
				title : '操作',
				type : 'string',
				width : 160,
				columnClass : 'text-center',
				resolution : function(value, record, column, grid, dataNo,
						columnNo) {
					var content = '';
						content += '<button class="sbtn sbtn-default" style="height:32px;line-height:10px"' + 
						'onclick="showModal(\'' + record.uuid + '\',\'' + 3 + '\',\'' + "审核"  + '\')">审核</button>';
					return content;
				}
			} ];
	var fryOrderOption = {
		lang : 'zh-cn',
		ajaxLoad : true,
		loadURL : '<c:url value="/order/pageList" />',
		columns : fryOrderColumns,
		gridContainer : 'fryOrderDataList',
		toolbarContainer : 'fryOrderPage',
		tools : 'refresh',
		/* check : true,
		checkWidth : '20px', */
		pageSize : 5,
		pageSizeLimit : [ 5, 10, 20, 50, 100 ]
	};
	var fryOrderGrid = $.fn.dlshouwen.grid.init(fryOrderOption);
	$(function() {
		fryOrderGrid.parameters = new Object();
		fryOrderGrid.parameters['status'] = "2";
		fryOrderGrid.load();
	});
	function showModal(uuid, status, msg){
		$("#id").val(uuid);
		$("#status").val(status);
		$("#msgModel").text(msg);
		$("#msgModelBody").text("你是否确认要" + msg + "？");
		$("#confirmModel").modal();
	}
	$("#submitModel").click(function(){
		$.ajax({
			url : "<c:url value='/order/updateStatus'/>",
			type : "POST",
			dataType : "json",
			data : "uuid=" + $("#id").val() + "&status=" + $("#status").val(),
			success : function(data, textStatus) {
				if (data.returncode == '200') {
					fryOrderGrid.refresh(true);
					showMsg('操作成功！');
				} else if (data.returncode == '10000') {
					showMsg('操作失败！请联系开发人员！');
				} else {
					showMsg('操作失败！');
				}
			},
			error : function() {
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	});
</script>
</html>	