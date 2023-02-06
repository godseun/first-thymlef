<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
		<script src="http://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
		<script>
		</script>
		<script type="text/javascript">
			var dupClick1 = false;
			$(function () {
			});
			function fnClose() {
				window.close();
			}
		</script>
		<!-- 팝업창 시작 -->
		<h1 class="blue_title">
			대화 톡톡
			<span class="close" onclick="fnClose();">
			</span>
		</h1>
		<div class="pop_set_content4">
			<div class="pop_set_substance">
				<img src="${staticRoot}/img/tmp/alarm.PNG" width="340px;" />
			</div>
		</div>
		<h1 class="gray_title">
			Copyright 2017 <span style="color:#3f51b5; font-weight: 900;">DAEHWA</span> Corp. ALL RIGHT RESERVED.
		</h1>