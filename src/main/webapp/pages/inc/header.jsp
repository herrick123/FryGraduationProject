<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	String path = request.getContextPath();
%>
<title>Fry</title>
<link rel="shortcut icon" href="<%=path %>/img/favicon.ico">
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/bootstrap-3.3.7/css/bootstrap-theme.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/bootstrap-3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/fontAwesome/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/grid/dlshouwen.grid.min.css" media="all"  />
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/validator/dlshouwen.validator.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/datePicker/skin/WdatePicker.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/pagebar.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/sodb.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/state.css" />


<script type="text/javascript" src="<%=path %>/extends/jquery/jquery.min.2.1.4.js"></script>
<script type="text/javascript" src="<%=path %>/extends/bootstrap-3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=path %>/extends/grid/dlshouwen.grid.js"></script>
<script type="text/javascript" src="<%=path %>/extends/grid/i18n/zh-cn.js"></script>
<script type="text/javascript" src="<%=path %>/extends/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path %>/extends/validator/dlshouwen.validator.min.js"></script>
<script type="text/javascript" src="<%=path %>/extends/validator/zh-cn.js"></script>
<script type="text/javascript" src="<%=path%>/extends/datePicker/WdatePicker.js"></script>
<script type="text/javascript" src="<%=path%>/extends/echarts.js"></script>
<script type="text/javascript" src="<%=path %>/js/time.js"></script>


<%@ include file="/pages/inc/modalDialog.jsp" %>