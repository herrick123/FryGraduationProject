<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.input-radius {
	border-radius: 5px !important;
}
</style>
<%@ include file="/pages/inc/header.jsp"%>
<!-- 前端校验框架 -->
<script type="text/javascript" src="<%=path%>/js/sysManage/quartz.js"></script>
<script type="text/javascript" src="<%=path%>/js/sysManage/editQuartz.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>编辑定时任务</title>
</head>
<body style="overflow: hidden;">
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">系统管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">定时任务管理</a><i class="fa fa-angle-right"></i></li>
			<li><a href="#">编辑定时任务</a></li>
		</ul>
	</div>
	<div class="content">
		<div class="row" style="margin-top:10px;">
			<!-- blue-hoki -->
			<div class="col-md-12">
				<!-- portlet light bordered -->
				<div class="portlet box blue-hoki ">
					<div class="portlet-body form">
						<form id="form1" class="form-horizontal" method="post"
							action="<c:url value='/quartz/update'/>">
							<input type="hidden"  name="id" id="qid" value='${quartzEntity.id}'/>
							<input type="hidden"  name="jobStatus" value='${quartzEntity.jobStatus}'/>
							<input type="hidden"  name="createTime" value='${quartzEntity.createTime}'/>
							<%-- <input type="hidden"  value="<c:out value='${quartzEntity.createId}' />" name="createId" id="createId" />
							<input type="hidden" class="form-control" value="<c:out value='${loginUser.userId }' />" name="updateId" id="updateId" /> --%>
							<div class="form-body">
								<div class="form-group">
									<label class="col-md-3 control-label">任务名称</label>
									<div class="col-md-3">
										<input type="text" class="form-control" placeholder="请输入任务名称"
											id="jobName" name="jobName" value="${quartzEntity.jobName}" 
											valid="r" validTitle="必填项" validInfoArea="show_jobName_area">
									</div>
									<div class="col-md-4 help-block" id="show_jobName_area"></div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">任务分组</label>
									<div class="col-md-3">
										<input type="text" class="form-control" placeholder="请输入任务分组"
											id="jobGroup" name="jobGroup" value="${quartzEntity.jobGroup}"
											valid="r" validTitle="必填项" validInfoArea="show_jobGroup_area">
									</div>
									<div class="col-md-4 help-block" id="show_jobGroup_area"></div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">任务全类名</label>
									<div class="col-md-3">
										<input type="text" class="form-control" placeholder="请输入任务分组" value="${quartzEntity.className}"
											id="className" name="className" valid="r" validTitle="必填项" validInfoArea="show_className_area">
									</div>
									<div class="col-md-4 help-block" id="show_className_area"></div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">定时设置</label>
									<div class="col-md-1">
										<select style="width: 90px;" name="cronType" id="cronType"
											class="form-control" onchange="changeExecuteParam();">
											<option value="1" <c:if test="${quartzEntity.cronType eq '1' }">selected="selected"</c:if>>每月</option>
											<option value="2" <c:if test="${quartzEntity.cronType eq '2' }">selected="selected"</c:if>>每周</option>
											<option value="3" <c:if test="${quartzEntity.cronType eq '3' }">selected="selected"</c:if>>每天</option>
											<option value="4" <c:if test="${quartzEntity.cronType eq '4' }">selected="selected"</c:if>>每几时</option>
											<option value="5" <c:if test="${quartzEntity.cronType eq '5' }">selected="selected"</c:if>>每几分</option>
											<option value="6" <c:if test="${quartzEntity.cronType eq '6' }">selected="selected"</c:if>>每几秒</option>
											<option value="7" <c:if test="${quartzEntity.cronType eq '7' }">selected="selected"</c:if>>指定时间</option>
										</select>
									</div>
									<div class="col-md-1" id="executeParamDiv4">
										<select style="width: 90px;" name="year" id="year"
											class="form-control">
											<option value="">年</option>
										</select>
									</div>
									<div class="col-md-1" id="executeParamDiv5">
										<select style="width: 90px;" name="month" id="month"
											class="form-control">
											<option value="">月</option>
										</select>
									</div>
									<div class="col-md-1" id="executeParamDiv2">
										<select style="width: 90px;" name="day" id="day"
											class="form-control">
											<%
												for (int i = 1; i <= 31; i++) {
											%>
											<option value="<%=i%>"><%=i%>日
											</option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-md-1" id="executeParamDiv3">
										<select style="width: 90px;" name="hour" id="hour"
											class="form-control">
											<%
												for (int i = 1; i <= 23; i++) {
											%>
											<option value="<%=i%>"><%=i%>时
											</option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-md-1" id="executeParamDiv6">
										<select style="width: 90px;" name="minute" id="minute"
											class="form-control">
											<option value="">分</option>
										</select>
									</div>
									<div class="col-md-1" id="executeParamDiv7">
										<select style="width: 90px;" name="second" id="second"
											class="form-control">
											<option value="">秒</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">描述信息</label>
									<div class="col-md-6">
										<textarea rows="3" name="desc" id="desc" class="form-control">${quartzEntity.desc}</textarea>
									</div>
								</div>
							</div>
							<div class="form-actions">
								<div class="row">
									<div class="col-md-offset-3 col-md-9">
										<button id="doSubmit" type="submit" class="sbtn sbtn-blue sbtn30">保存</button>
										<button type="button" class="sbtn sbtn-default sbtn30"
											onclick="javascript:location.href='<%=path%>/quartz/page';">取消</button>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(function() {
	changeExecuteParam();
	$("#year option[value='${quartzEntity.year}'").attr("selected","selected");
	$("#month option[value='${quartzEntity.month}'").attr("selected","selected");
	$("#day option[value='${quartzEntity.day}'").attr("selected","selected");
	$("#hour option[value='${quartzEntity.hour}'").attr("selected","selected");
	$("#minute option[value='${quartzEntity.minute}'").attr("selected","selected");
	$("#second option[value='${quartzEntity.second}'").attr("selected","selected");
});	
</script>
</html>