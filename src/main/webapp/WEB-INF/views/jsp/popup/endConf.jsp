<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<div class="all_bg"> </div>
<script type="text/javascript">
	$(function(){  
		if('${msg}' != ''){
			alert('${msg}');
		}
		window.close();
	});
</script>

