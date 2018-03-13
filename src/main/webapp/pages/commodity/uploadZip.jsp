<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>添加设备</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" href="<%=path %>/css/pilotcockpit.css" />
<link rel="stylesheet" href="<%=path %>/css/pagebar.css" />
<link rel="stylesheet" type="text/css" href="<%=path%>/css/bootstrapValidator.min.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/demo.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/fileUpload.css" />
<link rel="stylesheet" type="text/css" href="<%=path %>/css/dragslot.css">
<link rel="stylesheet" type="text/css" href="<%=path %>/css/styles.css">
<script type="text/javascript" src="<%=path%>/js/upload/fileUpload.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrapValidator.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/dragslot.js"></script>
<script type="text/template" id="file-temp-item-tpl">
<span class="file-temp-item" style="{{style}}">
	<span class="file-temp-name">{{name}}</span>	
	<span class="file-temp-btn">&times;</span>
</span>
</script>
  	
<script type="text/template" id="file-more-item-tpl">
<li>
	<span class="file-item-more-name">{{name}}</span>
	<span class="file-item-more-btn">&times;</span>
</li>
</script>
<style>
.portlet.box.blue-hoki > .portlet-title {
    background-color: #67809f;
}
</style>
</head>
<body>
	<div class="sodb-page-home">
		<ul class="sodb-page-ul">
			<li><i class="fa fa-home"></i> <a href="#">白沟箱包网</a> <i
				class="fa fa-angle-right"></i></li>
			<li><a href="#">商家管理</a> <i class="fa fa-angle-right"></i></li>
			<li><a href="#">上传压缩包</a></li>
		</ul>
	</div>
	<div class="page-container" style="padding-left: 0px;">
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<div id="content_1">
					<div class="portlet box blue-hoki">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-th-list"></i>上传压缩包
							</div>
						</div>
						<div class="portlet-body form">
							<form id="form1" class="form-horizontal" role="form" action="<c:url value='/commodity/save' />"enctype="multipart/form-data" method="post">
									<div class="form-body">
										
										<div class="form-group">
											<label class="col-md-4 control-label">商品首图<span
												class="required">* </span></label>
											<div class="col-md-8">
											     <div id="preview"></div>
												 <input type="file" name="file" id="picturePath" onchange="preview(this)" />
											</div>
										</div> 
										<div class="form-group">
											<label class="col-md-4 control-label">上传压缩包<span
												class="required">* </span></label>
												<div class="col-md-4">
												   <input type="file" name="fileTest[]" id="fileTest" multiple style="width: 300px;padding: 4px;"  />
												    <input type="hidden" name="uploadCompression" id="prjDoc" />
											        当前选择的文件列表
											        <span class="file-temp">
											        </span>
												   <div id="file-btn" style="display: none;">
												        <input type="button" class="sbtn sbtn-blue" id="uploadBtn" value="上传"  style="display: inline-block;">
											        </div>
											        <p class="upload-tip">文件上传成功</p>
												</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label">选择分类<span
												class="required">* </span></label>
												<div class="col-md-4">
													<select  class="form-control" name="classification">
														<option>-----请选择分类-----</option>
														<option>男包</option>
														<option>女包</option>
														<option>双肩包</option>
													</select>
												</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label">产品名称
												<span class="required">* </span></label>
													<div class="col-md-4">
														<input type="text" class="form-control" id="commodityName" name="commodityName" placeholder="请输出产品名称">
													</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label">产品货号
												<span class="required">* </span></label>
													<div class="col-md-4">
														<input type="text" class="form-control"  id="commodityNumber" name="commodityNumber" placeholder="请输出产品货号">
													</div>
										</div>
									<!-- 每次点击对数据进行修改回显，如果没有值的话显示“暂时没有配置流程” -->
							
										<div class="form-group" style="margin-left: 19%">
											<label class="col-md-2 control-label" style="width: 17%">零售价
												<span class="required">* </span></label>
													<div class="col-md-2">
														<input type="text" class="form-control" name="price" placeholder="请输入价格">
													</div>
										</div>
										<div class="form-group">
											
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label">尺寸
												<span class="required">* </span></label>
													<div class="col-md-4">
														<input type="text"  name="size" class="form-control" placeholder="例如：中.22等" valid="r"	 validTitle="必填项" validInfoArea="show_size_area">
													</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label">颜色
												<span class="required">* </span></label>
													<div class="col-md-4">
														<select  class="form-control" name="color">
														<option>-----请选择颜色-----</option>
														<option>白色</option>
														<option>乳白色</option>
														<option>米白色</option>
														<option>浅灰色</option>
														<option>银色</option>
														<option>灰色</option>
														<option>藕色</option>
														<option>橘红色</option>
														<option>西瓜红</option>
														<option>玫瑰红</option>
														<option>紫色</option>
														<option>杏色</option>
														<option>黄色</option>
														<option>驼色</option>
														<option>咖啡色</option>
														<option>栗色</option>
														<option>巧克力色</option>
														<option>蓝色</option>
														<option>绿色</option>
													</select>
													</div>
										</div>
										<div class="form-group">
											<label class="col-md-4 control-label">产品描述
												<span class="required">* </span></label>
												<div class="col-md-4">
													<textarea class="form-control" name="commodityDecribe" style="height: 100px" placeholder="请输入200字以内的产品描述"></textarea>
												</div>
										</div>
									</div>							
									<div class="form-actions">
										<div class="row">
											<div class="col-md-offset-5 col-md-9">
												<button type="button" id="subBtn" class="sbtn sbtn-blue sbtn30">
													保存</button>
												<button style="margin-left: 45px;" type="button"
												 	onclick="window.location.href='maintainPlan.jsp'"
													class="sbtn sbtn-default sbtn30">取消</button>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
<script type="text/javascript">
$(function () {
    $('#form1').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            commodityNumber:{
                validators: {
                    notEmpty: {
                        message: '商品货号不能为空'
                    },
                    stringLength: {
                        min: 0,
                        max: 10,
                        message: '商品货号长度必须在1到10位之间'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9]+$/,
                        message: '商品货号只能输入大写、小写、或者数字'
                    }
                }
            },
            commodityName:{
                validators: {
                    notEmpty: {
                        message: '商品名称不能为空'
                    },
                    stringLength: {
                        min: 0,
                        max: 5,
                        message: '商品名称长度必须在1到5位之间'
                    }
                }
            },
            size:{
                validators: {
                    notEmpty: {
                        message: '尺寸不能为空'
                    },
                    stringLength: {
                        min: 1,
                        max: 50,
                        message: '尺寸必须在1到50位之间'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '尺寸只能输数字'
                    }
                }
            },
           price:{
                validators: {
                    notEmpty: {
                        message: '价格不能为空'
                    },
                    stringLength: {
                        min: 1,
                        message: '价格必须大于1'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: '价格只能输数字'
                    }
                }
            }

    
        }
    });

    $("#form1").submit(function(ev){ev.preventDefault();});

    $("#subBtn").on("click", function(){
        var bootstrapValidator = $("#form1").data('bootstrapValidator');
        bootstrapValidator.validate();
        if(bootstrapValidator.isValid()){
        	var commodityName = $("#commodityName").val();
     	    var commodityNumber = $("#commodityNumber").val();
            $.ajax({
                type:"POST",
                dataType:"json",
                url:'<c:url value="/commodity/check" />',
                data:"commodityName="+commodityName+"&commodityNumber="+commodityNumber,
                success:function(Data,textStatus){
                    if(Data.returncode == '10000'){
                        showMsg(Data.info);
                    }else if(Data.returncode == '200'){
                        document.getElementById("form1").submit();
                    }else{
                        showMsg('添加失败！');
                        showMsg('添加失败！');
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
$("#planFlow").click(function(){
	window.location.href='planFlow.jsp'
	
})

/* jQuery(function($){
	$('#dragslot').dragslot({
		dropCallback: function(el){
		//	alert(el);
		}
	});
}); */
/* 上传压缩包 */
$(function() {
	validator_release = $.fn.dlshouwen.validator.init($('#form1'));
	// 上传操作
	$('#uploadBtn').click(function() {
		alert("11");
		$('.upload-tip').hide();
		// 构建FormData对象
		var str = "";
		var fd = new FormData($('#form1')[0]);
		for (var i = 0, j = curFiles.length; i < j; ++i) {
			fd.append('uploadFiles', curFiles[i]);
				str += curFiles[i].name;
		}
		
		$("#prjDoc").val(str);
/* 		var dom = document.getElementById(fileTest);  
		var fileSize =  dom.files[0].size;//文件的大小，单位为字节B
		console.log(fileSize); */
		
		$.ajax({
			url: '<c:url value='/commodity/async/upload' />',
			type: 'post',
			data: fd,
			processData: false,
			contentType: false,
			success: function(rs) {
				alert(rs)
				showMsg("文件上传成功");
			},
			error: function(err) {
				showMsg("文件上传失败！");
			}
		});
	});
}); 
		
		
/* 上传首图 */
function preview(file) {
	var prevDiv = document.getElementById('preview');
	var fileName=document.getElementById("picturePath").value;  
    var suffixIndex=fileName.lastIndexOf(".");  
    var suffix=fileName.substring(suffixIndex+1).toUpperCase(); 
	if(suffix=="BMP"||suffix=="JPG"||suffix=="JPEG"||suffix=="PNG"||suffix=="GIF"){
		if (file.files && file.files[0]) {
		var reader = new FileReader();
		reader.onload = function(evt) {
		prevDiv.innerHTML = '<img src="' + evt.target.result + '" style="width:150px" />';
		}
		reader.readAsDataURL(file.files[0]);
		} else {
		prevDiv.innerHTML = '<div class="img" width="125" height="130"  style="filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src=\'' + file.value + '\'"></div>';
		}
	}else {
		document.getElementById("picturePath").outerHTML = document.getElementById("picturePath").outerHTML;
		showMsg("请上传图片（格式BMP、JPG、JPEG、PNG、GIF等）!");
		
	}
}

</script>
</body>
</html>