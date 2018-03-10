<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详情</title>
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
			<a href="#">青岛机场安全管理</a> 
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">用户管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">用户详情</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="userForm" class="form-horizontal" id="userForm" action="<c:url value='/user/update' />" method="post">
		<input type="hidden" name="userId" id="userId" value="<c:out value='${ user.userId}' />"/>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">登录名：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="userAccount"  name="userAccount" value="<c:out value='${user.userAccount }'/>" readonly="readonly" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">用户名：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="userName" name="userName" value="<c:out value='${user.userName }'/>" readonly="readonly" placeholder="用户名" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<%-- <div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">密码：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="userPass" name="userPass" value="<c:out value='${user.userPass }'/>" readonly="readonly" placeholder="密码" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div> --%>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">电话：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="telPhone" readonly="readonly" name="telPhone" value="<c:out value='${user.telPhone }'/>" placeholder="电话" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">工号：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="IDNO" name="iDNO" readonly="readonly" placeholder="工号" value="<c:out value='${user.IDNO }'/>" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">邮箱：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="Email" name="email" readonly="readonly" value="<c:out value='${user.email }'/>" placeholder="邮箱" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">角色：</span>
				<div class="col-md-6">
					<c:forEach var="role" items="${roles }">
			  			<c:choose>
			  				<c:when test="${role.roleId == user.role }">
			  					<input type="text" class="form-control" readonly="readonly" value="<c:out value='${role.roleName }'/>" />
			  				</c:when>
			  			</c:choose>
				  	</c:forEach>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">部门：</span>
				<div class="col-md-6">
					<c:forEach var="department" items="${departments }">
				  			<c:choose>
				  				<c:when test="${department.id == user.departmentId }">
									<input type="text" class="form-control" readonly="readonly" value="<c:out value='${department.name }'/>" />
				  				</c:when>
				  			</c:choose>
				  		</c:forEach>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">性别：</span>
				<div class="col-md-6">
				<c:choose>
					<c:when test="${user.sex eq 1 }">
						<input type="text" class="form-control"  name="sex" readonly="readonly" value="男" />
					</c:when>
					<c:otherwise>
						<input type="text" class="form-control"  name="sex" readonly="readonly" value="女" />
					</c:otherwise>	
				</c:choose>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">负责人：</span>
				<div class="col-md-6">
					<c:choose>
						<c:when test="${user.head eq 1 }">
							<input type="text" class="form-control"  name="head" readonly="readonly" value="是" />
						</c:when>
						<c:otherwise>
							<input type="text" class="form-control"  name="sex" readonly="readonly" value="否" />
						</c:otherwise>	
					</c:choose>
				</div>
			</div>
		</div>
		<div class="row form-group" style="margin-top:10px;">
			<div class="col-md-10 " style="text-align: center; margin-top:30px;">
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left:46px;">返回</button>
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
$("#departmentId").change(function(){
	var departmentName = $("#departmentId").find("option:selected").text();
	$("#departmentName").val(departmentName);
}) 
/* function getName() {
	var departmentName = $("#departmentId").find("option:selected").text();
	$("#departmentName").val(departmentName);
}  */
$("#backBtn").click(function(){
	window.location.href = '<c:url value="/user/page" />';
})

$(function () {
    $('#userForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	userName: {
                validators: {
                	notEmpty: {
                        message: '用户名不能为空'
                    }
                }
            },
            iDNO: {
                validators: {
                	notEmpty: {
                        message: '工号不能为空'
                    }
                }
            },
            userAccount: {
                message: '登录名验证失败',
                validators: {
                    notEmpty: {
                        message: '登录名不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 18,
                        message: '登录名长度必须在3到18位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9_]+$/,
                        message: '用户名只能包含大写、小写、数字和下划线'
                    }
                }
            },
            email: {
                validators: {
                	notEmpty: {
                        message: '邮箱不能为空'
                    },
                    emailAddress: {
                        message: '邮箱地址格式有误'
                    }
                }
            },
            userPass: {
            	validators: {
                    notEmpty: {
                        message: '密码不能为空'
                    },
                    stringLength: {
                        min: 3,
                        max: 18,
                        message: '密码长度必须在3到18位之间'
                    }
                    
                }
            },
            telPhone: {
                message: '手机验证失败',
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
    $("#userForm").submit(function(ev){ev.preventDefault();});
    $("#subBtn").on("click", function(){
       var bootstrapValidator = $("#userForm").data('bootstrapValidator');
       bootstrapValidator.validate();
       if(bootstrapValidator.isValid()){
    	   var userId =$("#userId").val();
    	   var userAccount = $("#userAccount").val();
    	   var userName = $("#userName").val();
    	   $.ajax({
               type: "POST",
               dataType: "json",
               url: "<c:url value='/user/check' />",
               data: "userId="+userId+"&userAccount="+userAccount+"&userName="+userName,
               success : function(Data, textStatus) {
        			if(Data.returncode == '10000'){	
        				showMsg(Data.info);
        			}else if(Data.returncode == '200'){
        				document.getElementById("userForm").submit();
        			}else{
        				showMsg('用户添加失败！请联系开发人员！');
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
}); 

</script>
</html>