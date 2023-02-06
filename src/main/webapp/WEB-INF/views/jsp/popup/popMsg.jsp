<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script>
	</script>
	<script type="text/javascript">
		var dupClick1 = false;
		$(function(){
		}); 
		function fnClose(){
			window.close();
		}
		function fnCloseChk(){
			if($('#click01').is(':checked')) {
				var d = new Date();
				var ymd = d.getFullYear() + (d.getMonth()<9?'0':'') + (d.getMonth() + 1) + (d.getMonth()<10?'0':'')  + d.getDate();
				if(_BT.isEquals(ymd,_BT.Cookie.get('noMr'))) {
					var list = _BT.Cookie.get('noMrList') + '/' + '${pageParm.P_ID}' ;
					_BT.Cookie.set('noMrList', list);
				}else{
					_BT.Cookie.set('noMr', ymd);
					_BT.Cookie.set('noMrList', '${pageParm.P_ID}');
				}			
			}
			window.close();
		}
	</script>
	<!-- 팝업창 시작 -->
	<h1 class="blue_title">
		${pageParm.P_TITLE}
		<span class="close" onclick="fnClose();">
		</span>
	</h1>
	<div class="">
		<img src="${upload}${pageParm.P_IMG}"  style="width:100%; height:100%; " width="100%;" />
	</div>
	<h1 class="gray_title" style="text-align:right;height: 44px;padding-right:10px;">
		<input type="checkbox" id="click01" class="chk" /><label for="click01" class="signup_txt">오늘하루 그만보기</label><label class="join_form_btn mOn2" onclick="fnCloseChk();" style="width:60px;">닫기</label>
	</h1>