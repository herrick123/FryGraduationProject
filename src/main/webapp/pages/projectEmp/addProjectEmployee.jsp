<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header_jstree.jsp" %>
	<%@ include file="/pages/inc/delModal.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增高校</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
    <script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
    <script src="<%=path %>/js/tree/layout.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=path%>/js/laydate.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>
    <style type="text/css">
        .input-radius{
            border-radius: 5px !important;
        }
    </style>
</head>
<body style="overflow: hidden; ">
	<div class="sodb-page-home">
    	<ul class="sodb-page-ul">
        	<li>
            	<i class="fa fa-home"></i>
            	<a href="#">猛码学员管理系统</a>
            	<i class="fa fa-angle-right"></i>
        	</li>
        	<li>
            	<a href="#">项目管理</a><i class="fa fa-angle-right"></i>
        	</li>
        	<li>
            	<a href="#">添加学员项目评语</a>
        	</li>
    	</ul>
	</div>
	<form name="ProjectEmoloyeeForm" class="form-horizontal" id="ProjectEmoloyeeForm" action="<c:url value='/proEmp/save' />" method="post">
    	<div class="row" style="margin-top: 50px;">
        	<div class="form-group" style="margin-top: 30px;margin-left: 238px;">
            	<span class="col-sm-4 control-label">项目名称：${projectName }</span>
            	<div class="col-md-4">
            	<!-- 项目名字 -->
            		<input type="hidden" id="projectName" value="${projectName}">
            	<!-- 评价id -->
            		<input type="hidden"  id="id" name="id" value="${id}">
            	<!-- 项目id -->
                	<input type="hidden"  id="projectId" name="projectId" value="${projectId}">
                <!-- 成员id -->
                	<input type="hidden"  id="employeeId" name="employeeId" value="${employeeId}">
            	</div>
        	</div>
			<div class="form-group">
				<span class="col-sm-4 control-label" style="margin-left: 265px;">请根据此项目采用的技术为学员选择掌握的技能标签：</span><br>
				<div class="col-md-8" style="margin-left: 440px;margin-top: 10px;">
					<c:forEach var="skill" items="${skills }">
						<div class="col-md-2">
			  				<input type="checkbox"  name="skill" value="${skill.valueCode }"/>${skill.valueName }
			  			</div>
			  		</c:forEach>
			  	</div>
			</div>
        	<br>
        	<div class="form-group" style="margin-top: -10px">
            	<span  class="col-sm-4 control-label">综合评语：</span>
            	<div class="col-md-4">
            	<textarea rows="10" cols="50px" class="form-control input-radius" id="judge" name="judge"  placeholder="请输入评语内容" aria-describedby="sizing-addon2"></textarea>
            	</div>
        	</div>
        	<br>
			
    	</div>
    	<div class="row" style="margin-top: 20px;">
        	<div class="col-md-12" style="text-align: center;">
        		<input type="submit" class="sbtn sbtn-blue sbtn30"  value="保存">
            	<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left: 45px;">返回</button>
        	</div>
    	</div>
	</form>
	<script type="text/javascript">
	 $("#backBtn").click(function() {
		 var projectId=$("#projectId").val();
		 var projectName=$("#projectName").val();
		 window.location.href = '<c:url value="/proEmp/page" />/?id='+projectId+'&projectName='+projectName;
	    })
	
	
	</script>
</body>
</html>