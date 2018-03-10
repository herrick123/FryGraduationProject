<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>发现错误</title>
<%@ include file="/pages/inc/header.jsp" %>
</head>
<body>
<h1>Error：<%=request.getAttribute("error") %></h1>
</body>
</html>