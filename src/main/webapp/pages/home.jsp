<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
.s-home-title{height:40px;line-height: 40px;border-bottom: 1px solid #67809f;background-color: #E0E0E0;}
.s-home-title .col-md-9,.col-md-8 div{font-size:15px;font-weight: 600;}
.s-home-title .col-md-3 {text-align:right;}
.s-home-text{height:35px;line-height: 35px;}
.table-hover tr th{background-color: #67809f ;color:#fff;}
.s-home-syt{background-color: #67809f;color:#fff;height:40px;line-height:40px;margin-top:8px;padding-left:10px;cursor:pointer;}
.s-home-syt span{padding-left:10px;}
.s-home-dut{color:black;padding-left:10px;margin-top:10px; }
.s-home-dut div{height:30px;line-height: 30px; }
.s-home-block{padding:0px;border: 1px solid #c0c0c0;}
.s-home-content{padding:0px 0px 0px 15px;}
.table-hover-my{width:100%;line-height: 35px;font-weight:bold;}
.table-hover-my>tbody>tr:hover{background-color:#F0F0F0}
.article-title{}
.article-time{color:#808080;}
</style>
<!-- 高德css -->
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<!-- 高德地图涉及的js-->
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=d3acfe752801099b1a31afe817c6edcf&plugin=AMap.MouseTool"></script>

</head>
<body>
<div class="row" style="padding-top:10px;">
	<div class="col-md-12">
		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  			<ol class="carousel-indicators">
    			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
  			</ol>
  			<div class="carousel-inner" role="listbox">
			    <div class="item active">
			      <img src="../img/home/home-bg-01.jpg" style="width:100%;max-height:500px;min-height:344px;">
			    </div>
			    <div class="item">
			      <img src="../img/home/home-bg-02.png" style="width:100%;max-height:500px;min-height:344px;">
			    </div>
  			</div>
  			<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    			<span class="sr-only">Previous</span>
  			</a>
  			<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
  			</a>
		</div>
	</div>
</div>
<div id="sodb-article-area" style="text-align:center; padding:15px;">
	<div style="margin:0 auto;background-color: #FFFFFF;width: 100%;height: 100%;">
			<iframe id="articleIframe" name="articleIframe" frameborder="0" style="width:100%;min-height: 830px;" src="#"></iframe>
	</div>
</div>
<div id="head-category" class="row" style="">
	<div class="col-md-12" style="">
		<div class="col-md-9" style="">
			<div class="col-md-4" style="padding-left:0px;margin-top:15px;">
				<div class="col-md-12 s-home-block" style="height:100px;">
				 	<div class="row s-home-title">
				 		<div class="col-md-9">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">安全信息检索</div>
				 		</div>
				 		<div class="col-md-3">&nbsp;</div>
				 	</div>
			 		<div class="row s-home-content" style="">
				 		<div class="col-md-12" style="margin-top:10px;padding:0px;vertical-align:middle;">
				 			<span style="display:inline-block;float:left;width:70%;min-width:165px;"><input class="form-control" id="" placeholder="请输入关键字" style="width:100%;"></span>
				 			<span style="display:inline-block;margin-left:10px;float:left;"><button type="submit" class="sbtn sbtn-blue">搜索</button></span>
				 		</div>
				 	</div>
			 	</div>
			 	<div class="col-md-12 s-home-block" style="margin-top: 10px;height:240px;">
			 		<c:forEach items="${categoryList}" var="category" varStatus="status" begin="0" end="0">	
				 	<div class="row s-home-title">
				 		<div class="col-md-8">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">${category.categoryName }</div>
				 		</div>
				 		<div class="col-md-4" style="font-weight: normal;text-align:right;"><a href="<c:url value='/article/showArticle' />/${category.categoryId}" onclick="showArticleList()" target="articleIframe">更多&gt;&gt;</a></div>
				 	</div>
				 	<div class="row s-home-content">
				 		<div class="col-md-12" >
					 		<c:set var="articleCount" value="1"/>
				 			<c:forEach items="${articleList }" var="article" varStatus="index">
				 				<c:if test="${article.categoryId == category.categoryId && articleCount <= 5 }">
				 					<c:set var="articleCount" value="${articleCount+1 }"/>
				 					<div style="width:100%;line-height: 35px;">
				 						<div class="article-title" style="font-weight: normal;display:inline-block;width:80%;overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
				 						 	<a href="<c:url value='/article/homePreview' />/${article.articleId}" onclick="showArticleList()" target="articleIframe">${article.title }</a>
				 						</div>
				 						<div class="article-time" style="font-weight: normal;display:inline-block;width:20%;float:right;text-align: right;">
				 							<fmt:formatDate value="${article.createTime }" pattern="MM-dd"/>
				 						</div>
				 					</div>
				 				</c:if>
				 			</c:forEach>
				 		</div>
				 	</div>
				 	</c:forEach>
			 	</div>
		 	</div>
			<div class="col-md-8" style="padding:0px;height: 350px;margin-top:15px;">
			 	<div class="col-md-12 s-home-block" style="height: 100%;">
			 		<c:forEach items="${categoryList}" var="category" varStatus="status" begin="1" end="1">	
				 	<div class="row s-home-title">
				 		<div class="col-md-9">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">${category.categoryName }</div>
				 		</div>
				 		<div class="col-md-3" style="font-weight: normal;"><a href="<c:url value='/article/showArticle' />/${category.categoryId}" onclick="showArticleList()" target="articleIframe">更多&gt;&gt;</a></div>
				 	</div>
				 	<div class="row s-home-content" style="">
				 		<div class="col-md-12" style="margin-top:5px;">
				 			<c:set var="articleCount" value="1"/>
				 			<c:forEach items="${articleList }" var="article" varStatus="index">
				 				<c:if test="${article.categoryId == category.categoryId && articleCount <= 8 }">
				 					<c:set var="articleCount" value="${articleCount+1 }"/>
				 					<div style="width:100%;line-height: 35px;">
				 						<div class="article-title" style="font-weight:normal;display:inline-block;width:80%;overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
				 						 	<a href="<c:url value='/article/homePreview' />/${article.articleId}" onclick="showArticleList()" target="articleIframe">${article.title }</a>
				 						</div>
				 						<div class="article-time" style="font-weight:normal;display:inline-block;width:20%;float:right;text-align: right;">
				 							<fmt:formatDate value="${article.createTime }" pattern="MM-dd"/>
				 						</div>
				 					</div>
				 				</c:if>
				 			</c:forEach>
				 		</div>
				 	</div>
				 	</c:forEach>
				 </div>
			 </div>
		 </div>
		 <div class="col-md-3" style="padding-left:0px;height:350px;margin-top:15px;">
		 	<div class="col-md-12 s-home-block" style="height: 100%;">
			 	<div class="row s-home-title">
			 		<div class="col-md-9">
			 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
		 				<div style="float: left;margin-left:10px;">业务办理</div>
			 		</div>
			 		<div class="col-md-3">&nbsp;</div>
			 	</div>
		 		<div class="row s-home-content" style="margin-top: 10px;margin-bottom:0px;padding:0px;">
			 		<div class="col-md-12 col-sm-12" style="text-align: center;padding:0px;">
			 			<div  style="margin: 0 auto;text-align: center;">
				 			<div style="margin:0 auto;width:48%;max-height:100px;display:inline-block;"><img  src="../img/home/icon01.png" style="cursor: pointer;max-height:100px;width:100%;" onclick="window.location.href='#'" /></div>
				 			<div style="margin:0 auto;width:48%;max-height:100px;display:inline-block;"><img  src="../img/home/icon02.png" style="cursor: pointer;max-height:100px;width:100%;" onclick="window.location.href='#'"/></div>
			 			</div>
			 			<div  style="margin: 0 auto;text-align: center;">
				 			<div style="margin:0 auto;width:48%;max-height:100px;display:inline-block;"><img  src="../img/home/icon03.png" style="cursor: pointer;max-height:100px;width:100%;" onclick="window.location.href='#'"/></div>
				 			<div style="margin:0 auto;width:48%;max-height:100px;display:inline-block;"><img  src="../img/home/icon04.png" style="cursor: pointer;max-height:100px;width:100%;" onclick="window.location.href='#'"/></div>
			 			</div>
			 			<div  style="margin: 0 auto;text-align:center;">
			 				<div style="margin:0 auto;width:96%;max-height:86px;"><img  src="../img/home/icon05.png" style="cursor: pointer;width:100%;height:86px;margin:0px;" onclick="window.location.href='#'" /></div>
			 			</div>
			 		</div>
			 	</div>
		 	</div>
		 </div>
	</div>
</div>
<div id="head-foot" class="row" style="">
	<div class="col-md-12" style="">
		<div class="col-md-9" style="">
		<c:forEach items="${categoryList}" var="category" varStatus="status" begin="2" >
			<c:if test="${status.index % 2 ==0 }">
			<div class="col-md-4" style="padding-left: 0px; margin-top:15px;height:275px;">
			 	<div class="col-md-12 s-home-block" style="height:100%;">
				 	<div class="row s-home-title">
				 		<div class="col-md-8">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">${category.categoryName }</div>
				 		</div>
				 		<div class="col-md-4" style="font-weight: normal;text-align:right;"><a href="<c:url value='/article/showArticle' />/${category.categoryId}" onclick="showArticleList()" target="articleIframe">更多&gt;&gt;</a></div>
				 	</div>
				 	<div class="row s-home-content">
				 		<div class="col-md-12" style="">
				 			<c:set var="articleCount" value="1"/>
				 			<c:forEach items="${articleList }" var="article" varStatus="index">
				 				<c:if test="${article.categoryId == category.categoryId && articleCount <= 6 }">
				 					<c:set var="articleCount" value="${articleCount+1 }"/>
				 					<div style="width:100%;line-height: 35px;">
				 						<div class="article-title" style="font-weight: normal;display:inline-block;width:80%;overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
				 						 	<a href="<c:url value='/article/homePreview' />/${article.articleId}" onclick="showArticleList()" target="articleIframe">${article.title }</a>
				 						</div>
				 						<div class="article-time" style="font-weight: normal;display:inline-block;width:20%;float:right;text-align: right;">
				 							<fmt:formatDate value="${article.createTime }" pattern="MM-dd"/>
				 						</div>
				 					</div>
				 				</c:if>
				 			</c:forEach>
				 		</div>
				 	</div>
			 	</div>
			 </div>
			 </c:if>
			 <c:if test="${status.index % 2 !=0 }">
			 <div class="col-md-8" style="padding:0px; margin-top:15px;height:275px;">
			 	<div class="col-md-12 s-home-block" style="height:100%;">
				 	<div class="row s-home-title">
				 		<div class="col-md-9" style="">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">${category.categoryName }</div>
				 		</div>
				 		<div class="col-md-3" style="font-weight: normal;text-align:right;"><a href="<c:url value='/article/showArticle' />/${category.categoryId}" onclick="showArticleList()" target="articleIframe">更多&gt;&gt;</a></div>
				 	</div>
				 	<div class="row s-home-content">
				 		<div class="col-md-12">
				 			<c:set var="articleCount" value="1"/>
				 			<c:forEach items="${articleList }" var="article">
				 				<c:if test="${article.categoryId == category.categoryId && articleCount <= 6 }">
				 					<c:set var="articleCount" value="${articleCount + 1 }"/>
				 					<div style="width:100%;line-height: 35px;font-size:15px;">
				 						<div class="article-title" style="font-weight: normal;display:inline-block;width:80%;overflow: hidden; white-space: nowrap;text-overflow: ellipsis;">
				 						 	<a href="<c:url value='/article/homePreview' />/${article.articleId}" onclick="showArticleList()" target="articleIframe">${article.title }</a>
				 						</div>
				 						<div class="article-time" style="font-weight: normal;display:inline-block;width:20%;float:right;text-align: right;font-weight: normal;">
				 							<fmt:formatDate value="${article.createTime }" pattern="MM-dd"/>
				 						</div>
			 						</div>
				 				</c:if>
				 			</c:forEach>
				 		</div>
				 	</div>
			 	</div>
			 </div>
			 </c:if>
			 </c:forEach>
			
			<div class="col-md-4" style="padding-top: 0px;margin-top: 15px; padding-left: 0px;">
			 	<div class="col-md-12 s-home-block" style="height:390px;">
				 	<div class="row s-home-title">
				 		<div class="col-md-8">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">组织架构</div>
				 		</div>
				 		<div class="col-md-4" style="text-align:right;"><a href="#">更多&gt;&gt;</a></div>
				 	</div>
				 	<div class="row s-home-content" style="padding:0px;">
				 		<div class="col-md-12" style="">
				 			<div style="cursor: pointer;margin-top:15px;border:1px solid #e5e5e5;" onclick="window.location.href='#'">
				 				<div style="float: left"><img src="../img/home/bumen01.png" /></div>
			 					<div style="padding-top: 5px;min-width: 240px;"> 
			 					<p><font style="color:#67809f ">消防护卫部</font><br/>
				 				<font style="color:#d0d0d0;font-size: 11px;">Fire department</font></p>
				 				</div>
				 			</div>
				 			<div style="cursor: pointer;margin-top:15px;border:1px solid #e5e5e5;" onclick="window.location.href='#'">
				 				<div style="float: left"><img src="../img/home/bumen02.png" /></div>
			 					<div style="padding-top:5px;min-width: 240px"> 
			 					<p><font style="color:#67809f ">网络信息部</font><br/>
				 				<font style="color:#d0d0d0;font-size: 11px">Network Information Department</font></p>
				 				</div>
				 			</div>
				 			<div style="cursor: pointer;margin-top:10px;border:1px solid #e5e5e5;" onclick="window.location.href='#'">
				 				<div style="float: left"><img src="../img/home/bumen03.png" /></div>
			 					<div style="padding-top:5px;min-width: 250px"> 
			 					<p><font style="color:#67809f ">商务管理部</font><br/>
				 				<font style="color:#d0d0d0;font-size: 11px">Business Management Department</font></p>
				 				</div>
				 			</div>
				 			<div style="cursor: pointer;margin-top:15px;border:1px solid #e5e5e5;" onclick="window.location.href='#'">
				 				<div style="float: left"><img src="../img/home/bumen04.png" /></div>
			 					<div style="padding-top:5px;min-width: 240px"> 
			 					<p><font style="color:#67809f ">机务工程部</font><br/>
				 				<font style="color:#d0d0d0;font-size: 11px">Engineering Department</font></p>
				 				</div>
				 			</div>
				 			<div style="cursor: pointer;margin-top:15px;margin-bottom:15px;border:1px solid #e5e5e5;" onclick="window.location.href='#'">
				 				<div style="float: left"><img src="../img/home/bumen05.png" /></div>
			 					<div style="padding-top:5px;min-width: 240px"> 
			 					<p><font style="color:#67809f ">机场急救中心</font><br/>
				 				<font style="color:#d0d0d0;font-size: 11px">Airport Emergency Center</font></p>
				 				</div>
				 			</div>
				 		</div>
				 	</div>
			 	</div>
			 	<div class="col-md-12 s-home-block" style="margin-top: 10px;height:172px;">
				 	<div class="row s-home-title">
				 		<div class="col-md-8">
				 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
			 				<div style="float: left;margin-left:10px;">通讯录</div>
				 		</div>
				 		<div class="col-md-4">&nbsp;</div>
				 	</div>
				 	<div class="row s-home-content" style="">
				 		<div class="col-md-12" style="text-align:center;padding:0px;">
				 			<div style="margin-top:8px;">电话：
					 			<span style="display:inline-block;min-width:179px;width:79%;">
					 			<input class="form-control" id="phone" placeholder="电话" style="width:100%;"></span>
				 			</div>
				 			<div style="margin-top:8px;">姓名：
				 			<span style="display:inline-block;min-width:179px;width:79%;">
				 				<input class="form-control" id="username" placeholder="姓名" style=""></span>
				 			</div>
				 			<div style="margin-top:8px;">
				 				<button type="submit" class="sbtn sbtn-blue" style="margin-left:10px;">搜索</button>
				 			</div>
				 		</div>
				 	</div>
			 	</div>
			 </div>
			<div class="col-md-8 s-home-block" style="margin-top: 15px;height:572px;">
			 	<div class="row s-home-title">
			 		<div class="col-md-9">
			 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
		 				<div style="float: left;margin-left:10px;">安全事件统计</div>
			 		</div>
			 		<div class="col-md-3">&nbsp;</div>
			 	</div>
		 		<div class="row s-home-content" style="padding:0px 15px 10px 15px;">
			 		<div class="col-md-12" style="padding:0px;">
			 			<div id="mymap" style="height: 500px;margin-top:20px;"></div>
			 		</div>
			 	</div>
			 </div>
		 </div>
		 <div class="col-md-3" style="padding-left:0px;">
		 	<div class="col-md-12 s-home-block" style="margin-top: 15px;height:863px;">
			 	<div class="row s-home-title">
			 		<div class="col-md-9">
			 			<div style="margin-top:10px;width: 4px;height: 20px;background-color: #67809f;float: left"></div>
		 				<div style="float: left;margin-left:10px;">安保日常值班</div>
			 		</div>
			 		<div class="col-md-3">&nbsp;</div>
			 	</div>
		 		<div class="row s-home-content">
			 		<div class="col-md-12" style="padding:0px;">
			 			<div class="s-home-dut">
			 				<div>运行指挥中心：李伟民</div>
			 				<div>安全检查总站：刘建宇</div>
			 				<div>公安局：范好铁</div>
			 				<div>地面服务部：赵娟</div>
			 				<div>货运部：李付军</div>
			 				<div>网络信息部：丁大勇</div>
			 				<div>候机楼管理部：张金山</div>
			 				<div>急救中心：马严</div>
			 				<div>机场保障部：王亚伟</div>
			 				<div>机务工程部：马新国</div>
			 				<div>贵宾服务部：岳志平</div>
			 				<div>指挥中心正常班人员：焦姣</div>
			 				<div>指挥中心正常班人员：王帆</div>
			 				<div>指挥中心正常班人员：王宏强</div>
			 				<div>指挥中心正常班人员：惠晶</div>
			 				<div>指挥中心正常班人员：靖小茹</div>
			 				<div>指挥中心正常班人员：杨泽</div>
			 				<div>指挥中心正常班人员：赵建明</div>
			 				<div>指挥中心正常班人员：秦文</div>
			 			</div>
			 		</div>
			 	</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function showArticleList(){
		$("#head-foot").hide();
    	$("#head-category").hide();
    	$("#sodb-article-area").show();
	}
</script>

</html>