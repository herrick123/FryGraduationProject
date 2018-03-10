<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="modal fade" tabindex="-1" role="dialog" id="sodbGlobalModal" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" style="width:500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">提示</h4>
	        </div>
	        <div class="modal-body" id="sodbGlobalModalBody"></div>
	        <div class="modal-footer">
	            <button type="button" id="hideGlobalModalBtn" class="sbtn sbtn-blue">确定</button>
	        </div>
        </div>
    </div>
</div>
 <!-- 确认时间-->
	<div id="leaveModel" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
					<h4 class="modal-title" id="myModalLabel">确认操作</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<input type="hidden" id="modalId">
					请确认您请假时间不包括法定节假日
				</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" id="confirm" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
function showMsg(msg,time){
	$("#sodbGlobalModalBody").html(msg);
	$('#sodbGlobalModal').modal('show')
	if(time != undefined){
	    setTimeout(function(){
	        $("#sodbGlobalModalBody").html('');
	        $('#sodbGlobalModal').modal('hide');
	    },time * 1000)
	}
}
$("#hideGlobalModalBtn").click(function(){
	$("#sodbGlobalModalBody").html('');
    $('#sodbGlobalModal').modal('hide');
});
/* 确认时间 */
function showConfirmLeaveMsg(msg){
	if(msg != undefined){
		$(".modal-body").html(msg);
	}else{
		$(".modal-body").html("请确认您请假时间不包括法定节假日");
	}
	$("#leaveModel").modal();
}
</script>