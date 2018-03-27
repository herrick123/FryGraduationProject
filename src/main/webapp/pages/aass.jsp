<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<title>凡客</title>
<meta name="" content=""/>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/indexII.css" />
<link type="text/css" href="<%=path%>/css/base.css" rel="stylesheet" /> 
<script src="jquery-1.7.2.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=path%>/js/indexII.js" type="text/javascript" charset="utf-8"></script>
<style type="text/css">
li{float:left;list-style:none;}
</style>
</head>
<body style="overflow-x: hidden;">
			<h1>今日推荐</h1>
			<ul class="subs"  >
			<c:forEach var="commodityEntitiss" items="${commodityEntitis}"  >
				<li style="margin-left: 10px">
					<img style="width: 232px;height: 232px;"  src="<c:url value="/${commodityEntitiss.productPicture}" />" alt=""/>
					<div class="clearfix iteminfo_parameter lh32" style="margin-left: -7%">
						<a  onclick="commodityMessage('${commodityEntitiss.uuid}')" id= "okss" style="font-family: Microsoft Yahei;font-weight: bold;cursor: pointer;" >
							${commodityEntitiss.commodityName}  &  ${commodityEntitiss.commodityNumber}
						</a>
						<%-- <span style="font-family: Microsoft Yahei;font-weight: bold;">&</span>
						<a onclick="commodityMessage('${commodityEntitiss.uuid}')"  style="font-family: Microsoft Yahei;font-weight: bold;cursor: pointer;" >
							${commodityEntitiss.commodityNumber}
						</a> --%>
					</div>  
					<div class="clearfix iteminfo_parameter lh32" style="margin-left: 5%">
						<span id="ok" class="iteminfo_price">¥<b class="sys_item_price">
							${commodityEntitiss.price}
						</b></span>
					</div>
				</li>
			</c:forEach>
			</ul>
</body>
<script type="text/javascript">
function asd(){
	alert("11");
}
function commodityMessage(uuid){
	/* var index = $(e).index();
	alert(index);
	var uuid = $(".comoodityUuid").eq(index).val();
	alert(uuid); */
	window.location.href = '<c:url value="/commodity/commodityMessage/" />' + uuid;
}
</script>
</html>