<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
.input-radius{
		border-radius: 5px !important;
	}
</style>
<%@ include file="/pages/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
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
			<a href="#">用户权限管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		
		<li>
			<a href="#">用户管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">新增用户</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="userForm" class="form-horizontal" id="userForm" action="<c:url value='/user/save' />" method="post">
		
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">登录名：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="userAccount" name="userAccount" placeholder="登录名" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">用户名：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="用户名" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">密码：</span>
				<div class="col-md-6">
					<input type="password" class="form-control" id="userPass" name="userPass" placeholder="密码" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">电话：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="telPhone" name="telPhone" placeholder="电话" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">工号：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="IDNO" name="iDNO" placeholder="工号" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">邮箱：</span>
				<div class="col-md-6">
					<input type="text" class="form-control" id="Email" name="email" placeholder="邮箱" aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">角色：</span>
				<div class="col-md-6">
					<select name="role" class="form-control">
				  		<c:forEach var="role" items="${roles }">
				  			<option value ="${role.roleId }">${role.roleName }</option>
				  		</c:forEach>
				  	</select>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">部门：</span>
				<div class="col-md-6">
					<select name="departmentId" id="departmentId" class="form-control" onchange="getName();">
				  		<c:forEach var="department" items="${departments }">
				  			<option value ="${department.id }">${department.name }</option>
				  		</c:forEach>
				  	</select>
				  	<input type="hidden" id="departmentName" name="departmentName" value="${departments[0].name }">
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">性别：</span>
				<div class="col-md-6">
					<input type="radio"  name="sex" value="1" checked="checked"/>男
			  		<input type="radio"  name="sex" value="0"/>女
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-4 control-label">负责人：</span>
				<div class="col-md-6">
					<input type="radio"  name="head" value="1" />是
			  		<input type="radio"  name="head" value="0" checked="checked"/>否
				</div>
			</div>
		</div>
		<div class="row form-group" style="margin-top:10px;">
			<div class="col-md-12 " style="text-align: center; margin-top:30px;">
				<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn" >提交</button>
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left:46px;">返回</button>
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
function getName() {
	var departmentName = $("#departmentId").find("option:selected").text();
	$("#departmentName").val(departmentName);
}

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
                    },
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
    	   var userAccount = $("#userAccount").val();
    	   var userName = $("#userName").val();
    	   $.ajax({
               type: "POST",
               dataType: "json",
               url: "<c:url value='/user/check' />",
               data: "userAccount="+userAccount+"&userName="+userName,
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