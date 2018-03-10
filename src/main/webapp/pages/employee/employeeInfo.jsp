<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>查看员工信息</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrapValidator.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/default.css" />
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/component.css" />
<script type="text/javascript" src="<%=path%>/js/modernizr.custom.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrapValidator.min.js"></script>
<style type="text/css">
span {
	color: #ooo;
}
</style>
</head>
<body style="color: black;">
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">员工管理系统</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">员工信息管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">录入员工信息</a></li>
		</ul>
	</div>
	<div class="content">
		<form name="employeeForm" class="form-horizontal" id="employeeForm"
			action="" method="post">
			<input type="hidden" name="id" id="id"
				value="<c:out value='${ employee.id}' />" />
			<!-- <div class="row form-group col-md-2" style="margin-top: 50px;">
				<div class="employeeImage"></div>
			</div> -->
			<div class="row form-group col-md-8" style="margin-top: 50px;">
				<div class="col-md-6" style="margin-top: 50px;">
					<div class="form-group">
						<span for="appName" class="col-sm-4 control-label">姓名：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="employeeName" name="employeeName" placeholder="请输入员工名称"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.employeeName}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span for="appName" class="col-sm-4 control-label">登录名：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="userAccount" name="userAccount" placeholder="请输入登录名"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.userAccount}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span for="appName" class="col-sm-4 control-label">登录密码：</span>
						<div class="col-md-8">
							<input type="password" class="form-control input-radius"
								id="userPass" name="userPass" placeholder="请输入登录密码"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.userPass}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span for="appName" class="col-sm-4 control-label">角色：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
									id="role" name="role"
									aria-describedby="sizing-addon2" required="required"
									value="<c:out value='${ employee.role}' />"
									readonly="readonly">
						</div>
					</div> 
					<div class="form-group">
						<span class="col-sm-4 control-label">出生日期：</span>
						<div class="col-md-8">
							<input type="text"
								class="calender-birthday form-control input-radius"
								id="birthday" name="birthday" placeholder="请输入出生日期"
								required="required"
								value="<fmt:formatDate value='${ employee.birthday}' pattern='yyyy-MM-dd'/>"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">民族：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius" id="nation"
								name="nation" 
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.nation}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">证件号码：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="identityNum" name="identityNum"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.identityNum}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">学历：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="education" name="education"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.education}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">紧急联系人：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="urgentPerson" name="urgentPerson"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.urgentPerson}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">紧急联系人电话：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="urgentPhone" name="urgentPhone"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.urgentPhone}' />"
								readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-md-6" style="margin-top: 50px;">
					<div class="form-group">
						<span class="col-sm-4 control-label">性别：</span>
						<div class="col-md-8">
							<c:choose>
								<c:when test="${employee.gender eq 1 }">
									<input type="radio" name="sex" checked="checked" value="1"
										readonly="readonly" />男
						  		<input type="radio" name="sex" value="0" readonly="readonly" />女
							</c:when>
								<c:otherwise>
									<input type="radio" name="sex" value="1" readonly="readonly" />男
						  		<input type="radio" name="sex" checked="checked" value="0"
										readonly="readonly" />女
							</c:otherwise>
							</c:choose>
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">学校名称：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="schoolName" name="schoolName"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.schoolName}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">专业：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius" id="major"
								name="major" 
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.major}' />" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">联系方式：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius" id="phone"
								name="phone"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.phone}' />" readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">家庭住址：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius" id="address"
								name="address"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.address}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">能力级别：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius" id="abilityLevel"
									name="abilityLevel"
									aria-describedby="sizing-addon2" required="required"
									value="<c:out value='${ employee.abilityLevel}' />"
									readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">所属分区：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
									id="areaName" name="areaName"
									aria-describedby="sizing-addon2" required="required"
									value="<c:out value='${ employee.areaId}' />"
									readonly="readonly">
						</div>
					</div> 
					<div class="form-group">
						<span class="col-sm-4 control-label">期数：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius" id="issueId"
										name="issueId"
										aria-describedby="sizing-addon2" required="required"
										value="<c:out value='${ employee.issueId}' />"
										readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">银行卡号：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="bankCard" name="bankCard"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.bankCard}' />"
								readonly="readonly">
						</div>
					</div>
					<div class="form-group">
						<span class="col-sm-4 control-label">掌握的技能：</span>
						<div class="col-md-8">
							<input type="text" class="form-control input-radius"
								id="skill" name="skill"
								aria-describedby="sizing-addon2" required="required"
								value="<c:out value='${ employee.skill}' />"
								readonly="readonly">
						</div>
					</div>
				</div>
				<div class="col-md-12" style="margin-top: 10px;margin-left: -142px;">
					<div class="form-group">
						<span class="col-sm-4 control-label">自我简介：</span>
						<div class="col-md-7">
							<textarea rows="10" cols="16" class="form-control"
								id="introduction" name="introduction"
								aria-describedby="sizing-addon2" readonly="readonly">
							<c:out value='${ employee.introduction}' />
							</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="row form-group col-md-4" style="margin-top: 50px;">
				<span class="control-label" style="margin-left: 20px;">成长历程：</span>
				<div style="width: 474px; height: auto; margin-left: 20px;">
					<ul class="cbp_tmtimeline">
						<li><time class="cbp_tmtime" datetime="2017-04-16 08:30">
							<span>${ train.startTime}</span> <span></span> </time>
							<div class="cbp_tmicon cbp_tmicon-phone"></div>
							<div class="cbp_tmlabel">
								<h4>猛码科技的培训课程内容</h4>
								<hr style="margin-top: 0px; margin-bottom: 0px;">
								<p style="margin-left: 0px;">
									<c:out value="${ train.course}"></c:out>
								</p>
							</div></li>
						<c:forEach var="employeeVo" items="${employeeVos }">
							<li><time class="cbp_tmtime" datetime="2017-04-16 08:30">
								<span>${ employeeVo.uploadTime}</span> <span></span> </time>
								<div class="cbp_tmicon cbp_tmicon-phone"></div>
								<div class="cbp_tmlabel">
									<h4>${ employeeVo.fileName}</h4>
									<hr style="margin-top: 0px; margin-bottom: 0px;">
									<p style="margin-left: 0px;">
										<c:out value="${ employeeVo.remark}"></c:out>
									</p>
								</div></li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="row form-group" style="margin-top: 10px;">
				<div class="col-md-12 "
					style="text-align: center; margin-top: 30px;">
					<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn"
						style="margin-left: 46px;">返回</button>
				</div>
			</div>
			<div style="height:20px;"></div>
		</form>
	</div>
</body>
<script type="text/javascript">
	/* 返回页面 */
	$("#backBtn").click(function() {
		window.location.href = '<c:url value="/employee/page" />';
	})
</script>
</html>