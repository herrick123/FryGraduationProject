<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%@include file="/pages/inc/header.jsp"%>
<%
    String pageId = (String) request.getParameter("pageId");
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/index/font-awesome.min.css" />
<style type="text/css">

</style>

<script type="text/javascript" src="<%=path%>/js/index/app.js"></script>
<script type="text/javascript" src="<%=path%>/js/index/util.js"></script>
</head>
<body class="sodb_index_body" style="background-color: red;!important">
	<div style="width:270px;">
		<div class="sodb-menu-icon" style="background-color:#272B3A;"></div>
	</div>
	<div id="sodb-home-top" class="sodb_head">
		<div class="sodb-menu-context">
			<div class="sodb-menu-context-list sodb-menu-bk" 
				onclick="javascript:switchFrame(this);" menu-url="<%=path%>/commodity/pages">
				<div class="sodb-menu-context-top sodb-menu-context-top-home">&nbsp;</div>
				<div class="sodb-menu-context-bottom">箱包货源</div>
			</div>
			<div class="sodb-menu-context-list "
				onclick="javascript:switchFrame(this);" menu-url="<%=path%>/commodity/pageFirmList">
				<div class="sodb-menu-context-top sodb-menu-context-top-situation">&nbsp;</div>
				<div class="sodb-menu-context-bottom">网供列表</div>
			</div>
			<div class="sodb-menu-context-list"
				onclick="javascript:switchFrame(this);" menu-url="<%=path%>/pages/aass.jsp">
				<div class="sodb-menu-context-top sodb-menu-context-top-data">&nbsp;</div>
				<div class="sodb-menu-context-bottom">代发服务</div>
			</div>
			<c:if test="${empty loginUser}">
				<div class="sodb-menu-context-list"
					onclick="javascript:switchFrame(this);" menu-url="<%=path%>/user/add">
					<div class="sodb-menu-context-top sodb-menu-context-top-register">&nbsp;</div>
					<div class="sodb-menu-context-bottom">注册</div>
				</div>
			</c:if>
			<c:if test="${!empty loginUser}">
				<div class="sodb-menu-context-list" left-menu="menu-manage">
					<div class="sodb-menu-context-top sodb-menu-context-top-resources">&nbsp;</div>
					<div class="sodb-menu-context-bottom">管理中心</div>
				</div>
			</c:if>
		</div>
		<c:if test="${!empty loginUser}">
			<div class="sodb-menu-top-right-area">
				<span class="sodb-menu-top-right-area-user">${loginUser.userName}，您好！</span> <span
					id="exitSys" class="sodb-menu-top-right-area-exit">退出</span>
			</div>
		</c:if>
		<c:if test="${empty loginUser}">
			<div class="sodb-menu-top-right-area">
				<span class="sodb-menu-top-right-area-user" id="login" style="cursor: pointer;">登录</span>
			</div>
		</c:if>
	</div>
	<div id="sodb-index-area" class="sodb-index-home" style=" height:auto;background-color: white;!important">
	    <iframe id="homeIframe" src="<%=path %>/commodity/pages" style="width:100%;border:0px;overflow-x: hidden;overflow-y:hidden;height:auto;margin-left:4%;scrolling : no"></iframe>
	</div> 
	<div id="sodb-context-area" style="display: none;">
		<aside id="left-panel" class="icon-not"> 
		<nav>
			<ul id="menu-manage" class="menu-area">
				<!-- 管理员 start-->
				<c:if test="${loginUser.role == 0 }">
					<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/user/page">
						<i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">用户管理</span></a>
					</li>
				</c:if>	
				<!-- 管理员 end-->
				<!-- 淘宝店家  start-->
				<c:if test="${loginUser.role == 1 }">
					<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>">
						<i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">图片包</span></a>
					</li>
					<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>">
						<i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">订单管理</span></a>
					</li>	
				</c:if>	
				<!-- 淘宝店家 end -->
				<!-- 供货厂家  start-->
				<c:if test="${loginUser.role == 2 }">
					<%-- <li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/commodity/page">
						<i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">产品列表</span></a>
					</li> --%>
					<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/commodity/page"><i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">产品管理</span></a>
					<ul>
						<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/commodity/page">产品列表</a></li>
						<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/commodity/addCommodity">上传压缩包</a></li>
					</ul>
				</li>

					
				</c:if>	
				<!-- 供货厂家 end -->
				<!-- 代发厂家 start-->
				<c:if test="${loginUser.role == 3 }">
					<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>">
						<i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">代发管理</span></a>
					</li>	
				</c:if>	
				<!-- 代发厂家 end -->
				<li><a><i class="fa fa-lg fa-fw fa-table"></i><span class="menu-item-parent">资料管理</span></a>
					<ul>
						<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/user/edit">个人资料</a></li>
						<li><a onclick="javascript:switchFrame(this);" menu-url="<%=path%>/user/editPassword">修改密码</a></li>
					</ul>
				</li>
			</ul>
		</nav> 
		</aside>
		<div id="main" role="main"
			style="overflow-x: hidden; background-color: #dfdede; position: absolute; top: 100px; width: 100%;">
			<iframe id="mainFrame" name="mainFrame" frameborder="0"
				style="width: 83%;" src="#"></iframe>
		</div>
	</div>
	<input type="hidden" value="${to }" id="to"/>
</body>
<style type="text/css">
a {
	cursor: pointer;
}

.modal-header {
	cursor: move;
	padding: 8px;
	background: #fafafa;
}

.modal-body {
	padding-bottom: 5px;
}

em.invalid {
	display: block;
	color: #A90329;
	font-style: normal;
}

input.required {
	/* 	background : url(img/input_bg.png) no-repeat scroll; */
	background-position: 100% 0;
}

.selected-tr td {
	/*background :red;*/
	
}
/*.table-striped>tbody>tr:nth-child(odd)>td{background-color:#f9f9f9}*/
.modal-header .close {
	font-size: 28px;
}

.smart-form .input {
	font: 13px/16px 'Open Sans', Helvetica, Arial, sans-serif;
}

.select2-drop .clearfix .col-sm-3 {
	width: 100%;
}

.object-select {
	height: 32px;
}

.select2-results {
	padding: 3px 0px 4px;
}

.form-menu .btn {
	padding: 5px 15px;
	margin: 1px 0px;
}

.tab-form-menu {
	height: 40px;
}

.tab-form-menu a {
	padding: 5px 10px;
	margin: 5px 1px;
}

.right-side-bar {
	border: 1px solid red;
	position: absolute;
	right: 0px;
	top: 100px;
	width: 800px;
	height: 600px;
}

.change-markup {
	color: red;
	border-bottom: 1px dashed red;
}

.ui-dialog {
	border-radius: 0px;
}

.ui-widget-header, .ui-dialog-title {
	font-weight: 100 !important;
}

.dropzone {
	min-height: 180px;
}

nav>li>ul>li::before {
	width: 20px;
}

</style>

<script type="text/javascript">
	//登录按钮
	$("#login").click(function() {
		window.location.href = "<c:url value='/pages/fryLogin.jsp'/>";
	})
	//退出按钮
	$("#exitSys").click(function() {
		$.ajax({
			url : "<c:url value='/user/fryLogout'/>",
			dataType : "json",
			success : function(data, textStatus) {
				if (data.returncode == '200') {
					window.location.href = "<c:url value='/user/index'/>";
				} else if (data.returncode == '10000') {
					showMsg('注销失败!');
				}
			},
			error : function() {
				showMsg('系统暂不可用，请稍后再试！');
			}
		});
	})
	var curIframe = "homeIframe";
	$(function() {
		$(window).scrollTop(0);
		$("body").css("overflow-x", "hidden");
		//$(document).height()
		var minHeight = window.screen.height - 100;
		$("#homeIframe").css("min-height", minHeight);
		window.setInterval("reinitIframe()", 200);
		if($("#to").val() == "add"){
			$(".sodb-menu-context-list").eq(3).click();
		}
	})
	//点击头部菜单触发
	$(".sodb-menu-context-list").click(function(){
	    $(this).siblings().removeClass("sodb-menu-bk");
	    $(this).addClass('sodb-menu-bk');
	    var leftMenu = $(this).attr('left-menu');
	    if(leftMenu == 'menu-manage'){
	    	curIframe = "mainFrame";
	    	$("#sodb-index-area").hide();
	    	$("#sodb-context-area").show();
 	        $("#" + leftMenu).show();
	    	$("#" + leftMenu).children(":first").children(":first").trigger("click");
	    	//重新调整宽度
	    	var width = window.innerWidth - 265;
	    	$('#' + curIframe).css("width",width + "px");
	    } 
	    else{
	    	curIframe = "homeIframe";
	    	$("#sodb-index-area").show();
	    	$("#sodb-context-area").hide();
	    	reinitIframe();
	    }
	})
	//点击菜单栏触发
	function switchFrame(obj) {
		var url = $(obj).attr('menu-url');
		$("#" + curIframe).attr("src", url);
		if(curIframe == "mainFrame"){
			$('nav li.active').removeClass("active");
			$(obj).parent().addClass("active");
			//根据菜单栏高度，重新设定高度
			setTimeout(setHeight,300);
		}
	}
	//重新设定右侧iframe框的高度
	function setHeight(){
		var menu_height = $("#left-panel").height();
		var height = document.body.clientHeight - 100;
		if(menu_height >= height){
			var setHeight = menu_height+50;		
			$("#main").css("min-height", setHeight + "px");
			$("#mainFrame").css("min-height", setHeight + "px");
		} else {
			$("#main").css("min-height", height + "px");
			$("#mainFrame").css("min-height", height + "px");
		}
	}
	//设置首页iframe的高度
	function reinitIframe(){
		var iframe = document.getElementById("homeIframe");
		//获取iframe框内容页面的高度
		var height = iframe.contentWindow.document.documentElement.offsetHeight;
		var minHeight = window.screen.height - 100;
		if(height < minHeight){
			height = minHeight;
		}
		iframe.style.height = height + "px";
	}
</script>

</html>