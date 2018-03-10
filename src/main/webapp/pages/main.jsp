<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/pages/inc/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<style>
    html,body{
        width: 100%;
        height: 100%;
    }
    .mainindex{
        width: 95%;
        height: 80%;
        background: url("<%=path %>/img/marryNew/images/index_page.png") no-repeat center;
        background-size: contain;
    }
</style>
</head>
<body>
	<div class="place">
	    <span>位置：</span>
	    <ul class="placeul">
	    	<li><a href="#">首页</a></li>
	    </ul>
    </div>
    <div class="mainindex">
    </div>
</body>
</html>
