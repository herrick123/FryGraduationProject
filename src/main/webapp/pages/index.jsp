<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
    <meta name="author" content="">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%@include file="/pages/inc/header.jsp"%>
<%
	String pageId = (String) request.getParameter("pageId");
%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/index/left-nav.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/index/font-awesome.min.css" />
<script type="text/javascript" src="<%=path%>/js/index/app.js"></script>
<script type="text/javascript" src="<%=path%>/js/index/util.js"></script>
</head>
<body class="sodb_index_body">
	<div id="sodb-home-top" class="sodb_head">
		<!-- <div class="sodb-menu-icon">&nbsp;</div>  -->
		<div class="sodb-menu-top-right-area">
		<span class="sodb-menu-top-right-area-user">【${loginUser.employeeName}】，您好！</span>
		<span id="exitSys" class="sodb-menu-top-right-area-exit">退出</span>
	</div>
	</div>
	<aside id="left-panel" class="icon-not" > 
		<nav>
			<ul class="ms-yahei" id="leftNav">
				<c:if test="${loginUser.role eq 'S0001'}">
				<li class="sodb-left-menu">
					<a id="sys" style=" padding-left: 5px;" class="first-list" onclick="javascript:switchFrame(this);" menu-url="<%=path%>/user/manager"><i class="fa fa-lg fa-fw fa-table"></i> 
					<span class="menu-item-parent">首页</span></a>
				</li>
				</c:if>
				<c:if test="${loginUser.role eq 'S0002'}">
					<a id="sys" style=" padding-left: 5px;" class="first-list" onclick="javascript:switchFrame(this);" menu-url="<%=path%>/user/employee"><i class="fa fa-lg fa-fw fa-table"></i> 
					<span class="menu-item-parent">首页</span></a>
				</c:if>
				
				<c:forEach items="${modules }" var="g" varStatus="status">
				<li class="sodb-left-menu">
					<a id="sys" style=" padding-left: 5px;"><i class="fa fa-lg fa-fw fa-table"></i> 
					<span class="menu-item-parent">${g.key }</span></a>
					<ul>
						<c:forEach items="${g.value }" var="m">
							<li><a onclick="javascript:switchFrame(this);" menu-url=<c:url value='${m.moduleUrl}' />>${m.moduleName}</a></li>
			           	</c:forEach>
		           	</ul>
				</li>
		        </c:forEach>
		     </ul>
		</nav> 
		<span class="minifyme"> 
		<i class="fa fa-arrow-circle-left hit"></i>
		</span> 
	</aside>
	<div id="main" role="main" style="overflow-x: hidden;background-color: #dfdede;position:absolute;top:100px;width:100%;height:828px;">
		<iframe id="mainFrame" name="mainFrame" frameborder="0" style="width:100%;min-height:760px; max-height:780px;" src="#"></iframe>
	</div>
</body>
<style type="text/css">
	a{
		 cursor:pointer;
	}
    .modal-header{
        cursor: move;
        padding:8px;
        background : #fafafa;
    }
    .modal-body{
        padding-bottom:5px;
    }
    em.invalid{
        display:block;
        color:#A90329;
        font-style: normal;
    }
    input.required {
        /* 	background : url(img/input_bg.png) no-repeat scroll; */
        background-position:100% 0;
    }
    .selected-tr td{
        /*background :red;*/
    }
    /*.table-striped>tbody>tr:nth-child(odd)>td{background-color:#f9f9f9}*/
    .modal-header .close{
        font-size:28px;
    }
    .smart-form .input{
        font:13px/16px 'Open Sans', Helvetica, Arial, sans-serif;
    }
    .select2-drop .clearfix .col-sm-3{
        width : 100%;
    }
    .object-select{
        height:32px;
    }
    .select2-results{
        padding : 3px 0px 4px;
    }
    .form-menu .btn{
        padding:5px 15px;
        margin:1px 0px;
    }
    .tab-form-menu{
        height:40px;
    }
    .tab-form-menu a{
        padding:5px 10px;margin:5px 1px;
    }
    .right-side-bar{
        border:1px solid red;
        position:absolute;
        right:0px;
        top:100px;
        width:800px;
        height:600px;
    }
    .change-markup{
        color:red;
        border-bottom: 1px dashed red;
    }
    .ui-dialog{
        border-radius : 0px;
    }
    .ui-widget-header,.ui-dialog-title{
        font-weight:100 !important;
    }
    .dropzone{
        min-height: 180px;
    }

    nav > li > ul > li::before{
        width: 20px;
    }
</style>

<script type="text/javascript">
	$(function() {
		$("body").css("overflow-x","hidden");
		var height = document.body.clientHeight - 100;
		var height_frame = document.body.clientHeight;
		$("#main").css("min-height",height + "px");
		$("#mainFrame").css("min-height",height_frame + "px");
	})
	
	window.onresize = function(){
		if($("body").hasClass("minified")){
			 $('#mainFrame').css("width","98%");
		    }else{
		    	var width = window.innerWidth - 340;
		    	$('#mainFrame').css("width",width+"px");
		    }
	}
	
	setTimeout(function() {
			$("#index").addClass('active');
			$("#sys").trigger(
					"click");
			
		}, "100");

	function switchFrame(obj) {
		var url = $(obj).attr('menu-url');
		$("#mainFrame").attr("src", url);
		$('nav li.active').removeClass("active");
		$(obj).parent().addClass("active");	
	}
	
	
	
	$("#exitSys").click(function() {
		window.location.href = "/StudentMIS";
	})
	
	
	$("a").click(function() {
		$(this).next().children(":first").children(":first").trigger(
		"click");
	})
	
</script>


</html>