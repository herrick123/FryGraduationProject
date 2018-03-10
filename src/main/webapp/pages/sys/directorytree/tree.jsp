<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp" %> 
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">青岛机场安全管理</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">设备可视化</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">设备资源分类树管理</a></li>
		</ul>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="portlet-body form">
				<form class="form-inline" style="margin: 10px 0px 10px 10px;" name=""
					method="post">
					<div class="form-group">
						<span>目录名称：</span> <input type="text" class="form-control" id="name"
							placeholder="目录名称">
					</div>
					<div class="form-group" style="margin-left: 30px;">
						<button type="submit" class="sbtn sbtn-blue">查询</button>
					</div>
				</form>
			</div>
		</div>
	</div>

<div class="col-md-12" style="background-color: #234377; height: 3px;"></div>
	<div class="page-content-wrapper">
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-12" style="position: relative;top:10px">
						<div class="portlet blue-hoki box">
							<div class="portlet-title">
								<div class="caption" id="title">
									<i class="fa fa-th-list"></i>
								</div>
							</div>
							<div class="portlet-body">
								<div id="tree_2" class="jstree-default"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript">
	
		
		$(document).ready(function(){
			
		var parentBookCorpId = "0";
		$('#tree_2').on('select_node.jstree', function(e, data) {
			var selectedLength = data.selected.length;
			var i, j, r = [],t = [];
			for (i = 0, j = selectedLength; i < j; i++) {
				r.push(data.instance.get_node(data.selected[i]).id);
				t.push(data.instance.get_node(data.selected[i]).text);
			}
			parentBookCorpId = r.join(', ');
			if(parentBookCorpId>0){
				$("#parentName").text(t.join(', '));

				
			}else {
				$("#parentName").text("全部学生");
				
			}
			
			
//	 		if(selectedLength > 0){
//	 			userGrid.load();
//	 		}
		}).jstree({
			"core" : {
				"themes" : {
					"stripes" : true
				},
	            'data' : {
	                'url' : '<%=path %>/directory/tree?tree_code=A005',
	                'dataType': 'JSON',
	                'data' : function (node) {
	                  /* return { 'parent' : node.id }; */
	                	return { 'id' : node.id };
	                } 
	            }
			},
			"state": { "key": "airCorpTree" },
			"types" : {
				"default" : {
					"icon" : "fa fa-folder icon-state-warning icon-lg"
				},
				"file" : {
					"icon" : "fa fa-file icon-state-warning icon-lg"
				}
			},
			"plugins" : ["state","types" ] 
		});	
		$('#tree_2').on('changed.jstree',function(e,data){
	   	 //当前选中节点的文本值
	           var value = data.instance.get_node(data.selected[0]).parent;
	   	       var id=data.instance.get_node(data.selected[0]).id;
	   	       var name=data.instance.get_node(data.selected[0]).text;
	   	       userGrid.parameters = new Object();
	   	       userGrid.parameters['parentid'] = '0';
	   	   if(data.instance.get_node(data.selected[0]).parent!='#'){
	   	    	
				//userGrid.parameters = new Object();
				userGrid.parameters['parentid'] = id;
				userGrid.parameters['name']=name;
//	 			userGrid.refresh(true);
				//userGrid.load();
				

	   	    }else{
	   	    	//userGrid.parameters = new Object();
	   	    	userGrid.parameters['parentid'] = 0;
	   	    	//userGrid.load();
	   	    }
	         	parentname=[];
	   	        parentname.push("根节点");
		        parentname.push(name);
	        	addparentid=[];
		        addparentid.push(0);
		        addparentid.push(id);
	         	userGrid.load();
	       });
		
 		  
		});
	
	</script>

</body>
</html>