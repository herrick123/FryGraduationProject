var path = "/qdsodb";

$("#backBtn").click(function() {
	window.location.href = '<c:url value="/quartz/page" />';
})

	
function changeExecuteParam() {
	var value = $("#cronType").val();
	$("#year").empty();
	$("#month").empty();
	$("#day").empty();
	$("#hour").empty();
	$("#minute").empty();
	$("#second").empty();
	
	if (value == '1') {
		document.getElementById('executeParamDiv2').style.display = 'block';
		document.getElementById('executeParamDiv3').style.display = 'block';
		document.getElementById('executeParamDiv4').style.display = 'none';
		document.getElementById('executeParamDiv5').style.display = 'none';
		document.getElementById('executeParamDiv6').style.display = 'block';
		document.getElementById('executeParamDiv7').style.display = 'block';
		
		for (var i = 1; i <= 28; i++) {
			$("#day").append("<option value='"+i+"'>" + i + "日</option>");
		}
		$("#day").append("<option value='L'>最后一天</option>");
		for (var i = 0; i <= 23; i++) {
			$("#hour").append("<option value='"+i+"'>" + i + "时</option>");
		}
		for (var i = 0; i <= 59; i++) {
			$("#minute").append("<option value='"+i+"'>" + i + "分</option>");
		}
		for (var i = 0; i <= 59; i++) {
			$("#second").append("<option value='"+i+"'>" + i + "秒</option>");
		}
	} else if (value == '2') {
		document.getElementById('executeParamDiv2').style.display = 'block';
		document.getElementById('executeParamDiv3').style.display = 'block';
		document.getElementById('executeParamDiv4').style.display = 'none';
		document.getElementById('executeParamDiv5').style.display = 'none';
		document.getElementById('executeParamDiv6').style.display = 'block';
		document.getElementById('executeParamDiv7').style.display = 'block';
		var weekArray = [ '星期天', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六' ];
		for (var i = 1; i <= 7; i++) {
			//					var Ele1 = document.createElement('option');
			//					Ele1.setAttribute('value',i);
			//					Ele1.text = (weekArray[i-1]);
			$("#day").append(
					"<option value='"+i+"'>" + weekArray[i - 1]
							+ "</option>");
		}
		for (var i = 0; i <= 23; i++) {
			$("#hour").append("<option value='"+i+"'>" + i + "时</option>");
		}
		for (var i = 0; i <= 59; i++) {
			$("#minute").append("<option value='"+i+"'>" + i + "分</option>");
		}
		for (var i = 0; i <= 59; i++) {
			$("#second").append("<option value='"+i+"'>" + i + "秒</option>");
		}
	} else if (value == '3') {
		document.getElementById('executeParamDiv2').style.display = 'none';
		document.getElementById('executeParamDiv3').style.display = 'block';
		document.getElementById('executeParamDiv4').style.display = 'none';
		document.getElementById('executeParamDiv5').style.display = 'none';
		document.getElementById('executeParamDiv6').style.display = 'block';
		document.getElementById('executeParamDiv7').style.display = 'block';
		for (var i = 0; i <= 23; i++) {
			$("#hour").append("<option value='"+i+"'>" + i + "时</option>");
		}
		for (var i = 0; i <= 59; i++) {
			$("#minute").append("<option value='"+i+"'>" + i + "分</option>");
		}
		for (var i = 0; i <= 59; i++) {
			$("#second").append("<option value='"+i+"'>" + i + "秒</option>");
		}
	} else if (value == '4') {
		document.getElementById('executeParamDiv2').style.display = 'none';
		document.getElementById('executeParamDiv3').style.display = 'block';
		document.getElementById('executeParamDiv4').style.display = 'none';
		document.getElementById('executeParamDiv5').style.display = 'none';
		document.getElementById('executeParamDiv6').style.display = 'none';
		document.getElementById('executeParamDiv7').style.display = 'none';
		for (var i = 1; i <= 23; i++) {
			$("#hour").append("<option value='"+i+"'>" + i+ "时</option>");
		}
	} else if (value == '5') {
		document.getElementById('executeParamDiv2').style.display = 'none';
		document.getElementById('executeParamDiv3').style.display = 'none';
		document.getElementById('executeParamDiv4').style.display = 'none';
		document.getElementById('executeParamDiv5').style.display = 'none';
		document.getElementById('executeParamDiv6').style.display = 'block';
		document.getElementById('executeParamDiv7').style.display = 'none';
		$("#minute").empty();
		for (var i = 1; i <= 59; i++)  {
			$("#minute").append("<option value='"+i+"'>" + i + "分</option>");
		}
	}

	else if (value == '6') {
		document.getElementById('executeParamDiv2').style.display = 'none';
		document.getElementById('executeParamDiv3').style.display = 'none';
		document.getElementById('executeParamDiv4').style.display = 'none';
		document.getElementById('executeParamDiv5').style.display = 'none';
		document.getElementById('executeParamDiv6').style.display = 'none';
		document.getElementById('executeParamDiv7').style.display = 'block';
		$("#second").empty();
		for (var i = 1; i <= 59; i++) {
			$("#second").append("<option value='"+i+"'>" + i + "秒</option>");
		}

	} else if (value == '7') {
		document.getElementById('executeParamDiv2').style.display = 'block';
		document.getElementById('executeParamDiv3').style.display = 'block';
		document.getElementById('executeParamDiv4').style.display = 'block';
		document.getElementById('executeParamDiv5').style.display = 'block';
		document.getElementById('executeParamDiv6').style.display = 'block';
		document.getElementById('executeParamDiv7').style.display = 'block';

		var myDate = new Date();

		var myYear = myDate.getFullYear();
		var myMonth = myDate.getMonth() + 1;
		var myDay = myDate.getDate();
		$("#year").empty();
		for (var i = 0; i < 11; i++) {
			var year = myYear + i;
			$("#year").append("<option value="+year+">" + year + "年</option>");
		}
		var year = document.getElementById("year").value;
		//月
		$("#month").empty();
		if(parseInt(year) == myYear){
			for (var i = myMonth; i <= 12; i++) {
				$("#month").append("<option value='"+i+"'>" + i + "月</option>");
			}
		}else{
			for (var i = 1; i <= 12; i++) {
				$("#month").append("<option value='"+i+"'>" + i + "月</option>");
			}
		}
		
		//日
		$("#day").empty();
		for (var i = myDay; i <= 31; i++) {
			$("#day").append("<option value='"+i+"'>" + i + "日</option>");
		}
		//时
		$("#hour").empty();
		for (var i = 0; i <= 23; i++) {
			$("#hour").append("<option value='"+i+"'>" + i + "时</option>");
		}
		//分
		$("#minute").empty();
		for (var i = 0; i <= 59; i++) {
			var Ele5 = document.createElement('option');
			Ele5.setAttribute('value', i);
			Ele5.text = (i + '分');
			$("#minute").append("<option value='"+i+"'>" + i + "分</option>");
		}
		//秒
		$("#second").empty();
		for (var i = 0; i <= 59; i++) {
			$("#second")
					.append("<option value='"+i+"'>" + i + "秒</option>");
		}

	}
}
function changeM(){
	var myDate = new Date();
	var myYear = myDate.getFullYear();
	var year = document.getElementById("year").value;
	var myMonth = myDate.getMonth() + 1;
	$("#month").empty();
	if(parseInt(year) == myYear){
		for (var i = myMonth; i <= 12; i++) {
			$("#month").append("<option value='"+i+"'>" + i + "月</option>");
		}
	}else{
		for (var i = 1; i <= 12; i++) {
			$("#month").append("<option value='"+i+"'>" + i + "月</option>");
		}
	}
}

function change(){
	var myDate = new Date();
	var myYear = myDate.getFullYear();
	var myMonth = myDate.getMonth() + 1;
	var myDay = myDate.getDate();
	document.getElementById("day").options.length=0;
	var year = document.getElementById("year").value;
	//月
	
	var month = document.getElementById("month").value;
	
	var day = 0;
		if(month == 2){
			if((year % 4 == 0 && year % 100 != 0)||year % 400 == 0){
				day = 29;
			}else{
				day = 28;
			}
		}else if(month == 4 || month == 6 || month == 9 || month == 11){
			day = 30;
		}else{
			day = 31;
		}
	
	document.getElementById("day").options.length = 0;
	if(myMonth == parseInt(month)){
		for(var i = myDay;i <= day;i++){
			var options = new Option(i,i);
			document.getElementById("day").add(options);
		}
	}else{
		for(var i = 1;i <= day;i++){
			var options = new Option(i,i);
			document.getElementById("day").add(options);
		}
	}
	
	
}