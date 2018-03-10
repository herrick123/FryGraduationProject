<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/pages/inc/header.jsp"%>
<style type="text/css">
ol, ul, li {
    list-style: outside none none;
}

#pcha-process li {
    color: #888;
    float: left;
    position: relative;
    text-align: center;
}
#pcha-process li.step1 {
    text-align: left;
    width: 96px;
}
#pcha-process li.step1 p {
    margin-left: -0.8em;
}
#pcha-process li.step2 {
    width: 185px;
}
#pcha-process li.step3 {
    width: 145px;
}
#pcha-process li.step4 {
    width: 145px;
}
#pcha-process li.step5 {
    text-align: right;
    width: 65px;
}
.pcha_process_border {
    background: #e6e6e6 none repeat scroll 0 0;
    height: 7px;
    position: absolute;
    top: 9px;
    width: 100%;
    z-index: -1;
}
#pcha-process li i {
    background: #ccc none repeat scroll 0 0;
    border-radius: 50%;
    color: #fff;
    display: inline-block;
    font-weight: bold;
    height: 24px;
    line-height: 24px;
    margin-bottom: 7px;
    text-align: center;
    width: 24px;
}
#pcha-process li.step5 i {
}
#pcha-process li.active {
    color: #009251;
}
#pcha-process li.active i, #pcha-process li.active .pcha_process_border {
    background: #009251 none repeat scroll 0 0;
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
			<a href="#">安全事件处置</a>
			<i class="fa fa-angle-right"></i>
		</li>
		<li><a href="#">安全事件接警</a></li>
	</ul> 
</div>
<div id="pcha-process" class="floatright">
	<ul>
		<li class="step1 active"><i>1</i><p>提交订单</p><div class="pcha_process_border"></div></li>
		<li class="step2 active"><i>2</i><p>签订合同和托管资金</p><div class="pcha_process_border"></div></li>
		<li class="step3"><i>3</i><p>服务商提供服务</p><div class="pcha_process_border"></div></li>
		<li class="step5"><i>4 </i><p>评价</p><div class="pcha_process_border"></div></li>
	</ul>
</div>
<nav class='navbar navbar-default' role='navigation'>
            <div class='navbar-header'>
                <button class='navbar-toggle' data-toggle='collapse' data-target='#showBlock'>
                    <span class='icon-bar'></span>
                    <span class='icon-bar'></span>
                    <span class='icon-bar'></span>
                </button>
                <a class='navbar-brand'>快速导航</a>
            </div>
            <div class='collapse navbar-collapse' id='showBlock'>
                <ul class='nav navbar-nav'>
                    <li><a href='#'>华为</a></li>
                    <li><a href='#'>努比亚</a></li>
                    <li><a href='#'>小米</a></li>
                </ul>
            </div>
        </nav>
<div class="modal fade" tabindex="-1" role="dialog" id="sodbtestGlobalModal" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width:800px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">提示</h4>
	        </div>
	        <div class="modal-body">
	        <div style="clear:both;"></div>
	        	<div id="pcha-process" class="floatright">
					<ul>
						<li class="step1 active"><i>1</i><p>提交订单</p><div class="pcha_process_border"></div></li>
						<li class="step2 active"><i>2</i><p>签订合同和托管资金</p><div class="pcha_process_border"></div></li>
						<li class="step3"><i>3</i><p>服务商提供服务</p><div class="pcha_process_border"></div></li>
						<li class="step4"><i>4</i><p>确认付款</p><div class="pcha_process_border"></div></li>
						<li class="step5"><i>5</i><p>评价</p><div class="pcha_process_border"></div></li>
					</ul>
				</div>
	        </div>
	        <div class="modal-footer">
	            <button type="button" id="hideGlobalModalBtn" class="btn btn-primary">确定</button>
	        </div>
        </div>
    </div>
</div>
<div style="height:400px;text-align:center;margin-top:200px;">
<div class="row">
	<div class="col-md-6" style="text-align:right;">
		<div style="line-height:55px;">class="sbtn sbtn-blue"</div>
		<div style="line-height:55px;">class="sbtn sbtn-default"</div>
		<div style="padding-top:0px;line-height:55px;">class="sbtn sbtn-blue"</div>
		<div style="padding-top:0px;line-height:55px;">class="sbtn sbtn-default"</div>
		<div style="padding-top:0px;line-height:55px;">class="sbtn sbtn-blue sbtn30"</div>
		<div style="padding-top:0px;line-height:55px;">class="sbtn sbtn-default sbtn30"</div>
		<div style="padding-top:0px;line-height:55px;">在录入或编辑页面，两个按钮之间的间距为45px</div>
	</div>
	<div class="col-md-6" style="text-align:left;">
		<div style="padding-top:20px;"><button type="button" id="showTestLC" class="sbtn sbtn-blue">查询</button></div>
		<div style="padding-top:20px;"><button type="button" class="sbtn sbtn-default">查询</button></div>
		<div style="padding-top:20px;"><button type="button" class="sbtn sbtn-blue">安全事件录入</button></div>
		<div style="padding-top:20px;"><button type="button" class="sbtn sbtn-default">安全事件录入</button></div>
		<div style="padding-top:20px;"><button type="button" class="sbtn sbtn-blue sbtn30">提交</button></div>
		<div style="padding-top:20px;"><button type="button" class="sbtn sbtn-default sbtn30">返回</button></div>
		<div style="padding-top:20px;">
			<button type="button" class="sbtn sbtn-blue sbtn30">提交</button>
			<button type="button" class="sbtn sbtn-default sbtn30" style="margin-left:45px;">返回</button>
		</div>
	</div>
</div>
</div>
</body>
<script type="text/javascript">
$("#showTestLC").click(function(){
	$('#sodbtestGlobalModal').modal('show')
})
</script>
</html>