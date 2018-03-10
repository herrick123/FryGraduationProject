<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增专业</title>
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
            <a href="#">专业管理</a><i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="#">专业信息</a>
        </li>
    </ul>
</div>

<form name="majorForm" class="form-horizontal" id="majorForm" action="<c:url value='/major/save' />" method="post">
    <div class="row" style="margin-top: 50px;">
        <div class="form-group">
            <span for="appName" class="col-sm-4 control-label">专业名称：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="name" name="name" placeholder="请输入专业名称" aria-describedby="sizing-addon2" required="required">
            </div>
        </div>
        <br>
        <div class="form-group">
            <span class="col-sm-4 control-label">专业编码：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="code" name="code" placeholder="请输入专业编码" aria-describedby="sizing-addon2">
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
        window.location.href = '<c:url value="/major/page" />';
    })

    $(function () {
        $('#majorForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '专业名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '专业名称不能为空'
                        },
                        stringLength: {
                            min: 4,
                            max: 50,
                            message: '专业名称长度必须在4到50位之间'
                        }
                    }
                },
                code:{
                    validators: {
                        notEmpty: {
                            message: '专业编码不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 5,
                            message: '专业编码长度必须在1到5位之间'
                        }
                    }
                }
            }
        });

        $("#majorForm").submit(function(ev){ev.preventDefault();});

        $("#subBtn").on("click", function(){
            var bootstrapValidator = $("#majorForm").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()){
                var appName = $("#name").val();
                $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:'<c:url value="/major/check" />',
                    data:"name="+appName,
                    success:function(Data,textStatus){
                        if(Data.returncode == '10000'){
                            showMsg(Data.info);
                        }else if(Data.returncode == '200'){
                            alert();
                            document.getElementById("majorForm").submit();
                        }else{
                            showMsg('专业信息添加失败！');
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