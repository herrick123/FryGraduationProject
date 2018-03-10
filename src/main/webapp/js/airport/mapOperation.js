var images = [ '<%=path%>/img/equipment/grey.png',
		'<%=path%>/img/equipment/blue.png' ];
function ico1() {
	if ($(".right-cover1").is(":hidden")) {
		$(".right-cover1").show();
	} else {
		$(".right-cover1").hide();
	}
	return false;
}
function ico2() {
	if ($(".right-cover2").is(":hidden")) {
		$(".right-cover2").show();
	} else {
		$(".right-cover2").hide();
	}
	return false;
}
function ico3() {
	if ($(".right-cover3").is(":hidden")) {
		$(".right-cover3").show();
	} else {
		$(".right-cover3").hide();
	}
	return false;
}
function ico4() {
	if ($(".right-cover4").is(":hidden")) {
		$(".right-cover4").show();
	} else {
		$(".right-cover4").hide();
	}
	return false;
}
function ico5() {
	if ($(".right-cover5").is(":hidden")) {
		$(".right-cover5").show();
	} else {
		$(".right-cover5").hide();
	}
	return false;
}
function ico6() {
	if ($(".right-cover6").is(":hidden")) {
		$(".right-cover6").show();
	} else {
		$(".right-cover6").hide();
	}
	return false;
}
function ico7() {
	if ($(".right-cover7").is(":hidden")) {
		$(".right-cover7").show();
	} else {
		$(".right-cover7").hide();
	}
	return false;
}

function changeimg1() {
	if ($("#img1").attr("class") == "up") {
		$("#img1").attr("src", images[1]);
		$("#window1").show();
		$("#img1").removeClass();
	} else {
		$("#img1").attr("src", images[0]);
		$("#window1").hide();
		$("#img1").addClass("up");
	}
}
function changeimg2() {
	if ($("#img2").attr("class") == "up") {
		$("#img2").attr("src", images[1]);
		$("#window2").show();
		$("#img2").removeClass();
	} else {
		$("#img2").attr("src", images[0]);
		$("#window2").hide();
		$("#img2").addClass("up");
	}
}

function changeimg3() {
	if ($("#img3").attr("class") == "up") {
		$("#img3").attr("src", images[1]);
		$("#img3").removeClass();
	} else {
		$("#img3").attr("src", images[0]);
		$("#img3").addClass("up");
	}
}
function changeimg4() {
	if ($("#img4").attr("class") == "up") {
		$("#img4").attr("src", images[1]);
		$("#img4").removeClass();
	} else {
		$("#img4").attr("src", images[0]);
		$("#img4").addClass("up");
	}
}
function changeimg5() {
	if ($("#img5").attr("class") == "up") {
		$("#img5").attr("src", images[1]);
		$("#img5").removeClass();
	} else {
		$("#img5").attr("src", images[0]);
		$("#img5").addClass("up");
	}
}
function changeimg6() {
	if ($("#img6").attr("class") == "up") {
		$("#img6").attr("src", images[1]);
		$("#img6").removeClass();
	} else {
		$("#img6").attr("src", images[0]);
		$("#img6").addClass("up");
	}
}
function changeimg7() {
	if ($("#img7").attr("class") == "up") {
		$("#img7").attr("src", images[1]);
		$("#img7").removeClass();
	} else {
		$("#img7").attr("src", images[0]);
		$("#img7").addClass("up");
	}
}

//机场全貌
function qm(){
	$("#map").hide();
	$("#map2").show();
	//map2.setZoom(17);
	map.resize();
	$(".jpull-down").hide();
	$("#changeAddress").text("机场全貌");
}

//安检中心切换
function anjianzhongxin(){
	$("#map").show();
	$("#map2").hide();
	//map.setZoom(22);
	map.resize();
	$(".jpull-down").hide();
	$("#changeAddress").text("国际安检中心");
}



//全屏
function quanping(){
	var homeTop = window.parent.document.getElementById("sodb-home-top");
	var contextArea = window.parent.document.getElementById("sodb-context-area").children[0];
	var quanpingMap = window.parent.document.getElementById("sodb-context-area").children[1];
	if(homeTop.style.display!="none"){
		homeTop.style.display="none";
		contextArea.style.display="none";
		quanpingMap.className = "col-md-12";
		map.resize();
	}else{
		homeTop.style.display="block";
		contextArea.style.display="block";
		quanpingMap.className = "col-md-10";
		map.resize();
	}
}


$(function() {
	$('#window1').dragDrop();
	$('#window1').css({
		'position' : 'absolute',
		'left' : '66%',
		'top' : '10%',
		'diplay' : 'none',
		'z-index' : '50'
	}); // window1初始位置
	$('#window2').dragDrop();
	$('#window2').css({
		'position' : 'absolute',
		'left' : '66%',
		'top' : '15%',
		'diplay' : 'none',
		'z-index' : '50'
	}); // window2初始位置
	$("#qiehuan").click(function() {
		if ($(".jpull-down").is(":hidden")) {
			$(".jpull-down").show();
		} else {
			$(".jpull-down").hide();
		}
	});
	$("#changeAddress").click(function() {
		if ($(".jpull-down").is(":hidden")) {
			$(".jpull-down").show();
		} else {
			$(".jpull-down").hide();
		}
	});
	$("#gongju").click(function() {
		if ($(".gpull-down").is(":hidden")) {
			$(".gpull-down").show();
		} else {
			$(".gpull-down").hide();
		}
	});
	
	
	// click map to add marker 点击地图添加点（摄像头）
	/*
	 * $("#huadian").click(function(){ map.on('click', function (e) {
	 * addMarker(e.lngLat,'<%=path%>/img/gis/camera.png','24px','24px'); });
	 * });
	 */
});