<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/pages/inc/header.jsp" %>
<%@ include file="/pages/inc/delModal.jsp"%>
<html>
<head>
<title>安全事件智能分析</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/tree/devicecomponents.css" />

<style type="text/css">
#event_chart{
  height:300px;
  width:500px;
}
.dlshouwen-grid{
   font-size: 14px;
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
				<a href="#">系统管理</a>
				<i class="fa fa-angle-right"></i>
			</li>
			<li><a href="#">组织架构管理</a></li>
		</ul>
	</div>

	<div class="row" >
		<div class="col-md-12">
			<div class="portlet blue-hoki box" >
				<div class="portlet-body " style="height: 900px;">
					<div class="row" style="margin:0px;">
    					<div class="col-md-12">
        					<form class="form-inline">
           						<div class="form-group" style="line-height:50px;">
               	 					组织机构名：
                					<input type="text" class="form-control" name="frameName" id="frameName" placeholder="请输入组织名">
            					</div>
            
            					<button type="button" id="searchBtn" class="sbtn sbtn-blue">查询</button>
        					</form>
        					<div class="col-md-12" style="background-color:#234377; height:3px;"></div>
    					</div>
					</div>
					<!-- 结束搜索部分 -->
					<div class="row">
						<div class="col-md-12 column">
							<div class="tabbable" id="tabs-401700">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#panel-event-list"
										data-toggle="tab">信息列表</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-event-list">
									    <div>
									        <div id="event_list" 
											style="margin-top: 5px;"></div>
										    <div id="task_bar" class="dlshouwen-grid-toolbar-container"></div>
									    </div>
									</div>
									<div class="tab-pane " id="panel-event-chart">
										<div class="row" style="height: 800px;">
										    <div  class="col-md-5">
										        <div id="event_chart">
										        </div>
										    </div>
										     <div  class="col-md-5">
										        <div id="container1" style="width: 600px;height:300px;margin-left: 100px;"></div>
										    </div>
										      <div  class="col-md-5">
										        <div id="container2" style="width: 600px;height:300px;margin-top: 100px;"></div>
										    </div>
										      <div  class="col-md-5">
										       	<div id="container3" style="width: 600px;height:300px;margin-left: 100px;margin-top: 100px;"></div>
										    </div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<!-- 列表 -->
	<script type="text/javascript">
	var datas = [ {
		"serialId" : 1,
		"frameName" : "消防护卫部",
		"reportTime" : "2017-8-2 10:10:10",
		"frameNumber":"32",
		"responsible":"道格二世",
		"phone":"1234657",
	}, {
		"serialId" : 2,
		"frameName" : "网络信息部",
		"reportTime" : "2017-8-2 10:10:10",
		"frameNumber":"12",
		"responsible":"辛潮儿",
		"phone":"1101101",
	},
	{
		"serialId" : 3,
		"frameName" : "机务工程部",
		"reportTime" : "2017-8-2 10:10:10",
		"frameNumber":"2",
		"responsible":"王二狗",
		"phone":"23331",
	},
	{
		"serialId" : 4,
		"frameName" : "机场急救中心",
		"reportTime" : "2017-8-2 10:10:10",
		"frameNumber":"12",
		"responsible":"李狗蛋",
		"phone":"1101101",
	},
	{
		"serialId" : 5,
		"frameName" : "精英培养部",
		"reportTime" : "2017-5-2 10:10:10",
		"frameNumber":"1",
		"responsible":"张三疯儿",
		"phone":"1101101",
	},
	
	{"serialId" : 6,
		"frameName" : "商务管理部",
		"reportTime" : "2017-8-2 10:10:10",
		"frameNumber":"22",
		"responsible":"道格二世辛潮斯基",
		"phone":"1234567",
	},];

	var gridColumns = [
			{
				id : 'serialId',
				title : '序号',
				type : 'number',
				columnClass : 'text-center'
			},
			
			{
				id : 'frameName',
				title : '组织名称',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'reportTime',
				title : '成立时间',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				//部门的人数
				id : 'frameNumber',
				title : '人数',
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'responsible',
				title : '负责人',
				width:100,
				type : 'string',
				columnClass : 'text-center'
			},
			{
				id : 'phone',
				title : '部门电话',
				type : 'string',
				columnClass : 'text-center',
			},
			 {id:'operation', title:'操作', type:'string', columnClass:'text-center', resolution:function(value, record, column, grid, dataNo, columnNo){
			       var content = '';
			       content += '<button class="sbtn btn-xs sbtn-blue" style="height:32px;line-height:10px" onclick="edit(\''+record.serialId+'\');"> 编辑</button>';
			       content += '  ';
			       content += '<button class="sbtn btn-xs sbtn-blue" style="height:32px;line-height:10px" onclick="add(\''+record.serialId+'\');"> 新增</button>';
			       content += '  ';
			       content += '<button class="sbtn btn-xs sbtn-default" style="height:32px;line-height:10px" onclick="deleteOneRecord(\''+record.serialId+'\');">  删除</button>';
			       
			       return content;
			    }}
			];
	var gridOption = {
		lang : 'zh-cn',
		ajaxLoad : false,
		exportFileName : '告警接入任务列表',
		datas : datas,
		columns : gridColumns,
		gridContainer : 'event_list',
		toolbarContainer : 'task_bar',
		tools : '',
		pageSize : 10,
		pageSizeLimit : [ 10, 20, 50 ]
	};
	var grid = $.fn.dlshouwen.grid.init(gridOption);
	$(function() {
		grid.load();
	});
	
	var frameGrid = $.fn.dlshouwen.grid.init(frameOption);
	$(function(){
		$('#searchBtn').click(searchData);
		frameGrid.load();
	});

	function searchData(){
		frameGrid.parameters = new Object();
		frameGrid.parameters['frameName'] = $("#frameName").val();
		frameGrid.refresh(true);
	}

	function edit(id){
		window.location.href = '<c:url value="/pages/sys/organization/editFramework.jsp"/>?id='+id; 
	}

	function add(){
		window.location.href = '<c:url value="/pages/sys/organization/addFramework.jsp"/>';
	}

	//删除单条记录 
	function deleteOneRecord(id){
		$("#modalId").val(id);
		$("#delOneModel").modal();
	}

	$("#deleteOneBtn").click(function() {
		var id=$("#modalId").val();
	   	$.ajax({
	    		url : "<c:url value=''/>?id=",
	    		type: "POST",
	    		dataType: "json",
	    		success : function(data, textStatus) {
	    			if(data.returncode == '200'){	
	    				window.location.reload();
	    			}else{
	    				$('#delOneModel').modal('hide');
	    				showMsg('角色删除失败！请联系开发人员！');
	    			}
	    		},
	    		error : function() {	
	    			$('#delOneModel').modal('hide');
	    			showMsg('系统暂不可用，请稍后再试！');
	    		}
	    	});
	});

</script>
</body>
</html>