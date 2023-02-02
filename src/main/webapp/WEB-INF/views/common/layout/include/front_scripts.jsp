<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
	<script type="text/javascript" src="${staticRoot}/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/jquery.cookie.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/mytool.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/jquery.form.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/google.js"></script>
	<script type="text/javascript" src="${staticRoot}/js/aes.js"></script>

	<script type="text/javascript">
		$(function(){
			var msg = "${msg}";
			
			if(!_BT.isEmpty(msg)) {
				setTimeout(function(){ alert(msg); }, 100);
			}
		});	
	</script>