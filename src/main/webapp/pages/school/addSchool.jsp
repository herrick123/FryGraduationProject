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
            <a href="#">高校管理</a><i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="#">高校信息</a>
        </li>
    </ul>
</div>

<form name="schoolForm" class="form-horizontal" id="schoolForm" action="<c:url value='/school/save' />" method="post">
    <div class="row" style="margin-top: 50px;">
        <div class="form-group">
            <span for="appName" class="col-sm-4 control-label">高校名称：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="name" name="name" placeholder="请输入高校名称" aria-describedby="sizing-addon2" required="required">
            </div>
        </div>
        <br>
        <div class="form-group">
            <span class="col-sm-4 control-label">高校编码：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="school_code" name="school_code" placeholder="请输入高校编码" aria-describedby="sizing-addon2">
            </div>
        </div>
        <br>
        <div class="form-group">
            <span  class="col-sm-4 control-label">高校官网：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="web_url" name="web_url" placeholder="请输入高校官网地址" aria-describedby="sizing-addon2">
            </div>
        </div>

        <br>
        <div class="form-group">
            <span class="col-sm-4 control-label">高校简介：</span>
            <div class="col-md-4">
                <textarea class="form-control input-radius" id="introduction" name="introduction" placeholder="请输入高校简介" aria-describedby="sizing-addon2"></textarea>
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
        window.location.href = '<c:url value="/school/page" />';
    })

    $(function () {
        $('#schoolForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '高校名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '高校名称不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 50,
                            message: '高校名称长度必须在4到50位之间'
                        }
                    }
                },
                school_code:{
                    validators: {
                        notEmpty: {
                            message: '高校编码不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 5,
                            message: '高校编码长度必须在1到5位之间'
                        }
                    }
                },
                introduction:{
                    validators:{
                        notEmpty: {
                            message: '高校简介不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 255,
                            message: '高校简介长度必须在1到255位之间'
                        }
                    }
                }
            }
        });

        $("#schoolForm").submit(function(ev){ev.preventDefault();});

        $("#subBtn").on("click", function(){
            var bootstrapValidator = $("#schoolForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()){
                var appName = $("#schoolForm").val();
                $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:'<c:url value="/school/check" />',
                    data:"name="+appName,
                    success:function(Data,textStatus){
                        if(Data.returncode == '10000'){
                            showMsg(Data.info);
                        }else if(Data.returncode == '200'){
                            document.getElementById("schoolForm").submit();
                        }else{
                            showMsg('高校信息添加失败！');
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
    })
</script>
</html>