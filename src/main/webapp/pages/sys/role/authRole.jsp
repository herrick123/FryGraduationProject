<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-control" content="no-cache">
<meta http-equiv="Cache" content="no-cache">
<%@ include file="/pages/inc/header_jstree.jsp"%>
<!-- 前端校验框架 -->
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>角色授权</title>

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
			<a href="#">角色管理</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li>
			<a href="#">角色授权</a>
		</li>
	</ul>
</div>
<div class="content">
	<form name="roleForm" class="form-horizontal" id="roleForm" action="<c:url value='/role/authSave' />" method="post">
		<input type="hidden" name="roleId" id="roleId"  value="<c:out value='${ roleEntity.roleId}' />"/>
		<div class="row" style="margin-top:50px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">角色名：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="roleName" name="roleName" disabled="disabled" value="<c:out value='${ roleEntity.roleName }' />" placeholder="角色名"  aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">角色编码：</span>
				<div class="col-md-4">
					<input type="text" class="form-control" id="roleCode" name="roleCode" disabled="disabled" value="<c:out value='${ roleEntity.roleCode }' />" placeholder="角色编码"  aria-describedby="sizing-addon2">
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="form-group">
				<span  class="col-sm-4 control-label">角色授权：</span>
				<div class="col-md-4">
					<input type="hidden" id="modulesIds" name="modulesIds" value="${moduleId}">
					<div id="tree" class="tree"></div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top:10px;">
			<div class="col-md-12" style="text-align: center;">
				<button class="sbtn sbtn-blue" type="button" id="subBtn" >提交</button>
				<button class="sbtn sbtn-default" type="button" id="backBtn" style="margin-left:45px;">返回</button>
			</div>
		</div>
	</form>
</div>
</body>
<script type="text/javascript">
	//加载树
	$.ajaxSetup({cache:false});
	var roleId = $("#roleId").val();
	$('#tree').jstree({
		"core" : {
			"themes" : {
				"responsive" : false
			},
	        'data' : {
	           	'url' : '<c:url value="/role/authTree" />',
				'dataType' : 'JSON',
			}
		},
		"plugins" : [ "state", "checkbox","types"],
		"checkbox": {
	        "keep_selected_style": false,//是否默认选中
	        "three_state": true,//父子级别级联选择
	        
	    }
	});
	
	//返回
	$("#backBtn").click(function(){
		window.location.href = '<c:url value="/role/page" />';
	})

	//提交表单
	$("#subBtn").on("click", function(){
		var ref = $('#tree').jstree(true);//获得整个树
	    var sel = ref.get_selected(); //获得所有选中节点，返回值为数组
	    $("#modulesIds").val(sel);
		document.getElementById("roleForm").submit();
	});
	
	//给已选中的模块授权
	$('#tree').on('ready.jstree', function(e, data) {
		//去除所有选中的权限
		$("#tree").find("li").each(function(){
			$('#tree').jstree("uncheck_node", $(this).attr("id"));
		});
        //得到服务器传过来的原有权限id的字符串，格式自定义，我的格式为"0001，0002，xxx" 
        var checkMenu = $('#modulesIds').val(); 
        //分割字符串成数组 
        var array = checkMenu.split(","); 
      	 for(var i=0;i<array.length;i++){ 
        	console.log(array[i]);
	        //设置原有权限菜单处于选中状态，其中$("#0001")为id为0001的节点。 
	        //jQuery.tree.plugins.checkbox.check($("#" +array[i]+""));
	        $('#tree').jstree("check_node", "#" +array[i]+"");
        } 
      	
    });
	
</script>
</html>