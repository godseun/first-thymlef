<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head> 
	<jsp:include page="/WEB-INF/views/common/layout/include/store_meta.jsp"/>
	<title>
		<tiles:insertAttribute name="title" ignore="true" />
	</title>
</head>
<body> 
	<div class="wrap"> 
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div> 
		<div class="wid_1248" style="margin-top: 20px;">
			<div id="section2" style="width:auto; ">
				<tiles:insertAttribute name="body" />
			</div> 
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div> 
</body>
</html>