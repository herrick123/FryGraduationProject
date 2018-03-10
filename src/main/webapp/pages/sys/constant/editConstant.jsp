<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新增用户</title>
<script type="text/javascript" src="<%=path%>/js/sysManage/constant/editConstant.js"></script>
<style type="text/css">
	.input-radius{
		border-radius: 5px;
	}
	 .constant-label{
	 	text-align:right;
	 	line-height:30px;
	 }
	 .row{
	 	margin-top: 20px;
	 }
</style>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li>
				<i class="fa fa-home"></i>
				<a href="#">青岛机场安全管理</a> 
				<i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">数据字典分类信息管理</a><i class="fa fa-angle-right"></i>
			</li>
			<li>
				<a href="#">修改数据字典分类信息</a>
			</li>
		</ul>
	</div>
	<form name="constantForm" class="form-horizontal" id="constantForm" action="<c:url value='/constant/update' />" method="post">
		<input type="hidden" name="id" id="id" value="<c:out value='${ constant.id }' />" />
		<input type="hidden" name="modififer" id="modififer" value="<c:out value='${ loginUser.userName }' />" />
		<div class="row">
			<div class="form-group">
				<span  class="col-sm-4 constant-label">所属字典类别：</span>
				<div class="col-md-4  ">
					<input type="hidden" class="form-control" id="dictionaryId" name="dictionaryId" value="${dictionary.id }" >
					<input type="text" class="form-control" id="dictionaryName" disabled="disabled" placeholder="" aria-describedby="sizing-addon2" value="<c:out value='${ dictionary.typeName }' />">
				</div>
			</div>
			<div class="form-group">
				<span  class="col-sm-4 constant-label">字典名称：</span> 
				<div class="col-md-4">
					<input type="text" class="form-control" id="valueName" name="valueName" placeholder="请输入字典名称"  value="<c:out value='${ constant.valueName }' />"
					valid="r|le1-le20" validTitle="必填项" validInfoArea="show_valueName_area">
				</div>
				<div class="col-md-4 help-block" id="show_valueName_area"></div>
			</div>
			<div class="form-group">
				<span  class="col-sm-4 constant-label">字典类型编码：</span>
				<div class="col-md-4"> 
					<input type="text" class="form-control" id="valueCode" name="valueCode" placeholder="请输入字典类型编码"  value="<c:out value='${ constant.valueCode }' />"
					valid="r|le1-le20" validTitle="必填项" validInfoArea="show_valueCode_area">
				</div>
				<div class="col-md-4 help-block" id="show_valueCode_area"></div>
			</div>
			<div class="row form-group">
				<span  class="col-sm-4 constant-label">字典类型简介：</span>
				<div class="col-md-4 "> 
					<input type="text" class="form-control" id="constantDesc" name="constantDesc" placeholder="" aria-describedby="sizing-addon2"
						value="<c:out value='${ constant.constantDesc}' />"
						valid="r" validTitle="必填项" validInfoArea="show_constantDesc_area">
				</div>
				<div class="col-md-4 help-block" id="show_constantDesc_area"></div>
			</div>
		</div>
		<div class="row" style="margin-top: 20px;">
			<div class="col-md-11" style="text-align: center;">
				<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn">保存</button>
				<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" onclick="javascript:location.href='<%=path%>/constant/page';" style="margin-left: 45px;">返回
				</button>
			</div>
		</div>
	</form>
</body>
<script type="text/javascript">
	$("#backBtn").click(function() {
		window.location.href = '<c:url value="/constant/page" />';
	})
	$(function () {
    $('#constantForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	valueName:{
            	validators: {
                    notEmpty: {
                        message: '<p style="text-indent:65px;">字典名称不能为空</p>'
                    },
                    stringLength: {
                        min: 0,
                        max: 20,
                        message: '<p style="text-indent:65px;">字典名称长度必须在1到20位之间</p>'
                    }
                }
            },
            valueCode:{
            	validators: {
                    notEmpty: {
                        message: '<p style="text-indent:65px;">字典类别编码不能为空</p>'
                    },
                    stringLength: {
                        min: 0,
                        max: 20,
                        message: '<p style="text-indent:65px;">字典类别编码长度必须在1到20位之间</p>'
                    }
                }
            },
            constantDesc:{
            	validators: {
                    notEmpty: {
                        message: '<p style="text-indent:65px;">字典类型值不能为空</p>'
                    },
                    stringLength: {
                        min: 0,
                        max: 10,
                        message: '<p style="text-indent:65px;">字典类型值长度必须在1到255位之间</p>'
                    }
                }
            }
        }
        });
    $("#constantForm").submit(function(ev){ev.preventDefault();});
    $("#subBtn").on("click", function(){
       var bootstrapValidator = $("#constantForm").data('bootstrapValidator');
       bootstrapValidator.validate();
       if(bootstrapValidator.isValid()){
    	   var valueName = $("#valueName").val();
    	   var dictionaryId = $("#dictionaryId").val();
    	   var valueCode = $("#valueCode").val();
    	   var id = $("#id").val();
    	   $.ajax({
    		   type:"POST",
    		   dataType:"json",
    		   url:'<c:url value="/constant/check" />',
    		   data:"valueName="+valueName+"&valueCode="+valueCode+"&dictionaryId="+dictionaryId+"&id="+id,
    		   success:function(Data,textStatus){
	       			if(Data.returncode == '10000'){	
	       				showMsg(Data.info);
	       			}else if(Data.returncode == '200'){
	       				document.getElementById("constantForm").submit();
	       			}else{
	       				showMsg('数据字典信息添加失败！请联系开发人员！');
	       			} 
    		   },
    		   error:function(data){
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