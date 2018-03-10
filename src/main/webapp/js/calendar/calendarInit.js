$(".fc-state-default").hover(
    function(){
        $(this).addClass("calendar_hover");
    },
    function(){
        $(this).removeClass("calendar_hover");
    }
);
var Calendar = function() {

	return {
		init : function() {
			Calendar.initCalendar();
		},

		initCalendar : function() {

			if (!jQuery().fullCalendar) {
				return;
			}

			var date = new Date();
			var d = date.getDate();
			var m = date.getMonth();
			var y = date.getFullYear();

			var h = {};

			if (Metronic.isRTL()) {
				//$('#calendar').removeClass("mobile");
				h = {
						right : 'title',
						center : '',
						left : 'month, today, prev,next'
					};
			} else {
				//$('#calendar').removeClass("mobile");
				h = {
						left : 'prevYear,nextYear',
						center : 'title',
						right : 'prev,next,month,week,day'
					};
			}

			var initDrag = function(el) {
				var eventObject = {
					title : $.trim(el.text())
				};
				el.data('eventObject', eventObject);
				el.draggable({
					zIndex : 999,
					revert : true, 
					revertDuration : 0
				});
			};

			var addEvent = function(title) {
				title = title.length === 0 ? "Untitled Event" : title;
				var html = $('<div class="external-event label label-default">'
						+ title + '</div>');
				jQuery('#event_box').append(html);
				initDrag(html);
			};

			$('#external-events div.external-event').each(function() {
				initDrag($(this));
			});

			$('#event_add').unbind('click').click(function() {
				var title = $('#event_title').val();
				addEvent(title);
			});

			$('#calendar').fullCalendar('destroy'); // destroy the calendar
			$('#calendar')
					.fullCalendar(
							{ //re-initialize the calendar
								header : h,
								theme:true,
								//titleFormat:{month: '排班表  MMMM'},
								defaultView : 'month', // change default view with available options from http://arshaw.com/fullcalendar/docs/views/Available_Views/
								monthNames : [ "一月", "二月", "三月", "四月", "五月",
										"六月", "七月", "八月", "九月", "十月", "十一月",
										"十二月" ],
								monthNamesShort : [ "一月", "二月", "三月", "四月",
										"五月", "六月", "七月", "八月", "九月", "十月",
										"十一月", "十二月" ],
								dayNames : [ "周日", "周一", "周二", "周三", "周四",
										"周五", "周六" ],
								dayNamesShort : [ "周日", "周一", "周二", "周三", "周四",
										"周五", "周六" ],
								slotMinutes : 15,
								editable : true,
								selectable : true,
								selectHelper : true,
								currentTimezone : 'Asia/Beijing',
								buttonText: {
									prev: "上个月",
								    next: "下个月",
								    prevYear:'上一年',
								    nextYear:'下一年',
								    today: '返回今天',
								    month: '月',
								    week: '周',
								    day: '日',
								},
								select : function(startDate, endDate, allDay,
										jsEvent, view) {
									var startD = moment(startDate).format(
											'YYYY-MM-DD HH:mm:ss');
									layer.open({
										  type: 1,// 2表示打开iframe
										  btn:['保存','取消'],
										  title:"添加值班信息",
										  offset:10,
										  area: ['1000px', '800px'],
										  fix: false, //不固定
//										  maxmin: true,// 是否显示最大最小窗口按钮
										  scrollbar: false,
										  content: $(".addDuty"),
										  yes: function(index, layero){	
										  $("#addDutyForm").submit();
										  },
										  end: function () {
											  location.reload();// 关闭子窗口后刷新父页面
								          }
										});
									select(startD);
								},
								 dayClick: function(date, allDay, jsEvent, view) {
							          $(this).css('background-color', '');							           
							        },
								events:function(start, end,timezone, callback) {
									 var urlR = "/qdsodb/dutyShift/showDuty"; 
										$.ajax({
							                url: urlR,  
							              //  cache:false,  
							                type: "GET",
							                dataType: "json",
							                success:function(data) {  
						                //给日历增加事件
						                    var events = [];  
						                    var jsonText = eval(data);
						    		 		for( var j = 0; j < jsonText.length;j++){
						    		 			 var str = "<ul style='padding:5px;font-size:14px;'><li>值班员："+jsonText[j].personNameDay+"(白)</li>";
							                       str += "<li>值班领导："+jsonText[j].leaderNameDay+"(白)</li>";
							                       str += "<li>&nbsp;</li>";
							                       str += "<li>值班员："+jsonText[j].personNameNight+"(夜)</li>";
							                       str += "<li>值班领导："+jsonText[j].leaderNameNight+"(夜)</li></ul>";
							                       var startDate = jsonText[j].dutyDate;
							                       var startD = moment(startDate).format('YYYY-MM-DD');	
							                       var dutyId = jsonText[j].id;
							                       events.push({  
							                    	 id:dutyId,
							                         title:str,  
							                         start:startD,
//							                         backgroundColor: Metronic.getBrandColor('yellow'),
							                         allDay: true
							                       });   
						    		 		}
						                    
						                    callback(events);   
						                  },
						                  error : function() {	
						          			showMsg('系统暂不可用，请稍后再试！');
						          		}
						              })
								},
								// 点击添加后的事件触发的事件
								eventClick: function(event,calEvent, jsEvent, view) {
									var urlE = "/qdsodb/dutyShift/showOneDuty"; 
									$.ajax({
						                url: urlE,  
						              //  cache:false,  
						                type: "GET",
						                data:{id:event.id},
						                dataType: "json",
						                success:function(data) {  
					                    //给日历增加事件
					                    var jsonText = eval(data);
					                    var id;
					                    var personNameDay;
					                    var leaderNameDay;
					                    var personPhoneDay;
					                    var leaderPhoneDay;
					                    var personNameNight;
					                    var leaderNameNight;
					                    var personPhoneNight;
					                    var leaderPhoneNight;
					                    var dutyDate;
					    		 		for( var j = 0; j < jsonText.length;j++){
					    		 			 id = jsonText[j].id;
					    		 			 personNameDay = jsonText[j].personNameDay;
						                     leaderNameDay = jsonText[j].leaderNameDay;
						                     personPhoneDay = jsonText[j].personPhoneDay;
						                     leaderPhoneDay = jsonText[j].leaderPhoneDay;
						                     personNameNight = jsonText[j].personNameNight;
						                     leaderNameNight = jsonText[j].leaderNameNight;
						                     personPhoneNight = jsonText[j].personPhoneNight;
						                     leaderPhoneNight = jsonText[j].leaderPhoneNight;
						                     dutyDate = jsonText[j].dutyDate;
						                     break;
					    		 		}
				    		 			layer.open({
											  type: 1,// 2表示打开iframe
										      btn:['保存','取消','删除'],
											  title:"编辑值班信息",
											  offset:10,
											  area: ['1000px', '800px'],
											  fix: false, //不固定
											  scrollbar: false,
											  content:$(".editDuty"),
											  yes: function(index, layero){	
												$("#editDutyForm").submit();
											  },
											  btn3:function(index, layero){
												  var urlD = "/qdsodb/dutyShift/deleteDuty"; 
													$.ajax({
										                url: urlD,  
										              //  cache:false,  
										                type: "GET",
										                data:{id:event.id},
										                dataType: "json",
										                success:function(data) {
										                	showMsg('删除成功！');
										                },
										                error : function() {	
										          			showMsg('系统暂不可用，请稍后再试！');
										          		}
													})
											  },
											  end: function () {
												  location.reload();// 关闭子窗口后刷新父页面
									          }
											
											});
										editduty(id,personNameDay,leaderNameDay,personPhoneDay,leaderPhoneDay,
												personNameNight,leaderNameNight,personPhoneNight,leaderPhoneNight,dutyDate);
					                  },
					                  error : function() {	
					          			showMsg('系统暂不可用，请稍后再试！');
					          		  }
					              })
									
								},
								eventRender: function (event, element) {
								    element.html(event.title);           
								}
							});

		}

	};

}();