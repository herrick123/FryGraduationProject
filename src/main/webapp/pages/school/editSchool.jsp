<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>编辑高校</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
    <script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
    <style>
        .input-radius{
            border-radius: 5px !important;
        }
    </style>
</head>
<body>
<div class="sodb-page-home">
    <ul class="sodb-page-ul">
        <li>
            <i class="fa fa-home"></i>
            <a href="#">猛码学员管理</a>
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

<form name="schoolForm" class="form-horizontal" id="schoolFrom" action="<c:url value='/application/update' />" method="post">
    <input type="hidden" name="id" id="id" value="<c:out value='${ school.id}' />"/>
    <div class="row" style="margin-top: 50px;">
        <div class="form-group">
            <span for="appName" class="col-sm-4 control-label">高校名称：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="name"
                       name="name" placeholder="请输入高校名称" aria-describedby="sizing-addon2"
                       required="required" value="<c:out value='${ school.name }' />">
            </div>
        </div>
        <br>
        <div class="form-group">
            <span for="appName" class="col-sm-4 control-label">高校编码：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="school_code"
                       name="school_code" placeholder="请输入高校编码" aria-describedby="sizing-addon2"
                       value="<c:out value='${ school.school_code}' />">
            </div>
        </div>
        <br>
        <div class="form-group">
            <span for="appName" class="col-sm-4 control-label">高校官网：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="web_url"
                       name="web_url" placeholder="请输入高校官网" aria-describedby="sizing-addon2"
                       value="<c:out value='${ school.web_url }' />">
            </div>
        </div>

        <br>
        <div class="form-group">
            <span for="appName" class="col-sm-4 control-label">高校简介：</span>
            <div class="col-md-4">
					<textarea class="form-control input-radius" id="introduction" name="introduction" placeholder="请输入高校简介" aria-describedby="sizing-addon2">
						<c:out value='${ school.introduction}' />
					</textarea>
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
        $('#schoolFrom').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                name: {
                    message: '应用名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '<p style="text-indent:65px;">应用名称不能为空</p>'
                        },
                        stringLength: {
                            min: 2,
                            max: 18,
                            message: '<p style="text-indent:65px;">应用名称长度必须在2到18位之间</p>'
                        }
                    }
                },
                school_code:{
                    validators: {
                        notEmpty: {
                            message: '<p style="text-indent:65px;">高校编码不能为空</p>'
                        },
                        stringLength: {
                            min: 0,
                            max: 5,
                            message: '<p style="text-indent:65px;">高校编码长度必须在1到5位之间</p>'
                        },regexp: {
                            regexp: /^[0-9]+$/,
                            message: '<p style="text-indent:65px;">高校编码只能包含数字</p>'
                        }
                    }
                },
                introduction:{
                    validators:{
                        notEmpty: {
                            message: '<p style="text-indent:65px;">高校简介不能为空</p>'
                        },
                        stringLength: {
                            min: 0,
                            max: 255,
                            message: '<p style="text-indent:65px;">高校简介长度必须在1到255位之间</p>'
                        }
                    }
                }
            }
        });

        $("#schoolFrom").submit(function(ev){ev.preventDefault();});

        $("#subBtn").on("click", function(){
            var bootstrapValidator = $("#schoolFrom").data('bootstrapValidator');
            bootstrapValidator.validate();
            if(bootstrapValidator.isValid()){
                var appName = $("#name").val();
                var appId = $("#id").val();
                $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:'<c:url value="/application/check" />',
                    data:"name="+appName+"&id="+appId,
                    success:function(Data,textStatus){
                        if(Data.returncode == '10000'){
                            showMsg(Data.info);
                        }else if(Data.returncode == '200'){
                            document.getElementById("schoolFrom").submit();
                        }else{
                            showMsg('高校信息修改失败！');
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