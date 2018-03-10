<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header_jstree.jsp" %>
<%@ include file="/pages/inc/delModal.jsp"%>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学员首页</title>
<script src="<%=path %>/js/tree/layout.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/js/laydate.js"></script>
<style>
ul{
	margin-top:20px;
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
				<a href="#">首页</a>
			</li>
		</ul>
	</div>
	<div class="container">
	<div class="row clearfix">
		<div class="col-md-8 column">
			<div class="row clearfix">
				<div class="col-md-6 column">
					<div class="row clearfix"  style="background-color:rgba(128, 128, 128, 0.1);margin-top:30px;">
						<div class="col-md-6 column">
							<img alt="140x140" src="<%=path%>/img/home/pic1.png" />
						</div>
						<div class="col-md-6 column">
							<ul>
								<li>
									Lorem ips
								</li>
								<li>
									Consect
								</li>
								<li>
									Integer 
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 column">
					<div class="row clearfix"  style="background-color:rgba(128, 128, 128, 0.1);margin-top:30px;">
						<div class="col-md-6 column">
							<img alt="140x140" src="<%=path%>/img/home/pic2.png" />
						</div>
						<div class="col-md-6 column">
							<ul>
								<li>
									Lorem ip
								</li>
								<li>
									Consec
								</li>
								<li>
									Integer 
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="row clearfix">
				<div class="col-md-6 column">
					<div class="row clearfix"  style="background-color:rgba(128, 128, 128, 0.1);margin-top:30px;">
						<div class="col-md-6 column">
							<img alt="140x140" src="<%=path%>/img/home/pic3.png" />
						</div>
						<div class="col-md-6 column">
							<ul>
								<li>
									Lore
								</li>
								<li>
									Cons
								</li>
								<li>
									Intege
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-6 column">
					<div class="row clearfix"  style="background-color:rgba(128, 128, 128, 0.1);margin-top:30px;">
						<div class="col-md-6 column">
							<img alt="140x140" src="<%=path%>/img/home/pic4.png" />
						</div>
						<div class="col-md-6 column">
							<ul>
								<li>
									 <a href="#" class="btn btn-info" >
							          <span class="glyphicon glyphicon-upload">
							          </span>
										上传项目
							        </a>
								</li>
								<li>
									 <a href="#" class="btn btn-info" style="margin-top:10px;">
								     	<span class="glyphicon glyphicon-list-alt"></span>
								     	请假状态
								     </a>
								</li>
								<li>
									<a href="#" class="btn btn-info" style="margin-top:10px;">
							        	<span class="glyphicon glyphicon-arrow-right"></span>
							        	&nbsp;去&nbsp;请&nbsp;假
							        </a>
								</li>
								<li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-4 column">
			<div class="page-header">
				<h2>
					张三的成长历程 
				</h2>
			</div>
		</div>
	</div>
</div>

</body>
</html>