<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/pages/inc/header.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员首页</title>
<script src="<%=path %>/js/newCalendar/calendar.js/"></script>
<link rel="stylesheet" href="<%=path %>/css/calender.css">
</head>
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
<div id="demo">
    <div id="ca"></div>
</div>
<script>
    $('#ca').calendar({
        width: 380,
        height: 320,
        data: [
            {
                date: '2017/12/24',
                value: 'Christmas Eve'
            },
            {
                date: '2017/12/25',
                value: 'Merry Christmas'
            },
            {
                date: '2017/01/01',
                value: 'Happy New Year'
            }
        ],
        onSelected: function (view, date, data) {
            console.log('view:' + view)
            alert('date:' + date)
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