<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<title>用户注册</title>
</head>
<style>
	.li-curr{
		background: #d9534f !important;
		color: #fff !important;
		 font-weight: bolder;
	}
	.tabs li{
		width: 30%;
		text-align: center;
	    float: left;
	    background: #f2f2f2;
	    color: black;
	    font-size: 16px;
	    line-height: 30px;
	    margin-right: 2px;
	    cursor: pointer;
	}
</style>
<body>
	<form name="userForm" class="form-horizontal" id="userForm"
		action="<c:url value='/user/save' />" method="post">
		<input type="hidden" id="role" name="role" value="1"/>
		<div class="row" style="margin-top: 50px;margin-left: -12%">
			<div class="form-group col-md-12">
				<div class="col-md-2"></div>
				<div class="col-md-8" style="margin-left: 48px;">
					<ul class="tabs" id="roleUl">
						<li class="li-curr">淘宝卖家注册</li>
						<li>供货商家注册</li>
						<li>代购厂商注册</li>
					</ul>
				</div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">用户名<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写用户名"  
						valid="r|l1-le20" validTitle="必填项" validInfoArea="show_userName_area"
						value="" name="userName" id="userName" />
				</div>
				<div class="col-md-4 help-block" id="show_userName_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">密码<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="password" class="form-control" placeholder="请填写密码"  
						valid="r|le6-l20" validTitle="密码" validInfoArea="show_password_area"
						value="" name="password" id="password" />
				</div>
				<div class="col-md-4 help-block" id="show_password_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">确认密码<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="password" class="form-control" placeholder="请填写确认密码"  
						valid="r|le6-l20" validTitle="密码" validInfoArea="show_confirmPwd_area"
						value="" name="confirmPwd" id="confirmPwd" validPassword="password" />
				</div>
				<div class="col-md-4 help-block" id="show_confirmPwd_area"></div>
			</div>
			<div class="form-group col-md-12">
				<div class="col-md-1"></div>
				<label class="col-md-3 control-label">联系人<span
					class="required" style="color: red;">*</span>
				</label>
				<div class="col-md-4">
					<input type="text" class="form-control" placeholder="请填写联系人"  
						valid="r|l1-le20" validTitle="必填项" validInfoArea="show_contacts_area"
						value="" name="contacts" id="contacts" />
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
						value="" name="phone" id="phone" />
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
						value="" name="qq" id="qq" />
				</div>
				<div class="col-md-4 help-block" id="show_qq_area"></div>
			</div>
			<div id="role2" style="display: none;">
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">网供名称<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写您的工厂/公司名称"  
							valid="r|l2-le20" validTitle="必填项" validInfoArea="show_address_area"
							value="" name="address" id="address" />
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
							value="" name="deliveryAddress" id="deliveryAddress" />
					</div>
					<div class="col-md-4 help-block" id="show_deliveryAddress_area"></div>
				</div>
			</div>
			<div id="role3" style="display: none;">
				<div class="form-group col-md-12">
					<div class="col-md-1"></div>
					<label class="col-md-3 control-label">代发区域<span
						class="required" style="color: red;">*</span>
					</label>
					<div class="col-md-4">
						<input type="text" class="form-control" placeholder="请填写您的代发区域"  
							valid="r|l2-le40" validTitle="必填项" validInfoArea="show_area_area"
							value="" name="area" id="area" />
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
							value="" name="serviceCharge" id="serviceCharge" />
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
							value="" name="alipay" id="alipay" />
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
							value="" name="bond" id="bond" />
					</div>
					<div class="col-md-4 help-block" id="show_bond_area"></div>
				</div>
			</div>
		</div>
		<div style="text-align: center; margin-top: 20px;">
			<button id="subBtn" type="button" class="sbtn sbtn-blue" onclick="submit_user();" style="margin-left: -18%">
			<i class="icon-right fa fa-send"></i>提交</button>
			<!-- <button style="margin-left: 45px;" type="button" id="backBtn" class="sbtn sbtn-default">
			<i class="icon-right fa fa-reply"></i>返回</button> -->
		</div>
	</form>
</body>
<script type="text/javascript">
	//表单验证
	var validator_user;
	var option_user = {
		elementCallback : {
			success : function(element, css){
				if($(element).is(':checkbox') || $(element).is(':radio')){
					var name = $(element).attr('name');
					$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
				}else{
					$(element).parents('.form-group').removeClass(css.failure);
				}
				//验证授权分组名称
				if($(element).attr('name') == 'userName'){
					var userName = $("#userName").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						async : false,
						url : '<c:url value="/user/check" />',
						data : "userName=" + userName,
						success : function(Data, textStatus) {
							//用户名验证
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_userName_area").removeClass("info-area-success");
								$("#show_userName_area").addClass("info-area-failure");
								$("#show_userName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;用户名已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_userName_area").removeClass("info-area-failure");
								$("#show_userName_area").addClass("info-area-success");
								$("#show_userName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_userName_area").removeClass("info-area-success");
								$("#show_userName_area").addClass("info-area-failure");
								$("#show_userName_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;用户名获取失败！请联系开发人员！");
								return;
							}							
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_userName_area").removeClass("info-area-success");
							$("#show_userName_area").addClass("info-area-failure");
							$("#show_userName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
			}
		}
   	};
	$("#roleUl li").click(function(){
		$("#roleUl li").removeClass("li-curr");
		$(this).addClass("li-curr");
		if($(this).index() == 0){
			$("#role").val("1");
			$("#role2").hide();
			$("#role3").hide();
			validator_user = $.fn.dlshouwen.validator.init($('#userForm'), option_user);
		}else if($(this).index() == 1){
			$("#role").val("2");
			$("#role2").show();
			$("#role3").hide();
			validator_user = $.fn.dlshouwen.validator.init($('#userForm'), option_user);
		}else if($(this).index() == 2){
			$("#role").val("3");
			$("#role2").hide();
			$("#role3").show();
			validator_user = $.fn.dlshouwen.validator.init($('#userForm'), option_user);
		}
		parent.reinitIframe();
	});
	var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
	function submit_user() {
		if (!validator_user.validResult()) {
			return;
		}else if($("#show_userName_area").html() != name_area){
			$.fn.dlshouwen.validator.tools.toast('用户名验证未通过！', 'error', 3000);
			return;
		}
		$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
		$.ajax({
			type : "POST",
			dataType : "json",
			async : false,
			url : '<c:url value="/user/save" />',
            data: $('#userForm').serialize(),
			success : function(data, textStatus) {
				if (data.returncode == '200') {
					parent.$(".sodb-menu-context-list").eq(0).click();
				} else if (data.returncode == '10000') {
					showMsg('注册失败！请联系开发人员！');
				} else {
					showMsg('注册失败！');
				}						
			},
			error : function(data) {
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	}
	$(function() {
		validator_user = $.fn.dlshouwen.validator.init($('#userForm'), option_user);
	});
	/* $("#backBtn").click(function() {
		window.location.href = '<c:url value="/user" />';
	}); */
</script>
</html>