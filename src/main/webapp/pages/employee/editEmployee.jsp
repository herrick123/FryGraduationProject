<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑员工信息</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
    <script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
</head>
<body>
<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">员工管理系统</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">员工信息管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">录入员工信息</a></li>
		</ul>
	</div>
	<div class="content">
		<form name="employeeForm" class="form-horizontal" id="employeeForm" action="<c:url value='/employee/updataEmployee' />" method="post">
			<input type="hidden" name="id" id="id" value="<c:out value='${ employee.id}' />"/>
			<div class="row form-group col-md-2" style="margin-top: 50px;">
				<!-- <div class="employeeImage"></div> -->
			</div>
			<div class="row form-group col-md-5" style="margin-top: 50px;">
				<div class="form-group">
					<span for="appName" class="col-sm-4 control-label">姓名：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius"
							id="employeeName" name="employeeName" placeholder="请输入员工名称"
							aria-describedby="sizing-addon2" required="required" value="<c:out value='${ employee.employeeName}' />">
					</div>
				</div>
				<div class="form-group">
					<span for="appName" class="col-sm-4 control-label">登录名：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius"
							id="userAccount" name="userAccount" placeholder="请输入登录名"
							aria-describedby="sizing-addon2" required="required" value="<c:out value='${ employee.userAccount}' />">
					</div>
				</div>
				<div class="form-group">
					<span for="appName" class="col-sm-4 control-label">登录密码：</span>
					<div class="col-md-8">
						<input type="password" class="form-control input-radius"
							id="userPass" name="userPass" placeholder="请输入登录密码"
							aria-describedby="sizing-addon2" required="required" value="<c:out value='${ employee.userPass}' />" onchange="userPassChange();">
					</div>
				</div>
				<div class="form-group" id="reUserPassDiv" style="display: none">
					<span for="appName" class="col-sm-4 control-label">重新输入密码：</span>
					<div class="col-md-8">
						<input type="password" class="form-control input-radius"
							id="reUserPass" name="reUserPass" placeholder="请重新输入密码"
							aria-describedby="sizing-addon2" required="required">
					</div>
				</div>
				<div class="form-group">
					<span for="appName" class="col-sm-4 control-label">角色：</span>
					<div class="col-md-8">
						<c:forEach var="roleList" items="${roleList }">
				  			<input type="radio" 
				  			<c:if test="${ employee.role eq roleList.roleCode}">
				  				checked="checked"
				  			</c:if>
				  			name="role" value="${roleList.roleCode }"/>${roleList.roleName }&#12288;
				  		</c:forEach>
					</div>
				</div> 
				<div class="form-group">
					<span class="col-sm-4 control-label">性别：</span>
					<div class="col-md-8">
						<c:choose>
							<c:when test="${employee.gender eq 1 }">
								<input type="radio"  name="sex" checked="checked" value="1" />男&#12288;&#12288;
						  		<input type="radio"  name="sex"  value="0"/>女
							</c:when>
							<c:otherwise>
								<input type="radio"  name="sex"  value="1" />男&#12288;&#12288;
						  		<input type="radio"  name="sex"  checked="checked" value="0"/>女
							</c:otherwise>	
						</c:choose>
					</div>
				</div>
			    <div class="form-group">
					<span class="col-sm-4 control-label">出生日期：</span>
					<div class="col-md-8">
						<input type="text" class="calender-birthday form-control input-radius" id="birthday"
							name="birthday" placeholder="请输入出生日期" required="required" value="<fmt:formatDate value='${ employee.birthday}' pattern='yyyy-MM-dd'/>">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">民族：</span>
					<div class="col-md-8">
						<select name="nation" id="nations" class="form-control" onchange="getNation();">
					  		<c:forEach var="nation" items="${nations }">
					  			<option value ="${nation.valueCode }" 
					  			<c:if test="${ employee.nation eq nation.valueCode}">
					  				selected="selected"
					  			</c:if>
					  			>${nation.valueName }</option>
					  		</c:forEach>
					  	</select>
					  	<input type="hidden" id="nationInput" name="nationInput" value=""> 
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">证件号码：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius"
							id="identityNum" name="identityNum" placeholder="请输入证件号码"
							aria-describedby="sizing-addon2" required="required" value="<c:out value='${ employee.identityNum}' />">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">学历：</span>
					<div class="col-md-8">
						<select name="education" id="educations" class="form-control" onchange="getEducation();">
					  		<c:forEach var="education" items="${educations }">
					  			<option value ="${education.valueCode }"
					  			<c:if test="${ employee.education eq education.valueCode}">
					  				selected="selected"
					  			</c:if>
					  			>${education.valueName }</option>
					  		</c:forEach>
					  	</select>
					  	<input type="hidden" id="educationInput" name="educationInput" value=""> 
					</div>
				</div> 
			</div>
			<div class="row form-group col-md-5" style="margin-top: 50px;">
				<div class="form-group">
					<span class="col-sm-4 control-label">学校名称：</span>
					<div class="col-md-8">
						<select name="schoolName" id="schoolNames" class="form-control" onchange="getSchoolName();">
					  		<c:forEach var="schoolName" items="${schoolNames }">
					  			<option value ="${schoolName.valueCode }"
					  			<c:if test="${ employee.schoolName eq schoolName.valueCode}">
					  				selected="selected"
					  			</c:if>
					  			>${schoolName.valueName }</option>
					  		</c:forEach>
					  	</select>
					  	<input type="hidden" id="schoolNameInput" name="schoolNameInput" value="${schoolNames[0].valueName }">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">专业：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius" id="major"
							name="major" placeholder="请输入专业" aria-describedby="sizing-addon2"
							required="required" value="<c:out value='${ employee.major}' />">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">联系方式：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius" id="phone"
							name="phone" placeholder="请输入联系方式" aria-describedby="sizing-addon2"
							required="required" value="<c:out value='${ employee.phone}' />">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">家庭住址：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius" id="address"
							name="address" placeholder="请输入家庭住址" aria-describedby="sizing-addon2"
							required="required" value="<c:out value='${ employee.address}' />">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">银行卡号：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius" id="bankCard"
							name="bankCard" placeholder="请输入期数"
							aria-describedby="sizing-addon2" required="required"  value="<c:out value='${ employee.bankCard}' />">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">所属分区：</span>
					<div class="col-md-8">
						<select name="areaId" id="areaId" class="form-control" onchange="getArea();">
					  		<c:forEach var="area" items="${areas }">
					  			<option value ="${area.id }"
					  			<c:if test="${ employee.areaId eq area.id}">
					  				selected="selected"
					  			</c:if>
					  			>${area.areaName }</option>
					  		</c:forEach>
					  	</select>
					  	<input type="hidden" id="areaName" name="areaName">
					</div>
				</div> 
				<div class="form-group">
					<span class="col-sm-4 control-label">期数：</span>
					<div class="col-md-8" id="trainIssue">
						<select name="issueId" id="issueId" class="form-control" onchange="getIssue();">
				  			<c:forEach var="training" items="${trainingEntities }">
			  					<option value ="${training.id }"
			  					<c:if test="${ employee.issueId eq training.id}">
					  				selected="selected"
					  			</c:if>
			  					>${training.issue }</option>
				  			</c:forEach>
					  	</select>
					  	<input type="hidden" id="issueName" name="issueName" value="">  
					</div>
				</div> 
				<div class="form-group">
					<span class="col-sm-4 control-label">紧急联系人：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius"
							id="urgentPerson" name="urgentPerson" placeholder="请输入紧急联系人"
							aria-describedby="sizing-addon2" required="required" value="<c:out value='${ employee.urgentPerson}' />">
					</div>
				</div>
				<div class="form-group">
					<span class="col-sm-4 control-label">紧急联系人电话：</span>
					<div class="col-md-8">
						<input type="text" class="form-control input-radius"
							id="urgentPhone" name="urgentPhone" placeholder="请输入紧急联系人电话"
							aria-describedby="sizing-addon2" required="required" value="<c:out value='${ employee.urgentPhone}' />">
					</div>
				</div>  
			</div>  
			<div class="row form-group col-md-12" style="margin-top:10px;">
				<div class="form-group">
					<span class="col-sm-4 control-label">能力级别：</span>
					<div class="col-md-8">
			  			<c:forEach var="abilityLevel" items="${abilityLevels }">
			  				<input type="radio"
			  				<c:if test="${abilityLevel.valueCode eq employee.abilityLevel }">
			  					 checked="checked"
				  			</c:if> 
				  			name="abilityLevel" value="${abilityLevel.valueCode }"/>${abilityLevel.valueName }&#12288;
				  		</c:forEach>
					</div>
				</div>
			</div>
			<div class="row form-group col-md-12" style="margin-top:10px;">
				<div class="form-group">
					<span class="col-sm-4 control-label">掌握的技能：</span>
					<div class="col-md-8">
						<c:forEach var="skill" items="${skills }">
				  			<div class="col-md-2">
				  				<input type="checkbox" 
				  					<c:forEach var="skillList" items="${skillLists }">
					  					<c:if test="${skill.valueCode eq skillList }">
					  						checked="checked" 
					  					</c:if> 
					  				</c:forEach>
				  					 name="skill" value="${skill.valueCode }"/>${skill.valueName }
				  			</div>
				  		</c:forEach>
				  	</div>
				</div>
			</div>
			<div class="row form-group col-md-12" style="margin-top:10px;">
				<div class="form-group">
					<span class="col-sm-4 control-label">自我简介：</span>
					<div class="col-md-7">
						<textarea rows="10" cols="16" class="form-control" id="introduction" name="introduction" 
						placeholder="自我简介" aria-describedby="sizing-addon2" >
						<c:out value='${ employee.introduction}' />
						</textarea>
					</div>
				</div>
			</div>
			<div class="row form-group" style="margin-top:10px; ">
				<div class="col-md-12 " style="text-align: center; margin-top:30px;">
					<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn" >提交</button>
					<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left:46px;">返回</button>
				</div>
			</div>
		</form>
	</div>
	<div style="height:20px;"></div>
</body>
<script type="text/javascript">
/* 如果修改了密码，则显示重新输入密码框 */
function userPassChange(){
	$("#reUserPassDiv").css("display","block");
}

/* 获取分区列表 */
function getArea() {
	var areaName = $("#areaId").find("option:selected").text();
	$("#areaName").val(areaName);
	var areaId =$("#areaId").find("option:selected").val();
	   var html ='';
	   $.ajax({
	    type: "POST",
	    dataType: "json",
	    url: "<c:url value='/employee/getIssue' />",
	    data: "areaId="+areaId,
	    success : function(Data, textStatus) {
	    	console.log("areaId"+areaId);
	     var issue = Data.trainingEntities;
	     if(textStatus == 'success'){
		   html ='<select name="issueId" id="issueId" class="form-control" onchange="'+getIssue()+'">';
				   for(var i=0;i<issue.length;i++){
					  html += '<option value ="'+ issue[i].id +'">'+ issue[i].issue +'</option>';
				   }
	       html += '</select>';
	       html += '<input type="hidden" id="issueName" name="issueName" value=""> ';
		   $("#trainIssue").html(html);
	     }else{
	     	showMsg('失败！请联系开发人员！');
	     }
	    },
	    error: function(data) {
	    	showMsg("服务器异常，稍后尝试");
	    }
	   });
	
}

/* 通过获取的分区来获取期数*/
function getIssue() {
	var issueName = $("#issueId").find("option:selected").text();
	$("#issueName").val(issueName);
}

/* 获取民族 */
function getNation(){
	var nationName = $("#nations").find("option:selected").text();
	$("#nationInput").val(nationName);
}

/* 获取学历  */
function getEducation(){
	var educationName = $("#educations").find("option:selected").text();
	$("#educationInput").val(educationName);
}

/* 获取学校 */
function getSchoolName(){
	var schoolName = $("#schoolNames").find("option:selected").text();
	$("#schoolNameInput").val(schoolName);
}

/* 返回页面 */
$("#backBtn").click(function(){
	window.location.href = '<c:url value="/employee/page" />';
})

$(function () {
    $('#employeeForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            identityNum: {
            	validators: {
                    notEmpty: {
                        message: '身份证号不能为空'
                    },
                    stringLength: {
                        min: 18,
                        max: 18,
                        message: '密码长度必须18位之间'
                    }
                }
            },
            userPass: {
                validators: {
                	notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 6,
                        max: 10,
                        message: '密码长度必须6-10位之间'
                    },
                    identical: {
                        field: 'reUserPass',
                        message: '两次输入的密码不相符'
                    }
                }
            },
            reUserPass: {
                validators: {
                    identical: {
                        field: 'userPass',
                        message: '两次输入的密码不相符'
                    }
                }
            }, 
            bankCard: {
            	validators: {
                    notEmpty: {
                        message: '银行卡号不能为空'
                    },
                    stringLength: {
                        min: 16,
                        max: 19,
                        message: '密码长度必须在16到19位之间'
                    },
                    regexp: {
                        regexp: /^\d$/,
                        message: '请输入正确的银行卡号'
                    }
                }
            },
            phone: {
            	validators: {
                	notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '请输入11位手机号码'
                    },
                    regexp: {
                        regexp: /^1[3|5|8|7]{1}[0-9]{9}$/,
                        message: '请输入正确的手机号码'
                    }
                }
            },
            urgentPhone: {
                validators: {
                	notEmpty: {
                        message: '手机号码不能为空'
                    },
                    stringLength: {
                        min: 11,
                        max: 11,
                        message: '请输入11位手机号码'
                    },
                    regexp: {
                        regexp: /^1[3|5|8|7]{1}[0-9]{9}$/,
                        message: '请输入正确的手机号码'
                    }
                }
            }
        }
    });
    $("#employeeForm").submit(function(ev){ev.preventDefault();});
    $("#subBtn").on("click", function(){
       var bootstrapValidator = $("#employeeForm").data('bootstrapValidator');
       bootstrapValidator.validate();
       if(bootstrapValidator.isValid()){
    	   var appName = $("#employeeForm").val();
    	   $.ajax({
               type: "POST",
               dataType: "json",
               url: "<c:url value='/employee/check' />",
               data:"name="+appName,
               success : function(Data, textStatus) {
        			if(Data.returncode == '10000'){	
        				showMsg(Data.info);
        			}else if(Data.returncode == '200'){
        				document.getElementById("employeeForm").submit();
        			}else{
        				showMsg('员工添加失败！请联系开发人员！');
        			}
        		},
               error: function(data) {
                   showMsg("服务器异常，稍后尝试");
                }
           });

       }else{
    	   return;
   		}
    }); 
})

</script>
</html>