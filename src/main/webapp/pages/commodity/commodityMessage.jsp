<%@page pageEncoding="UTF-8"%>
<%@include file="/pages/inc/deviceHeadTree.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>首页</title>
<meta name="keywords" content="首页" />
<meta name="description" content="首页" />
 <link rel="stylesheet" type="text/css" href="<%=path %>/css/normalize.css"/>
 <script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.min.js"></script>
 <script src="<%=path%>/js/common.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
  $(document).ready(function(){
	  var showproduct = {
		  "boxid":"showbox",
		  "sumid":"showsum",
		  "boxw":400,//宽度,该版本中请把宽高填写成一样
		  "boxh":400,//高度,该版本中请把宽高填写成一样
		  "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
		  "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
		  "sumi":7,//列表间隔
		  "sums":5,//列表显示个数
		  "sumsel":"sel",
		  "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
		  "lastid":"showlast",
		  "nextid":"shownext"
		  };//参数定义	  
	 $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
  });
</script>
</head>
<body style="overflow-x: hidden;overflow-y:hidden;">
<div class="row" style="margin:0px;scrolling : no;overflow-y:hidden;">
	<div class="col-md-12">
		<div class="col-md-6">
			<h1 style="padding-top: 5%;font-weight: bold;font-size: 60px;">${userEntity.address}</h1>
		</div>
		<div class="col-md-4" style="margin-top: 4%;margin-left: 16%">
			<p style="font-weight: bold;">电话：${userEntity.phone}</p>
			<p style="font-weight: bold;padding-top: 10px;">地址：${userEntity.deliveryAddress}</p>
		</div>
		<div class="col-md-12" style="background-color: #272B3A;margin-top:2%; height:3px;"></div>
		<!-- 图片展示 -->
		<div class="col-md-6">
			<div class="showall">
				<div class="showbot">
					<div id="showbox">
						<img src="<c:url value="/${commodityEntity.productPicture}" />" width="500" height="500" />
				    </div><!--展示图片盒子-->
				<!--     <div class="col-md-offset-5" style="position: absolute;margin-left: 79.5%;margin-top: 15%;">
						<button type="button" id="subBtn"  class="sbtn sbtn-blue sbtn30" style="background-color: #ec6459;border: 0px;">下载数据包</button>
					</div> -->
			    </div>
			</div> 
		</div>
		<!-- 基本信息 -->
		
		 <input type="hidden" value="${commodityEntity.uploadCompression}" id="files"/>
		 <input type="hidden" id="commodityEntityUuid" value="${commodityEntity.uuid}" />
		  <input type="hidden" id="noUserr" value="${noUser}" />
		<div class="col-md-6" id="messageI" style="padding-top:1.1%;margin-left: -7%">
		<div class="tabbable" id="tabs-975144" style="">
				<ul class="nav nav-tabs">
					<li class= "active">
						 <a href="#panel-938456" data-toggle="tab">基本信息</a>
					</li>
					<li class="activees">
						 <a href="#panel-933832" data-toggle="tab">拿货咨询</a>
					</li>
					<li class="actives">
						 <a href="#panel-9338323" data-toggle="tab">下载记录</a>
					</li>
				</ul>
				<div class="tab-content">
					<div class="tab-pane active" id="panel-938456" style="margin-top: 30px;background-color: F3F3F3">
						<div class="form-body" >
							<h4 style="padding-top: 4%;margin-left: 3%;font-weight: bold;">商品名称：${commodityEntity.commodityName}</h4>
							<div style="border-bottom: dashed 1px #ccc;height: 1px;margin-bottom: 10px;padding-top: 4%;margin-left: 3%;"></div>
							<p style="padding-top: 1%;margin-left: 3%;">网供批发价：￥<span style="font-size: 28px;font-weight: normal;color: #ea4b35;font-family: Impact;">${commodityEntity.price}</span></p>
							<p style="padding-top: 3%;margin-left: 3%;">产品类型：${commodityEntity.classification}</p>
							<p style="padding-top: 3%;margin-left: 3%;">颜色分类：${commodityEntity.color}</p>
							<p style="padding-top: 3%;margin-left: 3%;padding-bottom: 12%">发布时间：	<span >
								<fmt:formatDate value='${commodityEntity.releaseTime}' pattern='yyyy-MM-dd'/></span></p>
							<img src="<%=path%>/img/gitpicture.gif" style="width: 595px;height: 100px;margin-top: -9%" />
						</div>
					</div>
					<div class="tab-pane activees" id="panel-933832" style="margin-top: 30px;background-color: F3F3F3">
						<div class="form-body" >
							<h4 style="padding-top: 4%;margin-left: 3%;font-weight: bold;">上门拿货方式：</h4>
							<div style="border-bottom: dashed 1px #ccc;height: 1px;margin-bottom: 10px;padding-top: 4%;margin-left: 3%;"></div>
							<p style="padding-top: 1%;margin-left: 3%;">拿货地址：${userEntity.deliveryAddress}</p>
							<p style="padding-top: 3%;margin-left: 3%;">联系电话：${userEntity.phone}</p>
							<p style="padding-top: 3%;margin-left: 3%;">厂家联系人QQ：${userEntity.qq}</p>
							<!-- <p style="padding-top: 3%;margin-left: 3%;padding-bottom: 12%">发布时间：</p> -->
							<img src="<%=path%>/img/gitpictureI.gif" style="width: 602px;height: 100px;margin-top: 4%" />
						</div>
					</div>
					<div class="tab-pane actives" id="panel-9338323" style="margin-top: 30px;background-color: F3F3F3">
						<div class="form-body" >
						 	<table class="table table-bordered" style="text-align: center">
						 		<tr>
						 			<td>用户名</td>
						 			<td>获取时间</td>
						 			<td>获取方式</td>
						 		</tr>
						 		<c:forEach items="${downloadRecordList}" var="it">
						 		<tr>
						 			<td>${it.userName}</td>
						 			<td><span >
									<fmt:formatDate value='${it.createTime}' pattern='yyyy-MM-dd'/></span></td>
						 			<td>${it.access}</td>
						 		</tr>
						 		</c:forEach>
						 	</table>
						</div>				
					</div>
				</div>
			</div>
		</div>
	</div>  
	<div class="col-md-12" style="margin-top:2%; border:0.5px dashed #000; "></div> 
	<div class="col-md-12" >
		<p style="font-size: 23px;font-weight: bold;color: #d9534f;line-height: 40px;margin-top: 2%;margin-left:-0.7%;">商品信息详情：</p>
		 <div class="col-md-offset-5" style="margin-top: -2.7%;margin-left: 14%">
			<button type="button" id="subBtn" onclick="downloadFile()" class="sbtn sbtn-blue sbtn30" style="background-color: #ec6459;border: 0px;">下载数据包</button>
		 </div>
	</div>  
	<div class="col-md-12" > 
		<div class="form-body" style="margin-top: 2%">
			<div class="col-md-3" >
				<span style="font-weight: bold;">质地：${commodityEntity.place}</span>
			</div> 
			<div class="col-md-3" >
				<span style="font-weight: bold;">大小：${commodityEntity.size}</span>
			</div> 
			<div class="col-md-3" >
				<span style="font-weight: bold;">闭合方式：${commodityEntity.closedWay}</span>
			</div> 
			<div class="col-md-3" >
				<span style="font-weight: bold;">流行元素：${commodityEntity.popular}</span>
			</div> 
		</div>
		<div class="form-body"  style="margin-top: 6%">
			<div class="col-md-3" >
				<span style="font-weight: bold;">款式：${commodityEntity.classification}</span>
			</div> 
			<div class="col-md-3" >
				<span style="font-weight: bold;">颜色：${commodityEntity.color}</span>
			</div> 
		</div>
	</div>              
</div>           
</body>
<script type="text/javascript">
function downloadFile() {
	var noUser = $("#noUserr").val();
	if(noUser == "0"){
		alert("请先登录再进行下载");
	}else{
		var uuid = $("#commodityEntityUuid").val();
		var filename = $("#files").val();
		window.open("<c:url value='/commodity/download' />?filename="+filename);
		$.ajax({
	        url : "<c:url value='/commodity/downloadRecord'/>?uuid="+uuid,
	        type : "POST",
	        dataType : "json",
	        success : function(data, textStatus) {
	        	window.location.reload();
	        },
	        error : function() {
	            showMsg('11111');
	        }
	    }); 
	}
}
</script>
</html>
