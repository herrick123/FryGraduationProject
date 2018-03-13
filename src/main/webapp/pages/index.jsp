<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<%
	String pageId = (String)request.getParameter("pageId");
%>
</head>

<body class="sodb_index_body">
<diV id="sodb-home-top" class="sodb_head sodb-index-home-bt">
	<div class="sodb-menu-icon">&nbsp;</div>
	<div class="sodb-menu-context">
		<div class="sodb-menu-context-list" left-menu="menu-sys">
			<div class="sodb-menu-context-top sodb-menu-context-top-sys">&nbsp;</div>
			<div class="sodb-menu-context-bottom">应急救援管理</div>
		</div>
	</div>
	<div class="sodb-menu-top-right-area">
		<span class="sodb-menu-top-right-area-user">管理员，您好！</span>
		<span id="exitSys" class="sodb-menu-top-right-area-exit">退出</span>
	</div>
</diV>
<div id="sodb-index-area" class="sodb-index-home" style="display: none"> 
	<%@include file="/pages/home.jsp"%>
</div>
<div id="sodb-context-area" class="row" style="display:block">
	<div class="col-md-2">
		<div class="f-aside">
			<div id="menu-comp" class="sodb-menu-area">
	           	<div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/securityMonitoring/pilot/pilotcockpit_list.jsp">
	               	<div class="f-menu-item f-menu-u">
	                   	<span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
	                   	<span class="context">安全管控驾驶舱</span>
	               	</div>
	           	</div>       
            </div>        
          	<div id="menu-sys" class="sodb-menu-area">
          		<div class="f-menu">
          			 <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/maintainPlan.jsp">
	            	<div class="f-menu-title" >
	                	<span class="f-title">应急救援预案管理</span>
	                	
	            	</div>
	            	</div>
	            	 <%--   <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/maintainPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div> --%>
		            	<%--    <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/preceptList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援方案配置</span>
		                </div>
		            </div> --%>
	          		<%-- <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div> --%>
		           <%--     <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/planList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">预案模板管理</span>
		                </div>
		                
		            </div> --%>
		        </div>
		        <div class="f-menu">
		        
	            	<div class="f-menu-title">
	                	<span class="f-title">检查单管理</span>
	                	<span class="f-mark"></span>
	            	</div>
	            		<div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/checkList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">检查单管理列表</span>
		                </div>
		            </div>
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/checkRecord.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">已发布检查单列表</span>
		                </div>
		            </div>
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/checkRecordList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">检查单记录列表</span>
		                </div>
		            </div>
		           <%--    <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/addArticle.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">测试</span>
		                </div>
		            </div> --%>
		        </div>
					<div class="f-menu">
					   <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/emergencyIntegrate/emergencyEventManage/emergencyEventManage.jsp">
	            	<div class="f-menu-title">
	                	<span class="f-title">应急救援指挥协调</span>
	                	
	            	</div>
	            	</div>
	          		<%--  <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div>  --%>
		       <%--      <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/emergencyIntegrate/emergencyEventManage/emergencyEventManage.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救事件管理</span>
		                </div>
		            </div> --%>
		        </div>
		          <div class="f-menu">
		           <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/sandTable/sandTable.jsp">
	            	<div class="f-menu-title">
	                	<span class="f-title">应急救援演练</span>
	                	
	            	</div>
	            	</div>
	          		<%--  <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div>  --%>
		          <%--   <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/sandTable/sandTable.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">电子沙盘</span>
		                </div>
		            </div> --%>
		        </div>
				
		        <div class="f-menu">
		        <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/assessmentList.jsp">
		        	<div class="f-menu-title">
	                	<span class="f-title">应急救援评估管理</span>
	                	
	            	</div>
	            	</div>
	            	<%-- <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/assessmentList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援评估管理</span>
		                </div>
		            </div> --%>
		        </div>
		        <div class="f-menu">
	            	<div class="f-menu-title">
	                	<span class="f-title">应急救援培训管理</span>
	                	<span class="f-mark"></span>
	            	</div>
	          		<%--  <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div>  --%>
		             <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/organization.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">机构管理</span>
		                </div>
		            </div>
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/cultivate.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援培训方案管理</span>
		                </div>
		            </div>
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/plan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援培训计划管理</span>
		                </div>
		            </div>
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/planCheck.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援培训计划管理（管理员）</span>
		                </div>
		            </div>
		             <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-plancultivate/cultivateSummaryList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援培训总结管理</span>
		                </div>
		            </div>
		        </div>
		        <div class="f-menu">
		        	<div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre- knowledge/knowledge.jsp">
		        	<div class="f-menu-title">
	                	<span class="f-title">应急知识库管理</span>
	                	
	            	</div>
	            	</div>
	          <%--   	<div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre- knowledge/knowledge.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急知识库管理</span>
		                </div>
		            </div> --%>
		        </div>
		        
		         <div class="f-menu">
		         <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/resourceManage/resourceList.jsp">
		        	<div class="f-menu-title">
	                	<span class="f-title">应急救援资源管理</span>
	                	
	            	</div>
	            	</div>
	            <%-- 	<div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/resourceManage/resourceList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援资源管理</span>
		                </div>
		            </div> --%>
		        </div>
		        <div class="f-menu">
		        <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-personnel/personnel.jsp">
		        	<div class="f-menu-title">
	                	<span class="f-title">应急人员管理</span>
	                	
	            	</div>
	            	</div>
	            	<%-- <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-personnel/personnel.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急人员管理</span>
		                </div>
		            </div> --%>
		        </div>
			<%-- 	<div class="f-menu">
	            	<div class="f-menu-title">
	                	<span class="f-title">应急救援指挥协调</span>
	                	<span class="f-mark"></span>
	            	</div>
	          		 <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div> 
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/emergencyIntegrate/emergencyEventManage/emergencyEventManage.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援事件处置</span>
		                </div>
		            </div>
		        </div> --%>
		        
		      <%--   <div class="f-menu">
	            	<div class="f-menu-title">
	                	<span class="f-title">应急救援演练</span>
	                	<span class="f-mark"></span>
	            	</div>
	          		 <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div> 
		            <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/sandTable/sandTable.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">电子沙盘</span>
		                </div>
		            </div>
		        </div> --%>
		         <div class="f-menu">
		              <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-statisticalQuery/statisticalList.jsp">
	            	<div class="f-menu-title">
	                	<span class="f-title">统计查询</span>
	                	
	            	</div>
	            	</div>
	          		<%--  <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div>  --%>
		         <%--    <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/pre-statisticalQuery/statisticalList.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">统计</span>
		                </div>
		            </div> --%>
		        </div>
		         <div class="f-menu">
		           <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/treeSafeguard.jsp">
	            	<div class="f-menu-title">
	                	<span class="f-title">组织结构</span>
	                	
	            	</div>
	            	</div>
	          		<%--  <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/contingencyPlan.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">应急救援预案管理</span>
		                </div>
		            </div>  --%>
		      <%--       <div class="f-menu-list" onclick="javascript:switchFrame(this);" menu-url="<%=path %>/pages/Pre-PlanManageMent/treeSafeguard.jsp">
		                <div class="f-menu-item">
		                    <span class="f-mark-icon"><img src="<%=path %>/img/menu/security_cockpit.png" alt=""></span>
		                    <span class="context">树型维护</span>
		                </div>
		            </div> --%>
		        </div>
          	</div>
    	</div>
	</div>
	<div class="col-md-10" style="background-color: #dfdede;padding:0px;">
		<iframe id="mainFrame" name="mainFrame" frameborder="0" style="width:100%;min-height: 800px;" src="#"></iframe>
	</div>
</div>
</body>
<script type="text/javascript">
$(function(){
    initMenu();
    setIFrameHeight();
})

<%-- function initMenu(){
	$("#sodb-index-area").hide();
	$("#sodb-context-area").show();
    $(".f-aside").on('click',".f-menu-title",function(){
        $(this).parent().siblings().removeClass("active");
        $(this).parent().toggleClass("active");
    })
    
    if("real" == "<%=pageId%>"){
    	realbackurl();
    }
    /* setTimeout(function(){
		$(".f-aside").find("div[class='sodb-menu-area']:first").show();
		$(".f-aside").find("div[class='f-menu-list']:first").addClass('f-menu-click-background');
    },"500"); */
} --%>

/* function setIFrameHeight(){
	$("#mainFrame").load(function(){
		$(this).height(0);
		var mainheight = $(this).contents().height() + 30 ;
		$(this).height(mainheight);
	});
} */

$(".sodb-menu-context-list").click(function(){
    $(this).siblings().removeClass("sodb-menu-bk");
    $(this).addClass('sodb-menu-bk');
    $(".f-menu").removeClass("active");
	$(".f-menu-list").each(function () {
        $(this).removeClass('f-menu-click-background');
    });
    var leftMenu = $(this).attr('left-menu');
    if(leftMenu == 'index-area'){
    	$("#sodb-index-area").show();
    	$("#sodb-context-area").hide();
    	$("#sodb-home-top").addClass("sodb-index-home-bt");
    }else{
    	$("#sodb-home-top").removeClass("sodb-index-home-bt");
    	$("#sodb-index-area").hide();
    	$("#sodb-context-area").show();
        $(".sodb-menu-area").each(function () {
            $(this).show();
        });
        $("#" + leftMenu).show();

    	$("#" + leftMenu).find("div[class='f-menu-list']:first").trigger("click");
    }
})

/* function switchFrame(obj){
	$(".f-menu-list").each(function () {
        $(this).removeClass('f-menu-click-background');
    });
	$(obj).addClass('f-menu-click-background');
	var url = $(obj).attr('menu-url');
	$("#mainFrame").attr("src", url);
	setIFrameHeight();
} */
$("#exitSys").click(function(){
	window.location.href = "/sodb";
})

/* function realbackurl(){
	$("#sodb-index-area").hide();
	$("#sodb-context-area").show();

    $(".f-aside").on('click',".f-menu-title",function(){
        $(this).parent().siblings().removeClass("active");
        $(this).parent().toggleClass("active");
    })
    
	$(".sodb-menu-context-list").each(function () {
        $(this).removeClass('sodb-menu-bk');
    });
	$("#menu_comp_list").addClass('sodb-menu-bk');
	$("#menu_comp_list").trigger("click");

    $(".f-aside").on('click',".f-menu-title",function(){
        $(this).parent().siblings().removeClass("active");
        $(this).parent().toggleClass("active");
    })
    
	$(".f-menu-list").each(function () {
        $(this).removeClass('f-menu-click-background');
    });
	$("#menu-real-page").addClass('f-menu-click-background');

	$("#menu-real-page").trigger("click");
} */
</script>
</html>