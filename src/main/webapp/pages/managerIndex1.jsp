<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<link rel="stylesheet" type="text/css" href="<%=path %>/css/bootstrapValidator.min.css" />
<script type="text/javascript" src="<%=path %>/js/bootstrapValidator.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<script src="<%=path %>/js/tree/layout.js" type="text/javascript"></script>
<script src="<%=path %>/js/echarts.min.js"></script>
<script src="<%=path %>/js/newCalendar/calendar.js/"></script>
<link rel="stylesheet" href="<%=path %>/css/calender.css">
<style>
button{
	margin-right:20px;
	border:1px solid #67809f;
	background-color:#67809f;
	color:#fff;
}
tr{
	margin-top:3px;
	margin-bottom:10px;
}
td{
    text-align: right;
    background-color:rgba(153, 153, 153, 0.08);
}
</style>
<style type="text/css">
	html {
		font: 500 14px 'roboto';
		color: #333;
		background-color: #fafafa;
	}
	a {
		text-decoration: none;
	}
	ul, ol, li {
		list-style: none;
		padding: 0;
		margin: 0;
	} 
	#demo {
		width: 380px;
		margin: 150px auto;
	}
	p {
		margin: 0;
	}
	#dt {
		margin: 30px auto;
		height: 28px;
		width: 200px;
		padding: 0 6px;
		border: 1px solid #ccc;
		outline: none;
	}
</style>
</head>
<body>
<div class="sodb-page-home">
	<ul class="sodb-page-ul" style="margin-left: 44px;">
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
		<div class="col-md-12 column" >
			<div class="btn-group" style="margin-top:30px;float:right;">
				 <button class="btn btn-default" type="button" style="border:1px solid #67809f;background-color:#67809f;color:#fff;">成立训练营</button> 
				 <button class="btn btn-default" type="button" style="border:1px solid #67809f;background-color:#67809f;color:#fff;">建立项目</button> 
				 <button class="btn btn-default" type="button" style="border:1px solid #67809f;background-color:#67809f;color:#fff;">移除项目人员</button> 
			</div>
		</div>
	</div>
	<hr>
	<div class="row clearfix" style="border:1px solid rgba(153, 153, 153, 0.59)">
		<div class="col-md-12 column" >
			<div class="col-md-12 column">
				<span style="margin-top:5px;margin-bottom:5px;margin-left:30px;"><h3>&nbsp;&nbsp;&nbsp;&nbsp;项目人员统计</h3></span>
			</div>
			<div class="row clearfix">
				<div class="col-md-4" style="height:350px;background-color:rgba(153, 153, 153, 0.08);margin-left:40px;margin-right:20px;margin-bottom:20px;">
					<table>
						<tr>
							<td>总&nbsp;&nbsp;人&nbsp;&nbsp;数：</td>
							<td>
								<input type="text" class="form-control" style="margin-top:10px;"/>
							</td>
						</tr>
						<tr>
							<td>在项目组人数：</td>
							<td><input type="text" class="form-control" style="margin-top:10px;"/></td>
						</tr>
						<tr>
							<td>空&nbsp;闲&nbsp;人&nbsp;数：</td>
							<td><input type="text" class="form-control" style="margin-top:10px;"/></td>
						</tr>
						<tr>
							<td>传统村落评审系统：</td>
							<td><input type="button" class="form-control" style="margin-top:10px;"/></td>
						</tr>
						<tr>
							<td>学员管理系统：</td>
							<td><input type="button" class="form-control" style="margin-top:10px;"/></td>
						</tr>
					</table>
					<p>
						 <a class="btn" href="#" style="float:right;margin-top:75px;">查看更多 »</a>
					</p>
				</div>
				<div class="col-md-6" style="height:350px;background-color:rgba(153, 153, 153, 0.08);margin-left:40px;margin-right:20px;margin-bottom:20px;">
					<div id="demo">
					    <div id="ca" style="margin-top:-120px"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
	<div class="row clearfix" style="border:1px solid rgba(153, 153, 153, 0.59)">
		<div class="col-md- column">
			<div class="col-md-12 column" >
				<div>
					<div style="margin-top:10px;margin-left:25px;margin-right:25px;">
						<span style="float:right;"><a><h4>请假审批 >></h></a></span>
					</div>
				</div>
				<div id="chart" style="width: 1100px;height:400px;margin-top:75px;">
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var myChart = echarts.init(document.getElementById('chart'));
	 var option = {
	            title: {
	                text: '猛码科技请假表'
	            },
	            tooltip: {},
	            legend: {
	                data:['请假天数']
	            },
	            xAxis: {
	                data: ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月",],
	                boundaryGap: [0, 0.001]
	            },
	            yAxis: {},
	            series: [{
	                name: '销量',
	                type: 'bar',
	                data: [5, 20, 36, 10, 10, 20,15,18,12,13,7,8]
	            }]
	        };
	 myChart.setOption(option);
</script>
<script>
    $('#ca').calendar({
        width: 380,
        height: 320,
        data:[],
        onSelected: function (view, date, data) {
         console.log('view:' + view)
         alert('date:' + date);
         console.log('date:' + date);
        /*  $.ajax({
     	    type: "POST",
     	    dataType: "json",
     	    url: "<c:url value='/calendar/' />",
     	    data: "areaId="+areaId,
     	    success : function(Data, textStatus) {
     	    	console.log("areaId"+areaId);
     	     var issue = Data.trainingEntities;
     	     if(textStatus == 'success'){
     		   html ='<select name="issueId" id="issueId" class="form-control" onchange="'+getIssue()+'">';
     				   for(var i=0;i<issue.length;i++){
     					  html += '<option value ="'+ issue[i].id +'">'+ issue[i].issue +'</option>';
     				   }
     	       html += '</select>';
     	       html += '<input type="hidden" id="issueName" name="issueName" value=""> ';
     		   $("#trainIssue").html(html);
     	     }else{
     	     	showMsg('失败！请联系开发人员！');
     	     }
     	    },
     	    error: function(data) {
     	    	showMsg("服务器异常，稍后尝试");
     	    }
     	   }); */
         /* SimpleDateFormat format = new SimpleDateFormat("EEE MMM dd yyyy HH:mm:ss z", Locale.ENGLISH);
         Date dateTrans = null;
         dateTrans = format.parse(date);
         var str = SimpleDateFormat("yyyy-MM-dd").format(dateTrans).replace("-","/");
         console.log('转换后的时间：'+str); */
         console.log('data:' + (data || 'None'));
        }
    });

    $('#dd').calendar({
        trigger: '#dt',
        zIndex: 999,
        format: 'yyyy-mm-dd',
        onSelected: function (view, date, data) {
            console.log('event: onSelected')
        },
        onClose: function (view, date, data) {
            console.log('event: onClose')
            console.log('view:' + view)
            console.log('date:' + date)
            console.log('data:' + (data || 'None'));
        }
    });
</script>
</body>
</html>