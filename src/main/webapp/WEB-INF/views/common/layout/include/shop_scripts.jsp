<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/nailduck.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/jquery.form.js"></script>
	<!-- 
	<script type="text/javascript" src="${staticRoot}/js/google.js"></script>
	 -->
	<script type="text/javascript" src="${staticRoot}/js/aes.js"></script>
	<script type="text/javascript">
		var GNB = "0"; // GNB
		var LNB = "0"; // LNB

		// 현재 GNB & LNB 선택 
		$(function(){
			if(GNB > 0) {
				$(".gnb a").eq(GNB-1).css({"color":"#ec2181","font-weight":"bold"});
				$(".gnb a").eq(GNB-1).addClass("active");
				 
				$(".lnb > div").eq(GNB-1).show(); 
				$(".lnb > div").eq(GNB-1).find("div").eq(LNB).find("a").addClass("active");
				
				$(".gnb a").each(function(i){  				
					$(this).on("click", function(){
						$(".lnb > div").eq(i).find("a:first").trigger("click"); 
						return false;
					});
				});
			}
		});
		
		// 공통 메세지 처리
		$(function(){
			var msg = "${msg}";
			
			if(!_BT.isEmpty(msg)) {
				setTimeout(function(){ alert(msg); }, 100);
			}
		});	
	</script>