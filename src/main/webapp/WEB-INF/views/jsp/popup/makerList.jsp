<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
		$(function(){
			$(".maker_msg_substance").html(opener.parent.fnSetHtml());
		});
		function fnChoice(){
			$('#mFrm').empty(); 
			$('input:checkbox[name="chk_Brand"]').each(function() {
				if(this.checked){
					$('#mFrm').append(					
							_BT.makeInput('chkBrand', $(this).attr("id"))
					);
		      }
			 });
			opener.parent.fnSendChoose($('#mFrm').serializeArray());
			fnClose();
		}
		function fnClose(){
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<form id="mFrm" name="mFrm">
	</form>
	<h1 class="blue_title">
		전체 브랜드
		<span class="close" onclick="fnClose();">
		</span>
	</h1> 
	<div class="maker_msg_substance">
	</div> 
	<div class="btn_group marginbottom_10">
		<span class="form_btn_Type_blue" onclick="fnChoice();">선 택</span>
		<span class="form_btn_Type_gray" onclick="fnClose();">취 소</span>
	</div>