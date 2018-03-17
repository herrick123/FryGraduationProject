<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<!--批量删除 -->
    <div id="delAllModel" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
					<h4 class="modal-title" id="myModalLabel">确认下架</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					你是否确认要下架所选商品吗？
				</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" id="delAll" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 删除单个 -->
	<div id="delOneModel" class="modal fade">
	    <div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss = "modal">&times;</button>
					<h4 class="modal-title" id="myModalLabel">确认下架</h4>
				</div>
				<div class="modal-body" style="text-align: center;">
					<input type="hidden" id="modalId">
					你是否确认要下架所选商品吗？
				</div>
				<div class="modal-footer">
					<div style="text-align: center;">
						<button class="sbtn sbtn-blue sbtn30" id="deleteOneBtn" >确认</button>
						<button class="sbtn sbtn-default sbtn30" data-dismiss = "modal" style="margin-left: 45px;">取消</button>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var deleteId = null;
	function showDelOneMsg(msg,id){
		if(msg != undefined){
			$(".modal-body").html(msg);
		}else{
			$(".modal-body").html("你是否确认要下架所选商品吗？");
		}
		$("#delOneModel").modal();
		deleteId = id;
	}
</script>
