<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript">
	$(function(){
		var param = opener.parent.getParam();
		$('#BSL').attr('src', param.ImgSrc);
	}); 
	function fnClose(){
		window.close();
	}
	</script>
	<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			첨부 파일 확인
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div class="pop_set_content">
			<div class="pop_set_substance">
			 	<div align="center" style="width: 100%" >
					<img alt="첨부이미지" id="BSL" src="${upload}/board/20170802/20170802180357" width="100%;" height="auto;">
				</div>
			</div>
		</div>

