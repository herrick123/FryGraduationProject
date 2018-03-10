<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增高校</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
    <script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
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

<form name="trainForm" class="form-horizontal" id="trainForm" action="<c:url value='/train/editOne' />" method="post">
    <div class="row" style="margin-top: 50px;">
        <input  type="hidden"  id="id" name="id" value="<c:out value='${ train.id }' />" >
        <input type="hidden"  id="areaId" name="areaId" value="<c:out value='${ train.areaId }' />" >
        <div class="form-group" style="margin-top: -10px">
            <span  for="areaCode" class="col-sm-4 control-label">训练营期数：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="issue" name="issue" value="<c:out value='${ train.issue }' />" placeholder="请输入训练营期数" aria-describedby="sizing-addon2">
            </div>
        </div>
        <br>
        <div class="form-group" style="margin-top: -10px">
            <span  class="col-sm-4 control-label">训练营课程：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="course" name="course" value="<c:out value='${ train.course }' />" placeholder="请输入训练营课程" aria-describedby="sizing-addon2">
            </div>
        </div>

        <br>
        <div class="form-group" style="margin-top: -10px">
            <span class="col-sm-4 control-label">详细课程计划的路径</span>
            <div class="col-md-4">
                <input type="text"  class="form-control input-radius" id="path" name="path" value="<c:out value='${ train.path}' />" placeholder="请输入详细课程计划的路径" aria-describedby="sizing-addon2">
            </div>
        </div>
        <div class="form-group" style="margin-top: 30px">
            <span class="col-sm-4 control-label">培训讲师：</span>
            <div class="col-md-4">
                <input type="text"  class="form-control input-radius" id="teacherName" name="teacherName" value="<c:out value='${ train.teacherName }' />" placeholder="请输入培训讲师" aria-describedby="sizing-addon2">
            </div>
        </div>
        <div class="form-group" style="margin-top: 30px">
            <span class="col-sm-4 control-label">本期训练营总人数：</span>
            <div class="col-md-4">
                <input type="text"  class="form-control input-radius" id="num" name="num" value="<c:out value='${ train.num }' />" placeholder="请输入训练营总人数" aria-describedby="sizing-addon2">
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
                teacherName:{
                    validators: {
                        notEmpty: {
                            message: '训练营姓名不能为空'
                        }
                    }
                }
            }
        });
       });

        $("#trainForm").submit(function(ev){ev.preventDefault();});

        $("#subBtn").on("click", function(){
       	 	var bootstrapValidator = $("#trainForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()){
                    	var issue = $("#issue").val();
                 	    var areaId = $("#areaId").val();
                 	    var id=$("#id").val();
                        $.ajax({
                            type:"POST",
                            dataType:"json",
                            url:'<c:url value="/train/check" />',
                            data:"issue="+issue+"&areaId="+areaId+"id"+id,
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
           	 
            });
       
</script>
</html>