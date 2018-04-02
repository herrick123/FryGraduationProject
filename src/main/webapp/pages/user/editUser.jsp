<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>用户个人信息修改</title>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">白沟箱包</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">管理中心</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">资料管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">个人资料</a></li>
		</ul>
	</div>
	<form name="userForm" class="form-horizontal" id="userForm"
		action="<c:url value='/user/update' />" method="post">
		<input type="hidden" id="uuid" name="uuid" value="${user.uuid }"/>
		<input type="hidden" id="role" name="role" value="${user.role }"/>
		<div class="row" style="margin-top: 50px;">
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">用户名<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" readonly="readonly"
						value="${user.userName }" name="userName" id="userName" />
				</div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">联系人<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写联系人"  
						valid="r|l1-le20" validTitle="必填项" validInfoArea="show_contacts_area"
						value="${user.contacts }" name="contacts" id="contacts" />
				</div>
				<div class="col-md-4 help-block" id="show_contacts_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">手机<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写手机号"  
						valid="r|number|le11-le11" validTitle="必填项" validInfoArea="show_phone_area"
						value="${user.phone }" name="phone" id="phone" />
				</div>
				<div class="col-md-4 help-block" id="show_phone_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">QQ<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写QQ"  
						valid="r|qq" validTitle="必填项" validInfoArea="show_qq_area"
						value="${user.qq }" name="qq" id="qq" />
				</div>
				<div class="col-md-4 help-block" id="show_qq_area"></div>
			</div>
			<c:if test="${user.role == 2 }">
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">网供名称<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写您的工厂/公司名称"  
							valid="r|l2-le20" validTitle="必填项" validInfoArea="show_address_area"
							value="${user.address }" name="address" id="address" />
					</div>
					<div class="col-md-4 help-block" id="show_address_area"></div>
				</div>
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">拿货地址<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写您的拿货地址"  
							valid="r|l2-le40" validTitle="必填项" validInfoArea="show_deliveryAddress_area"
							value="${user.deliveryAddress }" name="deliveryAddress" id="deliveryAddress" />
					</div>
					<div class="col-md-4 help-block" id="show_deliveryAddress_area"></div>
				</div>
			</c:if>
			<c:if test="${user.role == 3 }">
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">代发区域<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写您的代发区域"  
							valid="r|l2-le40" validTitle="必填项" validInfoArea="show_area_area"
							value="${user.area }" name="area" id="area" />
					</div>
					<div class="col-md-4 help-block" id="show_area_area"></div>
				</div>
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">服务费<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写服务费"  
							valid="r|money" validTitle="必填项" validInfoArea="show_serviceCharge_area"
							value="${user.serviceCharge }" name="serviceCharge" id="serviceCharge" />
					</div>
					<div class="col-md-4 help-block" id="show_serviceCharge_area"></div>
				</div>
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">支付宝<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写支付宝"  
							valid="r|email" validTitle="必填项" validInfoArea="show_alipay_area"
							value="${user.alipay }" name="alipay" id="alipay" />
					</div>
					<div class="col-md-4 help-block" id="show_alipay_area"></div>
				</div>
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">保证金<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写保证金"  
							valid="r|money" validTitle="必填项" validInfoArea="show_bond_area"
							value="${user.bond }" name="bond" id="bond" />
					</div>
					<div class="col-md-4 help-block" id="show_bond_area"></div>
				</div>
			</c:if>
		</div>
		<div style="text-align: center; margin-top: 20px;">
			<button id="subBtn" type="button" class="sbtn sbtn-blue" onclick="submit_user();">
			<i class="icon-right fa fa-send"></i>确认修改</button>
		</div>
	</form>
</body>
<script type="text/javascript">
	//表单验证
	var validator_user;
	function submit_user() {
		if (!validator_user.validResult()) {
			return;
		}
		$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
		document.getElementById("userForm").submit();
	}
	$(function() {
		validator_user = $.fn.dlshouwen.validator.init($('#userForm'));
	});
</script>
</html>