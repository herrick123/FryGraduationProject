<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@ include file="/pages/inc/header.jsp"%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增高校</title>
    <title>新增分区</title>
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

<form name="schoolForm" class="form-horizontal" id="schoolForm"  action="<c:url value='/area/addArea' />" method="post">
    <div class="row" style="margin-top: 50px;">
        <div class="form-group">
            <span for="areaName" class="col-sm-4 control-label">分区名称：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="areaName" name="areaName" placeholder="请输入分区名称" aria-describedby="sizing-addon2" required="required">
            </div>
        </div>
        <br>
        <div class="form-group" style="margin-top: -10px">
            <span  for="areaCode" class="col-sm-4 control-label">分区编号：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="areaCode" name="areaCode" placeholder="请输入分区编号" aria-describedby="sizing-addon2">
            </div>
        </div>
        <br>
        <div class="form-group" style="margin-top: -10px">
            <span  class="col-sm-4 control-label">分区所在地：</span>
            <div class="col-md-4">
                <input type="text" class="form-control input-radius" id="place" name="place" placeholder="请输入分区所在地" aria-describedby="sizing-addon2">
            </div>
        </div>

        <br>
        <div class="form-group" style="margin-top: -10px">
            <span class="col-sm-4 control-label">分区人数</span>
            <div class="col-md-4">
                <input type="text"  class="form-control input-radius" id="areaNum" name="areaNum" placeholder="请输入分区人数" aria-describedby="sizing-addon2">
            </div>
        </div>
        <div class="form-group" style="margin-top: 30px">
            <span class="col-sm-4 control-label">分区负责人：</span>
            <div class="col-md-4">
                <input type="text"  class="form-control input-radius" id="managerName" name="managerName" placeholder="请输入分区负责人" aria-describedby="sizing-addon2">
            </div>
        </div>
        <div class="form-group" style="margin-top: 30px">
            <span class="col-sm-4 control-label">分区负责人联系电话：</span>
            <div class="col-md-4">
                <input type="text"  class="form-control input-radius" id="managerPhone" name="managerPhone" placeholder="请输入分区负责人联系方式" aria-describedby="sizing-addon2">
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
        window.location.href = '<c:url value="/pages/area/areaList.jsp" />';
    })
       $(function () {
        $('#schoolForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                areaName: {
                    message: '分区名称验证失败',
                    validators: {
                        notEmpty: {
                            message: '分区名称不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 50,
                            message: '分区名称长度必须在4到50位之间'
                        }
                    }
                },
                areaCode:{
                    validators: {
                        notEmpty: {
                            message: '分区编号不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 10,
                            message: '分区编号长度必须在1到10位之间'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9]+$/,
                            message: '分区编号只能输入大写、小写、或者数字'
                        }
                    }
                },
                place:{
                    validators: {
                        notEmpty: {
                            message: '分区所在地不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 5,
                            message: '分区所在地长度必须在1到5位之间'
                        }
                    }
                },
                areaNum:{
                    validators: {
                        notEmpty: {
                            message: '分区人数不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 50,
                            message: '分区人数必须在1到50位之间'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '分区编号只能输数字'
                        }
                    }
                },
                managerName:{
                    validators: {
                        notEmpty: {
                            message: '分区负责人姓名不能为空'
                        },
                        stringLength: {
                            min: 0,
                            max: 5,
                            message: '分区负责人姓名必须在1到5位之间'
                        }
                    }
                },
                managerPhone:{
                    validators:{
                        notEmpty: {
                            message: '分区负责人电话不能为空'
                        },
                        stringLength: {
                            min: 11,
                            max: 11,
                            message: '长度必须为11位'
                        },
                        regexp: {
                            regexp: /^1[3|5|8|7]{1}[0-9]{9}$/,
                            message: '请输入正确的手机号码'
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
            	var areaName = $("#areaName").val();
         	    var areaCode = $("#areaCode").val();
                $.ajax({
                    type:"POST",
                    dataType:"json",
                    url:'<c:url value="/area/check" />',
                    data:"areaName="+areaName+"&areaCode="+areaCode,
                    success:function(Data,textStatus){
                        if(Data.returncode == '10000'){
                            showMsg(Data.info);
                        }else if(Data.returncode == '200'){
                            document.getElementById("schoolForm").submit();
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
    })

</script>
</html>