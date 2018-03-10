<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>猛码学员管理平台-登录</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Le favicon -->
	<link rel="stylesheet" href="<%=path %>/css/typica-login.css">
	<style>
		.login-form legend {
			font-size: 30px;
		}
	</style>
	<script type="text/javascript">
        if(window !=top){
            top.location.href=location.href;
        }
	</script>
</head>
<body onkeydown="KeyLogin()">
<div class="navbar navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<!--<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</a> <a class="brand" href="<%=path %>/pages/index.jsp" style="margin-top: 0px; margin-left: 0px;"><img src="<%=path %>/img/login/logo.png" alt="" style=""></a>-->
		</div>
	</div>
</div>
<div class="container">
	<div id="login-wraper">
		<form class="form login-form" id="loginForm" action="<c:url value = '/user/login'/>" method="post">
			<div class="login-title">猛码学员管理平台</div>
			<div class="login-content-info">
				<input class="login-content-info-text login-content-info-u" name = "userAccount" id = "userAccount" placeholder="请输入账号" type="text"/>
			</div>
			<div class="login-content-info" style="margin-bottom:5px">
				<input class="login-content-info-text login-content-info-p" name = "userPass" id = "userPass" placeholder="请输入密码" type="password"/>
			</div>
			<div class="error-message">
				<div class="errMsg" id="errMsg" style="color:red;">${loginMessage }</div>
			</div>
			<div class="login-button-area">
				<input type="button" id="loginBtn" value="登录" class="login-button-text" onclick="login()">
			</div>
			<div class="login-remind-area">
				<input type="checkbox" id="savePwd"/><label for="savePwd" style="cursor:pointer;">&nbsp;&nbsp;记住密码</label>
			</div>
		</form>
	</div>
</div>
<footer class="white navbar-fixed-bottom">
	猛码学员管理平台
</footer>
<script src="<%=path %>/js/backstretch.min.js"></script>

<script type="text/javascript">
    <%--jQuery(document).ready(function($) {--%>
        <%--$.backstretch([--%>
            <%--"<%=path %>/img/login/bg5.jpg"--%>
        <%--], {duration: 3000, fade: 750});--%>

    <%--});--%>

    function login(){
        if($("#userAccount").val() == ''){
            $("#errMsg").html("<span class='glyphicon glyphicon-exclamation-sign' style='font-size:13px'></span>&nbsp;请输入账号");
        } else if($("#userPass").val() == ''){
            $("#errMsg").html("<span class='glyphicon glyphicon-exclamation-sign' style='font-size:13px'></span>&nbsp;请输入密码");
        } else {
            loginForm.submit();
        }
    }
</script>
</body>
</html>