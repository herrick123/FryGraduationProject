<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<link type="text/css" href="<%=path%>/css/jquery.idcode.css" rel="stylesheet" /> 
<script src="<%=path%>/js/jquery.idcode.js" type="text/javascript" charset="utf-8"></script>
<style>
	<%-- body{
		background-image: url(<%=path %>/img/index/loginBgd.jpg);
	} --%>
</style>
<body style="background:url(<%=path %>/img/index/loginBgd.jpg) 0 -50px; background-size:cover; padding:0 auto;">
	<!-- <div
		style="position: fixed; width: 100%; background: #000; filter: alpha(Opacity = 80); -moz-opacity: 0.5; opacity: 0.5; height: 80%; min-height: 480px; margin-top: 5%;"></div>
	 --><div class="row"
		style="position: absolute; width: 100%; height: 400px; padding-top: 12%;">
		<div class="col-md-6" style="text-align: center; padding-top: 0px;">
			<div style="margin: 0 auto;">
				<%-- <img src="<%=path%>/img/index/logo.png" height="180px" /><br> --%>
				<!-- <h2 style="color: #fff;">白沟箱包</h2> -->
			</div>
		</div>
		<div class="col-md-6" style="text-align: center; padding-top: 0px;">
			<div style="width: 100%; max-width: 400px; background: #fff; padding: 20px 30px; border-radius: 20px; margin: 0 auto;">
				<h2 style="font-weight: bolder;margin-top: 0px;">用户登录</h2>
				<div style="height: 20px;color:red;margin-bottom: 5px;" id="warningMsg"></div>
				<div class="input-group">
					<span class="input-group-addon"><span
						class="glyphicon glyphicon-user"></span></span> <input type="text"
						class="form-control" placeholder="请输入用户名" id="userName">
				</div>
				<br>
				<div class="input-group">
					<span class="input-group-addon"><span
						class="glyphicon glyphicon-lock"></span></span> <input type="password"
						class="form-control" placeholder="请输入密码，区分大小写" id="password">
				</div>
				<br>
				<!-- <div class="input-group">
					<span class="input-group-addon">
						<span class="glyphicon glyphicon-barcode"></span>
					</span>
					<input type="text" id="Txtidcode" class="form-control" 
					placeholder="区分大小写" style="width: 150px;">
					<label id="idcode" style="margin-top: 2px; margin-left: 10px;"></label>
					<a onclick="$.idcode.setCode()" style="padding-top: 10px; cursor: pointer;">点击更换</a>
				</div> -->
				<div style="margin-top: 20px;">
					<button type="button"
						class="btn btn-default btn-lg btn-info btn-block" id="butn"
						onclick="login();">登录</button>
				</div>
				<div style="margin-top: 10px;height: 20px;">
					没有账号？快去
					<a href="<c:url value='/user/index?to=add'/>" style="color:red;">免费注册</a>
					<a href="<c:url value='/user/index'/>" style="margin-left: 10px;">返回首页</a>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function login(){
		var userName = $("#userName").val();
		var password = $("#password").val();
		if(userName == ""){
			$("#warningMsg").text("请填写用户名!");
		}else if(password == ""){
			$("#warningMsg").text("请填写密码!");
		}else{
			$.ajax({
				url : "<c:url value='/user/fryLogin'/>?userName=" + userName + "&password=" + password,
				dataType : "json",
				success : function(data, textStatus) {
					if (data.returncode == '200') {
						window.location.href = '<c:url value="/user/index" />';
					} else if (data.returncode == '10000') {
						$("#warningMsg").text("用户名或密码错误!");
						$("#userName").val("");
						$("#password").val("");
					}
				},
				error : function() {
					showMsg('系统暂不可用，请稍后再试！');
				}
			});
		}
	}
	/* $.idcode.setCode(); //加载生成验证码方法 */
</script>
</html>