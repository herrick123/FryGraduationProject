<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工上传作业</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/css/bootstrapValidator.min.css" />
<script type="text/javascript"
	src="<%=path%>/js/bootstrapValidator.min.js"></script>
 <script type="text/javascript" src="<%=path%>/js/bootstrap-select.js">	</script>
 <link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrap-select.css">
 <script type="text/javascript">
 $(window).on('load', function () {

     
	 $('.selectpicker').selectpicker({
	                'selectedText': 'cat'
	            });

	         
	   // $('.selectpicker').selectpicker('hide');
	        });
  </script>	
<style type="text/css">
.input-radius {
	border-radius: 5px !important;
}
.file{
    position: absolute;
    right: 0;
    top: 0;
    height: 24px;
    filter: alpha(opacity:0);
    opacity: 0;
    width: 250px;
    font-size: 32px;
}
</style>
</head>
<body style="overflow: hidden;">
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">学员管理系统</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">新增项目管理</a></li>
		</ul>
	</div> 
	<form name="addProjectForm" class="form-horizontal " id="addProjectForm"  action="<c:url value='/projectManage/save?employeeId=${staffId}' />" method="post">
		<div class="row" style="margin-top: 50px;">
			<div class="col-md-6"; >
			<div class="form-group">
				<span for="projectCode" class="col-sm-4 control-label">项目编号：</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="projectCode"
						name="projectCode" placeholder="请输入项目编号"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			<div class="form-group">
				<span for="projectName" class="col-sm-4 control-label">项目名称：</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="projectName"
						name="projectName" placeholder="请输入项目编号"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			<div class="form-group">
				<span for="owner" class="col-sm-4 control-label">项目所属：</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="owner"
						name="owner" placeholder="请输入项目所属"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			<div class="form-group">
					<span class="col-sm-4 control-label">项目类型：</span>
					<div	 class="col-md-8" style="margin-top: 5px;float-left:1px;">
				  		<c:forEach var="type" items="${types}" varStatus="status">
				  			<c:if test="${status.count ==1}">
				  			<input type="radio"  name="type" checked="checked" value="${type.valueCode }"/>${type.valueName }
				  			</c:if>
				  			
				  			<c:if test="${status.count !=1}">
				  			<input type="radio"  name="type" value="${type.valueCode }"/>${type.valueName }
				  			</c:if>
				  			
				  		</c:forEach>
					</div>
				</div>
			</div>
			<div  class="col-md-6"; style="float: right">
			<div class="form-group">
				<span class="col-sm-4 control-label">开始时间：</span>
				<div class="col-md-4">
					<input type="text"
						class="calender-birthday form-control input-radius" id="startTime"
						name="startTime" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})"
						placeholder="请输入开始时间" required="required">
				</div>
			</div>
			<div class="form-group">
				<span class="col-sm-4 control-label">结束时间：</span>
				<div class="col-md-4">
					<input type="text"
						class="calender-birthday form-control input-radius" id="endTime"
						name="endTime" onClick="WdatePicker({dateFmt:'yyyy/MM/dd'})"
						placeholder="请输入结束时间" required="required">
				</div>
			</div>
			<div class="form-group">
				<span for="projectLeader" class="col-sm-4 control-label">项目负责人：</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="projectLeader"
						name="projectLeader" placeholder="请输入项目负责人"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			<div class="form-group">
				<span for="staff" class="col-sm-4 control-label">参与学员：</span>
				<div class="col-md-4">
					<input type="text" class="form-control input-radius" id="staff"
						name="staff" placeholder="请输入项目负责人"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			<div class="form-group" style = "display : none;">
				<span for="staff" class="col-sm-4 control-label">参与学员id：</span>
				<div class="col-md-4">
					<input type="hidden" class="form-control input-radius" id="staffId"
						name="employeeId" placeholder="请输入项目负责人"
						aria-describedby="sizing-addon2" required="required">
				</div>
			</div>
			
			</div>
		</div>
		<br>
		 <div class="col-md-12" style="background-color:#234377; height:3px;"></div>
		 <br>

<!-- ---------------------------------------------------------------- -->
<%--      <form  name="addProjectFormm"  class="form-inline"  id="addProjectFormm" action="<c:url value='/projectManage/pageList' />" method="post" >
 --%>          
    <div  class="form-inline">
 	<div class="form-group" style="line-height: 50px;margin-left: 8px">
                学生姓名：<input type="text" class="form-control" id="employeeName" placeholder="请输入学生姓名">
            </div>
             <div class="form-group" style="line-height: 50px;margin-left: 50px;">
            
                技能标签：<select type="text" class="selectpicker bla bla bli " id="skill" multiple data-live-search="true" >
                <c:forEach var="skill" items="${skills}">
                	 <option value ="${skill.valueCode }">${skill.valueName }</option>
				 </c:forEach>         
           </select>
            </div>
             <div class="form-group" style="line-height: 50px;margin-left: 50px">
                能力级别：<input type="text" class="form-control" id="abilityLevel" placeholder="请输入能力级别">
            </div>
            <button type="button" id="searchBtn" class="sbtn sbtn-blue" style="margin-left: 15px;">查询</button>
            <div id="schoolDataList" class="dlshouwen-grid-container"></div>
       	    <div id="schoolPage" class="dlshouwen-grid-toolbar-container"></div>
       	     <div class="row" style="margin-top: 20px;">
			<div class="col-md-12" style="text-align: center;">
			<button class="sbtn sbtn-blue sbtn30" type="button" id="subBtn">保存</button>
			<button class="sbtn sbtn-default sbtn30" type="button" id="backBtnn"
				style="margin-left: 45px;">返回</button>
		</div>
		</div>
		</div>
     </form>       
    <div id="schoolDataList" class="dlshouwen-grid-container"></div>
    <div id="schoolPage" class="dlshouwen-grid-toolbar-container"></div>
</body>
<script type="text/javascript">
$(function () {
    $('#addProjectForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            projectName: {
                message: '项目名称验证失败',
                validators: {
                    notEmpty: {
                        message: '项目名称不能为空'
                    },
                    stringLength: {
                        min: 0,
                        max: 50,
                        message: '项目名称长度必须在0到50位之间'
                    }
                }
            },
            projectCode:{
                validators: {
                    notEmpty: {
                        message: '项目编号不能为空'
                    },
                    stringLength: {
                        min: 0,
                        max: 10,
                        message: '项目编号长度必须在1到10位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: '分区编号只能输入大写、小写、或者数字'
                    }
                }
            },
            owner:{
                validators: {
                    notEmpty: {
                        message: '项目所属不能为空'
                    },
                    stringLength: {
                        min: 0,
                        max: 5,
                        message: '项目所属长度必须在0到50位之间'
                    }
                }
            },
            
            projectLeader:{
                validators: {
                    notEmpty: {
                        message: '项目负责人姓名不能为空'
                    },
                    stringLength: {
                        min: 0,
                        max: 5,
                        message: '分区负责人姓名必须在1到5位之间'
                    }
                }
            }
        }
    });

    $("#addProjectForm").submit(function(ev){ev.preventDefault();});

    $("#subBtn").on("click", function(){
        var bootstrapValidator = $("#addProjectForm").data('bootstrapValidator');
        bootstrapValidator.validate();
        if(bootstrapValidator.isValid()){
        	var projectName = $("#projectName").val();
     	    var projectCode = $("#projectCode").val();
            $.ajax({
                type:"POST",
                dataType:"json",
                url:'<c:url value="/projectManage/check" />',
                data:"projectName="+projectName+"&projectCode="+projectCode,
                success:function(Data,textStatus){
                    if(Data.returncode == '10000'){
                        showMsg(Data.info);
                    }else if(Data.returncode == '200'){
                        document.getElementById("addProjectForm").submit();
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
var appColumns = [
                  {
                      id : 'serialId',
                      title : '序号',
                      type : 'string',
                      columnClass : 'text-center',
                      width:45,
                      resolution:function(value, record, column, grid, dataNo, columnNo){
                          return dataNo+1;
                      }	
                  },
                  {
                      id : 'id',
                      title : '主键',
                      type : 'string',
                      hide : true
                  },
                  {
                      id : 'employeeCode',
                      title : '学生编号',
                      width:160,
                      type : 'string',
                      columnClass : 'text-center'
                  },
                  {
                      id : 'employeeName',
                      title : '学生姓名',
                      width:160,
                      type : 'string',
                      columnClass : 'text-center'
                  },
                  {
                      id : 'skill',
                      title : '技能标签',
                      type : 'String',
                      width:160,
                      columnClass : 'text-center'
                  },
                  {
                      id : 'abilityLevel',
                      title : '能力级别',
                      type : 'date',
                      width:160,
                      columnClass : 'text-center'
                  },
                  {
                      id : 'projectName',
                      title : '已在项目组',
                      type : 'string',
                      width:160,
                      columnClass : 'text-center'
                  },


                  {
                      id : 'operation',
                      title : '操作',
                      width:200,
                      type : 'string',
                      columnClass : 'text-center',
                      resolution : function(value, record, column, grid, dataNo,
                                            columnNo) {
                          var content = '';
                          content += '  ';
                          content += "<button class='sbtn sbtn-default btn-sm' id='addBtn' "
                              + "onclick=addApp('"
                              + record.employeeName + "','"
                              + record.id
                              + "');>添加</button>";
                          return content;
                      }
                  }
              ];
			  var skill=$("#skill").val();
              function getSkill(){
            	  skill =  $("#skill").val();
            	  alert(skill);
              }
              var areaOption = {
                  lang : 'zh-cn',
                  ajaxLoad : true,
                  loadURL : '<c:url value="/projectManage/pageList" />',
                  columns : appColumns,
                  gridContainer : 'schoolDataList',
                  toolbarContainer : 'schoolPage',
                  tools : 'refresh',
                  check : true,
                  checkWidth : '27px',
                  pageSize : 5,
                  pageSizeLimit : [ 5, 10, 20, 50 ],
                  onCellMouseOver : function(value, record, column, grid, dataNo, columnNo, cell, row, extraCell, e){
                      if(columnNo==4){
                          cell.attr("title",value);
                      }
                  }
              };
              
              var areaGrid = $.fn.dlshouwen.grid.init(areaOption);
              $(function() {
            	
                  areaGrid.load();
              });
	
	
	var areaGrid = $.fn.dlshouwen.grid.init(areaOption);

    $(function() {
       $('#searchBtn').click(searchData);
       areaGrid.load();
    });
    
    function searchData() {
        areaGrid.parameters = new Object();
        areaGrid.parameters['employeeName'] = $("#employeeName").val();
        areaGrid.parameters['skill'] = $("#skill").val();
        areaGrid.parameters['abilityLevel'] = $("#abilityLevel").val();
        areaGrid.refresh(true);
    }
    var i = 0;
    function addApp(employeeName,employeeId){
    	i++;
    	if(i == 1){
    		$("#staff").val(employeeName);
    		$("#staffId").val(employeeId);
    	}else{
    		$("#staff").val($("#staff").val() + "、" + employeeName);
    		$("#staffId").val($("#staffId").val() + "," + employeeId);
    	}
    	
    }
    
    $("#backBtn").click(function(){
    	window.location.href = '<c:url value="/projectManage/page" />';
    })
</script>
</html>