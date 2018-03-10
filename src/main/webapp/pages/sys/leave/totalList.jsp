<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>猛码学员请假统计</title>
<style>
#nextyear{
margin-left: 10px;
}
td{
	border:1px solid rgba(128, 128, 128, 0.27);
	height:40px;
	width:80px;
	text-align:center;
	vertical-align:middle;
}
tr{
	height:10%;
}
.tablelist{
	margin:auto;
	width:95%;
}
.search{
	margin-top:20px;
}
input{
 margin-top:30px;
 margin-bottom:30px;
}
#nextyear{
	margin-left:30px;
	margin-right:40px;
}
#timeBtn{
	margin-left:10px;
}
</style>
</head> 
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul">
		<li>
			<i class="fa fa-home"></i>
			<a href="#">猛码学员管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
			<li>
			<a href="#">请假管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">请假统计</a></li>
	</ul>
</div>
<form  action="CountQuery" name="form1" method="post">
    <div>
    	<input type="hidden" name="nowdate" value=""/>
    </div>
    <div class="rightinfo">
    	<div class="tools">
    		 <div id="search">
    			<input type="button" id="lastyear" class="sbtn sbtn-blue sbtn30"  value="上年"/>
    			<input type="button" id="nextyear" class="sbtn sbtn-blue sbtn30"  value="下年"/>
    			<span>日&nbsp;期&nbsp;：&nbsp;&nbsp;</span>
    			<input id="now" name="time"  style="width:10%;height:32px;text-align:center;" value="${time}"/>
    			<input type="button" value="查询" class="sbtn sbtn-blue sbtn30"  id="timeBtn"/>
    		</div> 
        	<table cellspacing="0" cellpadding="0"  class="tablelist">
           		<col width="72" />
           		<col width="72" span="12" />
           		<tr>
		             <td width="72">请假人员</td>
		             <td width="72" >一月</td>
		             <td width="72">二月</td>
		             <td width="72">三月</td>
		             <td width="72">四月</td>
		             <td width="72">五月</td>
		             <td width="72">六月</td>
		             <td width="72">七月</td>
		             <td width="72">八月</td>
		             <td width="72">九月</td>
		             <td width="72">十月</td>
		             <td width="72">十一月</td>
		             <td width="72">十二月</td>
		             <td width="72">合计(小时)</td>
           		</tr>
             	<c:forEach items="${leaveTotal}" var="leave">
	             	<tr>
	             		 <td width="72">${leave.leaveName }</td>
	             		 <td width="72">${leave.month1 }</td>
			             <td width="72">${leave.month2 }</td>
			             <td width="72">${leave.month3 }</td>
			             <td width="72">${leave.month4 }</td>
			             <td width="72">${leave.month5 }</td>
			             <td width="72">${leave.month6 }</td>
			             <td width="72">${leave.month7 }</td>
			             <td width="72">${leave.month8 }</td>
			             <td width="72">${leave.month9 }</td>
			             <td width="72">${leave.month10 }</td>
			             <td width="72">${leave.month11 }</td>
			             <td width="72">${leave.month12 }</td>
			             <td width="72">${leave.monthTotal }</td>
			        </tr>
             	</c:forEach>
       		</table>
  	 	</div>
    </div>
</form>
<script>
var myDate = new Date();
var myYear = myDate.getFullYear();
var time =$("#now").val();
$("#lastyear").click(function(){
	time=time - 1;
	$("#now").val(time);
	time=$("#now").val();
	window.location.href = '<c:url value="/leave/pageTotalList"/>?time='+time;  
});

$("#nextyear").click(function(){
	 if(time>myYear-1) {
		showMsg("不能查询今年以后的时间");
	}else{
		time++;
	}
	$("#now").val(time);
	time=$("#now").val();
	window.location.href = '<c:url value="/leave/pageTotalList"/>?time='+time;  
});
$("#timeBtn").click(function(){
	window.location.href = '<c:url value="/leave/pageTotalList"/>?time='+time;  
});
</script>
</body>
</html>
