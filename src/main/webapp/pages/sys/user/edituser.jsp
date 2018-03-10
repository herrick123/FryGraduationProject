<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>

<script src="<%=path %>/extends/jstree/dist/jstree.min.js" type="text/javascript"></script>
<script src="<%=path %>/js/tree/metronic.js" type="text/javascript"></script>
<script src="<%=path %>/js/tree/layout.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=path %>/extends/jstree/dist/themes/default/style.min.css" />
<link href="<%=path %>/css/tree/devicecomponents.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="<%=path %>/css/tree/treecustom.css" rel="stylesheet" type="text/css"/>
 
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新用户</title>
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
			<a href="#">系统管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">用户管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">编辑用户</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="userForm" class="form-horizontal" id="userForm" action="<c:url value='/user/update' />" method="post">
		<input type="hidden" name="userId" id="userId" value="<c:out value='${ user.userId}' />"/>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-3 control-label">登录名：</span>
					<div class="col-md-5" >
						<input type="text" class="form-control" id="userAccount" name="userAccount" 
					 value="<c:out value='${user.userAccount }'/>" readonly="readonly">
					</div>
				<div class="col-md-4 help-block" id="show_userAccount_area"></div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">用户名：</span>
				<div class="col-md-5">
					<input type="text" class="form-control" id="userName" name="userName" placeholder="用户名"
					valid="r" validTitle="必填项" validInfoArea="show_userName_area" value="<c:out value='${user.userName }'/>">
				</div>
				<div class="col-md-4 help-block" id="show_userName_area"></div>
			</div>
		</div>
		 <div class="row form-group col-md-6" style="margin-top:10px;display: none;">
			<div class="form-group">
				<span  class="col-sm-3 control-label">密码：</span>
				<div class="col-md-5">
					<input type="password" class="form-control" id="userPass"  name="userPass" value="******" placeholder="密码" 
					valid="r|l3-le18" validTitle="必填项" validInfoArea="show_userPass_area">
				</div>
				<div class="col-md-4 help-block" id="show_userPass_area"></div>
			</div>
		</div> 
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">电话：</span>
				<div class="col-md-5">
					<input type="text" class="form-control" id="telPhone" name="telPhone" value="<c:out value='${user.telPhone }'/>" placeholder="电话"
					valid="r|mobile" validTitle="电话" validInfoArea="show_telPhone_area">
				</div>
				<div class="col-md-4 help-block" id="show_telPhone_area"></div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">工号：</span>
				<div class="col-md-5">
					<input type="text" class="form-control" id="IDNO" name="iDNO" value="<c:out value='${user.IDNO }'/>" placeholder="工号"
					valid="r|" validTitle="必填项" validInfoArea="show_IDNO_area">
				</div>
				<div class="col-md-4 help-block" id="show_IDNO_area"></div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">邮箱：</span>
				<div class="col-md-5">
					<input type="text" class="form-control" id="Email" name="email" value="<c:out value='${user.email }'/>" placeholder="邮箱"
					valid="r|email" validTitle="必填项" validInfoArea="show_email_area">
				</div>
				<div class="col-md-4 help-block" id="show_email_area"></div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">角色：</span>
				<div class="col-md-5">
					<select name="role" class="form-control">
				  		<c:forEach var="role" items="${roles }">
				  			<c:choose>
				  				<c:when test="${role.roleId == user.role }">
				  					<option value ="${role.roleId }" selected="selected" >${role.roleName }</option>
				  				</c:when>
				  				<c:otherwise>
				  					<option value ="${role.roleId }" >${role.roleName }</option>
				  				</c:otherwise>
				  			</c:choose>
				  		</c:forEach>
				  	</select>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">性别：</span>
				<div class="col-md-5">
				<c:choose>
					<c:when test="${user.sex eq 1 }">
						<input type="radio"  name="sex" checked="checked" value="1" />男
				  		<input type="radio"  name="sex"  value="0"/>女
					</c:when>
					<c:otherwise>
						<input type="radio"  name="sex"  value="1" />男
				  		<input type="radio"  name="sex"  checked="checked" value="0"/>女
					</c:otherwise>	
				</c:choose>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">负责人：</span>
				<div class="col-md-5">
					<c:choose>
						<c:when test="${user.head eq 1 }">
							<input type="radio"  name="head" checked="checked" value="1" />是
				  			<input type="radio"  name="head" value="0" />否
						</c:when>
						<c:otherwise>
							<input type="radio"  name="head" value="1" />是
				  			<input type="radio"  name="head" checked="checked" value="0" />否
						</c:otherwise>	
					</c:choose>
				</div>
			</div>
		</div>
		<div class="row form-group col-md-6" style="margin-top:10px;">
			<div class="form-group">
				<span class="col-sm-3 control-label">部门：</span>
				<div class="col-md-5">
					<input type="hidden" class="form-control" id="departmentId" name="departmentId" value="${user.departmentId}" >
					<input type="text" name="departmentName" id="departmentName" value="${user.departmentName}" 
					class="form-control" data-toggle="modal" data-target="#myModal" readonly="readonly" style="cursor:pointer"/>
					
				</div>
			</div>
		</div>
		<div class="row form-group" style="margin-top:10px;">
			<div class="col-md-12 " style="text-align: center; margin-top:30px;">
				<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn" onclick="submit_user();">提交</button>
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left:46px;">返回</button>
			</div>
		</div>
	</form>
</div>

<!--   模态框，编辑时弹出来         -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					编辑用户>>修改部门
				</h4>
			</div>
			<div class="modal-body">
				<div class="portlet blue-hoki box">
				 <div class="portlet-title">
					<div class="caption" id="">
						<i class="fa fa-th-list"></i>组织机构
					</div>
				</div>  
				<div class="portlet-body">
					<div class="jstree-default tree"></div>
				</div>
			 </div> 
			</div>
			<div class="modal-footer">
			<button type="button" class="btn btn-primary" onclick="sub();">确认</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
	
</body>
<script type="text/javascript">
$("#departmentId").change(function(){
	var departmentName = $("#departmentId").find("option:selected").text();
	$("#departmentName").val(departmentName);
}) 

$("#backBtn").click(function(){
	window.location.href = '<c:url value="/user/page" />';
})
//表单验证
var validator_user;
var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
$(function() {
	var option_user = {
       validType : {
           dlshouwen_prev : /^[a-zA-Z0-9_]+$/
       },
	elementCallback : {
		success : function(element, css){
			if($(element).is(':checkbox') || $(element).is(':radio')){
				var name = $(element).attr('name');
				$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
			}else{
				$(element).parents('.form-group').removeClass(css.failure);
			}

			//验证用户名
			if($(element).attr('name') == 'userName'){
				var userName = $("#userName").val();
				$.ajax({
					type : "POST",
					dataType : "json",
					url : '<c:url value="/user/check" />',
					data : "userName=" + userName + "&userId="+userId,
					success : function(Data, textStatus) {
						 if (Data.returncode == '200') {
							$(element).parents('.form-group').removeClass(css.failure);
							$("#show_userName_area").removeClass("info-area-failure");
							$("#show_userName_area").addClass("info-area-success");
							$("#show_userName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
						}
						 },
					error : function(data) {
						$(element).parents('.form-group').addClass(css.failure);
						$("#show_userName_area").removeClass("info-area-success");
						$("#show_userName_area").addClass("info-area-failure");
						$("#show_userName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
						return;
					}
				});
			}
			
		}
	}
    }
    $.fn.dlshouwen.validator.lang['zh-cn'].validTypeName.dlshouwen_prev = '用户名只能包含大写、小写、数字和下划线';
	validator_user = $.fn.dlshouwen.validator.init($('#userForm'),option_user);
});
function submit_user() {
     /* if (!validator_user.validResult()) {
        $.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
        return;
    }else if($("#show_userAccount_area").html() != name_area){
        $.fn.dlshouwen.validator.tools.toast('登录名验证未通过！', 'error', 3000);
        return;
    }else if($("#show_userName_area").html() != name_area){
        $.fn.dlshouwen.validator.tools.toast('用户名验证未通过！', 'error', 3000);
        return;
    } 
    $.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000); */
	document.getElementById("userForm").submit();
}

/* 部门树 */
var parentResourceId = "0";
$('.tree').on('select_node.jstree', function(e, data) {
	var selectedLength = data.selected.length;
	var i, j, r = [],t = [];
	for (i = 0, j = selectedLength; i < j; i++) {
		r.push(data.instance.get_node(data.selected[i]).id);
		t.push(data.instance.get_node(data.selected[i]).text);
	}
	parentResourceId = r.join(', ');
	if (parentResourceId > 0){
		$("#leveltitle").text(t.join(', '));
		
	} else {
		$("#leveltitle").text("所有目录信息");		
	}
   	}).jstree({
	"core" : {
		"themes" : {
			"stripes" : true
		},
        'data' : {
        	'url' : '<c:url value='/user/getTree' />',
            'dataType': 'JSON',
            'data' : function (node) {
            	return { 'id' : node.id };
             } 
        }
	},
	"state": { "key": "airCorpTree" },
	"types" : {
		"default" : {
			"icon" : "fa fa-folder icon-state-warning icon-lg"
		},
		"file" : {
			"icon" : "fa fa-file icon-state-warning icon-lg"
		}
	},
	"plugins" : ["state","types" ] 
});	

$(".tree").on("changed.jstree",function(e,data){
	var departMentId = data.instance.get_node(data.selected[0]).id;
	var departMentName = data.instance.get_node(data.selected[0]).text;
	sub = function(){
		document.getElementById("departmentId").value=departMentId;
		document.getElementById("departmentName").value=departMentName;
		$('#myModal').modal('hide');
	}
});

</script>
</html>