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
            	<a href="#">训练营管理</a><i class="fa fa-angle-right"></i>
        	</li>
        	<li>
            	<a href="#">训练营信息</a>
        	</li>
    	</ul>
	</div>
	<form name="trainForm" class="form-horizontal" id="trainForm" action="<c:url value='/train/save' />" method="post">
    	<div class="row" style="margin-top: 50px;">
        	<div class="form-group">
            	<span for="areaName" class="col-sm-4 control-label">分区名称：</span>
            	<div class="col-md-4">
            		<select class="form-control input-radius" name="areaId" id="areaId"  aria-describedby="sizing-addon2">
  						<option>请选择分区</option>
  						<c:forEach items="${areaList}" var="i">
  						<option  value="${i.id}" >${i.areaName}</option>
  						</c:forEach>
					</select>
            	</div>
        	</div>
        	<div class="form-group" style="margin-top: 30px">
            	<span class="col-sm-4 control-label">培训讲师：</span>
            	<div class="col-md-4">
                	<input type="text"  class="form-control input-radius" id="teacherName" name="teacherName" placeholder="请输入培训讲师" aria-describedby="sizing-addon2">
            	</div>
        	</div>
        	
        <br>
        	<div class="form-group" style="margin-top: -10px">
            	<span  for="areaCode" class="col-sm-4 control-label">训练营期数：</span>
            	<div class="col-md-4">
                	<input type="text" class="form-control input-radius" id="issue" name="issue" placeholder="请输入训练营期数" aria-describedby="sizing-addon2">
            	</div>
        	</div>
        	<br>
        	<div class="form-group" style="margin-top: -10px">
            	<span  class="col-sm-4 control-label">训练营课程：</span>
            	<div class="col-md-4">
                	<input type="text" class="form-control input-radius" id="course" name="course" placeholder="请输入训练营课程" aria-describedby="sizing-addon2">
            	</div>
        	</div>
        	<br>
        	<div class="form-group" style="margin-top: -10px">
            	<span class="col-sm-4 control-label">详细课程计划的路径</span>
            	<div class="col-md-4">
                	<input type="text"  class="form-control input-radius" id="path" name="path" placeholder="请输入详细课程计划的路径" aria-describedby="sizing-addon2">
            	</div>
        	</div>
        	
        	<div class="form-group" style="margin-top: 30px">
            	<span class="col-sm-4 control-label">本期训练营总人数：</span>
            	<div class="col-md-4">
                	<input type="text"  class="form-control input-radius" id="num" name="num" placeholder="请输入训练营总人数" aria-describedby="sizing-addon2">
            	</div>
        	</div>
        	<div class="form-group">
				<span class="col-sm-4 control-label">训练开始时间：</span>
				<div class="col-md-4">
					<input name="startTime" type="text"	 class="form-control" id="startTime"  placeholder="请输入训练营开始时间" aria-describedby="sizing-addon2"/>
				</div>
			</div>
			<div class="form-group">
				<span class="col-sm-4 control-label">训练结束时间：</span>
				<div class="col-md-4">
					<input name="endTime" type="text" class="form-control" id="endTime"  placeholder="请输入训练营结束时间" aria-describedby="sizing-addon2"/>
				</div>
			</div>
    	</div>
    	<div class="row" style="margin-top: 20px;">
        	<div class="col-md-12" style="text-align: center;">
            	<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn">保存</button>
            	<button class="sbtn sbtn-default sbtn30" type="button" id="backBtn" style="margin-left: 45px;">返回</button>
        	</div>
    	</div>
	</form>
</body>
<script type="text/javascript">
    $("#backBtn").click(function() {
        window.location.href = '<c:url value="/pages/training/trainList.jsp" />';
    })
       $(function () {
        $('#trainForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                path:{
                    validators: {
                        notEmpty: {
                            message: '课程计划的路径不能为空'
                        }
                    }
                },
                issue:{
                	 message: '期数验证失败',
                    validators: {
                        notEmpty: {
                            message: '期数不能为空'
                        }
                    }
                },
                teacherName:{
                    validators: {
                        notEmpty: {
                            message: '讲师姓名不能为空'
                        }
                    }
                }
            }
        });
       });

        $("#trainForm").submit(function(ev){ev.preventDefault();});
        
        
        
        //时间
    laydate.render({
  		  elem: '#startTime',
  	});
  	laydate.render({
  		  elem: '#endTime',
  	});
  	function check() {
  		var startTime = document.getElementById("startTime").value;
  		var endTime = document.getElementById("endTime").value;
  		
  		if (startTime == "" || endTime == "") {
  			showMsg("开始日期和结束日期不能为空！");
  			return false;
  		}
  		 var flag = setvalue();
  			return flag;
  	}
  	function setvalue() {
  		var date1 = document.getElementById('startTime').value;
  		var date2 = document.getElementById('endTime').value;
  		var currentday = new Date();
  		currentday = new Date(currentday.getFullYear(), currentday.getMonth(), currentday.getDate());
  		var startTime = new Date(Date.parse(date1.replace(/-/g, "/"))); //转换成Date();
  		var endTime = new Date(Date.parse(date2.replace(/-/g, "/"))); //转换成Date();
  		if (date1 == "") {
  			showMsg("开始日期不能为空！");
  			return false;
  		}
  		if (date2 == "") {
  			showMsg("结束日期不能为空！");
  			return false;
  		}
  		var day = (Number(endTime) - Number(startTime))
  				/ (1000 * 60 * 60 * 24);
  		if (day < 0) {
  			showMsg("请假结束日期不能早于请假开始日期，请重新选择日期！");
  			return false;
  		}
  		return true;
  	}
  	function convertStringToDate(dateString) {
  		dateString = dateString.split('-');
  		return new Date(dateString[0], dateString[1] - 1, dateString[2]);
  	};
  	 $("#subBtn").on("click", function(){
    	 var bootstrapValidator = $("#trainForm").data('bootstrapValidator');
    	 var flag=check();
         bootstrapValidator.validate();
         if(bootstrapValidator.isValid()){
        	 if(flag){
                 	var issue = $("#issue").val();
              	    var areaId = $("#areaId").val();
                     $.ajax({
                         type:"POST",
                         dataType:"json",
                         url:'<c:url value="/train/check" />',
                         data:"issue="+issue+"&areaId="+areaId,
                         success:function(Data,textStatus){
                             if(Data.returncode == '10000'){
                                 showMsg(Data.info);
                             }else if(Data.returncode == '200'){
                                 document.getElementById("trainForm").submit();
                             }else{
                                 showMsg('高校信息添加失败！');
                                 showMsg('分区信息添加失败！');
                             }
                         },
                         error:function(data){
                             showMsg("服务器异常，稍后尝试");
                         }
                     });
                 }
                 else {
                     return;
                 }
        	 }
         });
   
</script>
</html>