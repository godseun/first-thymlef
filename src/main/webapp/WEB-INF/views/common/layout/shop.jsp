<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/layout/include/base.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link href="/resources/css/style.css" rel="stylesheet" type="text/css"> 
	<jsp:include page="/WEB-INF/views/common/layout/include/meta.jsp"/>
	<title>
		<tiles:insertAttribute name="title" ignore="true" />
	</title>
	<jsp:include page="/WEB-INF/views/common/layout/include/shop_styles.jsp"/>
	<jsp:include page="/WEB-INF/views/common/layout/include/shop_scripts.jsp"/>
</head>
<body> 
	<div class="container"> 
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div> 
		<div id="nav" style="width:150px;">
			<tiles:insertAttribute name="navi" />
		</div>
		<div id="section" style="width:auto; ">
			<tiles:insertAttribute name="body" />
		</div> 
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div> 
</body>
</html>