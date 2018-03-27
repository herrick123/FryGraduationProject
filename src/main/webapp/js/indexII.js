 $(function(){
 	var c = 0
 	function timer(){
// 		三元表达式
        c++;
        if(c==6){
        	c=0;
        }
   		
// 		获得序号
// 		
   		$("#tl .tl1 img").eq(c).css({'display':'block'}).siblings('img').css({'display':'none'});
 		$("#tl ul li").eq(c).css({'background':'#A10000'}).siblings('li').css({'background':'#1E1E1E'});
 		
 	}
 	time = setInterval(timer,1000);
 	
   	  $("#tl").mouseenter(function(){
//   		 		 清除定时器
   		  clearInterval(time);
   	})
   		$("#tl ul li").mouseenter(function(){

// 		鼠标移入li变色
           c = $(this).index();
           
        $("#tl .tl1 img").eq(c).css({'display':'block'}).siblings('img').css({'display':'none'})
   		$(this).css({'background':'#A10000'}).siblings('li').css({'background':'#1E1E1E'});
   	})
// 	
   	   $("#tl").mouseleave(function(){
// 	   	恢复定时器
   	   	time = setInterval(timer,1000);
   	   	
   	   })
 	
 	
 })


















