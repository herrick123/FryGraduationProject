var path = "/StudentMIS";


//表单验证
var validator_constant;
var name_area = '<i class="fa fa-check"></i>&nbsp;&nbsp;必填项验证成功';
function submit_constant() {
	if (!validator_constant.validResult()) {
		$.fn.dlshouwen.validator.tools.toast('验证未通过！', 'error', 3000);
		return;
	}else if($("#show_valueName_area").html() != name_area){
		$.fn.dlshouwen.validator.tools.toast('字典名称验证未通过！', 'error', 3000);
		return;
	}
	$.fn.dlshouwen.validator.tools.toast('验证通过！', 'success', 3000);
	document.getElementById("constantForm").submit();
}

$(function() {
	var option_constant = {
		elementCallback : {
			success : function(element, css){
				if($(element).is(':checkbox') || $(element).is(':radio')){
					var name = $(element).attr('name');
					$('input[name='+name+']').parents('.form-group').removeClass(css.failure);
				}else{
					$(element).parents('.form-group').removeClass(css.failure);
				}
				var dictionaryId = $("#dictionaryId").val();
				var id = $("#id").val();
				//验证字典名称
				if($(element).attr('name') == 'valueName'){
					var valueName = $("#valueName").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						url : path + "/constant/check",
						data : "valueName=" + valueName + "&id=" + id + "&dictionaryId=" + dictionaryId,
						success : function(Data, textStatus) {
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_valueName_area").removeClass("info-area-success");
								$("#show_valueName_area").addClass("info-area-failure");
								$("#show_valueName_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典名称已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_valueName_area").removeClass("info-area-failure");
								$("#show_valueName_area").addClass("info-area-success");
								$("#show_valueName_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_valueName_area").removeClass("info-area-success");
								$("#show_valueName_area").addClass("info-area-failure");
								$("#show_valueName_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典名称获取失败！请联系开发人员！");
								return;
							}
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_valueName_area").removeClass("info-area-success");
							$("#show_valueName_area").addClass("info-area-failure");
							$("#show_valueName_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
				
				//验证类的全类名 
				if($(element).attr('name') == 'valueCode'){
					var valueCode = $("#valueCode").val();
					$.ajax({
						type : "POST",
						dataType : "json",
						url : path + "/constant/check",
						data : "valueCode=" + valueCode + "&id=" + id + "&dictionaryId=" + dictionaryId,
						success : function(Data, textStatus) {
							if (Data.returncode == '10000') {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_valueCode_area").removeClass("info-area-success");
								$("#show_valueCode_area").addClass("info-area-failure");
								$("#show_valueCode_area").html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典类型编码已经存在");
								return;
							} else if (Data.returncode == '200') {
								$(element).parents('.form-group').removeClass(css.failure);
								$("#show_valueCode_area").removeClass("info-area-failure");
								$("#show_valueCode_area").addClass("info-area-success");
								$("#show_valueCode_area").html("<i class='fa fa-check'></i>&nbsp;&nbsp;必填项验证成功");
							} else {
								$(element).parents('.form-group').addClass(css.failure);
								$("#show_valueCode_area").removeClass("info-area-success");
								$("#show_valueCode_area").addClass("info-area-failure");
								$("#show_valueCode_area").
									html("<i class='fa fa-times'></i>&nbsp;&nbsp;字典类型编码获取失败！请联系开发人员！");
								return;
							}
						},
						error : function(data) {
							$(element).parents('.form-group').addClass(css.failure);
							$("#show_valueCode_area").removeClass("info-area-success");
							$("#show_valueCode_area").addClass("info-area-failure");
							$("#show_valueCode_area"). html("<i class='fa fa-times'></i>&nbsp;&nbsp;服务器异常，稍后尝试！");
							return;
						}
					});
				}
			}
		}
   	};
	validator_constant = $.fn.dlshouwen.validator.init($('#constantForm'),option_constant);
});